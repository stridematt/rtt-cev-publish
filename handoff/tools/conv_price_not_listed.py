import sys, argparse
ap=argparse.ArgumentParser()
for a in ['cards','city_slug','city_name','label','label_towns','state_code','state_name','tz','out','existing']: ap.add_argument('--'+a)
A=ap.parse_args()
LABEL_TOWNS=set(x.strip() for x in (A.label_towns or A.city_name).split('|'))
EXISTING=set(l.strip() for l in open(A.existing)) if A.existing else set()
import json, re, datetime, html
cards=[c for c in json.loads(open(A.cards).read().replace('\u2013','-').replace('\u2014','-').replace('\\u2013','-').replace('\\u2014','-')) if not c.get('verified')]
MON=["January","February","March","April","May","June","July","August","September","October","November","December"]
DAY=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
STATE={A.state_code:A.state_name}
TODAY=datetime.date.today().isoformat()
def poss(n): return n if n.endswith("'s") or n.endswith('\u2019s') else (n+"'" if n.endswith('s') else n+"'s")
import unicodedata
def slugify(s):
    s=unicodedata.normalize('NFKD',s).encode('ascii','ignore').decode().lower().replace("'",'').replace('&','and')
    return re.sub(r'-+','-',re.sub(r'[^a-z0-9]+','-',s)).strip('-')
def t12(t):
    if not t: return ''
    h,m=map(int,t.split(':')); ap='am' if h<12 else 'pm'; h=h%12 or 12
    return f"{h}{'' if m==0 else ':%02d'%m} {ap}"
def trange(a,b):
    if a and b:
        A,B=t12(a),t12(b)
        if A[-2:]==B[-2:]: A=A[:-3]
        return f"{A} to {B}"
    if a: return f"Starts at {t12(a)}"
    if b: return f"Until {t12(b)}"
    return ''
def dlong(iso): d=datetime.date.fromisoformat(iso); return f"{DAY[d.weekday()]}, {MON[d.month-1]} {d.day}, {d.year}"
def dmid(iso): d=datetime.date.fromisoformat(iso); return f"{MON[d.month-1]} {d.day}, {d.year}"
def first_sentence(t):
    m=re.match(r'(.+?[.!?])(\s|$)',t); return m.group(1) if m else t
def parse_addr(a):
    a=a.strip(); parts=[x.strip() for x in a.split(',')]
    m=re.match(r'^([A-Z]{2})(?:\s+(\d{5}))?$',parts[-1]) if parts else None
    if not m: return {"name":parts[0],"street":"","city":"","state":A.state_code,"zip":""}
    st,zp=m.group(1),m.group(2) or ''
    city=parts[-2] if len(parts)>=2 else ''
    mid=parts[1:-2]
    name=parts[0] if len(parts)>=3 else ''
    street=', '.join(mid) if mid else (parts[0] if len(parts)==3 else '')
    if len(parts)==3 and not re.search(r'\d',parts[0]): street=''  # e.g. "Hudson Yards, New York, NY"
    return {"name":name or city,"street":street,"city":city,"state":st,"zip":zp}
SLUG_FIX={}
used=set(); out=[]
for c in cards:
    f=c['facts']; dl=c['dl']; d=c['cal']['d']
    def _fx(x):
        if not x: return x
        p=x.split('-'); return f"{p[0]}-{int(p[1]):02d}-{int(p[2]):02d}" if len(p)==3 else x
    _ht=lambda t: '23:59' if t in ('24:00','24:00:00') else t
    d=[[_fx(x[0]),_ht(x[1]),_ht(x[2]),_fx(x[3])] for x in d]
    full_addr=re.sub(r'\s*\(near [^)]*\)$','',(dl.get('Address',{}).get('t') or f['Where']).strip())
    ad=parse_addr(full_addr)
    town=ad['city'] or c['town']; st=ad['state']
    nm=re.sub(r'\s*\b20(2[5-7])\b\s*',' ',c['name'].replace('\u2019','')).strip()
    base=slugify(nm); ts=slugify(town)
    slug=base if (ts in base) else f"{base}-{ts}"
    slug=f"{slug}-{st.lower()}"
    slug=SLUG_FIX.get(slug,slug)
    if len(slug)>80:
        tail=(f"-{ts}" if ts not in base else "")+f"-{st.lower()}"
        b2=base[:80-len(tail)]
        if '-' in b2 and not base.startswith(b2+'-') and b2!=base: b2=b2.rsplit('-',1)[0]
        b2=b2.strip('-')
        while b2.rsplit('-',1)[-1] in ('with','and','at','the','of','for','a','in','on','to'): b2=b2.rsplit('-',1)[0]
        slug=b2+tail
    if slug in used or slug in EXISTING:
        k=2
        while f'{slug}-{k}' in used or f'{slug}-{k}' in EXISTING: k+=1
        print('SLUG CLASH', slug, '->', f'{slug}-{k}'); slug=f'{slug}-{k}'
    used.add(slug)
    dates=[x[0] for x in d]; ends=[x[3] or x[0] for x in d]
    sd=min(dates); ed=max(ends)
    first=sorted(d,key=lambda x:x[0])[0]
    st_time=first[1]; en_time=first[2] if (sd==ed) else ''
    rows=[]
    for x in sorted(d,key=lambda x:x[0]):
        tr=trange(x[1],x[2])
        if x[3] and x[3]!=x[0]:
            rows.append([f"{dmid(x[0])} to {dmid(x[3])}", (tr+", on open days" if tr else "Days and hours are on the host's site")])
        else:
            rows.append([dlong(x[0]), tr or "Time is on the host's site"])
    pass
    if len(rows)==1 and not (d[0][3] and d[0][3]!=d[0][0]): rows=[[f['When'], '']]
    org=dl.get('Host',{}).get('t') or (c['book_label'][1].replace('from ','') if len(c['book_label'])>1 else '') or (dl.get('Address',{}).get('t') or f.get('Where','')).split(',')[0].strip() or c['town']
    org_url=dl.get('Host',{}).get('href') or ''
    cost=f['Cost']; free='Free' in c['tags'] or cost.lower().startswith('free')
    cost_short=re.split(r';|\. ',cost)[0].strip()
    ages=f.get('Ages','')
    signup=dl.get('Sign-up',{}).get('t','')
    m=re.search(r'datetime="(\d{4}-\d\d-\d\d)"',json.dumps(dl)) 
    checked=re.search(r'(\d{4}-\d\d-\d\d)',json.dumps(c['dl'].get('Confirmed',{}))) 
    chk='2026-11-04'
    # the Confirmed row text is "On the host's page, checked November 4, 2026"
    mm=re.search(r'checked ([A-Z][a-z]+) (\d+), (\d{4})',dl.get('Confirmed',{}).get('t',''))
    if mm: chk=datetime.date(int(mm.group(3)),MON.index(mm.group(1))+1,int(mm.group(2))).isoformat()
    b=list(c['badge'])
    if len(b)<3:
        _d0=datetime.date.fromisoformat(sd); b=[MON[_d0.month-1][:3], str(_d0.day), (b[2] if len(b)>2 else '')]
    sdd=datetime.date.fromisoformat(sd)
    when_short=f"{b[0]} {b[1]}"+(f" {b[2]}" if b[2].startswith('to ') else "")
    venue=ad['name']; where_short=f"{venue}, {town}" if venue!=town else town
    typ=[t for t in c['tags'] if t not in ('Free','Paid','Tickets')][:1] or ['Christmas event']
    h1=c['name']; yr=sd[:4]
    city_label=A.label if town in LABEL_TOWNS else town
    tn=re.sub(r'\s*\b20(2[5-7])\b\s*',' ',h1).strip()
    def fit(n):
        for t in (f"{n} 2026 | {city_label}", f"{n} 2026"):
            if len(t)<=62: return t
        return None
    title=fit(tn)
    if not title:
        cuts=[m.start() for m in re.finditer(r' at | and | with |: | \(| for ',tn)]
        for k in sorted(cuts,reverse=True):
            t=fit(tn[:k].rstrip(' :'))
            if t and k>=12: title=t; break
    if not title: title=tn[:55].rsplit(' ',1)[0]+" 2026"
    desc=f"{tn} {yr}: {when_short}, {where_short}. {cost_short}."
    if len(desc)>155: desc=f"{h1}: {when_short}, {where_short}. {cost_short}."
    if len(desc)>155: desc=f"{h1}: {when_short}, {town}. {'Free.' if free else 'Dates, prices and parent tips.'}"
    if len(desc)>155: desc=desc[:152].rsplit(' ',1)[0]+'.'
    faq=[[f"When is {h1} in {yr}?", f['When']+"."], [f"Where is {h1}?", full_addr+"."],
         [f"How much does {h1} cost?", cost.rstrip('.')+"."]]
    if ages: faq.append([f"What ages is {h1} for?", ages.rstrip('.')+"."])
    if signup: faq.append([f"Do you need to sign up for {h1}?", f"Sign-up: {signup.lower()}. Do it on {poss(org)} website, linked on this page."])
    hero_sub=first_sentence(c['paras'][0])
    if len(hero_sub)>220: hero_sub=hero_sub[:217].rsplit(' ',1)[0]+'.'
    chips=[when_short]+([cost_short] if len(cost_short)<=28 else (['Free'] if free else []))+([ages] if ages and len(ages)<=28 else [])+["Confirmed on the host's site"]
    facts2=[["when", f['When'], rows[0][1] if len(rows)==1 else f"{len(rows)} dates listed below" if len(rows)>1 else ""],
            ["where", venue, ', '.join(x for x in [ad['street'], town] if x)],
            ["cost", cost_short, cost[len(cost_short):].lstrip(';. ').strip()]]
    if ages: facts2.append(["ages", ages, ""])
    table=[["Host", org]]+([["Sign-up", signup]] if signup else [])
    loc={"area":venue,"name":venue,"street":ad['street'],"city":town,"zip":ad['zip']}
    if not ad['street']: loc["note"]="See the host's site for the exact spot"
    ev={"card_id":c['id'],"slug":slug,"status":"listed","plan":"free","checked":chk,"published":TODAY,"lang":"en-US",
        "source_card":c['id'],
        "survey":{"event_name":h1,"start_date":sd,"end_date":ed,"start_time":st_time,"end_time":en_time,"timezone":A.tz,
                  "website":org_url,"ticket_link":c['book'],"venue_name":venue,"venue_city":town,"venue_state":st,"venue_country":"United States",
                  "cost":"Free" if free else ("Price not listed" if cost.lower().startswith("price not") else "Paid"),"currency":"USD","availability":"Available","audience":"Families with kids","languages":"English",
                  "organizer_name":org,"public_contact":"","phone":""},
        "page":{"h1":h1,"title":title,"description":desc,"where_short":where_short,"when_long":f['When'],"when_short":when_short,
                "cost_short":cost_short,"ages_short":ages,"about":c['paras'][:2],"ld_description":' '.join(c['paras'][:2]),
                "schedule_note":f"Dates and times come from {poss(org)} own site. Check there before you go, since hosts sometimes change plans.",
                "price_rows":[["Admission","Free" if cost.lower()=="free" else cost]],
                "price_note":f"Prices are set by {org} and can change. Rally Takes the Train doesn't sell tickets.",
                "locations":[loc],"locations_note":"","tip":c['tip'] or first_sentence(c['paras'][1] if len(c['paras'])>1 else (c['paras'][0] if c['paras'] else '')),"faq":faq,
                "cities":[{"name":A.city_name,"url":"/christmas-events/"+A.city_slug,"primary":True}],
                "state":{"name":A.state_name,"url":"/christmas-events/"+slugify(A.state_name)},
                "filter":{"ty":c['ty'],"fl":c['fl'],"town":c['town']},"hero_sub":hero_sub,
                "card":{"tag":typ[0],"date_badge":b,"when":f['When'],"where":where_short,"cost":cost_short,"ages":ages or "All ages","link_small":"dates, prices and directions"},
                "eyebrow":f"Christmas event · {town}, {st}","hero_chips":chips,"by":f"Hosted by {org}.","card_pills":typ,
                "facts2":facts2,"table":table,"register_label":c['book_label'][0] if c['book_label'] else "See dates and details",
                "booking_line":f"Details and any sign-up are with {org}.", "organizer_url":org_url,
                "dates_list":rows,"kids_do":[],"on_site":[]}}
    out.append(ev)
# nearby: up to 3 other FREE events, closest start dates
for ev in out:
    s0=ev['survey']['start_date']
    cands=[x for x in out if x is not ev and x['survey']['cost']=='Free']
    cands.sort(key=lambda x:abs((datetime.date.fromisoformat(x['survey']['start_date'])-datetime.date.fromisoformat(s0)).days))
    ev['page']['nearby_events']=[{"url":f"/christmas-events/{x['slug']}","tag":x['page']['card_pills'][0],"name":x['page']['h1'],"when":x['page']['when_short'],"where":x['survey']['venue_city'],"near":"Free"} for x in cands[:3]]
    ev['page']['nearby_h']="More free Christmas events around "+A.city_name
for ev in out:
    json.dump(ev,open(f"{A.out}/{ev['slug']}.json","w"),indent=1,ensure_ascii=False)
print(len(out)); 
for ev in out: print(ev['slug'], '|', ev['page']['title'], len(ev['page']['description']))
