# Raleigh run handoff (2026-11-26)

Built by three Sonnet helpers; lead validated every JSON, checked dashes, exclamation marks, offsets (-05:00), bundle sizes (all under 450 KB), 68 slugs and 68 unique cands (74000-74943), and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Registry script: rtt-cev-publish branch claude/project-thread-whacx9, rtt/reg_raleigh.sh, commit b4bb0e9b4185dd65e19eaf9431868cba1ad92e54 (68 adds, no set -e, prints added/refused summary; copy in this folder, rows in registry_rows.json).

## Registry command (Rally runs once; re-runs add duplicates)
cd /Users/matt/Downloads/sa/registry && source ./.env && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/b4bb0e9b4185dd65e19eaf9431868cba1ad92e54/rtt/reg_raleigh.sh -o reg_raleigh.sh && bash reg_raleigh.sh

## Towns (new events built)
EXISTING pages (add cards, set intro_html from page.json): raleigh-nc 9, durham-nc 9, cary-nc 5, apex-nc 2, holly-springs-nc 2, fuquay-varina-nc 2 (Angier folded in), wake-forest-nc 4 (Rolesville, Franklinton folded in), carrboro-nc 1.
NEW pages: garner-nc 3 (+1 moved in), knightdale-nc 1 (+3 moved in; Wendell folded in), clayton-nc 3 (+1), smithfield-nc 7 (Selma folded in), morrisville-nc 3, chapel-hill-nc 4, hillsborough-nc 5 (Efland folded in), pittsboro-nc 4, siler-city-nc 4. Total 68 new events.
Not built: Zebulon (no verified events), Wendell (folded into Knightdale), Youngsville (Facebook only).

## Publisher actions
1. Moves (never on two pages), from raleigh_moves.json and each moves.txt. Off Raleigh: Knightdale 3, Garner 1, Clayton 1, Apex 2 (Apex Rotary parade plus New Hope Valley Santa Express), Cary 3 (Sensory Friendly Winter Fest, Christmas Cantata, Candlelight Christmas Eve at Genesis UMC), Fuquay-Varina 1, Wake Forest 1 (Pictures with Santa). Remove from Raleigh as duplicates: NC Chinese Lantern Festival (on Cary), Light the Springs (on Holly Springs), Lighting of Wake Forest and Joyner Park walk (on Wake Forest), 4 Durham cards (on Durham). Drop the Raleigh Christmas Parade anchor (Nov 21, past, no card page).
2. Intro counts assume the moves; confirm against live counts afterwards. New town pages: nearby starts raleigh-nc. Link Raleigh and the other pages to all new towns, and each town back to Raleigh.
3. Knightdale Christmas Parade (Dec 12) live card says "see host page for prices": set cost to Free (public parade); the Knightdale intro already counts it as free.
4. Christmas Eve services pages that exist (link them): raleigh-nc, cary-nc, durham-nc, carrboro-nc. 404 for garner, knightdale, clayton, smithfield, morrisville, chapel-hill, hillsborough, pittsboro, siler-city, apex, holly-springs, fuquay-varina, wake-forest.
5. Price not listed events are marked so; public parades Free. Page date today of publishing. Then registry, then quick-counts for every changed path. Do not request indexing.

## Flags
- Intro free counts for Cary, Apex, Holly Springs, Fuquay-Varina, Wake Forest, Durham include moved or live cards whose prices were not checked.
- Skate the Square (Cary) runs to Feb 7, 2027; card capped at Dec 31 with the season in the note.
- Addresses/zips from memory or third party: Cary Arts Center zip, Franklinton, Angier (no street), DPAC (123 Vivian St, alternate address exists), Chapel Hill tree lighting (University Baptist Church from Triangle on the Cheap; host link is an Instagram post), University Place zip, 1870 Farm (address from third-party and 2025 sources, no 2026 hours or price on host page), Garner Light Up Main (215 W Main St from Downtown Garner post), Smithfield movies times (host page used over a news report).
- Calendar-sourced, host page not read: Hub RTP FAM JAMS, Spruce Pine Lodge (Discover Durham), Santa Paws and Santa on the Roof (Downtown Durham Inc), Fearrington Tea with Santa $125 (CVB calendar), Elfland (Orange County calendar), Celebrity Dairy (Visit Pittsboro, homepage link), Siler City parade (town calendar list link), Southpoint hours (mall page, listing start Nov 13 shown as Nov 26).
- Facebook-only host links: Mangum Lights, Elfland. Instagram link: Chapel Hill tree lighting.
- Conflicts (host time used): Chapel Hill parade 10:00 vs 10:30, Hillsborough tree lighting, Pittsboro parade 2 vs 3 pm; Duke Homestead price (Discover Durham Free vs Eventbrite $12, used $12).
- Folding stretch: Franklinton and Youngsville are far from Wake Forest.
- Thin "lastyear" paragraphs on new pages (no 2025 recaps found). uniq.py: all towns 60%+, Carrboro and Knightdale single-card pages may be unchecked.
- Held (main): Facebook-only items, sold out Cary Nutcracker Tea, menorah/Hanukkah/Kwanzaa events, Clayton Hot Cocoa with Santa (no time found), Black Santa at Hayti (no 2026 price), Christmas in the Groves (dates TBA), Santa's Social (full), Angier Christmas on the Square (address conflict).
- Events for towns with no page: Goldston tree lighting (Nov 29) and parade (Dec 5), Ronnie's Berry Farm Christmas Market (Dec 5, Angier), Spring Hope, Youngsville tree lighting.
