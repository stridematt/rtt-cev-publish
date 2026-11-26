# Macon GA / Middle Georgia run: handoff (Thu 2026-11-26)

Cand range 44000-44999 (used 44000-44008, 44230-44233, 44330-44332, 44520-44521, 44660-44667, 44760, 44810-44813, 44860-44864, 44910-44912). Time zone Eastern, every timed JSON-LD is -05:00 (checked). 39 new events in 9 bundles. Checks done: valid JSON, unique cands and slugs, no dashes or "!" in page text, no empty cost, Paid pill stripped, uniq 60%+ per helper (run per helper, not across all towns).

Registry (pinned command is posted separately): script `macon/reg_macon.sh` in rtt-cev-publish, 39 adds. Bundles and page.json are in the same folder (`macon/<town>-ga-bundle.json.gz`, `-page.json`), moves in `macon/macon_moves.json`.

## Towns
| Town | Status | New events | Page total after moves | Free |
|---|---|---|---|---|
| macon-ga | EXISTING (2 live cards) | 9 new + Gray parade card (page macon-ga) | 17 (2 live + 9 + 5 moved + 1 Gray) | 9 |
| warner-robins-ga | EXISTING (14 live) | 3 new | 7 after moves | 6 |
| perry-ga | NEW | 2 new + 2 moved in | 4 | 3 (see flag) |
| forsyth-ga | NEW (Forsyth and Juliette) | 4 | 4 | 1 |
| milledgeville-ga | NEW | 8 | 8 | 2 |
| eatonton-ga | NEW | 4 | 4 | 2 |
| dublin-ga | NEW | 5 | 5 | 2 |
| hawkinsville-ga | NEW (Opera House destination) | 3 | 3 | 1 |

Folded without a page (reason in each `folded.json`): Gray (1 event, card built for macon-ga), Byron and Centerville (1 parade card each, stay on warner-robins-ga), Fort Valley/Peach County, Barnesville, Gordon, Jeffersonville, Cochran, Sandersville, Vienna (nothing verifiable).

## Publisher actions
1. Moves (macon_moves.json): from warner-robins-ga move 5 Macon cards to macon-ga (festival-of-trees-at-the-museum-of-arts-and-sciences, public-ice-skating-at-the-macon-coliseum, macon-pops-christmas-spectacular, marche-de-noel-macon-christmas-market, christmas-at-the-creek); drop 3 from warner-robins-ga (macon-christmas-light-extravaganza and nutcracker-of-middle-georgia duplicate macon-ga; santa-at-hay-house ended Nov 22, drop if present); move 2 Perry cards to perry-ga (small-business-saturday-and-tree-lighting-ceremony-perry-ga, perry-christmas-parade-ga). Then remove dead planner rows.
2. New pages: perry, forsyth, milledgeville, eatonton, dublin, hawkinsville (page.json has intro_html, seo fields, nearby). Core page macon-ga links every new town and warner-robins-ga links Perry. Use a far template (not one named in nearby).
3. Existing pages macon-ga and warner-robins-ga: addCards from the bundle plus intro_html, seo_title, seo_description from page.json. Macon page gets the Gray parade card (bundle gray-ga). Recheck counts against the live page at publish time; the live Warner Robins title says 13 events, 5 free.
4. Christmas Eve services page: macon yes, warner-robins yes; perry, forsyth, milledgeville, eatonton, dublin, hawkinsville no (404).
5. Dates today, quick-counts for every changed path, drop events that ended before publish day.

## Flags
- Most Macon, Forsyth, Milledgeville, Eatonton and Dublin facts come from tourism or city calendars (Visit Macon, visitforsythga.com, Visit Milledgeville, Visit Eatonton, Visit Dublin GA); the pages say so.
- Tubman Museum address (310 Cherry St) was not on the host page. Rechecked Nov 26: Visit Dublin prints "Downtown Dublin, 314 Academy Avenue" (coordinates 32.5382957,-82.9078839) for the parade and Jingle and Mingle, so those Dublin pins come from the host page. Forsyth host pages print only "Downtown Forsyth", no street, so no better pin exists. Milledgeville parade has no street address.
- Santa at The Plaza and Live Nativity (Eatonton) not confirmed on host pages. Pate Road lights (Forsyth) list only two dates.
- Perry: Rally's coordinator confirmed the live Small Business Saturday and Tree Lighting card is free. PUBLISHER: remove its Paid tag and set cost Free when moving it to perry-ga. Perry page.json already counts 4 events, 4 free. Perry's "last year" paragraph uses the Visit Perry 2025 guide, labeled as 2025.
- Forsyth train_links uses /museums/sam-shortline-excursion-train-cordele-georgia (taken from the live Macon page, not separately checked for 200).
- Neighbor-page scans covered macon-ga and warner-robins-ga only; athens, augusta, columbus not link-scanned for stray cards.

## Held (not built)
Facebook-only or social-only: Barnesville events (also conflicting parade dates), Perry Our Town Christmas Lights, Silobrate Lights, Half Pint Haven, Westside High Santa, Gray tree lighting, Zaxbys Light the Night, Barker Farms, Lake Oconee boat parade, Cochran, Vienna Holiday Stroll, Sandersville (no 2026 date printed). Other: Perry Breakfast with Santa (Eventbrite and Facebook only), Perry Winter Wonderland and trolley tours (2025 guide only), Warner Robins Family Fun Night (details coming soon), shopping markets (Perry Mistletoe, Main Street Gray, Merry Market, Curate), Mesmerica 360, Christmas Orchard Feast, Ultimate King of Pop show, Santa's Secret Shoppe, This is Christmas at Crossroads (conflicting dates), Houston County library calendar (not read: unchecked).
Strays for other runs: Lane Southern Orchards, Fort Valley Breakfast with the Grinch and Santa (Dec 12); Lightin' the Lake Country (Greensboro GA, Nov 29); Cordele SAM Shortline trains (already in the Georgia train guide).

## Method notes
Tourism-bureau event pages (Simpleview and Tribe sites) first; skip Eventbrite and Wix pages; check city community-events sections as well as special events; formats ["query"] directQuote keeps scrapes short; Check Christmas Eve pages with Firecrawl (curl is blocked).
