// Rally Christmas Eve publisher v4 (any country blog). Runs in a same-origin tab on rally-takes-the-train-site.squarespace.com.
// Input: window.__cfg = {CID, COLL, CAT, TPL?}; textarea #rttpaste holds "RTTB:" + base64(gzip(JSON {bundle})).
// Replaces <!--RTT_HOME_BOOK-->...<!--/RTT_HOME_BOOK--> with the live homepage flipbook (style rtt-s1 + #rtt-look-inside + its script).
(async () => {
  const L = window.__pl = [];
  const { CID, COLL, CAT, TPL, TPLID, TPLCID } = window.__cfg || {};
  if (!CID || !COLL || !CAT) { L.push('no cfg'); return; }
  const H = () => ({ 'x-csrf-token': decodeURIComponent(document.cookie.match(/crumb=([^;]+)/)[1]), 'content-type': 'application/json' });
  const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  // v4: fetch gz parts from URLs (window.__cfg.URLS), e.g. raw.githubusercontent.com (CORS *)
  let bundle = {};
  for (const u of (window.__cfg.URLS || [])) {
    const r = await fetch(u); if (!r.ok) { L.push('fetch ' + r.status + ' ' + u); return; }
    const txt = await new Response(r.body.pipeThrough(new DecompressionStream('gzip'))).text();
    Object.assign(bundle, JSON.parse(txt).bundle); L.push('got ' + u.split('/').pop());
  }
  L.push('bundle ' + Object.keys(bundle).length);
  // homepage flipbook
  let BOOK = '';
  try {
    const home = await fetch('/?nc=' + Date.now()).then(r => r.text());
    const doc = new DOMParser().parseFromString(home, 'text/html');
    const sec = doc.getElementById('rtt-look-inside');
    const styles = [...doc.querySelectorAll('style')].filter(s => s.textContent.includes('rtt-s1')).map(s => s.outerHTML).join('');
    const scripts = [...doc.querySelectorAll('script')].filter(s => !s.src && /rtt-look-inside|data-rtt-next/.test(s.textContent)).map(s => '<script>' + s.textContent + '<\/script>').join('');
    if (sec && styles) BOOK = styles + sec.outerHTML + scripts;
    L.push('book ' + BOOK.length);
  } catch (e) { L.push('book ERR ' + e); }
  const book = html => BOOK ? html.replace(/<!--RTT_HOME_BOOK-->[\s\S]*?<!--\/RTT_HOME_BOOK-->/, '<!--RTT_HOME_BOOK-->' + BOOK + '<!--/RTT_HOME_BOOK-->') : html;
  // existing posts
  let items = [], off = null;
  do { const j = await fetch('/' + COLL + '?format=json' + (off ? '&offset=' + off : '') + '&nc=' + Date.now()).then(r => r.json()); items = items.concat(j.items || []); off = j.pagination && j.pagination.nextPage ? j.pagination.nextPageOffset : null; } while (off);
  const byUrl = {}; items.forEach(x => byUrl[x.urlId] = x.id);
  L.push('existing ' + items.length);
  const tplId = TPLID || (TPL && byUrl[TPL]) || items[0] && items[0].id;  // TPLID/TPLCID: template post from another blog (new blogs have only a draft template)
  const tpl = tplId ? await fetch(`/api/content/blogs/${TPLCID || CID}/text-posts/${tplId}`, { headers: H() }).then(r => r.json()) : null;
  const setHtml = (p, html) => { let hit = 0; for (const row of p.body.layout.rows) for (const col of row.columns) for (const bl of col.blocks) if (bl.value && typeof bl.value.html === 'string') { bl.value.html = html; bl.value.source = html; hit++; } return hit; };
  const only = window.__only ? new Set(window.__only) : null;
  window.__stats = { put: 0, post: 0, err: 0, book: 0 };
  for (const [slug, b] of Object.entries(bundle)) {
    if (only && !only.has(slug)) continue;
    try {
      const html = book(b.html); if (html !== b.html) window.__stats.book++;
      const ex = { html: '<p>' + esc(b.meta.excerpt || b.meta.description || '') + '</p>' };
      const seo = { seoTitle: b.meta.seo_title || b.meta.title, seoDescription: b.meta.description || '' };
      const uid = b.meta.url_id || slug;
      if (byUrl[uid]) {
        const url = `/api/content/blogs/${CID}/text-posts/${byUrl[uid]}`;
        const p = await fetch(url, { headers: H() }).then(r => r.json());
        delete p.pushedServices; delete p.pendingPushedServices;
        const hit = setHtml(p, html); p.title = b.meta.title; p.seoData = Object.assign({}, p.seoData, seo); p.excerpt = ex; p.tags = []; p.categories = [CAT]; p.workflowState = 1;
        const r = await fetch(url, { method: 'PUT', headers: H(), body: JSON.stringify(p) });
        L.push(uid + ':put' + r.status + ':h' + hit); r.ok ? window.__stats.put++ : window.__stats.err++;
      } else if (tpl) {
        const p = JSON.parse(JSON.stringify(tpl));
        for (const k of ['collectionId', 'id', 'addedOn', 'updatedOn', 'fullUrl', 'assetUrl', 'commentCount', 'pushedServices', 'pendingPushedServices', 'shareStates', 'recordType', 'publishOn']) delete p[k];
        const hit = setHtml(p, html); p.title = b.meta.title; p.urlId = uid; p.tags = []; p.categories = [CAT]; p.seoData = Object.assign({}, tpl.seoData, seo); p.excerpt = ex; p.publishOn = Date.now(); p.workflowState = 1;
        p.categories = [];  // POST caps a category at 25 chars; the long blog category is set by a PUT right after (PUT accepts it)
        const r = await fetch(`/api/content/blogs/${CID}/text-posts`, { method: 'POST', headers: H(), body: JSON.stringify(p) });
        let ok = r.ok, note = '';
        if (r.ok) { try { const c = await r.json(); const u2 = `/api/content/blogs/${CID}/text-posts/${c.id}`; const q = await fetch(u2, { headers: H() }).then(x => x.json()); delete q.pushedServices; delete q.pendingPushedServices; q.categories = [CAT]; q.tags = []; q.workflowState = 1; const r2 = await fetch(u2, { method: 'PUT', headers: H(), body: JSON.stringify(q) }); note = ':cat' + r2.status; } catch (e) { note = ':catERR ' + e; } }
        else note = ' ' + (await r.text()).slice(0, 200);
        L.push(uid + ':post' + r.status + ':h' + hit + note); ok ? window.__stats.post++ : window.__stats.err++;
      } else { L.push(uid + ':no template'); window.__stats.err++; }
    } catch (e) { L.push(slug + ':ERR ' + e); window.__stats.err++; }
    await new Promise(r => setTimeout(r, 350));
  }
  L.push('done');
})();
'started';
