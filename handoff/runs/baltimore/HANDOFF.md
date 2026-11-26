# Baltimore run handoff (2026-11-26)

Three Sonnet helpers; lead generated page.json intro_html and seo fields (mkpage_lead.py), moves and registry scripts. Times -05:00 (Eastern). Registry: rtt-cev-publish branch claude/project-thread-a3blks, commit d4f794c2331708ada1c2dfdd7b6fbe664891bd93, rtt/reg_baltimore1..5.sh (41 adds, 10 per script, raw fetch verified). Bundles rtt/baltimore/<town>-md.json.gz (same commit), copies in each <town>-md folder.

## Towns (new events)
- baltimore-md (existing): 1 (80000 Charm City Lights). Intro 40 events, 14 free after 16 moves.
- annapolis-md (existing): 6 (80400-80405, incl. Severn, Crofton, Odenton folded). columbia-md: 2 (Savage Mill). ellicott-city-md: 1. severna-park-md: 1. north-east-md: 1 (Elkton folded). westminster-md: 2 (incl. Sykesville folded). monkton-md: 1 (Upperco). glen-burnie, pasadena, brooklyn-park, mount-airy: intro only.
- NEW pages: towson-md 4, catonsville-md 4 (Arbutus folded), owings-mills-md 4 (Windsor Mill folded), middle-river-md 3 (Essex folded), white-marsh-md 2 (Perry Hall folded), bel-air-md 3, havre-de-grace-md 6.
Total 41 new events. Not built: Aberdeen, Edgewood, Hampstead, Hunt Valley, Dundalk (fold notes), Abingdon, Eldersburg, Perryville, Taneytown, Manchester, Odenton and Crofton (cards on Annapolis).

## Publisher actions
1. Moves: baltimore_moves.json (16 suburb cards leave baltimore-md). Hanukkah Snowflakes (Pikesville) stays on Baltimore; Santastic Holiday Celebration (Nov 14) is past, review it.
2. Baltimore links every new town; new towns link back (page.json nearby starts baltimore-md). Eve page exists for Baltimore only (Towson 404; others unchecked).
3. Existing-town page.json holds only intro_html and seo fields to ADD; NEW towns carry full NEWPAGE_SPEC content.
4. Price not listed events marked so; parades Free. Page date = publishing day.
5. Registry then quick-counts for all changed paths. Do not request indexing.

## Flags
- Annapolis, Columbia, Ellicott City dates from Visit Annapolis and Visit Howard County calendars. Santa Is Coming to Crofton from the host's Instagram.
- Kenilworth, Foundry Row, Metro Centre, Catonsville Santa House addresses incomplete or not from host pages; Stephens Hall zip 21252 vs 21204.
- Middle River boat parade has no price or street address from host.
- Held (no host date, Facebook only, shopping, old-year): Annapolis Storytime with Santa, Hunt Valley tree lighting, Cecil County Christmas Parade, Aberdeen parade (dates conflict), Edgewood tree lighting, Havre de Grace Candlelight Tour.
- Thin coverage: Glen Burnie (Hanover cards could be a page), Pasadena, Brooklyn Park, Mount Airy, Aberdeen, Edgewood, Abingdon, Eldersburg, Perryville, Taneytown.
- Baltimore and Monkton single-event bundles were not uniq.py checked; existing_cards.txt for monkton has guessed slugs.
