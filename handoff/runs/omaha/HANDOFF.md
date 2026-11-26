# Omaha run handoff (2026-11-26)

Built by three Sonnet helpers (Omaha core, south/west suburbs, Iowa and outer ring); lead checked JSON validity, duplicate cands and slugs (none), existing-card collisions (none), -06:00 on all JSON-LD, no dashes or exclamation marks in page text, and generated intro_html, seo_title and seo_description in each page.json from intro.json. Cand range 72000-72999. 45 new events. Registry script: reg_omaha.sh (rtt-cev-publish omaha/reg_omaha.sh, commit 4abc13a6338a85be38de2ba504b20ec985b7587c; no set -e, prints "added N, refused M"). registry_rows.json lists the rows.

Registry command (Rally, in Terminal, source ./.env first, run once):
cd /Users/matt/Downloads/sa/registry && source ./.env && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/4abc13a6338a85be38de2ba504b20ec985b7587c/omaha/reg_omaha.sh -o reg_omaha.sh && bash reg_omaha.sh

## Towns (folder, bundle, page.json with intro_html)
EXISTING pages: omaha-ne +19 (intro: 29 events, 12 free, after 3 moves off), council-bluffs-ia +8 (13 events, 4 free; includes Missouri Valley Polar Express and Honey Creek Syrup with Santa), la-vista-ne +0 (intro/move only: 2 events, 1 free; no bundle), lincoln-ne +2 (bundle; intro count 24 events, 3 free is estimated: check against live page, some Nov 19-21 events have ended).
NEW pages: bellevue-ne 5 (3 own + Plattsmouth 2; 0 free), papillion-ne 5 (incl. Gretna 2; 1 free), fremont-ne 3 (Blair and Wahoo fold in, 0 free), nebraska-city-ne 3 (2 free).
Folded, no page: Gretna into Papillion; Plattsmouth into Bellevue (nearest page); Blair, Wahoo into Fremont; Glenwood, Missouri Valley, Honey Creek into Council Bluffs; South Sioux City into sioux-city-ia (live); Ashland, Springfield, Louisville, Bennington, Valley, Waterloo (0 verified events).

## Publisher actions
1. Moves: omaha_moves.json. Remove from omaha-ne the two Council Bluffs cards and the La Vista sleigh ride card (they stay on their own town pages). Elkhorn stays on omaha-ne.
2. Link omaha-ne to bellevue, papillion, fremont, nebraska-city (and la-vista, council-bluffs, lincoln); link each new town back to omaha-ne. omaha-ne page.json nearby/train_links are minimal; keep the live page's existing links.
3. Existing pages (omaha, council-bluffs, la-vista, lincoln): use intro_html from page.json, replacing the live intro. New pages use the full page.json.
4. Christmas Eve services: omaha-ne exists (link it). bellevue, papillion, la-vista are 404; others unchecked, assume none.
5. Times are -06:00. Page date = publish day. Multi-date runs emit one start time plus endDate (kit behavior). Midtown Crossing runs to Feb 14 (in when_note).
6. Registry, then quick-counts for every changed path (omaha-ne, council-bluffs-ia, la-vista-ne, lincoln-ne, bellevue-ne, papillion-ne, fremont-ne, nebraska-city-ne). Do not request indexing.
7. Run the live date audit and drop events already ended on publish day.

## Flags (not from a host page)
Rockbrook Village address and free (Facebook post); Midtown Crossing address; Christmas in the Village at 24th and Lake (street and zip mine); Elkhorn addresses lack street numbers (zip 68022 mine); Elkhorn parade end time; Holiday Lights Festival "Free" from festival's own line; Gretna Greenery and Glitter (city Facebook snippet); Bellevue Olde Towne address inferred; Rock n Lights hours from Visit Omaha; Winterpalooza (Nebraska City) and Nebraska City Christmas Tea from snippets and a library Facebook post; Lincoln Courtyard Marriott street address; Night of 1,000 Santas time (museum page 5 to 8 pm, one post says 5 to 9) and Dec 4 vs Dec 5; Fremont events price not listed; Breakfast with Santa Fremont is City Facebook only (built from city calendar listing, verify); Jolly Jamboree year not shown on church page. Fremont and Elkhorn Valley Railroad runs no trains (museum page says closed), trains paragraph says so.
Thin pages: Fremont 3, Nebraska City 3, Bellevue and Papillion rely on folded neighbors.

## Held
Omaha: Jolly Light Nights at Elkhorn Shores, Winterland at Heartwood, mall Santa photos (Westroads, Oak View, Regency), Durham sock skating, concert series and Log Cabin Christmas, Joslyn Castle Dec 6, Metro YMCA and Dave and Buster's Santa breakfasts, Hip Hop Nutcracker, Pigeon Holiday Extravaganza (2025 page). Bellevue tree lighting and Snow Plow and Santa Parade Dec 5 (Facebook only). (Bennington Santa is now built, cand 72580, on omaha-ne). Gretna Ideal Christmas Fest, Ashland Hometown Christmas and Light Parade (no times or address), Blair library Santa storytime, Wahoo Christmas in Wahooville, Plattsmouth Breakfast with Santa, Lincoln on Main Santa breakfasts, Nebraska City Lied Lodge brunch and Candlelight Tour.
