# Charlotte run handoff (2026-11-26)

Built by three Sonnet helpers; lead checked JSON validity, bundle slugs vs registry rows (56 slugs, 56 cands), dashes and exclamation marks, and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Times are -05:00 (Eastern). Registry script: rtt-cev-publish branch claude/project-thread-jjm52i, rtt/reg_charlotte.sh, commit d9f81975248f1a19ca671f263a336914b0742040 (56 adds). Cand range 85000-85999.

## Registry command (Rally runs once; re-runs add duplicates)
cd /Users/matt/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/d9f81975248f1a19ca671f263a336914b0742040/rtt/reg_charlotte.sh -o reg_charlotte.sh && bash reg_charlotte.sh

## Towns (new events built)
EXISTING pages (add cards, add intro_html from page.json): charlotte-nc 5 (intro 24 events, 11 free), cornelius-nc 1, kannapolis-nc 2, gastonia-nc 4, cramerton-nc 1, indian-trail-nc 1, rock-hill-sc 2. mint-hill-nc: nothing new verified (no bundle; intro_html only).
NEW pages: huntersville-nc 6 (+6 moved in), davidson-nc 1 (+2), mooresville-nc 3, matthews-nc 4, monroe-nc 2, waxhaw-nc 6 (Marvin and Weddington folded in), fort-mill-sc 1 (+5 moved from Rock Hill; Indian Land folded in), lake-wylie-sc 1 (+2 moved), concord-nc 4 (+2), salisbury-nc 5 (+1; Spencer, China Grove, Landis folded in), harrisburg-nc 2 (Mount Pleasant folded in), belmont-nc 1 (+1), mount-holly-nc 1, lincolnton-nc 3.
Total 56 new events. Not built: Clover, York, Tega Cay, Stallings, Mineral Springs, Wesley Chapel, Denver, Stanley, Pineville (no verified events or under 3).

## Publisher actions
1. Moves (never on two pages): charlotte_moves.json and each moves.txt. Off Charlotte: 4 cards to Huntersville, Broken Egg brunch and Speedway Christmas to Concord, Polar Express train to Salisbury (Spencer), Holidays at the Garden to Belmont, Christmasville to Rock Hill (duplicate: just remove), Pineville bilingual concert stays or goes to a later Pineville page. Off Cornelius: tree lighting and St. Mark's market to Huntersville; Davidson parade/Santa cards to Davidson. Off Rock Hill: 5 cards to Fort Mill, 2 to Lake Wylie; remove Carowinds Winterfest (duplicate of winterfest-charlotte-nc). McAdenville Christmas Town is on both Charlotte and Gastonia: remove the Charlotte copy.
2. Intro counts assume the moves; confirm against live counts afterwards. New town pages: nearby starts charlotte-nc; link Charlotte to all new towns (hub line lists them) and each town back to Charlotte.
3. Christmas Eve services pages that exist (link them): charlotte-nc, gastonia-nc, cramerton-nc, matthews-nc, rock-hill-sc. 404 or unchecked for the rest (huntersville, cornelius, davidson, mooresville, concord, salisbury, kannapolis all 404).
4. Price not listed events are marked so; public parades Free. Page date today of publishing. Then registry, then quick-counts for every changed path. Do not request indexing.

## Flags
- Addresses and zips from memory or tourism pages, not host pages: Cabarrus Arena, Swanee Theatre zip, Mount Pleasant, China Grove (Hanna Park zip conflict 28023 vs 28032), Gastonia Rotary Pavilion, Kings Mountain, Dallas, Mount Holly, Cramerton, Lincolnton, Lincoln Cultural Center, Cornelius Town Hall, Stumptown Park (120 vs 196 S Trade St), Museum of the Waxhaws, Marvin Efird Park, Indian Land (two addresses; used WorldReach).
- Hosts attributed by the helper, not printed: Polar Express screening (Charlotte Center City Partners), Hugh Torance House ("Historic Huntersville").
- Calendar or tourism sources rather than host: Gaston parades (Go Gaston NC), Salisbury, China Grove, Concord, Harrisburg (Visit Rowan, Explore Cabarrus), Visit Lake Norman listings, Rock Hill A Beautiful Christmas (Visit York County).
- Conflicts: Snowland at Great Wolf Lodge (host Nov 23 to Jan 5 vs Explore Cabarrus Nov 29 to Dec 23; used host); Birkdale Breakfast with Santa (host Dec 5, tourism Dec 6; used host); Davidson Santa at Ben and Jerry's cost ($10 per family in notes, live card shows 0); Mooresville intro and Concord intro free counts include moved cards whose prices were not checked.
- Page "lastyear" paragraphs on new pages come from edition numbers or older years, not 2025 recaps. Thin.
- uniq.py crashes on single-page towns (Belmont, Mount Holly, Cramerton, Cornelius, Davidson) so uniqueness unchecked there; it flags "Price not listed" (not real). Monroe Santa's Workshop held (2026 page confirms dates only).
- Held (main): Facebook-only items, round-up-only items (NoDa tree lighting, Merry Midtown etc.), Wingate parade (no venue), Tega Cay tree lighting (no address), Noon Year's Eve (year conflict), Festival of Trees (Concord and Belmont, no price or dates).
- Events for towns with no page: Cherryville (Dec 12), Lowell (Nov 30), Ranlo (Dec 12), Marshville library Santa (Dec 1), Unionville parade (Dec 6).
