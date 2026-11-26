/* rtt_us_lib.js  (Rally Takes the Train, US new-event pipeline, 2026-11-20)
 * Load in the Squarespace admin tab (https://rally-takes-the-train-site.squarespace.com/config/pages):
 *   upload this file to the #ar-file input, then  (0,eval)(await document.getElementById('ar-file').files[0].text())
 *   or  await RTTUS.boot()  (loads the copy cached in IndexedDB rtt_us/lib)
 * Then upload a bundle (<name>.json.gz from mkbundle_us.py) to #ar-file and run:
 *   await RTTUS.load()                         -> {pages, cities, bad:[]}
 *   await RTTUS.publish()                      -> new event posts (skips any slug that already exists), SEO set, live checked
 *   await RTTUS.addCards('seattle-wa')         -> DRY RUN: builds cards/planner/share/schema/counts, returns validation report
 *   await RTTUS.addCards('seattle-wa',{save:1})-> same, then backs up the page to IndexedDB rtt_us_backup and PUTs
 * Output strings are sanitized for the Chrome tool (= ? & % replaced by ~).
 * Rules: only ADDS. Never edits existing cards. Refuses if a slug or card id already exists.
 */
(() => {
const SITE = 'https://www.rallytakesthetrain.com';
const MON = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
const DAY = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
const crumb = () => (document.cookie.match(/crumb=([^;]+)/) || [])[1];
const H = () => ({ 'content-type': 'application/json', 'x-csrf-token': crumb() });
const E = s => String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
const san = o => (typeof o === 'string' ? o : JSON.stringify(o)).replace(/[=?&%]/g, '~');
const dd = s => new Date(s + 'T12:00:00');
const maps = l => 'https://www.google.com/maps/search/?api=1&query=' + encodeURIComponent(l);
const TZOF = st => ({al:'-06:00',ar:'-06:00',il:'-06:00',ia:'-06:00',ks:'-06:00',la:'-06:00',mn:'-06:00',ms:'-06:00',mo:'-06:00',ne:'-06:00',nd:'-06:00',ok:'-06:00',sd:'-06:00',tx:'-06:00',wi:'-06:00',az:'-07:00',co:'-07:00',id:'-07:00',mt:'-07:00',nm:'-07:00',ut:'-07:00',wy:'-07:00',ca:'-08:00',nv:'-08:00',or:'-08:00',wa:'-08:00',ak:'-09:00',hi:'-10:00'})[st] || '-05:00';
const sleep = ms => new Promise(r => setTimeout(r, ms));
const idb = async (store, mode, fn) => { const db = await new Promise((res, rej) => { const r = indexedDB.open('rtt_us', 1); r.onupgradeneeded = () => { r.result.createObjectStore('lib'); r.result.createObjectStore('backup'); }; r.onsuccess = () => res(r.result); r.onerror = rej; });
  return new Promise((res, rej) => { const t = db.transaction(store, mode); const out = fn(t.objectStore(store)); t.oncomplete = () => res(out && out.result !== undefined ? out.result : out); t.onerror = rej; }); };
const file = () => { const i = document.getElementById('ar-file'); if (!i || !i.files[0]) throw new Error('upload a file to #ar-file first'); return i.files[0]; };
const getItem = async slug => { const j = await (await fetch('/christmas-events/' + slug + '?format=json&nc=' + Date.now(), { credentials: 'include' })).json(); const P = await (await fetch('/api/content-items/' + j.item.id, { credentials: 'include' })).json(); return P; };
const mainBlock = P => P.body.layout.rows[0].columns[0].blocks.find(b => b.value && b.value.html && b.value.html.includes('rtt-'));

const R = window.RTTUS = { B: null, log: [] };

R.install = async () => { const src = await file().text(); await idb('lib', 'readwrite', s => s.put(src, 'lib')); return 'cached ' + src.length; };
R.boot = async () => { const src = await idb('lib', 'readonly', s => s.get('lib')); if (!src) return 'no cached lib'; (0, eval)(src); return 'RTTUS ready'; };

/* ---------- bundle ---------- */
R.load = async () => {
  const f = file(); const ds = f.name.endsWith('.gz') ? new Response(f.stream().pipeThrough(new DecompressionStream('gzip'))) : new Response(f);
  const B = JSON.parse(await ds.text()); const bad = [];
  for (const k in B.pages) { const h = B.pages[k]; const d = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(h)); const x = [...new Uint8Array(d)].map(b => b.toString(16).padStart(2, '0')).join('').slice(0, 16); if (B.meta[k.replace(/\.html$/, '')].sha !== x) bad.push(k); }
  R.B = B; return san({ pages: Object.keys(B.pages).length, cities: Object.keys(B.cities || {}), bad });
};

/* ---------- publish new event posts ---------- */
R.publish = async (opt = {}) => {
  const B = R.B; if (!B) throw new Error('RTTUS.load() first');
  const tplSlug = B.template || opt.template; if (!tplSlug) throw new Error('bundle.template (an existing event post slug) missing');
  const T = await getItem(tplSlug); const out = {};
  for (const slug of Object.keys(B.meta)) {
    const m = B.meta[slug], html = B.pages[slug + '.html'];
    const ex = await fetch('/christmas-events/' + slug + '?format=json', { credentials: 'include' });
    if (ex.status === 200) { out[slug] = 'EXISTS'; continue; }
    const layout = JSON.parse(JSON.stringify(T.body.layout)); const blk = layout.rows[0].columns[0].blocks[0];
    blk.value.html = html; if (blk.value.wysiwyg) blk.value.wysiwyg.source = html;
    blk.id = [...crypto.getRandomValues(new Uint8Array(10))].map(b => b.toString(16).padStart(2, '0')).join('');
    const body = { collectionId: T.collectionId, recordType: 1, workflowState: 1, publishOn: Date.now(), title: m.title, urlId: slug,
      tags: m.tags || ['Christmas events', m.state_name || m.state, m.city || m.town], categories: T.categories, authorId: T.authorId, body: { raw: false, layout },
      excerpt: { html: '<p style="white-space:pre-wrap;" data-rte-preserve-empty="true">' + E(m.excerpt) + '</p>', raw: false },
      postItemInjectCode: T.postItemInjectCode, commentState: T.commentState };
    let r, j = null;
    for (let k = 0; k < 4; k++) { r = await fetch('/api/content-items', { method: 'POST', credentials: 'include', headers: H(), body: JSON.stringify(body) }); if (r.status !== 429) break; await sleep(45000); }
    try { j = await r.json(); } catch (e) {}
    if (r.status !== 200 || !j || !j.id) { out[slug] = 'ERR ' + r.status; continue; }
    const g = await (await fetch('/api/content-items/' + j.id, { credentials: 'include' })).json();
    g.seoData = Object.assign({}, g.seoData || {}, { seoTitle: m.seo_title, seoDescription: m.seo_desc, seoHidden: false }); delete g.pushedServices; delete g.pendingPushedServices;
    const p = await fetch('/api/content-items/' + j.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(g) });
    const live = await fetch('/christmas-events/' + slug, { credentials: 'include' }); const t = await live.text();
    out[slug] = { id: j.id, seo: p.status, live: live.status, quick: t.includes('rvx-quick') };
    await sleep(1200);
  }
  R.log.push({ publish: out }); return san(out);
};

/* ---------- city page cards ---------- */
// card (parse.py shape, from the bundle) -> event fields
const ev = (c, slug) => {
  const d = c.cal.d, f = c.facts, free = (c.tags || []).includes('Free');
  const last = d.reduce((a, r) => (r[3] || r[0]) > a ? (r[3] || r[0]) : a, d[0][0]);
  const s0 = d[0][0], x0 = dd(s0); const fmt = s => { const x = dd(s); return MON[x.getMonth()] + ' ' + x.getDate(); };
  const host = (c.dl.Host || {}).t, hostUrl = (c.dl.Host || {}).href;
  const loc = (c.dl.Address || {}).t || f.Where;
  return { id: c.id.replace(/^ev-/, ''), slug, name: c.name, tag: (c.tags || []).find(t => t !== 'Free') || 'Holiday show', free, ty: c.ty, fl: c.fl, town: c.town,
    tile: c.badge, when: f.When, loc, cost: f.Cost, ages: f.Ages, signup: (c.dl['Sign-up'] || {}).t || (free ? '' : 'Tickets required'), p: c.paras, tip: c.tip,
    host, hostUrl, url: c.cal.u, d, s0, last, plan: s0 === last ? fmt(s0) : fmt(s0) + ' to ' + fmt(last), share: s0 === last ? 'is on ' + fmt(s0) : 'starts ' + fmt(s0),
    short: (c.paras[0].match(/^.+?[.!?](\s|$)/) || [c.paras[0]])[0].trim(), checked: c.checked || new Date().toISOString().slice(0, 10) };
};

const cardsOf = h => [...h.matchAll(/<section class="rtt-pe-ride"[^>]*id="(ev-[^"]+)"[^>]*data-xf-fl="([^"]*)"[^>]*data-xf-town="([^"]*)"[^>]*data-cal="([^"]*)"/g)].map(m => {
  let d0 = ''; try { d0 = JSON.parse(m[4].replace(/&quot;/g, '"').replace(/&amp;/g, '&')).d[0][0]; } catch (e) {}
  return { id: m[1].slice(3), free: /\bfree\b/.test(m[2]), town: m[3], d0 }; });

function buildCard(T, e) {
  let c = T.html; const tid = T.id, tname = T.name, tslug = T.slug;
  if (tslug) c = c.split(tslug).join(e.slug);
  c = c.replace(/data-cal="[^"]*"/, 'data-cal="' + E(JSON.stringify({ n: e.name, l: e.loc, u: e.url, m: maps(e.loc), d: e.d })) + '"');
  c = c.replace(/data-xf-ty="[^"]*"/, 'data-xf-ty="' + E(e.ty) + '"').replace(/data-xf-fl="[^"]*"/, 'data-xf-fl="' + E(e.fl) + '"').replace(/data-xf-town="[^"]*"/, 'data-xf-town="' + E(e.town) + '"');
  c = c.replace(/<span class="rtt-xt__m">[^<]*<\/span><span class="rtt-xt__d">[^<]*<\/span><span class="rtt-xt__s">[^<]*<\/span>/, '<span class="rtt-xt__m">' + E(e.tile[0]) + '</span><span class="rtt-xt__d">' + E(e.tile[1]) + '</span><span class="rtt-xt__s">' + E(e.tile[2] || '') + '</span>');
  c = c.replace(/(rtt-pe-tag--lic">)[^<]*</, (m0, a) => a + E(e.tag) + '<');
  for (const [k, v] of [['When', e.when], ['Cost', e.cost], ['Ages', e.ages]]) c = c.replace(new RegExp('(<span class="rtt-xc__sr">' + k + ': </span><span class="rtt-xc__v">)[^<]*'), (m0, a) => a + E(v));
  c = c.replace(/<a class="rtt-map" href="[^"]*"([^>]*)>[^<]*<span class="rtt-map__sr">/g, (m, a) => '<a class="rtt-map" href="' + E(maps(e.loc)) + '"' + a + '>' + E(e.loc) + '<span class="rtt-map__sr">');
  c = c.replace(/(<div class="rtt-xd__b">)[\s\S]*?(<dl>)/, (m0, a, b) => a + e.p.map(p => '<p>' + E(p) + '</p>').join('') + '<p class="rtt-ev__tip"><b>Parent tip:</b> ' + E(e.tip) + '</p>' + b);
  c = c.replace(/(<dt>Host<\/dt><dd><a href=")[^"]*("[^>]*>)[^<]*/, (m0, a, b) => a + E(e.hostUrl) + b + E(e.host));
  if (/<dt>Sign-up<\/dt>/.test(c)) c = e.signup ? c.replace(/<dt>Sign-up<\/dt><dd>[^<]*<\/dd>/, '<dt>Sign-up</dt><dd>' + E(e.signup) + '</dd>') : c.replace(/<dt>Sign-up<\/dt><dd>[^<]*<\/dd>/, '');
  else if (e.signup) c = c.replace('<dt>Confirmed</dt>', '<dt>Sign-up</dt><dd>' + E(e.signup) + '</dd><dt>Confirmed</dt>');
  const x = dd(e.checked); c = c.replace(/checked <time datetime="[^"]*">[^<]*<\/time>/, 'checked <time datetime="' + e.checked + '">' + ['January','February','March','April','May','June','July','August','September','October','November','December'][x.getMonth()] + ' ' + x.getDate() + ', ' + x.getFullYear() + '</time>');
  c = c.replace(/<select>[\s\S]*?<\/select>/, '<select>' + e.d.map((r, i) => { const y = dd(r[0]); return '<option value="' + i + '">' + DAY[y.getDay()] + ', ' + MON[y.getMonth()] + ' ' + y.getDate() + (r[1] ? ' · ' + r[1] : '') + '</option>'; }).join('') + '</select>');
  c = c.split(tid).join(e.id); c = c.split(E(tname)).join(E(e.name)); c = c.split(tname).join(E(e.name));
  return c;
}

R.addCards = async (citySlug, opt = {}) => {
  const B = R.B; const list = (B && B.cities && B.cities[citySlug]) || opt.cards; if (!list || !list.length) throw new Error('no cards for ' + citySlug);
  const P = await getItem(citySlug); const blk = mainBlock(P); const h0 = blk.value.html; let h = h0; const rep = { city: citySlug };
  const PG = SITE + '/christmas-events/' + citySlug; const existing = cardsOf(h0); const ids = new Set(existing.map(x => x.id));
  const EV = list.map(x => ev(x.card, x.slug));
  for (const e of EV) { if (ids.has(e.id)) throw new Error('card exists ' + e.id); if (h0.includes('data-rtt-evp="' + e.slug + '"')) throw new Error('page already links ' + e.slug); }
  // template: a linked card with the same free/paid status
  const pickT = free => { for (const x of existing) { if (x.free !== free) continue; const m = h0.match(new RegExp('<section class="rtt-pe-ride"[^>]*id="ev-' + x.id + '"[\\s\\S]*?<\\/section>')); if (!m || !/data-rtt-evp="/.test(m[0])) continue; const nm = (m[0].match(/data-sh-name="([^"]*)"/) || [])[1]; const sl = (m[0].match(/data-rtt-evp="([^"]*)"/) || [])[1]; if (nm) return { id: x.id, html: m[0], name: nm.replace(/&amp;/g, '&'), slug: sl }; } return null; };
  // placement: after the last card of the same section and town with start date <= new start; else after last card of the section
  const N0 = existing.length, F0 = existing.filter(x => x.free).length, P0 = N0 - F0;
  const order = existing.slice(); EV.sort((a, b) => a.s0 < b.s0 ? -1 : 1);
  for (const e of EV) {
    const T = pickT(e.free) || pickT(!e.free) || R._tpl; if (!T) throw new Error('no template card (call RTTUS.tplFrom(<city with cards>) first)');
    const sec = order.filter(x => x.free === e.free); const same = sec.filter(x => x.town === e.town);
    let after = (same.filter(x => x.d0 <= e.s0).pop() || same[0] && { id: null } || sec[sec.length - 1] || order[order.length - 1]);   // no card yet in this section: after the page's last card
    if (after && after.id === null) { const firstSame = same[0]; const k = order.indexOf(firstSame); after = order[k - 1]; e.before = firstSame.id; }
    e.after = after ? after.id : null;
    const html = buildCard(T, e);
    if (e.before && !e.after) { const m = h.match(new RegExp('<section class="rtt-pe-ride"[^>]*id="ev-' + e.before + '"')); h = h.replace(m[0], html + '\n' + m[0]); }
    else { const m = h.match(new RegExp('<section class="rtt-pe-ride"[^>]*id="ev-' + e.after + '"[\\s\\S]*?<\\/section>')); if (!m) throw new Error('anchor ' + e.after); const i = h.indexOf(m[0]) + m[0].length; h = h.slice(0, i) + '\n' + html + h.slice(i); }
    const k = e.after ? order.findIndex(x => x.id === e.after) + 1 : order.findIndex(x => x.id === e.before);
    order.splice(k, 0, { id: e.id, free: e.free, town: e.town, d0: e.s0 });
  }
  // planner rows
  const base = dd('2026-11-01'), pct = x => Math.round(((dd(x) - base) / 864e5) / 62 * 10000) / 100;
  let pr = 0; const rowRe = id => new RegExp('<li class="rtt-plan__row"><span class="rtt-plan__name"><a href="[^"]*#ev-' + id + '">[\\s\\S]*?<\\/li>');
  for (const e of EV) { const k = order.findIndex(x => x.id === e.id); let nb = null; for (let j = k - 1; j >= 0 && !nb; j--) { const m = h.match(rowRe(order[j].id)); if (m) nb = m[0]; } if (!nb) for (let j = k + 1; j < order.length && !nb; j++) { const m = h.match(rowRe(order[j].id)); if (m) nb = { pre: m[0] }; } if (!nb) continue;
    const tplRow = typeof nb === 'string' ? nb : nb.pre; const span = Math.max(1, (dd(e.last) - dd(e.s0)) / 864e5 + 1);
    const row = tplRow.replace(/#ev-[^"]+">[^<]*</, '#ev-' + e.id + '">' + E(e.name) + '<').replace(/<small>[^<]*<\/small>/, '<small>' + E(e.town) + ' · ' + E(e.plan) + '</small>').replace(/(rtt-plan__bar rtt-plan__bar--\w+" style=")left:[^;]*;width:[^"]*/, '$1left:' + pct(e.s0) + '%;width:' + Math.round(span / 62 * 10000) / 100 + '%');
    const i = h.indexOf(tplRow); h = typeof nb === 'string' ? h.slice(0, i + tplRow.length) + row + h.slice(i + tplRow.length) : h.slice(0, i) + row + h.slice(i); pr++; }
  rep.plan = pr;
  // share map
  let sm = 0; for (const e of EV) { const m = h.match(/\{"ev": \{/); if (!m) break; const i = h.indexOf(m[0]) + m[0].length; h = h.slice(0, i) + '"' + e.id + '": {"w": "' + e.share + '", "c": "' + (e.town) + '", "f": ' + (e.free ? 1 : 0) + '}, ' + h.slice(i); sm++; }
  rep.share = sm;
  // schema: one Event per card, ItemList in page order
  const sm2 = h.match(/(<script type="application\/ld\+json">)([\s\S]*?)(<\/script>)/); const LD = JSON.parse(sm2[2]); const G = LD['@graph'] || LD;
  const evNodes = G.filter(n => n['@type'] === 'Event'); const tpl = JSON.parse(JSON.stringify(evNodes[0]));
  const IL = G.find(n => n['@type'] === 'ItemList');
  for (const e of EV) {
    const n = JSON.parse(JSON.stringify(tpl)); const r0 = e.d[0]; const parts = e.loc.split(',').map(s => s.trim()); const zip = (parts[parts.length - 1].match(/\d{5}/) || [''])[0];
    Object.assign(n, { '@id': PG + '#event-' + e.id, name: e.name + ' in ' + (e.town || (P.title.match(/in (.+?) \(/) || [, ''])[1]) + ', ' + citySlug.split('-').pop().toUpperCase(), alternateName: e.name, description: e.tag + '. ' + e.short,
      startDate: r0[0] + (r0[1] ? 'T' + r0[1] + ':00' + TZOF(citySlug.split('-').pop()) : ''), endDate: e.last, url: SITE + '/christmas-events/' + e.slug, mainEntityOfPage: SITE + '/christmas-events/' + e.slug, sameAs: e.url,
      location: { '@type': 'Place', name: parts[0], address: Object.assign({ '@type': 'PostalAddress', addressLocality: parts.length > 2 ? parts[parts.length - 2] : e.town, addressRegion: (parts[parts.length - 1].match(/[A-Z]{2}/) || [''])[0], addressCountry: 'US' }, parts.length > 3 ? { streetAddress: parts[1] } : {}, zip ? { postalCode: zip } : {}) },
      offers: Object.assign({ '@type': 'Offer', url: e.url, priceCurrency: 'USD', availability: 'https://schema.org/InStock' }, e.free ? { price: 0 } : {}),
      organizer: { '@type': 'Organization', name: e.host, url: e.hostUrl }, performer: { '@type': 'PerformingGroup', name: e.host }, isAccessibleForFree: e.free });
    delete n.typicalAgeRange; delete n.subjectOf; delete n.sameAs; if (e.url) n.sameAs = e.url; if (e.price != null && n.offers) n.offers.price = e.price; G.push(n);
  }
  if (IL) { const pos = id => order.findIndex(x => id.includes('#event-' + x.id) && (id.endsWith('#event-' + x.id) || /-\d{8}$/.test(id.slice(id.indexOf('#event-' + x.id) + 7 + x.id.length))));
    for (const e of EV) IL.itemListElement.push({ '@type': 'ListItem', item: { '@id': PG + '#event-' + e.id }, position: 0, url: SITE + '/christmas-events/' + e.slug });
    IL.itemListElement.sort((a, b) => pos(a.item['@id']) - pos(b.item['@id'])); IL.itemListElement.forEach((it, k) => it.position = k + 1); if ('numberOfItems' in IL) IL.numberOfItems = IL.itemListElement.length; }
  h = h.replace(sm2[0], sm2[1] + JSON.stringify(LD) + sm2[3]);
  // counts
  const N1 = N0 + EV.length, F1 = F0 + EV.filter(e => e.free).length, P1 = N1 - F1; const C = {};
  const sub = (re, to) => { const n = (h.match(re) || []).length; C[re.source.slice(0, 22)] = n; h = h.replace(re, to); };
  sub(new RegExp('\\b' + N0 + ' (Christmas events|family events|events on this page)', 'g'), N1 + ' $1');
  sub(new RegExp('\\b' + F0 + ' of the ' + N0 + '\\b', 'g'), F1 + ' of the ' + N1);
  sub(new RegExp('\\b' + F0 + ' of ' + N0 + ' are free', 'g'), F1 + ' of ' + N1 + ' are free');
  sub(new RegExp('All ' + N0 + ' events', 'g'), 'All ' + N1 + ' events');
  sub(new RegExp('&quot;t&quot;: ' + N0 + '\\}', 'g'), '&quot;t&quot;: ' + N1 + '}');
  sub(new RegExp('There are ' + N0 + ' Christmas', 'g'), 'There are ' + N1 + ' Christmas');
  sub(new RegExp('confirmed ' + N0 + ' Christmas', 'g'), 'confirmed ' + N1 + ' Christmas');
  sub(new RegExp(N0 + ' Events, ' + F0 + ' Free', 'g'), N1 + ' Events, ' + F1 + ' Free');
  sub(new RegExp(N0 + ' Events\\b', 'g'), N1 + ' Events');
  sub(new RegExp(': ' + P0 + ' are ticketed', 'g'), ': ' + P1 + ' are ticketed');
  sub(new RegExp('(Ticketed and paid <b>)' + P0 + '(</b>)', 'g'), '$1' + P1 + '$2');
  if (F1 !== F0) { sub(new RegExp('See all ' + F0 + ' free events', 'g'), 'See all ' + F1 + ' free events'); sub(new RegExp('>' + F0 + ' free events<', 'g'), '>' + F1 + ' free events<'); sub(new RegExp('(#free-events"[^>]*>[^<]*<b>)' + F0 + '(</b>)', 'g'), '$1' + F1 + '$2'); }
  sub(new RegExp('data-xf-total="' + N0 + '"', 'g'), 'data-xf-total="' + N1 + '"');
  rep.counts = C;
  // validation
  const ids2 = cardsOf(h); const LD2 = JSON.parse(h.match(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/)[1]); const G2 = LD2['@graph'] || LD2;
  const v = { cards0: N0, cards: ids2.length, newCards: EV.length, dup: ids2.length - new Set(ids2.map(x => x.id)).size, free: ids2.filter(x => x.free).length, paid: ids2.filter(x => !x.free).length,
    ev0: G.length && evNodes.length, events: G2.filter(n => n['@type'] === 'Event').length, il: IL ? (G2.find(n => n['@type'] === 'ItemList').itemListElement.length) : null,
    newDash: (h.match(/[–—]/g) || []).length - (h0.match(/[–—]/g) || []).length, linked: EV.every(e => h.includes('data-rtt-evp="' + e.slug + '"')),
    leftover: (h.match(new RegExp('\\b' + N0 + ' (Christmas events|family events)|All ' + N0 + ' events|of the ' + N0 + ' ', 'g')) || []).length };
  v.ok = v.cards === N1 && v.dup === 0 && v.free === F1 && v.events === v.ev0 + EV.length && v.newDash === 0 && v.linked && v.leftover === 0;
  rep.v = v; rep.N = [N0, F0, P0, '->', N1, F1, P1]; rep.order = EV.map(e => e.id + ' after ' + (e.after || ('before ' + e.before)));
  R.city = { citySlug, P, blk, h0, h, N0, F0, N1, F1 };
  if (opt.save) {
    if (!v.ok) { rep.saved = 'REFUSED: validation failed'; return san(rep); }
    await idb('backup', 'readwrite', s => s.put(h0, citySlug + '@' + new Date().toISOString()));
    blk.value.html = h;
    P.seoData = Object.assign({}, P.seoData, { seoTitle: (P.seoData.seoTitle || '').replace(N0 + ' Events, ' + F0 + ' Free', N1 + ' Events, ' + F1 + ' Free').replace(N0 + ' Events', N1 + ' Events'), seoDescription: (P.seoData.seoDescription || '').replace(F0 + ' of ' + N0 + ' are free', F1 + ' of ' + N1 + ' are free') });
    delete P.pushedServices; delete P.pendingPushedServices;
    const r = await fetch('/api/content-items/' + P.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(P) });
    const g = await getItem(citySlug); rep.saved = r.status; rep.check = mainBlock(g).value.html === h; rep.seo = g.seoData.seoTitle;
  }
  R.log.push({ addCards: rep }); return san(rep);
};

/* restore the most recent backup of a city page */
R.restore = async citySlug => { const keys = await idb('backup', 'readonly', s => s.getAllKeys()); const k = keys.filter(x => x.startsWith(citySlug + '@')).sort().pop(); if (!k) return 'no backup';
  const h0 = await idb('backup', 'readonly', s => s.get(k)); const P = await getItem(citySlug); mainBlock(P).value.html = h0; delete P.pushedServices; delete P.pendingPushedServices;
  const r = await fetch('/api/content-items/' + P.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(P) }); return 'restored ' + k + ' ' + r.status; };

/* ---------- in-place updates (2026-11-21) ---------- */
// Replace the code block of event posts that already exist with the bundle's pages (same URL, backed up first).
R.update = async () => {
  const B = R.B; if (!B) throw new Error('RTTUS.load() first'); const out = {};
  for (const slug of Object.keys(B.meta)) {
    const html = B.pages[slug + '.html'];
    try {
      const P = await getItem(slug); const blk = mainBlock(P); if (!blk) { out[slug] = 'no block'; continue; }
      await idb('backup', 'readwrite', s => s.put(blk.value.html, slug + '@' + new Date().toISOString()));
      blk.value.html = html; if (blk.value.wysiwyg) blk.value.wysiwyg.source = html; delete P.pushedServices; delete P.pendingPushedServices;
      let r; for (let k = 0; k < 4; k++) { r = await fetch('/api/content-items/' + P.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(P) }); if (r.status !== 429) break; await sleep(45000); }
      const g = await getItem(slug); out[slug] = { put: r.status, check: mainBlock(g).value.html === html };
    } catch (e) { out[slug] = 'ERR ' + e.message; }
    await sleep(1200);
  }
  R.log.push({ update: out }); return san(out);
};
// Point the Host link of named cards on a city page at the host's own website: map = {"ev-raleigh-...": "https://host.example"}.
R.relink = async (citySlug, map) => {
  const P = await getItem(citySlug); const blk = mainBlock(P); const h0 = blk.value.html; let h = h0; const done = {};
  for (const [id, site] of Object.entries(map)) {
    const m = h.match(new RegExp('<section class="rtt-pe-ride"[^>]*id="' + id + '"[\\s\\S]*?<\\/section>')); if (!m) { done[id] = 'no card'; continue; }
    const c2 = m[0].replace(/(<dt>Host<\/dt><dd>(?:(?!<\/dd>)[\s\S])*?<a [^>]*?href=")([^"]*)(")/, (all, a, old, b) => { done[id] = old === site ? 'same' : 'ok'; return a + E(site) + b; });
    if (!done[id]) done[id] = 'no host link';
    h = h.replace(m[0], c2);
  }
  if (h !== h0) {
    await idb('backup', 'readwrite', s => s.put(h0, citySlug + '@' + new Date().toISOString()));
    blk.value.html = h; if (blk.value.wysiwyg) blk.value.wysiwyg.source = h; delete P.pushedServices; delete P.pendingPushedServices;
    const r = await fetch('/api/content-items/' + P.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(P) });
    done._saved = r.status;
  }
  R.log.push({ relink: { citySlug, done } }); return san(done);
};

// A page with no linked card yet: borrow one from another city page as the card template.
R.tplFrom = async citySlug => { const P = await getItem(citySlug); const h = mainBlock(P).value.html;
  const m = h.match(/<section class="rtt-pe-ride"[^>]*id="ev-([^"]+)"[\s\S]*?<\/section>/g) || []; const c = m.find(x => /data-rtt-evp="/.test(x)); if (!c) return 'none';
  R._tpl = { id: c.match(/id="ev-([^"]+)"/)[1], html: c, name: (c.match(/data-sh-name="([^"]*)"/) || [])[1].replace(/&amp;/g, '&'), slug: (c.match(/data-rtt-evp="([^"]*)"/) || [])[1] }; return 'ok ' + R._tpl.id; };
/* ---------- coming soon -> event page ---------- */
  const firstLinked = th => { const re = /<section class="rtt-pe-ride"[^>]*id="ev-([^"]+)"[\s\S]*?<\/section>/g; let m;
    while ((m = re.exec(th))) { const s = m[0]; const nm = (s.match(/data-sh-name="([^"]*)"/) || [])[1]; const sl = (s.match(/data-rtt-evp="([^"]*)"/) || [])[1];
      if (nm && sl) return { id: m[1], html: s, name: nm.replace(/&amp;/g, '&'), slug: sl, free: /data-xf-fl="[^"]*\bfree\b/.test(s) }; } return null; };
  R.convertSoon = async (city, tplCity, opt = {}) => {
    const list = R.B && R.B.cities && R.B.cities[city]; if (!list || !list.length) throw new Error('no cards for ' + city);
    const P = await getItem(city); const blk = mainBlock(P); const h0 = blk.value.html; let h = h0;
    if (!/class="rtt-soon"/.test(h0)) throw new Error('not a coming soon page');
    if (/class="rtt-pe-ride"/.test(h0)) throw new Error('page already has cards');
    const box = h0.match(/<div class="box" id="avisos">[\s\S]*?<p class="fine">[\s\S]*?<\/p><\/div>/); if (!box) throw new Error('soon box not found');
    const th = mainBlock(await getItem(tplCity)).value.html;
    const tplName = tplCity.replace(/-[a-z]+$/, '').replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
    const T = firstLinked(th); if (!T) throw new Error('template has no linked card');
    const cityName = (P.title.match(/in (.+?) (with|\()/) || [, city])[1];
    const EV = list.map(x => ev(x.card, x.slug)).sort((a, b) => a.s0 < b.s0 ? -1 : 1);
    const free = EV.filter(e => e.free), paid = EV.filter(e => !e.free);
    // styles and scripts the cards need, from the template page
    const styles = [...th.matchAll(/<style[^>]*>[\s\S]*?<\/style>/g)].map(m => m[0])
      .filter(s => !/class="transform|\.rtt-lights|\.rtt-soon\{|nav\.rtt-nb\.rtt-nb|\.rtt-kx\{|\/\*rtt-h1\*\/|\/\*rtt-h2\*\/|\.ke-gated \.rtt-host/.test(s));
    const scripts = [...th.matchAll(/<script(?![^>]*ld\+json)[^>]*>[\s\S]*?<\/script>/g)].map(m => m[0])
      .filter(s => /__shInit|__alInit|__keEmail|rtt-evp-js/.test(s))
      .map(s => s.split('#' + tplName.replace(/\s/g, '')).join('#' + cityName.replace(/[^A-Za-z0-9]/g, '')).split(tplName).join(cityName).replace(/There are \d+ Christmas events/g, 'There are ' + EV.length + ' Christmas events'))
      .map(s => s.includes('__shInit') ? s.replace(/D=\{"ev": \{[\s\S]*?\}\},/, 'D={"ev": {' + EV.map(e => '"' + e.id + '": {"w": "' + e.share + '", "c": "' + e.town + '", "f": ' + (e.free ? 1 : 0) + '}').join(', ') + '}},') : s);
    if (!scripts.some(s => s.includes('__shInit') && EV.every(e => s.includes('"' + e.id + '"')))) throw new Error('share map not replaced');
    const sec = (title, id, evs, first) => evs.length ? '<h2 class="rtt-fp__h' + (first ? ' rtt-fp__h--first' : '') + '" id="' + id + '">' + E(title) + '</h2>\n' + evs.map(e => buildCard(T, e).split(tplName).join(cityName)).join('\n') + '\n' : '';
    const n = EV.length, f = free.length;
    const intro = '<p>Rally confirmed ' + (n === 1 ? 'one Christmas event' : n + ' Christmas events') + ' for kids in ' + E(cityName) + ' for 2026' + (f ? (f === n ? (n === 1 ? ', and it is free' : ', and all of them are free') : ', ' + f + ' of them free') : '') + '. Each card links to the host for times, tickets and changes.</p>';
    const block = '<div class="rtt-post rtt-conv" id="events">' + styles.join('\n') + '\n<h2 class="t" id="events-h">Christmas events for kids in <em>' + E(cityName) + '</em> in 2026</h2>\n' + intro + '\n'
      + sec('Free Christmas events in ' + cityName, 'free-events', free, true) + sec('Ticketed Christmas events in ' + cityName, 'paid-events', paid, !free.length) + '</div>\n' + scripts.join('\n');
    h = h.replace(box[0], block);
    h = h.replace(/Rally is researching the season/g, 'Christmas events and history');
    // schema: Events + ItemList in the page's own graph
    const sm = h.match(/(<script type="application\/ld\+json">)([\s\S]*?)(<\/script>)/); const LD = JSON.parse(sm[2]); const G = LD['@graph'] || (LD['@graph'] = [LD]);
    const tLD = JSON.parse(th.match(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/)[1]); const tG = tLD['@graph'] || [tLD];
    const tpl = JSON.parse(JSON.stringify(tG.find(x => x['@type'] === 'Event'))); const PG = SITE + '/christmas-events/' + city;
    const ST = city.split('-').pop(); const TZ = ({al:'-06:00',ar:'-06:00',il:'-06:00',ia:'-06:00',ks:'-06:00',la:'-06:00',mn:'-06:00',ms:'-06:00',mo:'-06:00',ne:'-06:00',nd:'-06:00',ok:'-06:00',sd:'-06:00',tx:'-06:00',wi:'-06:00',az:'-07:00',co:'-07:00',id:'-07:00',mt:'-07:00',nm:'-07:00',ut:'-07:00',wy:'-07:00',ca:'-08:00',nv:'-08:00',or:'-08:00',wa:'-08:00',ak:'-09:00',hi:'-10:00'})[ST] || '-05:00';
    const order = free.concat(paid);
    for (const e of order) {
      const x = JSON.parse(JSON.stringify(tpl)); const r0 = e.d[0]; const parts = e.loc.split(',').map(s => s.trim()); const zip = (parts[parts.length - 1].match(/\b\d{5}\b/) || [''])[0];
      Object.assign(x, { '@id': PG + '#event-' + e.id, name: e.name + ' in ' + cityName, alternateName: e.name, description: e.tag + '. ' + e.short,
        startDate: r0[0] + (r0[1] ? 'T' + r0[1] + ':00' + TZ : ''), endDate: e.last, url: SITE + '/christmas-events/' + e.slug, mainEntityOfPage: SITE + '/christmas-events/' + e.slug, sameAs: e.url || undefined,
        location: { '@type': 'Place', name: parts[0], address: Object.assign({ '@type': 'PostalAddress', addressLocality: parts.length > 2 ? parts[parts.length - 2] : e.town, addressRegion: ST.toUpperCase(), addressCountry: 'US' }, parts.length > 3 ? { streetAddress: parts[1] } : {}, zip ? { postalCode: zip } : {}) },
        offers: Object.assign({ '@type': 'Offer', url: e.url || SITE + '/christmas-events/' + e.slug, priceCurrency: 'USD', availability: 'https://schema.org/InStock' }, e.free ? { price: 0 } : {}),
        organizer: { '@type': 'Organization', name: e.host, url: e.hostUrl || undefined }, isAccessibleForFree: e.free });
      delete x.performer; delete x.typicalAgeRange; G.push(x);
    }
    G.push({ '@type': 'ItemList', '@id': PG + '#events', name: 'Christmas events for kids in ' + cityName + ' (2026)', numberOfItems: order.length,
      itemListElement: order.map((e, k) => ({ '@type': 'ListItem', position: k + 1, item: { '@id': PG + '#event-' + e.id }, url: SITE + '/christmas-events/' + e.slug })) });
    h = h.replace(sm[0], sm[1] + JSON.stringify(LD) + sm[3]);
    // checks
    const cards = [...h.matchAll(/<section class="rtt-pe-ride"[^>]*id="ev-([^"]+)"/g)].map(m => m[1]);
    const LD2 = JSON.parse(h.match(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/)[1]); const G2 = LD2['@graph'];
    const v = { cards: cards.length, want: n, linked: EV.every(e => h.includes('data-rtt-evp="' + e.slug + '"')), events: G2.filter(x => x['@type'] === 'Event').length,
      noBox: !h.includes('coming in late November'), dash: (h.match(/[–—]/g) || []).length - (h0.match(/[–—]/g) || []).length, tplLeft: h.split(T.slug).length - 1 + (h.split(tplName).length - h0.split(tplName).length) + (T.name.length > 6 ? h.split(T.name).length - 1 : 0), size: h.length };
    v.ok = v.cards === n && v.linked && v.events === n && v.noBox && v.dash === 0 && v.tplLeft === 0;
    R.conv = { city, P, blk, h0, h };
    const rep = { city, v };
    if (opt.save) {
      if (!v.ok) return JSON.stringify(Object.assign(rep, { saved: 'REFUSED' }));
      await idb('backup', 'readwrite', s => s.put(h0, city + '@' + new Date().toISOString()));
      blk.value.html = h; delete P.pushedServices; delete P.pendingPushedServices;
      const r = await fetch('/api/content-items/' + P.id, { method: 'PUT', credentials: 'include', headers: H(), body: JSON.stringify(P) });
      const g = await getItem(city); rep.saved = r.status; rep.check = mainBlock(g).value.html === h;
    }
    return JSON.stringify(rep);
  };
})();
'RTTUS loaded';
