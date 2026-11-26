# Las Vegas run handoff (2026-11-26)

Built by three Sonnet helpers; lead checked JSON validity and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Times are -08:00. Registry script: rtt-cev-publish rtt/reg_las_vegas.sh (41 adds, about 10 per call) and a copy in this folder.

## Towns (new events built)
- las-vegas-nv (existing): 14 (cand 90000-90013)
- henderson-nv (existing): 5 (90300-90304)
- boulder-city-nv (NEW): 5 + 2 moved trains (90500-90504)
- north-las-vegas-nv (NEW): 7 (90600-90606)
- pahrump-nv (NEW): 4 (90700-90703)
- mesquite-nv (NEW): 6 (90800-90805; Moapa Valley farm folded in)
Total 41 new events. Not built as pages: Laughlin, Primm (0 verified), Moapa Valley (folded into Mesquite), Mount Charleston (1 item, see below).

## Every folder
facts.json, tweaks.json, bundle.json.gz, intro.json, page.json. Existing-town page.json carries intro_html to ADD to the live page (existing pages have no such block).

## Publisher actions
1. Moves: las-vegas_moves.json. Henderson-town cards leave the Las Vegas page; Boulder City trains leave both Henderson and Las Vegas; Magical Forest at Opportunity Village moves from Henderson to Las Vegas. Several Henderson and Boulder City cards exist twice under different slugs (Ethel M, gingerbread, Santa Train); keep one.
2. Intro counts assume the moves (Las Vegas 31 events, 16 free; Henderson 18, 10). Confirm against live counts after moves.
3. Link Las Vegas to all new towns and each town back to Las Vegas (nearby starts with las-vegas-nv). Las Vegas page links /christmas-eve-services/las-vegas-nv (christmas_eve_page set). Other towns have no eve page.
4. Price not listed events marked so; public parades Free. Page date today of publishing.
5. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- Las Vegas 90004/90005 DISCOVERY Children's Museum and Downtown Summerlin addresses, and some community center zips, are from memory, not the host pages.
- Henderson 90304 Santa at The Village at Lake Las Vegas: only a Facebook snippet, address from memory. Weakest event.
- North Pole Express (Boulder City) is listed sold out for 2026; kept because already live.
- Pahrump: dinner venue conflict (Nye Communities Coalition vs Bob Ruud Community Center); Cookies with Santa date from host (Dec 20), directory disagrees.
- Mesquite theatre pages have the thinnest uniqueness margin (just over 60%). Mesquite Toes Christmas Spectacular is $20.
- uniq.py flags the "Price not listed" string; not a real issue.
- Glittering Lights at Las Vegas Motor Speedway (7000 Las Vegas Blvd N) is near North Las Vegas; left on Las Vegas.
- Not built for lack of a host page: Candy Cane House (Henderson), Boulder City Christmas House, Smith Center, Bellagio, Sphere, Fashion Show Mall, Springs Preserve, Fremont Street. Mount Charleston Winter Programs (gomtcharleston.com, weekends in December) and A Ranch Christmas at Spring Mountain Ranch State Park (Santa Dec 12, parks.nv.gov) belong on Las Vegas, unbuilt.
- North Las Vegas events seen only on an aggregator (SkyView Nutcracker breakfast, Silver Mesa, Church Home Santa) not built.
