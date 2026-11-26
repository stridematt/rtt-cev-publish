# New Orleans run handoff (2026-11-26)

Built by Sonnet helpers (core and Jefferson/St. Bernard, Northshore, River Parishes and bayou, each with a second pass). Lead checked: JSON validity, no duplicate cands or slugs, all cands in 66000-66999 (63 events), -06:00 on every timed JSON-LD, no dashes in bundles, intro_html, seo_title and seo_description generated into every page.json from intro.json (tools/mk_page_intro.py). Central time.

Registry: rtt-cev-publish branch claude/project-thread-fqyeqv, new-orleans/reg_new_orleans.sh, commit 3fd2044c76082f4feb42a0a98466830932eb2b2d (63 adds, no set -e, `|| true` on each, every add --confirm-new, prints "added N, refused M" and refused slugs; verified identical to the local file). Rows: registry_rows.json.

Registry command (Rally, Terminal, source ./.env first, run once; re-runs add duplicates):
cd /Users/matt/Downloads/sa/registry && source ./.env && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/3fd2044c76082f4feb42a0a98466830932eb2b2d/new-orleans/reg_new_orleans.sh -o reg_new_orleans.sh && bash reg_new_orleans.sh

## Towns (folder, bundle.json.gz, page.json; intro counts are events, free; free is a floor where noted)
NEW pages (full page.json): covington-la 6, 4 free (2 Nutcracker cards move in from slidell); mandeville-la 7, 3 (2 cards move in from slidell, Abita Springs folded); madisonville-la 4, 3 (1 card from slidell); hammond-la 3, 2 (Ponchatoula folded); gretna-la 8, 4+ (4 cards move in from new-orleans; Marrero, Westwego, Belle Chasse, Terrytown, Harvey folded); chalmette-la 4, 0 known (Maumus Nutcracker Tea moves in from new-orleans; Arabi, Meraux, Violet, St. Bernard folded); laplace-la 7, 1 (2 Destrehan cards move in from new-orleans; Lutcher, Gramercy, Norco, Luling, Hahnville, St. Rose, Reserve folded); morgan-city-la 8, 4 (Berwick, Bayou Vista, Patterson, Franklin folded).
EXISTING pages with new events (bundle plus intro_html from page.json): new-orleans-la +16 (33 events after moves, 9+ free); metairie-la +3 (10 events, 1+ free; gets Lafreniere Park and 3 Harahan cards from new-orleans); kenner-la +1 (4, 3 free); slidell-la +5 (9, 4 free; 5 cards move out); houma-la +3 (8, 3 free; Thibodaux, Lockport, Golden Meadow folded).
No page: Harvey, Avondale, River Ridge, Elmwood, Gonzales, Donaldsonville, Franklinton, Folsom, Amite, Pearl River, Lacombe, Galliano, Cut Off, Raceland (nothing verified or under 3 and Facebook only). See folded.json files and folded_B2.json.

## Publisher actions
1. Moves: new_orleans_moves_final.json (card, from, to; 18 cards from new-orleans-la and slidell-la). Cards move off the source page onto the target page's list (target bundle does not include them; copy the live card). Delete from new-orleans-la the duplicates rudolph-the-red-nosed-reindeer-metairie-la (already on metairie-la) and kenners-magical-christmas-village-la (already two cards on kenner-la).
2. Link new-orleans-la to every new town page (covington, mandeville, madisonville, hammond, gretna, chalmette, laplace, morgan-city) and each new page back to new-orleans-la; also link slidell-la to covington, mandeville, madisonville; metairie-la to gretna. page.json "nearby" starts ["new-orleans-la","New Orleans"].
3. Existing pages: use intro_html and seo_description from page.json (existing towns' page.json holds only intro and seo fields) replacing the live intro. New pages use the full page.json.
4. Christmas Eve services pages: new-orleans-la and houma-la exist; link them. 404 for metairie, kenner, gretna, chalmette, laplace, morgan-city, covington, mandeville, madisonville, hammond, slidell.
5. Page date = publish day. Times -06:00. Multi-date runs emit one start time plus endDate (kit behavior).
6. Registry, then quick-counts for every changed path (all pages above). Do not request indexing.
7. Run the live date audit and drop events already ended on publish day. Intro free counts are floors for new-orleans, metairie, gretna, chalmette and laplace (live cards not re-read for price): recount from the live page after moves.
8. Train links: gretna-la and laplace-la use /museums/louisiana-steam-train-association-new-orleans-area and /museums/new-orleans-streetcars-louisiana (verified 200). Other new pages have none.

## Flags (weak facts, please review before publish)
- Calendar-only sources (no host page): 66303 Holiday Family Movie Night (neworleans.com), 66000 West End Boat Parade, most Covington, Mandeville and Madisonville events (Visit The Northshore calendar), Morgan City, Berwick, Patterson, Franklin (cajuncoast.com hub), Lutcher/Norco (lariverparishes.com). Pages say so via the source line.
- (Dropped 2026-11-26: Westwego fire company parade, Facebook-only; Christmas at RISE Tickfaw, dates only in a calendar image.)
- 66413 Bogalusa parade: city page gives only "Zesto parking lot"; address 100 Richmond St is from business listings (news says 600 block of Columbia St). 66414 Bogalusa brunch: Eventbrite only.
- Mandeville Holiday of Lights dates conflict (parish page Dec 18/19 vs calendar Dec 19/20); built dates are Dec 4, 5, 11, 12 where both agree.
- Addresses inferred or not on host page: Steamboat Natchez wharf (600 Decatur St), Lakeside Shopping Center, Madisonville Maritime Museum, Plaquemines festival, Morgan City, Bayou Vista, Berwick, Franklin and Patterson zips, Norco and Lutcher bonfire streets, Christmas Past Festival (Girod St, no number).
- Jingle on the Boulevard uses 7300 Crowder Blvd; route starts at 8400 Morrison Rd. Lockport parade 5:30 pm from a calendar and snippet. Slidell Little Theatre zip 70458 (host) vs 70461 (tourism).
- Gretna and Chalmette lastyear paragraphs are thin; gretnala.com link comes from a live card and was not read.
- Thin pages: Hammond 3, Madisonville 4, Chalmette 4.

## Held
Westwego fire company parade (Facebook-only; city site only has a 2024 post), Christmas at RISE Tickfaw (open dates only in a calendar image). Holiday Spectacular alternatives and others: Brunch with Santa at Bourbon Orleans (2025 page), Old Algiers Holiday Art Market, Christmas on SALA Ave, Plaquemines tree lightings (conflicting dates), Southdown "A Trip to the North Pole" (Dec 12/19 vs 13/20), Christmas in Wonderland Houma (no venue), Thibodaux Christmas in the Park and Santa's Land (no address, 2025 page), Patterson Wedell-Williams tree festival, LaPlace Christmas on Main (Facebook), Gonzales and Donaldsonville events (Facebook or 2024), Gramercy Stroll, Felicity bonfire (ticketed bar), Folsom, Amite, Abita Fete de Noel (Facebook, market), Franklinton parade (conflicting dates), Bogalusa Christmas in the Park, Pancakes and Pajamas with Santa (Slidell, no address), Hammond lights page (2015), Idlewild lights (2024 dates), Centerville light show. Shopping markets, brewery markets, adult events skipped. Not covered: Baton Rouge (existing page, out of scope).
