// Rally publisher v5: small chunks, per-page lookup (no full collection listing), resumable per chunk.
// window.__jobs5 = [{CID, COLL, CAT, files:[url...]}]; window.__TPLID, window.__TPLCID; progress in localStorage 'rtt5_done' (array of chunk urls).
(async () => {
  const L = window.__pl5 = [];
  const H = () => ({ 'x-csrf-token': decodeURIComponent(document.cookie.match(/crumb=([^;]+)/)[1]), 'content-type': 'application/json' });
  const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
  const st = window.__stats = window.__stats || { put: 0, post: 0, err: 0, chunks: 0 };
  const hb = () => { try { localStorage.setItem('rtt5_hb' + (window.__sfx || ''), JSON.stringify({ t: Date.now(), cur: window.__cur5, st })); } catch (e) {} };
  setInterval(hb, 15000);
  if (!window.__BOOK) {
    try {
      const home = await fetch('/?nc=' + Date.now()).then(r => r.text());
      const doc = new DOMParser().parseFromString(home, 'text/html');
      const sec = doc.getElementById('rtt-look-inside');
      const styles = [...doc.querySelectorAll('style')].filter(s => s.textContent.includes('rtt-s1')).map(s => s.outerHTML).join('');
      const scripts = [...doc.querySelectorAll('script')].filter(s => !s.src && /rtt-look-inside|data-rtt-next/.test(s.textContent)).map(s => '<script>' + s.textContent + '<\/script>').join('');
      window.__BOOK = (sec && styles) ? styles + sec.outerHTML + scripts : '';
    } catch (e) { window.__BOOK = ''; }
  }
  const BOOK = window.__BOOK;
  const book = html => BOOK ? html.replace(/<!--RTT_HOME_BOOK-->[\s\S]*?<!--\/RTT_HOME_BOOK-->/, '<!--RTT_HOME_BOOK-->' + BOOK + '<!--/RTT_HOME_BOOK-->') : html;
  const tpl = await fetch(`/api/content/blogs/${window.__TPLCID}/text-posts/${window.__TPLID}`, { headers: H() }).then(r => r.json());
  const setHtml = (p, html) => { let hit = 0; for (const row of p.body.layout.rows) for (const col of row.columns) for (const bl of col.blocks) if (bl.value && typeof bl.value.html === 'string') { bl.value.html = html; bl.value.source = html; hit++; } return hit; };
  const doneKey = 'rtt5_done';
  const isDone = u => JSON.parse(localStorage.getItem(doneKey) || '[]').includes(u);
  const markDone = u => { const d = JSON.parse(localStorage.getItem(doneKey) || '[]'); d.push(u); localStorage.setItem(doneKey, JSON.stringify(d)); };
  for (const job of window.__jobs5) {
    const { CID, COLL, CAT } = job;
    for (const u of job.files) {
      if (isDone(u)) continue;
      window.__cur5 = u.split('/').pop(); hb();
      let bundle;
      try {
        const r = await fetch(u + '?v=5'); if (!r.ok) { L.push('fetch ' + r.status + ' ' + u); st.err++; continue; }
        bundle = JSON.parse(await new Response(r.body.pipeThrough(new DecompressionStream('gzip'))).text()).bundle;
      } catch (e) { L.push('chunk ERR ' + u + ' ' + e); st.err++; continue; }
      let bad = 0;
      for (const [slug, b] of Object.entries(bundle)) {
        try {
          const html = book(b.html);
          const ex = { html: '<p>' + esc(b.meta.excerpt || b.meta.description || '') + '</p>' };
          const seo = { seoTitle: b.meta.seo_title || b.meta.title, seoDescription: b.meta.description || '' };
          const uid = b.meta.url_id || slug;
          let id = null;
          const lr = await fetch('/' + COLL + '/' + uid + '?format=json&nc=' + Date.now());
          if (lr.ok) { try { const j = await lr.json(); if (j.item && j.item.urlId === uid) id = j.item.id; } catch (e) {} }
          if (id) {
            const url = `/api/content/blogs/${CID}/text-posts/${id}`;
            const p = await fetch(url, { headers: H() }).then(r => r.json());
            delete p.pushedServices; delete p.pendingPushedServices;
            setHtml(p, html); p.title = b.meta.title; p.seoData = Object.assign({}, p.seoData, seo); p.excerpt = ex; p.tags = []; p.categories = [CAT]; p.workflowState = 1;
            const r = await fetch(url, { method: 'PUT', headers: H(), body: JSON.stringify(p) });
            if (r.ok) st.put++; else { st.err++; bad++; L.push(uid + ':put' + r.status); }
          } else {
            const p = JSON.parse(JSON.stringify(tpl));
            for (const k of ['collectionId', 'id', 'addedOn', 'updatedOn', 'fullUrl', 'assetUrl', 'commentCount', 'pushedServices', 'pendingPushedServices', 'shareStates', 'recordType', 'publishOn']) delete p[k];
            setHtml(p, html); p.title = b.meta.title; p.urlId = uid; p.tags = []; p.categories = []; p.seoData = Object.assign({}, tpl.seoData, seo); p.excerpt = ex; p.publishOn = Date.now(); p.workflowState = 1;
            const r = await fetch(`/api/content/blogs/${CID}/text-posts`, { method: 'POST', headers: H(), body: JSON.stringify(p) });
            if (r.ok) { st.post++; try { const c = await r.json(); const u2 = `/api/content/blogs/${CID}/text-posts/${c.id}`; const q = await fetch(u2, { headers: H() }).then(x => x.json()); delete q.pushedServices; delete q.pendingPushedServices; q.categories = [CAT]; q.tags = []; q.workflowState = 1; await fetch(u2, { method: 'PUT', headers: H(), body: JSON.stringify(q) }); } catch (e) {} }
            else { st.err++; bad++; L.push(uid + ':post' + r.status + ' ' + (await r.text()).slice(0, 120)); }
          }
        } catch (e) { st.err++; bad++; L.push(slug + ':ERR ' + e); }
        await new Promise(r => setTimeout(r, 150));
      }
      bundle = null; st.chunks++; markDone(u); hb();
      if (L.length > 300) L.splice(0, L.length - 300);
    }
  }
  window.__cur5 = 'ALL DONE'; hb(); L.push('done');
})();
'started v5';
