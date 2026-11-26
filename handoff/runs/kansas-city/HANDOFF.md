# Kansas City run handoff (2026-11-26)

Three Sonnet helpers plus two follow-ups; lead generated page.json intro_html and seo fields (/home/claude/lead/lead.py logic), moves, registry scripts. Central time, every JSON-LD time is -06:00 (verified in all bundles). Cand range 75000-75999 (91 new events, 75000-75755).
Registry: rtt-cev-publish branch claude/project-thread-9z1n92, scripts rtt/reg_kansas_city1..10.sh (10 adds each, no set -e, prints "added N, refused M" and refused slugs). Bundles rtt/kansas-city/<town>.json.gz. Rows: registry_rows.json. Moves: kansas-city_moves.json (23 card moves, 4 duplicates to drop).

## Pages
- NEW (full page.json): kansas-city-ks (7 events + 1 move + 1 from OP), bonner-springs-ks (4), shawnee-ks (3), leawood-ks (2 + 1 move), prairie-village-ks (2 + 2 moves, Merriam and Mission folded), gladstone-mo (3, North Kansas City folded + 1 move), smithville-mo (3), parkville-mo (6, Riverside, Platte City, Weston folded + 1 move), excelsior-springs-mo (4 + 2 moves).
- Existing (intro_html and seo only in page.json): kansas-city-mo (11 new + Raytown 75480), independence-mo (8 + Fort Osage 75481 + 2 moves), lees-summit-mo (7 incl. Raymore, Belton, Pleasant Hill, Garden City folded), blue-springs-mo (5 incl. Oak Grove, Grain Valley, Lone Jack), liberty-mo (3 incl. Kearney), overland-park-ks (2 new, 13 moves out), olathe-ks (7 incl. Gardner, 4 moves in), lenexa-ks (4), lawrence-ks (2), leavenworth-ks (6 incl. Lansing).
- Folded, no page: Oak Grove, Grain Valley, Lone Jack, Raymore, Belton, Pleasant Hill, Garden City, Grandview, Kearney, North Kansas City, Riverside, Platte City, Weston, Gardner, Merriam, Mission, Lansing, Raytown, Fort Osage. Basehor and Tonganoxie: no events. Harrisonville and Peculiar: nothing usable.

## Publisher actions
1. Moves per kansas-city_moves.json; drop the 4 duplicates.
2. Kansas City page links every new town; new towns link back (page.json nearby starts kansas-city-mo). Eve pages exist for kansas-city, independence, lees-summit, overland-park, olathe, lawrence; none for the others (404).
3. Price not listed events show Price not listed; parades Free. Page date = publishing day.
4. Registry then quick-counts for all changed paths. Do not request indexing.

## Flags
- Intro "at least N free" counts cover new events only; live cards' free status was not read. Refresh intro counts after quick-counts if wanted.
- Addresses not from host pages: Hiram Young Park, Bingham-Waggoner Estate, KCPL Southeast Branch, Raymore T.B. Hanna Station, Oak Grove Fieldhouse, Linden Square (601 vs 602 NE 70th St noted in page), Garden City Yaya's (no address or price).
- Leavenworth/Lansing items come from the Leavenworth CVB calendar; KC Carol show from Visit KC calendar; Edwardsville and Raytown from city posts. kansas-city-ks page sources are generic homepages.
- Smithville Candy Cane Quest is Dec 4 (city Newsflash); CandyLand is Dec 5. Shawnee Santa at Family Tree Nursery: event page says Dec 13, store banner says Dec 12 (noted on page).
- Empty "lastyear" on several new pages; no sourced 2025 recaps.
- Held: Linwood YMCA Santa breakfast (dates conflict), Raymore tree lighting (dates conflict), Lone Jack tree lighting (no time), Gladstone Holiday Market and Platte City parade (Facebook only), Midland Railway Snowglobe Express (no 2026 date), Weston and Excelsior Springs home tours (adult ticketed), Leawood Breakfast with Santa (registration closed).
- Thin: Harrisonville, Peculiar, Basehor, Tonganoxie, Grandview, Weston, Riverside, Platte City.

## Update 06:55Z
- Registry ran (89 added, 2 refused). glowild-hidden-treasure-at-kansas-city-zoo-mo dropped from the KC bundle (live card glowild-hidden-treasure-kansas-city-mo is the same event; commit 7550ec2, rtt/kansas-city/kansas-city-mo.json.gz). KC page.json intro now says 49 events (32 live after moves, 6 moving in from Overland Park, 11 new).
- The live GloWild card ends Dec 19; the zoo's own calendar (events.kansascityzoo.org/21rwq) says Nov 4 to Dec 27, Wed to Sun, 5:30 to 10 pm. Publisher: fix the live card end date/When text to Dec 27.
- cpkc-holiday-train-at-union-station-kansas-city-mo refused (same source URL as the Hamilton ON stop); still needs a registry add.
