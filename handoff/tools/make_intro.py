#!/usr/bin/env python3
"""Chicago-style intro for a city page: lede + "What Rally found in X".

python3 make_intro.py <slug> "<Name>" <out_page_json> [--cards a.json b.json ...] [--existing parsed_existing.json] [--hub san-francisco-ca:San Francisco]
cards = disc_build cards.json files (new events); existing = city2/parse.py output of the live page (already carded).
Writes/merges intro_html, intro_counts into page.json (other keys kept).
"""
import json, sys, html, datetime, argparse, os, re
ap = argparse.ArgumentParser()
ap.add_argument('slug'); ap.add_argument('name'); ap.add_argument('out')
ap.add_argument('--cards', nargs='*', default=[]); ap.add_argument('--existing')
ap.add_argument('--hub', default='san-francisco-ca:San Francisco')
ap.add_argument('--state', default='california:California')
ap.add_argument('--today', default=datetime.date.today().isoformat())
A = ap.parse_args()
MON = ["January","February","March","April","May","June","July","August","September","October","November","December"]
SITE = "https://www.rallytakesthetrain.com"
TODAY = A.today
def md(iso): d = datetime.date.fromisoformat(iso); return f"{MON[d.month-1]} {d.day}"
def esc(s): return html.escape(s, quote=False)

new = []
for f in A.cards: new += json.load(open(f))
old = json.load(open(A.existing)) if A.existing and os.path.exists(A.existing) else []
new_ids = {c['id'] for c in new}
cards, seen = [], set()
for c in old + new:
    if c['id'] in seen: continue
    seen.add(c['id']); cards.append(c)

def span(c):
    d = (c.get('cal') or {}).get('d') or []
    if not d: return None, None
    s = min(x[0] for x in d); e = max((x[3] if len(x) > 3 and x[3] else x[0]) for x in d)
    return s, e
up = []
for c in cards:
    s, e = span(c)
    if s and e >= TODAY: up.append((s, e, c))
up.sort(key=lambda x: (x[0], x[2]['name']))
N = len(up)
def isfree(c): return 'free' in (c.get('fl') or '').split() or any(t.lower() == 'free' for t in c.get('tags', []))
def has(c, rx): return re.search(rx, (c.get('ty', '') + ' ' + c['name'] + ' ' + ' '.join(c.get('tags', []))), re.I)
free = [x for x in up if isfree(x[2])]
santa = [x for x in up if has(x[2], r'\bsanta\b')]
parade = [x for x in up if has(x[2], r'\bparade\b|tree lighting|lighting ceremony|lights the|holiday lighting')]
towns = sorted({x[2].get('town') or A.name for x in up} - {A.name})
cats = [('show', 'Christmas show', 'Christmas shows', r'\bshow\b|nutcracker|ballet|concert|theat'),
        ('lights', 'Christmas light display', 'Christmas light displays', r'\blights\b|lightscape|glow'),
        ('market', 'Christmas market', 'Christmas markets', r'\bmarket\b|\bfair\b|mercantile'),
        ('train', 'train ride', 'train rides', r'\btrain\b|railway|railroad|trolley|cable car|streetcar'),
        ('story', 'story time', 'story times', r'\bstory\b|storytime'),
        ('crafts', 'craft workshop', 'craft workshops', r'\bcrafts?\b|workshop|gingerbread|ornament'),
        ('skate', 'ice rink', 'ice rinks', r'skat|\brink\b|on ice')]
def lst(names):
    names = [n for n in names if n]
    if len(names) <= 1: return ''.join(names)
    return ', '.join(names[:-1]) + ' and ' + names[-1]
def withdate(x):
    s, e, c = x
    return f"{esc(c['name'])} ({md(s)}" + (f" to {md(e)}" if e != s and e[:4] == s[:4] else (f" to {md(e)}" if e != s else '')) + ")"

page = A.slug; url = f"{SITE}/christmas-events/{page}"
hub_slug, hub_name = A.hub.split(':', 1); st_slug, st_name = A.state.split(':', 1)
P = []
if N == 0:
    lede = (f'<a href="{SITE}/christmas-eve-tracker">Rally the corgi</a> is sniffing out Christmas events for kids in {esc(A.name)} for 2026. '
            f'We check every date on the host’s own website, and each listing links straight there.')
else:
    where = f"across {esc(A.name)} and {len(towns)} nearby town{'s' if len(towns) != 1 else ''}" if towns else f"in {esc(A.name)}"
    fr = f", {len(free)} of them free" if free else ""
    lede = (f'<a href="{SITE}/christmas-eve-tracker">Rally the corgi</a> has sniffed out the best Christmas events for kids in {esc(A.name)} for 2026, '
            f'and here is what he found: {N} family event{"s" if N != 1 else ""} {where}{fr}.')
    first = up[0]; last = max(up, key=lambda x: x[1])
    if N > 1:
        mid = [x for x in up if x is not first and x is not last][:3]
        lede += f" The magic runs from {md(first[0])} ({esc(first[2]['name'])}) through {md(last[1])}"
        lede += (f", with {lst([withdate(x) for x in mid])} along the way." if mid else ".")
    else:
        lede += f" It is {withdate(first)}."
    newx = [x for x in up if x[2]['id'] in new_ids]
    if old and newx:
        lede += f" New in this update: {lst([withdate(x) for x in newx[:3]])}."
    lede += " We check every date on the host’s own website, and each listing links straight there."
hub = '' if page == hub_slug else f' For the whole area, see <a href="{SITE}/christmas-events/{hub_slug}">Christmas events for kids in {esc(hub_name)}</a>.'
lede += hub + f' For the rest of the state, see our <a href="{SITE}/christmas-events/{st_slug}">{esc(st_name)} Christmas events for kids guide</a>.'
P.append(f'<p class="rtt-post__lede">{lede}</p>')

li = []
if N:
    tw = f" in {esc(A.name)}" + (f" and {len(towns)} nearby town{'s' if len(towns) != 1 else ''}, including {lst([esc(t) for t in towns[:3]])}" if towns else "")
    li.append(f"<strong>{N} Christmas event{'s' if N != 1 else ''} for kids</strong>{tw}")
    if free:
        li.append(f'<a href="{url}#free-events"><strong>{len(free)} free event{"s" if len(free) != 1 else ""}</strong></a>, including {lst([esc(x[2]["name"]) for x in free[:3]])}')
    if santa:
        li.append(f"<strong>Meet Santa:</strong> {len(santa)} chance{'s' if len(santa) != 1 else ''}, including {lst([withdate(x) for x in santa[:2]])}")
    if parade:
        li.append(f"<strong>Parades and tree lightings:</strong> {lst([withdate(x) for x in parade[:3]])}")
    also = []
    for k, one, many, rx in cats:
        n = sum(1 for x in up if (x[2].get('ty','').split() or [''])[0] == k or (k in ('train','skate') and re.search(rx, x[2]['name'], re.I)))
        if n: also.append(f"{n} {one if n == 1 else many}")
    if also: li.append(f"<strong>Also on the list:</strong> {lst(also)}")
    if N > 1:
        last = max(up, key=lambda x: x[1])
        li.append(f"<strong>Season:</strong> {md(up[0][0])} ({esc(up[0][2]['name'])}) to {md(last[1])} ({esc(last[2]['name'])})")
    t = datetime.date.fromisoformat(TODAY)
    li.append(f"Every date checked on the host’s own site on {MON[t.month-1][:3]} {t.day}")
    P.append('<div class="rtt-post__tldr">\n    <p class="rtt-post__tldr-k">What Rally found in ' + esc(A.name) + '</p>\n    <ul>'
             + ''.join(f'<li>{x}</li>' for x in li) + '</ul>\n  </div>')
intro = '\n'.join(P)
assert '—' not in intro and '–' not in intro and '!' not in re.sub(r'<[^>]+>', '', intro)
pj = json.load(open(A.out)) if os.path.exists(A.out) else {"slug": page, "name": A.name}
pj['intro_html'] = intro
if N:
    picks = [x[2]['name'] for x in sorted(up, key=lambda x: (not re.search(r'train|railway|santa|lights|nutcracker|parade|tree lighting', x[2]['name'], re.I), x[0]))][:4]
    if old or not pj.get('seo_title'):
        pj['seo_title'] = f"{A.name} Christmas Events for Kids 2026: {N} Event{'s' if N != 1 else ''}"
    d = f"Christmas events for kids in {A.name} for 2026: {lst(picks)}."
    if free: d += f" {len(free)} of {N} are free."
    if old or not pj.get('seo_desc'):
        pj['seo_desc'] = d
    pj['seo_description'] = pj.get('seo_desc')
pj['intro_counts'] = {"events": N, "free": len(free), "santa": len(santa), "towns": len(towns), "new": len([x for x in up if x[2]['id'] in new_ids]), "built": TODAY}
json.dump(pj, open(A.out, 'w'), indent=1, ensure_ascii=False)
print(page, pj['intro_counts'])
