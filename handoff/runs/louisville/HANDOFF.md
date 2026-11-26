# Louisville run handoff (2026-11-26)

Built by three Sonnet helpers (Louisville core and Jefferson County, Kentucky outside Jefferson, southern Indiana); lead generated page.json (intro_html, seo_title, seo_description) from each intro.json. All times Eastern, -05:00 (verified in bundles for ky and in). Registry: rtt-cev-publish rtt/reg_louisville.sh (55 adds) and a copy plus registry_rows.json in this folder. Cand range 82000-82999.

## Towns (new events built)
EXISTING pages (add cards, add intro_html): louisville-ky 11 (82000-82010; includes Shively Light Up as a folded card), saint-matthews-ky 1 (82250), clarksville-in 5 (82840-82844, Sellersburg folded), new-albany-in 3 (82770-82772), charlestown-in 1 (82900), crestwood-ky 1 (82540), la-grange-ky 4 (82500-82503), simpsonville-ky 4 (82400 Shelby County parade, 82670-82673; Shelbyville and Taylorsville folded), elizabethtown-ky 4 (82550-82553), frankfort-ky 2 (82680, 82681 Lawrenceburg, folded; Frankfort is outside this run, no intro change). jeffersontown-ky: no new events, intro only.
NEW pages: bardstown-ky 5 (82450-82454, New Haven folded in), radcliff-ky 3 (82600-82602, Fort Knox), shepherdsville-ky 4 (82630-82633, Mount Washington folded), jeffersonville-in 4 (82700-82703), corydon-in 3 (82940-82942).
Total 55 new events. No page: Shelbyville (folded into Simpsonville), Shively (folded into Louisville), Sellersburg (into Clarksville), Lawrenceburg (into Frankfort), Middletown, Prospect, Fern Creek, Okolona, Anchorage, Georgetown, Floyds Knobs, Hodgenville (nothing verified).

## Publisher actions
1. Moves (louisville_moves.json, moves.txt per town): off Louisville to clarksville-in (3 Clarksville cards, already live there too: just remove from Louisville), new-albany-in (gingerbread-extraveganza), charlestown-in (christmas-in-charlestown), la-grange-ky (light-up-la-grange-ky), crestwood-ky (yuletide-at-yew-dell, duplicate: remove from Louisville only), saint-matthews-ky (nutcracker-family-storytime-with-louisville-ballet-ky and pet-night-with-santa-louisville-ky). Louisville intro counts assume these moves (39 events, 13 free).
2. New town pages: nearby starts louisville-ky; link Louisville to all new towns and each town back to Louisville. Eve pages exist for louisville, saint-matthews, new-albany, clarksville, charlestown, crestwood, la-grange, simpsonville; 404 for jeffersontown, bardstown, radcliff, shepherdsville, jeffersonville, corydon, elizabethtown.
3. Slug note: the live page is saint-matthews-ky, not st-matthews-ky (404).
4. Price not listed events marked so; public parades Free. Page date today of publishing. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- Facts not from a host page: Louisville Slugger Field address and Bats Dec 12 date, Kentucky Science Center address, Shively card (Facebook-only, snippet), Nutcracker Magical Christmas Ballet price and venue (GoToLouisville), Light Up Mt. Washington (Travel Bullitt calendar), Light Up Radcliff (city Facebook snippet), Second Chances pop-up hours (Eventbrite and Lane Report), assumed ZIPs for Taylorsville, Shepherdsville, Lawrenceburg, Fort Knox, Clarksville Lapping Park, Culbertson Mansion, Howard Steamboat Museum and White Christmas at Clark County Museum (gosoin.com only), Light Up Clarksville (gosoin.com).
- Existing-card slug lists for Charlestown, Simpsonville, saint-matthews are guesses from page anchors.
- Calendar-sourced cards carry a source note (Tour Oldham County, Visit Bardstown, Visit Shelby KY, Tour Elizabethtown, Visit Lawrenceburg).
- Lawrenceburg's 2 events are not checked against Frankfort's existing cards. The live Louisville Nov 13 Santa card starts the Louisville season line.
- Held: see each helper note in the thread; notable: My Old Kentucky Dinner Train North Pole Express (dates not retrievable), Whitehall tea (sold out), Light Up Valley Station (Facebook only), Shelby County Community Theatre (conflicting times), State Theater extra titles (single source).
- uniq.py flags "Price not listed" (not real); Charlestown has one page so uniq could not run alone (63.3% vs Corydon).
