# Phoenix run handoff (2026-11-26)

Built by three Sonnet helpers (core, East Valley, West Valley); lead checked JSON validity, duplicate cands, dashes and exclamation marks, bundle slugs vs registry rows, and generated page.json (intro_html, seo_title, seo_description) from each intro.json. Times are -07:00 (Arizona has no daylight saving). Registry script: rtt-cev-publish rtt/reg_phoenix.sh (70 adds) and a copy in this folder. Cand range 89000-89999.

## Towns (new events built)
EXISTING pages (add cards, add intro_html to the live page): phoenix-az 8 (intro 29 events, 13 free), scottsdale-az 5 (29/24), tempe-az 3 (11/6), mesa-az 3 (26/15), gilbert-az 3 (16/10), chandler-az 2 (19/15), glendale-az 7 (11/8), surprise-az 4 (9/3), apache-junction-az 2 (4/3), casa-grande-az 2 (4/2).
NEW pages: fountain-hills-az 4, cave-creek-az 3 (Carefree folded in), queen-creek-az 2, san-tan-valley-az 4, maricopa-az 1, peoria-az 4, goodyear-az 2, avondale-az 1, buckeye-az 5, litchfield-park-az 5 (own page).
Total 70 new events. Folded, no page: Paradise Valley into Scottsdale; El Mirage, Wickenburg, Sun City and Sun City West into Surprise (1 verified event each: el-mirage-winterfest-and-parade-az, wickenburg-christmas-parade-of-lights-az).
Thin new pages (1 to 2 built events): maricopa 1 (plus Merry Copa move), avondale 1 (plus Winterfest move), goodyear 2, queen-creek 2 (plus Schnepf and two Gilbert cards).

## Every folder
facts.json, tweaks.json, bundle.json.gz, intro.json, page.json, existing_cards.txt. paradise-valley-az has only folded.json.

## Publisher actions
1. Moves: phoenix_moves.json. 18 suburb cards leave the Phoenix page (many are duplicates of cards already live on the town page: just remove from Phoenix). Gilbert's two Queen Creek cards go to Queen Creek, Merry Copa goes from Casa Grande to Maricopa, Surprise's three neighbor cards go to Litchfield Park, Avondale and Buckeye.
2. Intro counts assume the moves and include live cards whose dates were not re-verified. Confirm against live counts after moves; Tempe is 10 events, 5 free if the expired Tempe Marketplace tree lighting (Nov 25) is removed.
3. New town pages: nearby starts phoenix-az; link Phoenix to all new towns and each town back to Phoenix. Phoenix intro hub line is generated; existing town pages have no intro block yet (add intro_html from page.json).
4. Christmas Eve services pages: phoenix-az, scottsdale-az, mesa-az, chandler-az, surprise-az exist; tempe, glendale, fountain-hills, cave-creek, peoria, goodyear, avondale, buckeye, litchfield-park are 404 (Gilbert, Apache Junction, Casa Grande unconfirmed). Link the existing ones.
5. Price not listed events are marked so; public parades Free. Page date today of publishing.
6. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- Addresses supplied from a listing or memory, not the host page: Scottsdale Civic Center (7380 E 2nd St), Omni Montelucia (4949 E Lincoln Dr), MIM (4725 E Mayo Blvd), Carefree Desert Gardens (101 Easy St), Tempe Petersen House and Gammage (Tempe Tourism), Berean Baptist San Tan Valley zip 85140 and Maricopa Living Nativity zip 85139 (assumed), Arrowhead Towne Center, Westgate, Peoria Holiday Festival, Arizona Broadway Theatre, Buckeye zips and Sundance Park, Wigwam, Vertuccio Farms (Visit Mesa).
- Conflicts: Cave Creek tree lighting hours (built 4 to 7 pm); Starlight Movie Night (city calendar Dec 5, Facebook Dec 6; used Dec 5); Goodyear Holidays on the Square 5 to 8 vs 5 to 9 pm; Festival Foothills Park address; Surprise Stadium 15850 vs 15960 (used 15960); Mesa Santa Express 440 vs 420 E Main St.
- Weakest: San Tan Valley events from the SanTanValley.com community calendar only (Dust Bowl parade organizer unnamed); Glitz and Glitter at Galleria (Eventbrite only, no host link); Santa Paddle time and permit from Tempe Tourism; Fountain Hills ages from the Fountain Hills Times.
- Host URLs that are homepages: El Mirage (elmirageaz.gov), Buckeye events, Wigwam events, Litchfield Park tree lighting.
- uniq.py flags "Price not listed" (stale regex; not real). Avondale has one page, so uniq.py crashes: uniqueness unchecked.
- Held: Chandler Cornerstone Christmas Festival, Casa Grande Toy Parade (Facebook only), Maricopa Merry Fitmas and Holiday Homes on Parade, San Tan Valley Holiday Helpers, Mesa Dave and Buster's Santa breakfast, Arizona Science Center Snow Week (no dates), Scottsdale OdySea Santa and Hermosa Inn gingerbread and Jingle Belles, Surprise Cookies and Crafts with Santa (price unverifiable), Wickenburg Music Walk (2024 page), Peoria Miracle on 34th Street, Goodyear and Buckeye aggregator-only items (Teeny Town Cookies with Santa, Winter Carnival), Verrado Parade, Arizona City Santa Fly-In, Chandler Candleland, Tempe Native Holiday Market and Menorah Lighting.
- Casa Grande carries cards for Coolidge, Florence, Stanfield and Arizona City (no pages); Gilbert has a Sun Lakes concert. Left in place.
