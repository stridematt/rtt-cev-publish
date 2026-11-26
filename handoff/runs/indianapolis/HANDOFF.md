# Indianapolis run handoff (2026-11-26)

Built by three Sonnet helpers; lead generated page.json (intro_html, seo_title, seo_desc) from intro.json. Times are -05:00 (Eastern). Registry: rtt-cev-publish branch claude/project-thread-3an4pt, commit b50e951637f69f2ac27a2c7d3ba6d4e3395bea41, rtt/reg_indianapolis.sh (71 adds; copy also here, plus registry_rows.json).

## Bundles to publish (new events per page)
indianapolis-in 12 (88000-88011), avon-in 6 NEW, beech-grove-in 2 NEW, brownsburg-in 3, carmel-in 1, danville-in 4 NEW, fishers-in 4 (incl. 1 McCordsville), franklin-in 4 NEW, greenfield-in 3, greenwood-in 4, lebanon-in 3 NEW, martinsville-in 5 NEW (incl. 2 Mooresville), nashville-in 5 NEW, noblesville-in 5 NEW, plainfield-in 4, shelbyville-in 4 NEW, zionsville-in 2 (Whitestown; load zionsville-in bundle only, not whitestown-in). Lawrence and Westfield: no new events, intro only. 71 new events total.
New pages (9): avon, beech-grove, danville, franklin, lebanon, martinsville (includes Mooresville), nashville, noblesville, shelbyville.
Not paged: Whitestown (2 events, on Zionsville), McCordsville (1 event, on Fishers), Mooresville (2, on Martinsville), Pendleton (0 verified).

## Publisher actions
1. Moves: indianapolis_moves.json. Existing page.json move_from_* keys carry the same lists.
2. Existing-town page.json carries intro_html to ADD (existing pages have none). Counts assume the moves (Indianapolis 35 events, 10 free; Fishers 9/4; Carmel 5/2; Westfield 6/3; Zionsville 14/4; Greenwood 7/0; Plainfield 6/2; Greenfield 8/1; Brownsburg 5/2; Lawrence 2/0). Confirm against live counts after moves.
3. Link Indianapolis to all new towns and each new town back (nearby starts indianapolis-in). Eve pages exist for indianapolis, carmel, plainfield, brownsburg (page.json christmas_eve_page); others 404.
4. Registry (Mac Terminal) then quick-counts for every changed path. Do not request indexing.

## Flags
See helper notes in each folder; main ones: Reindeer Express times (2-8 pm placeholder, when_note says check booking), Santa House address assumed, Forest of Lights address from parks foundation listing, Conservatory Crossing price conflict ($7/$15 vs $6/$14), Trees of Plainfield dates conflict (town page used), several Franklin/Avon/Nashville addresses or zips from secondary listings, Shelbyville/Avon/Danville/Martinsville facts partly from Visit Hendricks/Morgan County calendars.
