# Fresno run handoff (2026-11-26)

Three Sonnet helpers (Fresno/Clovis/Madera/mountains, Fresno east and south, Tulare and Kings). Lead added intro_html, seo_title and seo_description to every page.json. Times -08:00 (events with no start time carry dates only). Registry script: rtt-cev-publish rtt/reg_fresno.sh (55 adds), branch claude/project-thread-onjh08, commit f6acb53889e4d58e04d5c18b319a8188bad75cee. Cand range 78000-78999. Rows: registry_rows.json. Moves: fresno_moves.json.

## Towns (new events built)
EXISTING pages (add cards and replace intro): fresno-ca 9 (intro 24 events, 12 free), clovis-ca 1 (7/5), madera-ca 1 (2/1), visalia-ca 9 (12/6, includes Woodlake 2), hanford-ca 5 (7/4, includes Lemoore parade), porterville-ca 0 new (intro only, 3/1), dinuba-ca nothing new.
NEW pages: oakhurst-ca 11 (Fish Camp, Bass Lake, Coarsegold folded in; Sugar Pine holiday train), reedley-ca 6 (+1 move; Orange Cove, Parlier folded; Hillcrest steam trains), sanger-ca 4, selma-ca 4 (Caruthers folded), kingsburg-ca 2 (+1 move), fowler-ca 1 (+3 moves), tulare-ca 1 (+2 moves), exeter-ca 1 (+2 moves).
Total 55 new events. Folded or no page: Kerman and Coalinga (cards on fresno-ca), Chowchilla, Mendota, Firebaugh, Lemoore, Woodlake, Orange Cove, Parlier, Caruthers, Riverdale (stays on fresno-ca), Corcoran, Lindsay, Farmersville (nothing verified).

## Publisher actions
1. Moves (fresno_moves.json): remove from fresno-ca the 7 cards listed (Clovis parade to clovis-ca, Clovis City Hall tree lighting duplicate just removed, 3 Fowler cards to fowler-ca, Kingsburg gingerbread train to kingsburg-ca, Reedley Santa visit to reedley-ca). Porterville to Exeter (2 cards) and to Tulare (2 cards). Visalia to Hanford (Lemoore Jingle and Mingle). These are live cards: move, do not rebuild.
2. Existing-town bundles carry page = the existing slug: add the cards to the live page, replace intro with page.json intro_html, set seo from page.json.
3. NEW pages: nearby starts fresno-ca. Link Fresno to all new towns (Oakhurst, Reedley, Sanger, Selma, Kingsburg, Fowler, Tulare, Exeter) and each back.
4. Christmas Eve services pages exist for fresno-ca, madera-ca, visalia-ca, hanford-ca, porterville-ca. Link them. Clovis, Oakhurst, Sanger, Kingsburg, Reedley, Selma, Fowler, Tulare, Exeter return 404.
5. Registry, then quick-counts for every changed path. Do not request indexing.

## Flags
- Facts partly from social or calendar sources: Sanger tree lighting (chamber Facebook via snippets), Toyland Parade (organizer PDF), Selma parade and ice rink (City Instagram), Kingsburg Santa Lucia (chamber Instagram), Kerman breakfast (city JS calendar), Oakhurst-area events (yosemitethisyear.com calendar), Tulare Hometown Holiday (host images, address from a round-up), Fashion Fair/Art Museum free from snippet.
- Trek to the Nation's Christmas Tree (Kings Canyon NP) is built under Sanger (78403); Visalia helper held its own copy, so no duplicate.
- Held: Lindsay parade (flyer only), Tulare parade (no official 2026 page), Chowchilla, Mendota, Madera Christmas in the Park (Facebook only), Corcoran, Farmersville, City of Fresno tree lighting, Storyland, Irish Christmas at the Fox (2025 date), Reedley Opera House shows.
- Madera live page has one parade card, not two (checked).
- Thin pages: Fowler 1 new event (4 with moves), Tulare, Exeter, Kingsburg. Single-page uniq.py runs were unchecked for Tulare and Exeter.
- Oakhurst page.json folded_in wording is an assumption.
