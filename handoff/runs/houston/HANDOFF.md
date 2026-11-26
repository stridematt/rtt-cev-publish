# Houston run handoff (2026-11-26)

Built by Sonnet helpers, lead-checked for JSON validity, dashes, exclamation marks and duplicate cand numbers. Event facts were verified by the helpers on host pages; flags below list what was not.

## Per town (new events built; page type)
NEW pages (no live page today): katy 4 (+4 moved from Houston), cypress 2, rosenberg 4, fulshear 3, sugar-land 7 (incl. Richmond and Stafford events folded in; Holiday Lights moves from Houston), missouri-city 2, spring 8 (Tomball folded in), atascocita 6 (Humble folded in), friendswood 1, alvin 2, lake-jackson 3, dickinson 1.
Existing pages (add cards): houston 26 (files facts-a/b/c, bundle-a/b/c), bellaire 1, the-woodlands 4, conroe 3, magnolia 5, montgomery 4, baytown 2, deer-park 5, la-porte 1, pasadena 2, pearland 4, league-city 4 (Kemah and Webster folded in), galveston 1, texas-city 1.
Total new events: 106. Not built as towns: Tomball, Humble, Kemah, Stafford, Webster, Richmond (under 20,000 and fewer than 3 verified events; folded into Spring, Atascocita, League City, Sugar Land).

## Every town folder
facts.json, tweaks.json, bundle.json.gz (Houston has -a, -b, -c), intro.json, page.json. page.json holds intro_html (Chicago-style lede plus "What Rally found in X"), seo_title, seo_description. Check each page against /christmas-events/chicago-il before publishing (Rally's standing rule). Existing-town page.json was generated from intro.json; their intro_html must be ADDED to the live page (existing pages have no such block), new pages get it from newCity.

## Publisher actions
1. Move suburb cards off Houston (houston_moves.json; Rally rule). Katy, Conroe, Pearland, Woodlands, Galveston, Sugar Land, Baytown, League City, La Porte moves; tomball market goes to Spring; holly-jolly-holiday-party-humble to Atascocita; kemah boat parade stays on Houston until League City page takes it (or move to League City: it is on League City's own calendar). Jacinto City and Nederland stay on Houston. Bryan, College Station, Beaumont events have no page in this run: leave.
2. Houston intro_html has {N} and {FREE} tokens: fill from live counts after moves and the 26 new cards.
3. Add a Houston "Houston suburbs" links block to every town above, and a "Houston" link back from each town (nearby field already starts with Houston).
4. Christmas Eve pairs: houston galveston katy magnolia montgomery pearland the-woodlands (page.json christmas_eve_page). Add the rb-q line, FAQ and FAQPage question if the live page lacks them.
5. Price not listed events are marked "Price not listed". Public parades Free.
6. Times are -06:00. Page date: today of publishing.
7. Registry: reg_houston.sh (106 adds), run after pages are live, about 10 per call.
8. quick-counts for every changed path. Do not request indexing; URLs to index are in index_urls.txt.

## Flags (not verified or weak)
- The Woodlands: addresses 2 Waterway Square Pl and 9595 Six Pines Dr from memory, not the listing.
- Houston LITH Hayride zip 77009 not on host page (host says Norhill Esplanade).
- Pearland Town Center address (11200 Broadway St) from search snippet; Dickinson park zip 77539 from a third-party listing.
- Spring: first 7 events were built by the stopped agent and not re-verified by H2.
- Galveston: parade time conflict (6 vs 6:30 pm; used 6:30). Galveston intro counts assume 3 moves from Houston.
- Lake Jackson Free events rest on the city's "13 free events" statement.
- Houston Uptown lights: Visit Houston only source, no dates. Houston c-bundle pair Lights in the Heights vs Uptown scored 62% unique within the batch; not checked against a and b.
- Thin pages: friendswood 1, dickinson 1, texas-city 1, bellaire 1, la-porte 1, galveston 1 new event.
- nearby and museum slugs on new page.json come from the brief, not re-checked live. Verify each returns 200.
- Kingwood Christmas in the Park held (stale 2024 pages only).
