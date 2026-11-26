# Memphis run handoff (2026-11-26)

Three Sonnet helpers (Tennessee, DeSoto County MS, north and Arkansas); lead added intro_html, seo_title and seo_description to every page.json. Times -06:00. Registry script: rtt-cev-publish rtt/reg_memphis.sh (47 adds, branch claude/project-thread-hi23jg, commit 619fb18). Cand range 81000-81999. Rows: registry_rows.json.

## Towns (new events built)
EXISTING: memphis-tn 8 (intro 30 events, 10 free; live page says 23, confirm), bartlett-tn 2 (Millington and Munford folded in; intro 5 events, 3 free), olive-branch-ms 1 (intro 4/2).
NEW pages: germantown-tn 9, collierville-tn 7, arlington-tn 3, southaven-ms 6 (includes folded Tunica Funambula), horn-lake-ms 1, hernando-ms 4, west-memphis-ar 3, marion-ar 3.
No pages: Lakeland (0 verified), Millington, Munford (folded into Bartlett), Tunica (folded into Southaven), Walls, Byhalia, Nesbit, Covington, Atoka, Brighton, Oakland, Mason (nothing verified).
Total 47 new events.

## Publisher actions
1. Moves (memphis_moves.json): bartlett-christmas-parade-tn leaves the Memphis page; it is already live on Bartlett.
2. Millington and Munford bundles carry page bartlett-tn: add those two cards to the live Bartlett page. Check the Bartlett Nutcracker card for the Dec 19 performance (bartlett-tn/tweak_note.json).
3. bartlett-tn and olive-branch-ms and memphis-tn: add intro_html from page.json. New town pages: nearby starts memphis-tn; link Memphis to all new towns and each town back.
4. Christmas Eve services: only memphis-tn exists; link it. All other towns 404.
5. Intro counts assume the move; confirm live counts (Memphis live count is 23 vs 22 listed).
6. Registry then quick-counts for every changed path. Do not request indexing.

## Flags
- Weak or social-sourced: West Memphis Santa Fly-In (host Instagram post is the registry URL; times from Instagram), West Memphis after-party hours (chamber Instagram), Horn Lake 4 to 6 pm and Santa (parks Facebook excerpt), Hernando Cookies with Santa hours (city Instagram), Southern Lights nightly hours (parks Facebook).
- Registry URLs to eyeball: Graceland (trailing hyphen), Southaven Southern Lights (PREVIEW=YES calendar link), Strike Zone homepage.
- GSO ticket price $24 came from Memphis Travel, not the GSO page. Funambula endings blank. Collierville Holiday Lights Tour has dates only (no times).
- ZIPs added by helper, not host: Millington 38053, Munford 38058, West Memphis 72301. Devil Dome address from MapQuest.
- Thin pages: Horn Lake 1 event (own page by population rule), Arlington 3. Horn Lake, Olive Branch, Bartlett uniqueness unchecked (uniq.py crashes on a single page). "lastyear" text is thin for Collierville, Arlington, Marion.
- Tunica Resorts event is far from Southaven; Rally may prefer it on memphis-tn.
- Brief error: Memphis Railroad and Trolley Museum is at Central Station in Memphis, not Germantown.
- Held: Madeline's Christmas Germantown Community Theatre (no times or prices), The Happy Elf (date conflict), Madonna Christmas (sold out), Millington parade and Santa meet and greet, Covington and Atoka and Brighton items, Tunica tree festival items, Walls and Byhalia parades (Facebook only), Hernando Howliday Paws and Claus.
