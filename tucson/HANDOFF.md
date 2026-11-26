# Tucson run handoff (2026-11-26)

Built by three Sonnet helpers (core, south/north, far); lead checked JSON validity, duplicate cands and slugs, dashes and exclamation marks outside scripts, -07:00 on all JSON-LD dates, and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Cand range 77000-77999. Registry script: reg_tucson.sh (57 adds, also in rtt-cev-publish rtt/reg_tucson.sh); registry_rows.json lists them. 57 new events.

## Towns
EXISTING pages (add cards + intro_html): tucson-az 18 new (intro: 37 events, 17 free), marana-az 1 (4/3), sahuarita-az 3 (8/3), douglas-az 3 (5/1).
NEW pages: oro-valley-az 3 (4/3 with moved Festival card), green-valley-az 2 own + 2 Tubac/Rio Rico (4/1), vail-az 2 (2/0), benson-az 3 (3/3), sierra-vista-az 7 incl. Empire Ranch (7/3), nogales-az 1 (1/1), bisbee-az 4 (4/2), tombstone-az 5 (5/3), safford-az 5 incl. Willcox (5/2).
Folded, no page: Catalina and Oracle into Oro Valley; Tubac, Rio Rico (2 events) into Green Valley; Willcox into Safford; Eloy/Picacho (0) into Casa Grande; Patagonia/Sonoita (Empire Ranch) into Sierra Vista; Hereford and Huachuca City into Sierra Vista. Do not publish tubac-az bundle (renamed); its two events are in green-valley bundle.

## Publisher actions
1. Moves: tucson_moves.json. Marana festival card is a duplicate (remove from Tucson). Remove expired Downtown tree lighting (Nov 20) from Tucson.
2. Intro counts assume moves; confirm against live counts. Douglas free count (1 of 2 live) taken from live.json: confirm.
3. New town pages: nearby starts tucson-az; link Tucson to all new towns and each back to Tucson. Existing town pages have no intro block yet (use intro_html from page.json).
4. Christmas Eve services: tucson-az exists, link it; others 404 or assumed none.
5. Times are -07:00 (Arizona). Page date = publish day. Multi-date events (Nutcrackers, Douglas on Ice) emit one start time plus endDate (kit behavior).
6. Registry then quick-counts for every changed path. Do not request indexing.

## Flags (not from a host page)
Addresses from listings or memory: Reid Park Zoo, Tucson Botanical Gardens, Arizona Inn, Hacienda del Sol, Trail Dust Town (TucsonTopia or Facebook), Old Tucson 201 S Kinney Rd, Westin La Paloma, Park Place Mall, Mini Time Machine zip, Tombstone Courthouse (chamber directory), Bisbee Festival of Lights (62 Brewery Ave, 8 to 10 pm, city notice), Willcox zip. Flandrau dates from Visit Tucson; Presidio workshop from Downtown Tucson Partnership. Children's Museum Tucson $12.50 (meta says $11). Sierra Vista parade 5:30 pm from Chamber Facebook. Merry and Bright Bisbee is a host Facebook event. Weak "lastyear" text on Tombstone, Safford, Nogales pages.
Thin pages: Nogales (1 event, heritage-site listing), Vail (2, no prices), Benson (3, counts a city tree-decorating program).
uniq.py flags "Price not listed" (stale regex).

## Held
Tucson: Sabino Snow Fest, Gaslight Theatre, Holiday Ice rink (2025 only), TSO Holiday Magic (2023 only), La Encantada Enchanted Snowfall and Santa (no host details), Park Place Santa photos, Westin ok built. Marana Morales light show (conflicting addresses/dates). Tombstone Santa in the Park, SantaCon, Christmas Ball. Bisbee Small Town Holiday, Holiday Huzzah. Sierra Vista Festival of Trees, Berean Christmas Village. Douglas toy drives, Cochise College Family Night, Gadsden Hotel. Safford Pima Star Barn. Eloy Christmas on Main St (Facebook only). Tumacacori La Fiesta (no 2026 dates). Pima County Library programs (only one dated, built as Price not listed).
