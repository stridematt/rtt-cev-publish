# Denver run handoff (2026-11-26)

Built by three Sonnet helpers; lead checked JSON validity, held four pages that failed the uniqueness gate, rewrote nine intros, and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Times are -07:00 (Mountain, December). Registry script: rtt-cev-publish branch claude/project-thread-aov8me, rtt/reg_denver.sh, commit 031c24dbdde21a34413a3538a58e8287514d6bbb (57 adds, copy in this folder and registry_rows.json). Cand range 84000-84999.

## Registry command (Rally runs once; re-runs add duplicates)
cd /Users/matt/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/031c24dbdde21a34413a3538a58e8287514d6bbb/rtt/reg_denver.sh -o reg_denver.sh && bash reg_denver.sh

## Towns (new events built; bundle.json.gz in each folder)
EXISTING pages (add cards, add intro_html from page.json): denver-co 2 (intro 45 events, 11 free), thornton-co 3, commerce-city-co 2, brighton-co 1, westminster-co 3, broomfield-co 2, castle-rock-co 3, parker-co 3, littleton-co 1, lakewood-co 2, boulder-co 2, longmont-co 1, lafayette-co 1. No new events, intro_html only (no bundle): aurora-co, golden-co, niwot-co, northglenn-co, lone-tree-co, castle-pines-co.
NEW pages: arvada-co 7, englewood-co 3 (Cherry Hills Village folded in), centennial-co 2, highlands-ranch-co 1 (plus 2 moved in), wheat-ridge-co 4, evergreen-co 5 (Conifer parade included), georgetown-co 3 (Idaho Springs Ramble folded in), louisville-co 4 (Superior Winter Festival folded in), erie-co 2.
Total 57 new events. Not built as pages: Greenwood Village and Superior (folded.json only), Morrison (no events).

## Publisher actions
1. Moves: denver_moves.json. About 20 suburb cards leave the Denver page for their towns; Lone Tree gives two to Englewood and Highlands Ranch; Broomfield gives an Erie card to Erie; Boulder gives 3 cards to Longmont and 5 to Louisville and drops 3 duplicates already on Longmont. Many are duplicates already live on the town page: just remove from the old page.
2. Intro counts assume the moves; confirm against live counts after moves. New town pages: nearby starts denver-co; link Denver to all new towns and each town back to Denver.
3. Christmas Eve services pages that exist (link them): denver, aurora, lakewood, boulder, littleton, lone-tree, castle-rock, parker. 404: arvada, englewood, centennial, highlands-ranch, greenwood-village. Unchecked: the rest (wheat-ridge, evergreen, georgetown, louisville, erie, westminster, golden, longmont, thornton etc.).
4. Price not listed events are marked so; public parades Free. Page date today of publishing.
5. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- HELD for uniqueness (house rule 4): the five Douglas County Libraries "A Visit with Santa" pages scored 45 to 52% against each other. Castle Rock's kept; Lone Tree, Highlands Ranch, Parker and Castle Pines held (facts in held_library_santa_facts.json, source https://www.dcl.org/booked-for-the-holidays/). Rally could ask for one merged Douglas County Libraries page instead.
- Arvada: five Apex Recreation pages share host boilerplate and clear 60% by only 60.4 to 62.8%. Arvada Center not carded; address 6901 Wadsworth Blvd in page.json is from memory.
- Addresses or facts not from a host page: RTD station names (rtd-denver.com), Englewood history (englewoodco.gov), Highlands Ranch Mansion 9950 E Gateway Dr (Metro District page; an older page says 9250 Zotos Dr), several Apex school and rec center addresses (Apex Facebook listings), Westminster Santa Visits dates (fire department Facebook post), Louisville Front Street (no street number), RTD rail mentions on Wheat Ridge, Evergreen, Louisville and Erie pages (from memory, no station named).
- Homepage-only URLs: Louisville Parade of Lights (downtownlouisvilleco.com, no event page). Eventbrite-hosted: Arvada Dickens Christmas Experience, Thornton Santa's Workshop (Eventbrite is the only link).
- Conflicts: Parker Mayor's Lighting 5 to 7 pm (town calendar) vs 6 pm (Downtown Parker); used the town calendar.
- Page "lastyear" paragraphs on Englewood, Centennial and Wheat Ridge have no 2025 recap behind them; thin. Georgetown's is edition-number based.
- Highlands Ranch Hometown Holiday (live on Denver, Dec 12) was not re-verified for 2026 beyond aggregator pages.
- uniq.py flags "Price not listed" (not real) and crashes on single-page towns, so those were checked cross-town by the helpers instead.
- Intro caveats: Boulder, Georgetown, Louisville, Wheat Ridge live pages 404 or not read; counts built from cards plus facts. Longmont Crafts and Cocoa (free, registration) not counted free. Winterfest at Chautauqua counted free though extras cost.
- Not carded, left in place: christmas-party-at-cherry-creek-state-park-greenwood-village-co on the Aurora page. Held and unbuilt: Facebook-only events, Streets at SouthGlenn (map junk), Brighton Breakfast with Santa (no details), Greenwood Village and Morrison (nothing verified).

## Addendum: merged Douglas County Libraries Santa page (added 05:45Z)
The four held library visits (Lone Tree, Highlands Ranch, Castle Pines, Parker) are now ONE event page on the Highlands Ranch page: visits-with-santa-at-douglas-county-libraries-lone-tree-highlands-ranch-co (cand 84302, 68.7% unique vs Castle Rock's library page, times -07:00, Price not listed). Folder: library-santa/ (bundle.json.gz, facts, tweaks). Highlands Ranch intro and page.json now say 4 events, 2 free. Registry: rtt/reg_denver_library.sh, commit d8ec60335badba7a6eab80c1be29346be6f7a494 (1 add, separate from reg_denver.sh). Castle Rock keeps its own library card. The merged card lives only on Highlands Ranch, not on the Lone Tree, Parker or Castle Pines pages (those intros stay at 11, 5 and 4 events).
Command: cd /Users/matt/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/d8ec60335badba7a6eab80c1be29346be6f7a494/rtt/reg_denver_library.sh -o reg_denver_library.sh && bash reg_denver_library.sh
