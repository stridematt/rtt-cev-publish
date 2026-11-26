# All example code: Rally Takes the Train city pages and new events

Every command, script and snippet from the kit in one file. Read README.md first for the rules and the order of work.

## facts.json (two of the 19 entries in examples/facts_example.json)

One entry per event. `times` for set dates, `range` for a season. `page` is the city page slug.

```json
[
 {
  "cand": 9401,
  "name": "Lights of Life at Life University",
  "town": "Marietta",
  "venue": "Life University",
  "address": "1269 Barclay Circle, Marietta, GA 30060",
  "range": [
   "2026-11-26",
   "2026-12-31",
   "17:30",
   ""
  ],
  "when_note": "Nightly from Thanksgiving to New Year's Eve; lights come on around sunset and stay lit until about 9 or 10 pm.",
  "cost": "$15 per car or truck; $30 per bus",
  "ages": "All ages",
  "host": "Life University",
  "url": "https://www.life.edu/about/lights-of-life/",
  "kind": "lights trains",
  "indoor": false,
  "page": "marietta-ga",
  "page_name": "Marietta",
  "paras": [
   "Life University opens Lights of Life on its Marietta campus every night from Thanksgiving Day, November 26, 2026, through New Year's Eve. The lights come on around sunset and stay lit until about 9 or 10 pm, and the route is mostly a drive-through, with areas where families can park and walk.",
   "Admission is charged per vehicle at the entrance: $15 for a car or truck and $30 for a bus, paid in cash or by major card. The university calls it more than a light display, with carnival rides, train rides and a petting zoo for children in the walking areas, so plan a stop rather than a single loop."
  ],
  "tip": "Pay per car, not per person, so bring the whole family in one vehicle and leave time to park for the train and the petting zoo."
 },
 {
  "cand": 9412,
  "name": "Canton Merry Market and Christmas Parade",
  "town": "Canton",
  "venue": "Cannon Park and downtown Canton",
  "address": "130 E Main Street, Canton, GA 30114",
  "times": [
   [
    "2026-12-12",
    "12:00",
    "18:00"
   ]
  ],
  "when_note": "Market noon to 6 pm; Christmas Parade at 6 pm.",
  "cost": "Free",
  "ages": "All ages",
  "host": "Canton Optimist Club",
  "url": "https://explorecantonga.com/events/39th-annual-downtown-canton-ga-merry-market-christmas-parade/",
  "kind": "market parade santa",
  "indoor": false,
  "page": "canton-ga",
  "page_name": "Canton",
  "paras": [
   "Downtown Canton holds its 39th annual Merry Market and Christmas Parade on Saturday, December 12, 2026. The market runs from noon to 6 pm in Cannon Park with small business vendors, food and visits with Santa, and proceeds go to the Canton Optimist Club, which presents the parade.",
   "The Christmas Parade steps off at 6 pm, right as the market closes, with homemade floats, local clubs and businesses and special guests, including Santa Claus himself. Families can shop and eat in the afternoon and then find a spot on the street for the parade."
  ],
  "tip": "Shop the market in the late afternoon, then claim a curb spot downtown before the 6 pm parade."
 }
]
```

## tweaks.json example

`examples/tweaks_example.json`

```json
{
 "christmas-in-canton-ga": {
  "cand": 9411,
  "kids": ["Visit Santa", "Pet the animals at the petting zoo", "Get their face painted", "Take a wagon ride", "Watch the balloon artist", "Toast marshmallows for s'mores"],
  "site": ["Santa visits", "Petting zoo", "Face painting", "Wagon rides", "Balloon artist", "S'mores station", "Late shopping downtown"],
  "table": [["Host", "City of Canton"], ["Date", "Friday, December 11, 2026"], ["Hours", "6 to 9 pm"], ["Admission", "Free"]],
  "about": ["It is the night before the Merry Market and Christmas Parade, so families who want a quieter visit with Santa can come Friday and return Saturday for the parade."],
  "faq": [["Is Christmas in Canton free?", "Yes. The City of Canton holds it free in Cannon Park on Friday, December 11, 2026, from 6 to 9 pm."],
          ["Is there a petting zoo at Christmas in Canton?", "Yes, along with face painting, wagon rides, a balloon artist and a s'mores station."]],
  "source": "Explore Canton's events calendar"
 },
 "glimmer-and-glee-drone-show-in-kennesaw-ga": {
  "cand": 9403,
  "kids": ["Watch drones draw holiday pictures in the sky", "Listen to live music on the lawn"],
  "table": [["Host", "City of Kennesaw"], ["Music", "From 6 pm"], ["Drones", "7:30 pm"], ["Admission", "Free"]],
  "faq": [["What time is the Kennesaw drone show?", "The drones fly at 7:30 pm on Sunday, December 13, 2026, after live music that starts at 6 pm in Depot Park."]],
  "when": "Sunday, December 13, 2026, in Depot Park, Kennesaw. Live music starts at 6 pm and the drone show begins at 7:30 pm."
 }
}
```

## Shell: setup, directory, build, bundle, counts

`examples/shell_snippets.sh`

```bash
#!/usr/bin/env bash
# Rally Takes the Train: shell snippets. Not meant to run top to bottom; copy the block you need.

# ---------- A. Set up the kit in a cloud workspace (Python 3.12+) ----------
cp -r rtt-city-kit /home/claude/rtt && cd /home/claude/rtt/pipeline && mkdir -p ev out work
# Fresh list of live pages (used to avoid slug clashes). The kit has a snapshot in tools/live.json; refresh it when you can:
gh repo clone stridematt/sitemaps /home/claude/stridematt/sitemaps -- --depth 1 && export RTT_LIVE_JSON=/home/claude/stridematt/sitemaps/tools/truth/live.json
# or: export RTT_LIVE_JSON=../tools/live.json

# ---------- B. Events directory check (ON MATT'S MAC via device_bash; never print the token) ----------
cd $HOME/mnt/sa/registry && set -a && . ./.env >/dev/null 2>&1; set +a
python3 registry.py check --name "Christmas in Canton" --city Canton --cc ga --date 2026-12-11
#  "NEW 0 ..."            -> not in the directory
#  "match: RTT-... | slug" -> already live: check whether it is carded on the right city page, do not rebuild
#  a "match" with a clearly different event (e.g. Santa Storytime for Breakfast with Santa) is a false match: use --confirm-new on add

# ---------- C. Build ----------
RUN=work/canton-run        # one folder per run
mkdir -p $RUN              # write $RUN/facts.json by hand (see examples/facts_example.json)
for s in canton-ga kennesaw-ga; do mkdir -p work/$s; [ -f work/$s/$s.html ] || cp ../tools/empty_city.html work/$s/$s.html; done
python3 disc_build.py $RUN/facts.json canton-ga $RUN/cards.json          # 2nd arg is ignored when facts carry "page"
python3 us_city.py multi $RUN/cards.json                                  # ev/<slug>.json + out/<slug>/page.html
# write $RUN/tweaks.json (see examples/tweaks_example.json), then:
python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json          # venue fix, Where-is fix, extra content, rebuild, source line
python3 ../tools/uniq.py christmas-in-canton-ga glimmer-and-glee-drone-show-in-kennesaw-ga
#  every line must show >= 60.0% and [] for issues. "own website" is fine only when the url really is the host's site.
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json)
python3 mkbundle_us.py $RUN/bundle.json.gz winterfest-seattle-wa $A     # upload this file in the browser (max 3.8 MB)

# Empty price check (hold the event instead of publishing):
grep -l 'Admission: \.' out/*/page.html

# ---------- D. Directory add (Mac, after the pages are live and carded) ----------
python3 registry.py add --slug christmas-in-canton-ga --name "Christmas in Canton" --city Canton --cc ga \
  --url https://explorecantonga.com/events/christmas-in-canton-2026/ --date 2026-12-11 --status live --confirm-new
# device_bash calls time out at 180 s: about 10 adds per call.

# ---------- E. Counts (never hand-edit counts) ----------
gh api -X POST repos/stridematt/sitemaps/actions/workflows/quick-counts.yml/dispatches -f ref=main \
  -f 'inputs[pages]=/christmas-events/canton-ga,/christmas-events/kennesaw-ga'
gh run list -R stridematt/sitemaps -w quick-counts.yml -L 3 --json status,conclusion,createdAt
```

## Browser: publish, cards, checks, edits (Squarespace admin tab)

`examples/browser_snippets.js`

```javascript
/* Rally Takes the Train: browser snippets for the Squarespace admin tab.
 * Run each block with the Chrome javascript tool in a tab on
 *   https://rally-takes-the-train-site.squarespace.com/config/pages   (signed in)
 * Rules for the Chrome tool: never print anything with = ? & % (it blocks the output) -> always .replace(/[=?&%]/g,'_').
 * Write '?format'+'=json' instead of '?format=json' inside code for the same reason.
 * File input: find it with the find tool ("file input #ar-file"), then file_upload the file to that ref.
 */

// ---------- 0. Load the RTTUS library (once per tab) ----------
// Either it is cached:            await RTTUS.boot()
// or upload pipeline/rtt_us_lib_v5.js to #ar-file, then:
(0, eval)(await document.getElementById('ar-file').files[0].text()); await RTTUS.install(); 'RTTUS ready';

// ---------- 1. Publish new event pages from a bundle ----------
// file_upload work/<run>/bundle.json.gz to #ar-file first.
const r = await RTTUS.load();            // {pages, cities, bad:[]}  bad must be empty
window.__pub = null; RTTUS.publish().then(x => window.__pub = x);   // async, takes ~3 s per page
JSON.stringify(r).replace(/[=?&%]/g, '_');

// ---------- 2. Poll the publish result (repeat until not 'pending'; keep each call under 45 s) ----------
await new Promise(r => setTimeout(r, 30000));
(() => { if (!window.__pub) return 'pending'; const P = typeof window.__pub == 'string' ? JSON.parse(window.__pub) : window.__pub;
  const k = Object.keys(P); return k.length + ' pages; bad: ' + k.filter(s => !(P[s].seo == 200 && P[s].live == 200 && P[s].quick)).join(','); })();
// 'EXISTS' for a slug means it was already live: publish never overwrites. Use RTTUS.update() (section 6) for that.

// ---------- 3. City cards: dry run, then save ----------
await RTTUS.tplFrom('roswell-ga');      // needed once per tab: copies a card template from a city page that has cards
const C = ['canton-ga', 'kennesaw-ga'];  // the city pages in the bundle
const out = []; for (const c of C) { let x = await RTTUS.addCards(c); if (typeof x == 'string') x = JSON.parse(x);
  out.push(c + ':' + (x.v && x.v.ok) + ':' + x.N); }   // N = cards,free,paid -> after; ok must be true
out.join(' | ').replace(/[=?&%]/g, '_');

window.__sv = []; (async () => { for (const c of C) { try { let x = await RTTUS.addCards(c, { save: 1 }); if (typeof x == 'string') x = JSON.parse(x);
  window.__sv.push(c + ':' + (x.v && x.v.ok) + ':' + x.N + ':' + (x.saved || x.status || '')); } catch (e) { window.__sv.push(c + ':ERR:' + e.message); } }
  window.__sv.push('DONE'); })(); 'started';
// then poll:  window.__sv.join(' | ').replace(/[=?&%]/g,'_')

// ---------- 4. Check pages are live and carded (same-origin; the cloud shell cannot reach the public site) ----------
const out4 = []; for (const [c, t] of [['canton-ga', 'Christmas in Canton'], ['kennesaw-ga', 'Glimmer and Glee']]) {
  const h = await fetch('/christmas-events/' + c + '?format' + '=json').then(r => r.text()); out4.push(c + ':' + h.includes(t)); }
out4.join(' ');

// ---------- 5. Date audit: publish date today (Pacific) and schema datePublished only ----------
const S = ['christmas-in-canton-ga', 'glimmer-and-glee-drone-show-in-kennesaw-ga'];
const TODAY = new Date().toLocaleDateString('en-CA', { timeZone: 'America/Los_Angeles' });
const bad5 = []; for (const s of S) { const j = await fetch('/christmas-events/' + s + '?format' + '=json').then(r => r.json()); const b = j.item.body;
  const pub = new Date(j.item.publishOn).toLocaleDateString('en-CA', { timeZone: 'America/Los_Angeles' });
  const dp = [...new Set([...b.matchAll(/datePublished.{0,4}(\d{4}-\d\d-\d\d)/g)].map(m => m[1]))];
  let ld = true; for (const m of b.matchAll(/<script type="application\/ld\+json">([\s\S]*?)<\/script>/g)) { try { JSON.parse(m[1]); } catch (e) { ld = false; } }
  if (pub !== TODAY || dp.join() !== TODAY || /dateModified|lastReviewed/.test(b) || !ld) bad5.push(s + ' pub ' + pub + ' dp ' + dp + ' ld ' + ld); }
S.length + ' checked; issues: ' + bad5.join(' | ');

// ---------- 6. Republish existing event pages (after a fix + rebuild) ----------
// file_upload a bundle built from the fixed pages, then:
await RTTUS.load(); window.__up = null; RTTUS.update().then(x => window.__up = x); 'updating';
// poll: const U=typeof window.__up=='string'?JSON.parse(window.__up):window.__up; Object.keys(U).filter(s=>!(U[s].put==200&&U[s].check)).join(',')
// update() backs up each page to IndexedDB rtt_us/backup and keeps the original publish date.

// ---------- 7. Direct edit of any page (a city card fact, schema cleanup) ----------
// Edits BOTH the rendered html and the editor copy (wysiwyg.source): they often differ, so count matches in each.
const slug = 'brookhaven-ga';
const R7 = [['Saturdays, December 5 and 12', 'Saturdays, December 5, 12 and 19']];   // [old, new] pairs, exact text
const j7 = await fetch('/christmas-events/' + slug + '?format' + '=json').then(r => r.json());
const P7 = await fetch('/api/content-items/' + j7.item.id, { credentials: 'include' }).then(r => r.json());
const crumb = (document.cookie.split('; ').find(c => c.startsWith('crumb' + String.fromCharCode(61))) || '').split(String.fromCharCode(61))[1];
const counts = []; P7.body.layout.rows.forEach(row => row.columns.forEach(col => col.blocks.forEach(b => { if (!b.value || !b.value.html) return;
  for (const [a, z] of R7) { counts.push(b.value.html.split(a).length - 1); b.value.html = b.value.html.split(a).join(z);
    if (b.value.wysiwyg && b.value.wysiwyg.source) { counts.push(b.value.wysiwyg.source.split(a).length - 1); b.value.wysiwyg.source = b.value.wysiwyg.source.split(a).join(z); } } })));
// Look at counts BEFORE saving. Then save:
delete P7.pushedServices; delete P7.pendingPushedServices;
const put = await fetch('/api/content-items/' + P7.id, { method: 'PUT', credentials: 'include', headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': crumb }, body: JSON.stringify(P7) });
'counts ' + counts.join(',') + ' put ' + put.status;
// Also check the excerpt and SEO description: JSON.stringify(P7) for the old text, replace in the whole object the same way.
// Never use string.replace with a replacement containing "$" prices ("$15" is read as a capture group): use split/join.

// ---------- 8. Remove dateModified / lastReviewed from an event page's schema ----------
const clean = h => h.replace(/,\s*"dateModified":\s*"[^"]*"/g, '').replace(/"dateModified":\s*"[^"]*",\s*/g, '')
                    .replace(/,\s*"lastReviewed":\s*"[^"]*"/g, '').replace(/"lastReviewed":\s*"[^"]*",\s*/g, '');
// apply clean() to b.value.html and b.value.wysiwyg.source as in section 7, PUT, then rerun section 5.
```

## tools/tweak_pages.py

`tools/tweak_pages.py`

```python
#!/usr/bin/env python3
"""Apply the hand-written fixes and extra content to built event JSONs, then rebuild the pages.

Run from the pipeline folder after `us_city.py multi`:
  python3 ../tools/tweak_pages.py <facts.json> <tweaks.json>

What it always does (fixes known generator bugs), for every slug in tweaks.json:
  - venue name: locations[].name/area, where_short and facts2 'where' use the venue, not the street
  - "Where is" quick answer: "<name> is at <venue>, <address>."
What it does per slug when the tweak has the key:
  kids      list  -> page.kids_do           (what children do there)
  site      list  -> page.on_site           (what is at the event)
  table     list of [label, value] rows, replaces rows with the same label
  about     list of extra paragraphs (sourced facts only)
  faq       list of [question, answer] (added if the question is new)
  when      string -> replaces the "When is ..." quick answer and FAQ answer
  source    string, e.g. "Visit Henry County's events calendar": replaces "<host>'s own website/own site/public website"
            in the JSON (use when the facts came from a city or CVB calendar, not the host's own site)
  org       string -> page.organizer_url (the host's own site, when the facts url is only a calendar)

tweaks.json: {"<event-slug>": {"cand": 9401, "kids": [...], ...}, ...}   ("cand" matches facts.json)
After it runs, it calls build_listed.py for each slug and post_source.py for the slugs that have "source".
"""
import json, sys, os, subprocess

HERE = os.getcwd()
facts = {f["cand"]: f for f in json.load(open(sys.argv[1]))}
tweaks = json.load(open(sys.argv[2]))

for slug, t in tweaks.items():
    path = os.path.join(HERE, "ev", slug + ".json")
    e = json.load(open(path)); p = e["page"]; x = facts[t["cand"]]
    # generator bug 1: street used as the venue name
    for L in p.get("locations") or []:
        L["name"] = L["area"] = x["venue"]
    p["where_short"] = f"{x['venue']}, {x['town']}"
    for r in p.get("facts2") or []:
        if r[0] == "where":
            street = (p.get("locations") or [{}])[0].get("street") or x["address"].split(",")[0]
            r[1] = x["venue"]; r[2] = f"{street}, {x['town']}"
    # generator bug 2: "Where is" repeats the street
    for q in p.get("quick") or []:
        if q[0].startswith("Where is"):
            q[1] = f"{x['name']} is at {x['venue']}, {x['address']}."
    if t.get("kids"): p["kids_do"] = t["kids"]
    if t.get("site"): p["on_site"] = t["site"]
    if t.get("table"):
        keys = {k for k, _ in t["table"]}
        p["table"] = [r for r in p.get("table") or [] if r[0] not in keys] + t["table"]
    for a in t.get("about", []):
        if a not in p["about"]: p["about"].append(a)
    for q in t.get("faq", []):
        if q[0] not in [y[0] for y in p.get("faq") or []]: p.setdefault("faq", []).append(q)
    if t.get("when"):
        for lst in (p.get("quick") or [], p.get("faq") or []):
            for q in lst:
                if q[0].startswith("When is"): q[1] = t["when"]
    if t.get("org"): p["organizer_url"] = t["org"]
    s = json.dumps(e, ensure_ascii=False)
    if t.get("source"):
        host = x["host"]
        for a in (f"{host}'s own website", f"{host}'s own site", f"{host}'s public website",
                  f"{host}' own website", f"{host}' own site", f"{host}' public website"):
            s = s.replace(a, t["source"])
    json.dump(json.loads(s), open(path, "w"), indent=1, ensure_ascii=False)
    subprocess.run(["python3", "build_listed.py", path], check=True, capture_output=True)
    print("tweaked + rebuilt", slug)

src = {s: t["source"] for s, t in tweaks.items() if t.get("source")}
if src:
    json.dump(src, open("/tmp/_post_source.json", "w"))
    subprocess.run(["python3", os.path.join(os.path.dirname(os.path.abspath(__file__)), "post_source.py"), "/tmp/_post_source.json"], check=True)
```

## tools/post_source.py

`tools/post_source.py`

```python
#!/usr/bin/env python3
"""Rewrite the template line "We listed X from <Host>'s public website" to the real source, in out/<slug>/page.html.

build_listed.py writes that line from the organizer name, so it is wrong when the facts came from a city or CVB calendar.
Run AFTER every build_listed.py run (a rebuild puts the old wording back), from the pipeline folder:
  python3 ../tools/post_source.py map.json        map.json = {"<slug>": "Visit Henry County's events calendar", ...}
"""
import html, re, sys, json

for slug, src in json.load(open(sys.argv[1])).items():
    f = f"out/{slug}/page.html"; t = open(f).read()
    t, n = re.subn(r" from [^<>]{3,80}?(?:&#x27;|')s? public website", " from " + html.escape(src), t)
    open(f, "w").write(t); print(n, slug)
```

## tools/split_cards.py

`tools/split_cards.py`

```python
#!/usr/bin/env python3
"""Split the combined cards.json from disc_build.py into one file per city page and print the mkbundle_us.py arguments.
  python3 ../tools/split_cards.py work/<run>/facts.json work/<run>/cards.json
Prints e.g.  canton-ga:work/<run>/cards_canton-ga.json kennesaw-ga:work/<run>/cards_kennesaw-ga.json
"""
import json, sys, os, collections
facts = {f["name"]: f["page"] for f in json.load(open(sys.argv[1]))}
cards = json.load(open(sys.argv[2])); d = os.path.dirname(sys.argv[2]); by = collections.defaultdict(list)
for c in cards: by[facts[c["name"]]].append(c)
args = []
for city, cs in by.items():
    p = os.path.join(d, f"cards_{city}.json"); json.dump(cs, open(p, "w"), indent=1, ensure_ascii=False); args.append(f"{city}:{p}")
print(" ".join(args))
```

## tools/uniq.py

`tools/uniq.py` (run from pipeline/; checks every new page against every page in out/)

```python
import re,glob,html,sys,json
def txt(p):
    b=open(p).read(); b=re.sub(r"<script.*?</script>|<style.*?</style>","",b,flags=re.S); return html.unescape(re.sub(r"<[^>]+>"," ",b))
def grams(t):
    w=re.findall(r"[a-z0-9']+",t.lower()); return set(tuple(w[i:i+5]) for i in range(len(w)-4))
new=sys.argv[1:]; allp=glob.glob('out/*/page.html'); G={p:grams(txt(p)) for p in allp}
bad=re.compile(r"(?i)not stated|see the host page for|check the host's page|no admission price|does not (list|say|give|state)|price not")
for s in new:
    p=f'out/{s}/page.html'; g=G[p]; best=max(((len(g&G[q])/len(g),q) for q in allp if q!=p),default=(0,''))
    t=txt(p); issues=[m.group(0) for m in bad.finditer(t)]+(['dash'] if re.search('[–—]',t) else [])+(['!'] if '!' in t else [])
    ow=[t[max(0,m.start()-60):m.end()+10].replace('\n',' ') for m in re.finditer('own website',t)][:1]
    print(f"{100-100*best[0]:5.1f}% unique vs {best[1].split('/')[1][:40]:40s} {s[:50]} {issues} {ow}")
```

## pipeline/disc_build.py (facts to cards)

`pipeline/disc_build.py`

```python
#!/usr/bin/env python3
"""Discovery candidates -> city-page cards (parse.py shape) with the boilerplate done by code.

Claude writes only a short facts file per city (facts read from each event's own page) plus 2 paragraphs and a tip;
this script derives everything else: card id, When text, badge, calendar rows, filters, tags, host and ticket links.

Usage:
  python3 disc_build.py <facts.json> <city-slug> <out-cards.json>
facts.json: list of
  {"cand": 24, "url": "...", "name": "...", "town": "Raleigh", "venue": "...", "address": "street, town, ST zip",
   "times": [["2026-12-04","17:00","21:00"], ...], "cost": "Free" | "Kids $8; adults $7", "ages": "All ages",
   "host": "...", "kind": "santa|market|lights|show|parade|crafts|story|food|outing|service" (space separated, optional),
   "indoor": true|false|null, "paras": ["...", "..."], "tip": "...", "when_note": "optional text added after the times"}
"""
import json, sys, re, datetime, unicodedata

CHK = "On the host’s page, checked {d}"
MON = ["January","February","March","April","May","June","July","August","September","October","November","December"]
DAY = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
KIND_TAG = [("service", "Christmas Eve service"), ("santa", "Santa visit"), ("market", "Christmas market"), ("lights", "Christmas lights"),
            ("parade", "Christmas parade"), ("show", "Holiday show"), ("story", "Storytime"), ("crafts", "Christmas crafts"), ("food", "Breakfast with Santa")]
GUESS = [("service", r"christmas eve|candlelight|worship|mass\b|service"), ("santa", r"santa|claus|st\.? nicholas"), ("market", r"market|bazaar|vendor"),
         ("lights", r"light|lighting|glow"), ("parade", r"parade"), ("show", r"nutcracker|carol\b|ballet|concert|cantata|choir|play|theat|symphony|pops|movie|film|screening|wrestling"),
         ("story", r"story ?time|storytime|story"), ("crafts", r"craft|workshop|make and take|cookie decorat"), ("food", r"breakfast|brunch|pancake|cocoa|cookies")]

def slug(s):
    s = unicodedata.normalize("NFKD", s).encode("ascii", "ignore").decode().lower().replace("'", "").replace("&", "and")
    return re.sub(r"-+", "-", re.sub(r"[^a-z0-9]+", "-", s)).strip("-")

def t12(t):
    h, m = map(int, t.split(":")); ap = "am" if h < 12 else "pm"; h = h % 12 or 12
    return ("noon" if (h == 12 and m == 0 and ap == "pm") else f"{h}{'' if not m else ':%02d' % m} {ap}")

def trange(a, b):
    if a and b:
        A, B = t12(a), t12(b)
        if A.endswith(B[-2:]) and A[-2:] in ("am", "pm") and B[-2:] in ("am", "pm"): A = A[:-3]
        return f"{A} to {B}"
    return t12(a) if a else ""

def dlong(iso):
    d = datetime.date.fromisoformat(iso); return f"{DAY[d.weekday()]}, {MON[d.month-1]} {d.day}, {d.year}"

def when_text(times, note=""):
    by = {}
    for d, a, b in times: by.setdefault(d, []).append((a, b))
    days = sorted(by)
    if len(days) == 1:
        slots = by[days[0]]
        s = dlong(days[0]) + ", " + (trange(*slots[0]) if len(slots) == 1 else " and ".join(t12(a) for a, _ in slots))
    elif len(days) <= 4:
        s = "; ".join(dlong(d) + ", " + ", ".join(trange(a, b) for a, b in by[d]) for d in days)
    else:
        s = f"{dlong(days[0])} to {dlong(days[-1])} ({len(days)} dates)"
    return s + (f" ({note})" if note else "")

def badge(times):
    days = sorted({d for d, _, _ in times}); d0 = datetime.date.fromisoformat(days[0])
    if len(days) == 1: return [MON[d0.month-1][:3], str(d0.day), DAY[d0.weekday()][:3]]
    d1 = datetime.date.fromisoformat(days[-1]); return [MON[d0.month-1][:3], str(d0.day), f"to {MON[d1.month-1][:3]} {d1.day}"]

def rbadge(a, b):
    x, y = datetime.date.fromisoformat(a), datetime.date.fromisoformat(b)
    return [MON[x.month-1][:3], str(x.day), f"to {MON[y.month-1][:3]} {y.day}"]

def rwhen(a, b, o, c, note=""):
    s = f"{dlong(a)} to {dlong(b)}" + (", " + trange(o, c) if o else "")
    return s + (f" ({note})" if note else "")

def kinds(f):
    if f.get("kind"): return f["kind"].split()
    hay = (f["name"] + " " + " ".join(f.get("paras", []))).lower()
    name = f["name"].lower()
    first = [k for k, rx in GUESS if re.search(rx, name)]
    rest = [k for k, rx in GUESS if re.search(rx, hay) and k not in first]
    return (first + rest)[:3] or ["outing"]

def card(f, city_key, checked):
    rng = f.get("range")  # [start, end, open, close]: one run of dates (daily or select days)
    if rng:
        r0, r1, ra, rb = (list(rng) + ["", ""])[:4]
        assert re.match(r"2026-1[0-2]-\d\d", r0) and re.match(r"2026-1[12]-\d\d|2027-01-\d\d", r1) and r1 >= "2026-11-25", f"out of season {f['name']}"
        times = [[r0, ra, rb]]
    else:
        times = [[d, a or "", b or ""] for d, a, b in f["times"]]
        for d, a, _ in times: assert re.match(r"2026-1[12]-\d\d|2027-01-0[1-6]", d), f"out of season {f['name']} {d}"
    k = kinds(f); free = f["cost"].lower().startswith("free")
    weekend = any(datetime.date.fromisoformat(d).weekday() >= 5 for d, _, _ in times)
    fl = " ".join(x for x in ["free" if free else "", "weekend" if weekend else "", "indoor" if f.get("indoor") else "",
                              "little" if re.search(r"toddler|ages? [0-3]\b|2 to|little", f.get("ages", ""), re.I) else ""] if x)
    tags = [next((t for kk, t in KIND_TAG if kk == k[0]), "Christmas event")] + (["Free"] if free else [])
    nm = f["name"]; town = f["town"]
    # url = the host's own site (website and Host link); tickets = the ticket seller (tickets button only). Never Eventbrite as the website.
    site = f.get("url") or ""
    if re.search(r"eventbrite\.|ticketleap|ticketmaster", site): site = ""
    if not site: print(f"NOTE no host website for {nm}: tickets link only, no Host link")
    book = f.get("tickets") or site
    for x in (f["paras"] + [f["tip"]]): assert "—" not in x and "–" not in x and "!" not in x, f"dash or ! in {nm}"
    return {"id": f"ev-{city_key}-{slug(nm)}"[:90], "ty": " ".join(k), "fl": fl, "town": town,
            "cal": {"n": nm, "l": f["address"], "u": site, "m": "", "d": ([[r0, ra, rb, r1]] if rng else [[d, a, b, ""] for d, a, b in times])},
            "badge": (rbadge(r0, r1) if rng else badge(times)), "tags": tags, "name": nm,
            "facts": {"When": (rwhen(r0, r1, ra, rb, f.get("when_note", "")) if rng else when_text(times, f.get("when_note", ""))), "Where": f"{f['venue']}, {f['address']}" if f.get("venue") and f["venue"] not in f["address"] else f["address"],
                      "Cost": f["cost"], "Ages": f.get("ages") or "Families"},
            "paras": f["paras"], "tip": f["tip"],
            "dl": {"Host": {"t": f["host"], "href": site}, "Address": {"t": f["address"], "href": ""}, "Confirmed": {"t": CHK.format(d=checked), "href": ""}},
            "book": book, "book_label": [("Get tickets" if f.get("tickets") else "See details and dates"), "from " + re.sub(r"^www\.", "", book.split("/")[2]).split(".")[0].capitalize()],
            "other_tags": [], "verified": False, "cand": f.get("cand"), "page": f.get("page"), "page_name": f.get("page_name")}

if __name__ == "__main__":
    facts, city_slug, out = sys.argv[1], sys.argv[2], sys.argv[3]
    today = datetime.date.today(); checked = f"{MON[today.month-1]} {today.day}, {today.year}"
    cards = [card(f, (f.get("page") or city_slug).rsplit("-", 1)[0], checked) for f in json.load(open(facts))]
    ids = [c["id"] for c in cards]; assert len(ids) == len(set(ids)), "duplicate card ids"
    json.dump(cards, open(out, "w"), indent=1, ensure_ascii=False)
    for c in cards: print(c["id"], "|", c["facts"]["When"], "|", c["ty"], "|", c["fl"])
```

## pipeline/us_city.py (cards to event pages and per-city bundles)

`pipeline/us_city.py`

```python
#!/usr/bin/env python3
"""One command from cards to a publish bundle for one US city page.

  python3 us_city.py <city-slug> <city name> <cards.json> <city.html>
  e.g. python3 us_city.py raleigh-nc Raleigh work/raleigh/cards.json work/raleigh/raleigh-nc.html

Runs conv.py, enrich_listed.py, the source wording fix, build_listed.py and mkbundle_us.py, then prints a check per page
(words, dashes, leftovers) and the bundle path. Needs Python 3.12+ (cloud workspace).
"""
import json, sys, os, re, glob, html, subprocess, shutil

STATES = {"al":"Alabama","ak":"Alaska","az":"Arizona","ar":"Arkansas","ca":"California","co":"Colorado","ct":"Connecticut","de":"Delaware","dc":"District of Columbia","fl":"Florida","ga":"Georgia","hi":"Hawaii","id":"Idaho","il":"Illinois","in":"Indiana","ia":"Iowa","ks":"Kansas","ky":"Kentucky","la":"Louisiana","me":"Maine","md":"Maryland","ma":"Massachusetts","mi":"Michigan","mn":"Minnesota","ms":"Mississippi","mo":"Missouri","mt":"Montana","ne":"Nebraska","nv":"Nevada","nh":"New Hampshire","nj":"New Jersey","nm":"New Mexico","ny":"New York","nc":"North Carolina","nd":"North Dakota","oh":"Ohio","ok":"Oklahoma","or":"Oregon","pa":"Pennsylvania","ri":"Rhode Island","sc":"South Carolina","sd":"South Dakota","tn":"Tennessee","tx":"Texas","ut":"Utah","vt":"Vermont","va":"Virginia","wa":"Washington","wv":"West Virginia","wi":"Wisconsin","wy":"Wyoming"}
TZ = {"wa":"America/Los_Angeles","or":"America/Los_Angeles","ca":"America/Los_Angeles","nv":"America/Los_Angeles","az":"America/Phoenix","ut":"America/Denver","co":"America/Denver","nm":"America/Denver","id":"America/Boise","mt":"America/Denver","wy":"America/Denver",
      "tx":"America/Chicago","ok":"America/Chicago","ks":"America/Chicago","ne":"America/Chicago","sd":"America/Chicago","nd":"America/Chicago","mn":"America/Chicago","ia":"America/Chicago","mo":"America/Chicago","ar":"America/Chicago","la":"America/Chicago","ms":"America/Chicago","al":"America/Chicago","tn":"America/Chicago","wi":"America/Chicago","il":"America/Chicago",
      "hi":"Pacific/Honolulu","ak":"America/Anchorage"}
HERE = os.path.dirname(os.path.abspath(__file__))

def run(*a):
    r = subprocess.run(a, cwd=HERE, capture_output=True, text=True)
    if r.returncode: sys.exit(f"FAILED {' '.join(a)}\n{r.stdout}\n{r.stderr}")
    return r.stdout

def main(city_slug, city_name, cards, city_html):
    st = city_slug.rsplit("-", 1)[1]
    work = os.path.join(HERE, "work", city_slug); evd = os.path.join(work, "ev"); shutil.rmtree(evd, ignore_errors=True); os.makedirs(evd)
    live = os.environ.get("RTT_LIVE_JSON", "/home/claude/stridematt/sitemaps/tools/truth/live.json")
    existing = os.path.join(work, "existing.txt")
    open(existing, "w").write("\n".join(k.split("/")[-1] for k in json.load(open(live))["pages"]))
    towns = sorted({c["town"] for c in json.load(open(cards))} | {city_name})
    run("python3", "city2/conv.py", "--cards", cards, "--city_slug", city_slug, "--city_name", city_name, "--label", city_name,
        "--label_towns", city_name, "--state_code", st.upper(), "--state_name", STATES[st], "--tz", TZ.get(st, "America/New_York"),
        "--out", evd, "--existing", existing)
    run("python3", "enrich_listed.py", evd, city_html)
    for f in glob.glob(evd + "/*.json"):   # facts came from a ticket page, not the host's own site: say so
        s = open(f).read(); e = json.loads(s); org = e["survey"].get("organizer_name") or ""
        host = (e["survey"].get("ticket_link") or "").split("/")[2] if "//" in (e["survey"].get("ticket_link") or "") else ""
        if re.search(r"eventbrite|ticketleap|ticketmaster|universe\.com|showclix|etix", host):
            for p in {org + "'s", org + "’s", org + "'", org + "’"}:
                s = s.replace(p + " own website", "the event's " + host.replace("www.", "").split(".")[0].capitalize() + " page")
        open(f, "w").write(s)
    for f in glob.glob(evd + "/*.json"):
        shutil.copy(f, os.path.join(HERE, "ev"))
        run("python3", "build_listed.py", f)
    bundle = os.path.join(work, f"b_{city_slug}.json.gz")
    print(run("python3", "mkbundle_us.py", bundle, "winterfest-seattle-wa", f"{city_slug}:{cards}").strip())
    bad = 0
    for f in sorted(glob.glob(evd + "/*.json")):
        s = json.load(open(f))["slug"]; b = open(os.path.join(HERE, "out", s, "page.html")).read()
        t = html.unescape(re.sub(r"<[^>]+>", " ", re.sub(r"<script.*?</script>|<style.*?</style>", "", b, flags=re.S)))
        issues = [x for x in ["—", "–", "own website", " None", "null", "undefined", "TODO"] if x in t]
        bad += bool(issues); print(f"{len(t.split()):5d} words  {s}  {issues or ''}")
    print("BUNDLE", bundle, "OK" if not bad else f"{bad} pages need a look")

def city_html(city_slug):
    """The city page's code block, free from the admin domain (no Firecrawl)."""
    import urllib.request
    p = os.path.join(HERE, "work", city_slug); os.makedirs(p, exist_ok=True); f = os.path.join(p, city_slug + ".html")
    if not os.path.exists(f):
        j = json.load(urllib.request.urlopen(f"https://rally-takes-the-train-site.squarespace.com/christmas-events/{city_slug}?format=json", timeout=60))
        open(f, "w").write(j["item"]["body"])
    return f

def multi(cards_file):
    """Cards carrying "page" (city slug) and "page_name": one bundle per city page, one combined bundle for publishing."""
    import gzip
    cards = json.load(open(cards_file)); groups = {}
    for c in cards: groups.setdefault((c["page"], c["page_name"]), []).append(c)
    specs = []
    for (slug_, name), cs in groups.items():
        f = os.path.join(HERE, "work", slug_, "cards.json"); os.makedirs(os.path.dirname(f), exist_ok=True)
        json.dump(cs, open(f, "w"), indent=1, ensure_ascii=False)
        main(slug_, name, f, city_html(slug_)); specs.append(f"{slug_}:{f}")
    out = os.path.join(os.path.dirname(os.path.abspath(cards_file)), "bundle.json.gz")
    print(run("python3", "mkbundle_us.py", out, "winterfest-seattle-wa", *specs).strip())

if __name__ == "__main__":
    if sys.argv[1] == "multi": multi(sys.argv[2])
    else: main(*sys.argv[1:5])
```

## pipeline/mkbundle_us.py (bundle for the browser)

`pipeline/mkbundle_us.py`

```python
#!/usr/bin/env python3
"""Pack built US event pages + their city-page cards into one bundle for rtt_us_lib.js.
Usage: python3 mkbundle_us.py <out.json.gz> <template-event-slug> <city-slug>:<cards.json> [<city-slug>:<cards.json> ...]
  cards.json = list of parse.py-shape cards (what new_cards.py writes as NEW), each with "id" like ev-seattle-xxx.
  Event pages are read from out/<slug>/page.html and ev/<slug>.json (slug = card's event page slug, matched by source_card).
"""
import json, gzip, hashlib, sys, glob

STATES = {"AL":"Alabama","AK":"Alaska","AZ":"Arizona","AR":"Arkansas","CA":"California","CO":"Colorado","CT":"Connecticut","DE":"Delaware","DC":"District of Columbia","FL":"Florida","GA":"Georgia","HI":"Hawaii","ID":"Idaho","IL":"Illinois","IN":"Indiana","IA":"Iowa","KS":"Kansas","KY":"Kentucky","LA":"Louisiana","ME":"Maine","MD":"Maryland","MA":"Massachusetts","MI":"Michigan","MN":"Minnesota","MS":"Mississippi","MO":"Missouri","MT":"Montana","NE":"Nebraska","NV":"Nevada","NH":"New Hampshire","NJ":"New Jersey","NM":"New Mexico","NY":"New York","NC":"North Carolina","ND":"North Dakota","OH":"Ohio","OK":"Oklahoma","OR":"Oregon","PA":"Pennsylvania","RI":"Rhode Island","SC":"South Carolina","SD":"South Dakota","TN":"Tennessee","TX":"Texas","UT":"Utah","VT":"Vermont","VA":"Virginia","WA":"Washington","WV":"West Virginia","WI":"Wisconsin","WY":"Wyoming"}

def main(out, template, specs):
    evs = {}
    for f in glob.glob("ev/*.json"):
        e = json.load(open(f)); evs[e.get("source_card")] = e
    B = {"v": 1, "template": template, "meta": {}, "pages": {}, "cities": {}}
    for spec in specs:
        city, cf = spec.split(":", 1)
        cards = json.load(open(cf)); B["cities"][city] = []
        for c in cards:
            e = evs.get(c["id"])
            if not e: sys.exit(f"no built event page for card {c['id']}")
            s, p, sv = e["slug"], e["page"], e["survey"]
            h = open(f"out/{s}/page.html").read()
            assert "–" not in h and "—" not in h, s
            primary = next(x for x in p["cities"] if x.get("primary"))
            B["pages"][s + ".html"] = h
            B["meta"][s] = {"title": p["h1"], "seo_title": p["title"], "seo_desc": p["description"], "excerpt": p["description"],
                            "sha": hashlib.sha256(h.encode()).hexdigest()[:16], "town": sv["venue_city"], "state": sv["venue_state"],
                            "state_name": STATES.get(sv["venue_state"], sv["venue_state"]), "city": primary["name"],
                            "tags": ["Christmas events", STATES.get(sv["venue_state"], sv["venue_state"]), primary["name"]]}
            c = dict(c); c["checked"] = e["checked"]
            B["cities"][city].append({"slug": s, "card": c})
    raw = json.dumps(B, ensure_ascii=False).encode()
    open(out, "wb").write(gzip.compress(raw, 9))
    print(out, len(raw), "bytes,", len(B["meta"]), "pages,", {k: len(v) for k, v in B["cities"].items()})

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3:])
```

## Not inlined (too long, in the kit)

- `pipeline/build_listed.py` (905 lines): renders out/<slug>/page.html from ev/<slug>.json
- `pipeline/enrich_listed.py`, `quick_answers.py`, `locale_rules.py`, `tracker.py`, `marquee.py`, `og.py`, `city2/conv.py`, `city2/parse.py`
- `pipeline/rtt_us_lib_v5.js`: the RTTUS browser library (load, publish, addCards, update, restore, tplFrom, relink, convertSoon)
