# Sacramento run handoff (2026-11-26)

Three Sonnet helpers (two passes each); lead added intro_html, seo_title, seo_description to every page.json (script /home/claude/gen_pages.py logic, regenerate from intro.json if counts change). Pacific, times -08:00. Cand range 76000-76999 (57 events used). Registry: rtt-cev-publish sacramento/reg_sacramento.sh on branch claude/project-thread-9vleco, commit 4fc00ad (57 adds, rows in registry_rows.json). Moves: sacramento_moves.json.

## Pages
EXISTING with new events: sacramento-ca 4, roseville-ca 5, folsom-ca 2, el-dorado-hills-ca 4, citrus-heights-ca 1, orangevale-ca 1, carmichael-ca 1, north-highlands-ca 1 (Rio Linda, Antelope folded), woodland-ca 2.
Existing, intro and moves only: elk-grove-ca (2 moves in), fair-oaks-ca (1 move in), galt-ca (intro only, no new events).
NEW pages: rancho-cordova-ca 2, rocklin-ca 4 (Loomis folded), lincoln-ca 3, auburn-ca 5, davis-ca 6 (Winters folded), west-sacramento-ca 2, lodi-ca 2, placerville-ca 5 (Apple Hill; Cameron Park, Shingle Springs, Diamond Springs folded), grass-valley-ca 4 (Nevada City folded), sutter-creek-ca 3 (Jackson, Amador City folded).
Folded or empty: dixon-ca (Winters to Davis; Dixon, Esparto, Knights Landing nothing), loomis-ca, Penryn, Newcastle, Granite Bay, Colfax, Plymouth: nothing verified beyond Loomis.

## Publisher actions
1. Bundles: <town>/bundle.json.gz for every town that has one; each bundle's own page is set. New towns need page.json (nearby starts sacramento-ca), then link Sacramento to all new towns and each back.
2. Moves (sacramento_moves.json): 13 cards move from Sacramento to their town page; 11 are already on the target page (or inline duplicates) so just remove them from Sacramento; Jelly Belly Fairfield has no home page and stays. the-rocklin-great-gingerbread-build-off-ca moves from Roseville to Rocklin. Check each target before adding so nothing shows twice.
3. Set intro_html, seo_title, seo_description from page.json on all existing pages listed above (including Elk Grove, Fair Oaks, Galt).
4. Christmas Eve services pages: sacramento-ca, folsom-ca, el-dorado-hills-ca exist; link them. Roseville, Rocklin, Lincoln, Auburn, Woodland 404; others unchecked.
5. Fair Oaks tree lighting: chamber says Fair Oaks Park (Village construction); existing card says Village Park. Fix venue when it moves.
6. Registry then quick-counts for every changed path. Do not request indexing.

## Flags (not from a host page, or weak)
Orangevale procession address and route (community calendar); Delta King and B Street Theatre addresses (own knowledge); Live Steamers address (calendar); Rio Linda parade 6 pm start (local news and parade Facebook); Roseville Sylvia parade date Dec 5 (law-firm blog quoting the partnership calendar), Maidu and Galleria addresses unverified; Woodland fairgrounds address (own knowledge); Harris Family Farm address conflicts (Blair Rd vs Sky Ranch Ln); Delfino hours conflict (11 to 7 booking page vs 11 to 5:30 calendar); Winters schedule (Your Town Monthly); Nevada County Fairgrounds zip assumed; Lincoln Santa in the Plaza Dec 19 vs Dec 20; Auburn Santa at Promenade verified fully only for Dec 12; Folsom Whistlestop prices not printed and some shows sold out; Davis Breakfast with Santa prices differ between Eventbrite ($10/$15, used) and lodge page; West Sacramento tree lighting Dec 4 (city calendar) vs Dec 1 (Facebook snippet). Amador City Main Street Magic registry URL is the chamber's Facebook post (host's own post).
Thin pages: Lodi 2, West Sacramento 2, Rancho Cordova 2 plus 1 move; single-page towns unchecked by uniq.py. Elk Grove, Fair Oaks, Galt: no new events found after two passes.

## Held
Santa & Sirens (2025 dates), Fair Oaks Santa Stops (sold out), Fair Oaks Snowman hunt and Festival of Trees (no details), Arden Fair Santa (no price, mall), Granite Bay Quarry Ponds tree lighting (no date/cost), Rocklin Santa Tour (Facebook only), Santa's Cottage Folsom (flyer only), Old Sacramento Holiday Cheer (last year), Capitol tree lighting (no 2026 date found), Sutter Creek Cruisin' the Lights (2022), Facebook-only events, shopping markets, fun runs.
