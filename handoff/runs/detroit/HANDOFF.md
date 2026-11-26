# Detroit run handoff (2026-11-26)

Built by Sonnet helpers (core and Wayne, Oakland, Macomb/Washtenaw/Livingston/Monroe, plus a Wayne continuation). Lead generated intro_html, seo_title and seo_description into each page.json, checked JSON validity, dashes, exclamation marks, offsets (all -05:00) and unique cands. Cand range 83000-83999. 63 new events. Registry: detroit-run/reg_detroit.sh (63 adds), rows in registry_rows.json. Moves: detroit_moves.json.

## New events by page
Existing pages (add cards plus intro_html): detroit 2, dearborn 2, westland 1, canton 1, taylor 1, royal-oak 3, troy 1, rochester-hills 3, novi 1 (Wixom folded), pontiac 1, sterling-heights 1 (Utica folded), ann-arbor 4 (Saline, Chelsea, Dexter, Ann Arbor Hands-On Holidays).
Intro only (no new events): grosse-pointe, grosse-pointe-farms, livonia, redford, trenton, garden-city, rochester, clarkston, howell, hartland (some folders have no intro).
NEW pages: plymouth 2, southgate 2, lincoln-park 2, romulus 1, belleville 3, dearborn-heights 2, farmington 3, farmington-hills 3, auburn-hills 2, lake-orion 3 (Oxford folded), milford 3, commerce-township 2, warren 2, macomb-township 2, roseville 2 (Fraser folded), chesterfield 3 (New Baltimore folded), st-clair-shores 1, shelby-township 1, clinton-township 2 (Mount Clemens folded), monroe 1. birmingham-mi and southfield-mi are new pages carrying only moved cards (no new events).
No page: Waterford, West Bloomfield, Ferndale (folded into Royal Oak), Wixom (into Novi), Walled Lake, Oxford (into Lake Orion), Northville, Wyandotte, Allen Park, Brighton.

## Publisher actions
1. Moves per detroit_moves.json (about 20 cards leave Detroit; several are duplicates of live town cards: just remove from Detroit).
2. New pages need nearby starting detroit-mi; link Detroit to all new towns and each back to Detroit.
3. Christmas Eve services pages: exist for detroit-mi, ann-arbor-mi, rochester-mi, rochester-hills-mi, village-of-clarkston-mi. 404: dearborn, farmington, dearborn-heights, livonia, plymouth, canton, taylor, royal-oak, troy, novi, pontiac, warren, sterling-heights and the other new towns (some read from the statewide page, not scraped).
4. Intro counts include live cards whose dates were not re-verified; confirm after moves.
5. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- Weak coverage: existing towns Livonia, Redford, Trenton, Garden City, Rochester, Brighton, Northville, Wyandotte, Allen Park, Woodhaven, Riverview got little or no new research (past-dated Nov 20-22 events dominate Downriver). Brownstown, Flat Rock, Grosse Ile have unverified Downriver events, no page.
- Addresses not from the host page: Kellogg Park Plymouth, Southgate Kiwanis Park (Facebook), Belleville Area Museum, Hudson's Detroit zip, Holly Trolley, Dearborn Historical Museum zip, Taylor zip, Farmington Civic Theater, Troy Historic Village (memory, verify), Longacre House, LEGOLAND, Macomb Township and several zips.
- Date or fact conflicts: Plymouth parade Nov 27 (DDA) vs Nov 28 (stale chamber); Romulus 11147 vs 11120 Hunt St; Southgate address; Wixom tree lighting 6 vs 6:30 pm; Monroe Tree Walk end Jan 2 vs 7; Dearborn Historical Museum year inferred.
- Sources not host pages: Fantasyland hours (News Herald), Rochester Hills Santa prices (Facebook snippet), Lake Orion parade end time estimated, Oxford parade (Chamber Facebook), Farmington Hills lights Free (2025 recap), Pontiac times from snippets, Santa on Cherry Street (DDA Facebook via Meet Daisy), Clinton Aglow (page rendered empty).
- Held: Canterbury Village events, Livonia Santa's Workshop (2025 dates), Walled Lake tree lighting, Mount Clemens Light Parade (no time), Warren library Santas Dec 9 and 15, Partridge Creek Sensory Santa, Southgate Holidays at the Y, Brighton, Michigan Transit Museum trains (none in 2026), Clinton Township Holiday Express (not running).
- uniq.py flags "Price not" (stale regex) and crashes on single-page towns, so those were not checked. Some lastyear paragraphs are thin; FAQ padded in places.
