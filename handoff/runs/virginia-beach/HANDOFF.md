# Virginia Beach run handoff (2026-11-26)

Three Sonnet helpers; lead validated JSON, offsets (-05:00 everywhere; Skate, Winter Wonderland, Pugh, Tree Tour, Christmas Town are date ranges), no dashes/exclamations, unique slugs and cands (71000-71999 block, 67 new events), bundles under 1 MB, built page.json (intro_html, seo) for every town from intro.json. The Virginia Beach page intro has no hub link to itself.
Registry: rtt-cev-publish branch claude/project-thread-73spig, commit a4c9a6f8917bfdacd1ba08a5d9e20e33cf2eb583, rtt/reg_virginia_beach1..7.sh (10 adds each, 7 in the last; no set -e; prints "added N, refused M" and refused slugs). Rows in registry_rows.json; bundles in rtt/virginia-beach/<town>-va.json.gz and in each town folder.

## Registry command (Rally runs once; re-runs add duplicates)
cd /Users/matt/Downloads/sa/registry && source ./.env && for i in 1 2 3 4 5 6 7; do curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/a4c9a6f8917bfdacd1ba08a5d9e20e33cf2eb583/rtt/reg_virginia_beach$i.sh -o reg_virginia_beach$i.sh && bash reg_virginia_beach$i.sh; done

## Towns
EXISTING (add cards, set intro_html and seo from page.json): virginia-beach-va 7 new (29 total), norfolk-va 5 (25), chesapeake-va 4 (12 with moved parade), suffolk-va 6 (8), hampton-va 4 (9 with 3 moved in), newport-news-va 4 (11 after moves out), williamsburg-va 5 (8).
NEW pages: portsmouth-va 7, smithfield-va 3 (Windsor, Isle of Wight), franklin-va 17 (Southampton County), yorktown-va 5 (Poquoson 3 and Gloucester 1 folded in, plus 6 moved from Newport News; 11 total).
Total 67 new events.

## Publisher actions
1. Moves and drops per virginia-beach_moves.json and each moves.txt/neighbor_moves.txt (never on two pages).
2. Link every new town from the Virginia Beach page; each new town links back (nearby starts virginia-beach-va). Link Hampton Roads sister pages to each other where nearby lists say so.
3. Price not listed events show so; parades Free. Page date today of publishing. Then registry, then quick-counts for every changed path. Do not request indexing.
4. Christmas Eve services pages that exist (link): virginia-beach, norfolk, chesapeake, suffolk, williamsburg. 404: portsmouth, smithfield, franklin, yorktown, hampton, newport-news.
5. Hampton and Newport News were already live (2 and 17 cards); the brief was stale.

## Flags
- Addresses not from host pages: Hermitage, Portsmouth Art and Cultural Center, Harrison Opera House, Harbor Park zip, Ocean View Beach Park, Hampton Coliseum, American Theatre, Mariners' Museum, Virginia Living Museum, Busch Gardens, Poquoson High School, Merchants Square.
- Facebook or social sources: Lynnhaven Boat Parade, Founders Inn price (host Instagram), Pugh light show (host Facebook). Suffolk Frosty Fest, Tree Tour, Nutcracker come from the Downtown Suffolk calendar. Franklin events from the Visit Franklin Southampton calendar.
- Intro free counts for Suffolk, Chesapeake and Virginia Beach cover new events only (live cards' prices not read). Suffolk SEO title omits the free count for that reason.
- New page "sources" are thin and "lastyear" says no 2025 recap found (Franklin, Smithfield).
- Held: Norfolk Elf Door Discovery, Winterfest Riverwalk (no dates), Norfolk Parks Breakfast with Santa (Facebook only), Chrysler Hall Nutcracker (only World Ballet Company source), Portsmouth Donuts with Santa (no date), Portsmouth Little Comfort Christmas (Instagram), Kid's Christmas Festival (Eventbrite), Holly Jolly Trolley (conflicting dates), Hampton Grand Holiday Market, Peninsula Town Center Holiday Magic, Bass Pro Santa, Poquoson Frosty Festival, Santa photos, library Jamboree. Water Country and Jamestown: no 2026 holiday events found.

## Address check (2026-11-26, after handoff)
Verified against host or venue pages: Hampton Coliseum 1000 Coliseum Dr, American Theatre 125 E Mellen St, Harrison Opera House, Hermitage, Harbor Park, Mariners' Museum, Virginia Living Museum, Busch Gardens, Portsmouth tree lighting (524 Middle St Plaza, per host event page).
Fixed in bundles (norfolk-va, portsmouth-va, yorktown-va; republish needed if already loaded): Portsmouth Art and Cultural Center is 400 High St (was 440); Poquoson High School is 51 Odd Rd, Poquoson 23662 (was 1210 Poquoson Ave); Ocean View Beach Park now "Granby Street at Ocean View Avenue, Norfolk, VA 23503" (host gives no street number; was 100 W Ocean View Ave). Merchants Square: Duke of Gloucester St in front of the Kimball Theatre (134 N Henry St per a third-party page), left as is. Registry script unchanged.
