# Wichita run handoff (2026-11-26)

Built by three Sonnet helpers (core and Derby, suburbs, outer ring); lead merged intros (wichita-ks recounted: 43 events, 12 free), generated intro_html, seo_title and seo_description into each page.json (mk_page_intro, Kansas), registry script and rows. Cand range 68000-68999 (used 68000-68011, 68400, 68500-68506, 68750-68795). 44 new events. Central time: -06:00 on every timed JSON-LD.

Registry script: rtt-cev-publish branch claude/project-thread-m4858o, wichita/reg_wichita.sh, commit de3b8ad6ddebaa59688303ed0c66d53700aa8d39 (44 adds, no set -e, || true, --confirm-new, prints "added N, refused M" and refused slugs). Rows: registry_rows.json.

Registry command (Rally, Terminal, source ./.env first, run once):
cd /Users/matt/Downloads/sa/registry && source ./.env && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/de3b8ad6ddebaa59688303ed0c66d53700aa8d39/wichita/reg_wichita.sh -o reg_wichita.sh && bash reg_wichita.sh

## Towns
NEW pages (full page.json + bundle): towanda-ks 4 events, 0 free (2 cards move from wichita-ks); newton-ks 4, 2 free (Halstead folded in); mcpherson-ks 9, 5 free; hesston-ks 3, 1 free.
EXISTING with new events: wichita-ks 43, 12 free (22 live - 2 moved to Towanda + 12 new from wichita-ks/ + 5 from wichita-suburbs-ks/ + 6 from wichita-outer-ring-ks/; use intro_html from wichita-ks/page.json; THREE bundles all target page wichita-ks); derby-ks 4, 3 free (+1); hutchinson-ks 4, 3 free (+2, 2 live cards stay).
Folded, no page: Andover (its Hometown Christmas card stays on wichita-ks), Haysville, Maize, Goddard, Mulvane, Park City, Augusta, El Dorado, Winfield, Kingman (events carded on wichita-ks), Halstead (into newton-ks); nothing verified: Bel Aire, Cheney, Rose Hill, Valley Center, Clearwater, Colwich, Kechi, Belle Plaine, Wellington, Hillsboro.

## Publisher actions
1. Moves: wichita_moves.json. Delete the two Fulton Valley Farms cards from wichita-ks and add them to towanda-ks (the Towanda bundle has only its 2 new cards). The Fulton page also lists a Dec 24 Pancakes session the live card may lack; check.
2. Link wichita-ks to towanda-ks, newton-ks, mcpherson-ks, hesston-ks, derby-ks, hutchinson-ks; each new page back to wichita-ks. page.json nearby starts ["wichita-ks","Wichita"].
3. Existing pages: replace live intro with intro_html and seo_description from page.json. wichita-ks links to its Christmas Eve page /christmas-eve-services/wichita-ks (live). 404 for derby, towanda, newton, mcpherson, hutchinson; hesston not checked.
4. Page date = publish day. -06:00. Registry, then quick-counts for every changed path (wichita, derby, hutchinson, towanda, newton, mcpherson, hesston). Do not request indexing.
5. Run the live date audit; drop events ended on publish day (Nov 26 events: Somewhere in Winter and Winfield Isle of Lights run on).

## Flags (facts not from a host page)
Wichita: addresses for Orpheum, INTRUST Bank Arena, zoo zip, Mid-America All-Indian Museum, Somewhere in Winter, Wichita Art Museum came from listings; Ballet Wichita Nutcracker uses Century II's page (no prices printed); Pageant venue conflict (used the ticket page); Toyland Dec 3 to 5 times assumed from Visit Wichita; Paint a Keeper 1 to 3 pm (one Facebook post says 11 to 3); Santa Brunch from Visit Wichita; Thunder times from a search excerpt. Suburbs: Haysville, Goddard, Park City details from city Facebook or excerpts (CivicPlus pages empty); Maize and Mulvane PIX addresses from a local guide; Park City start 4:30 pm (listings say 4 or 4:30). Outer: Hutchinson Zoo dates from Visit Hutch and $10 from an excerpt; Winfield Isle of Lights and El Dorado/Newton no street address; Hesston Main Street time conflict (6 pm vs 6 to 9); McPherson and Hesston thin last-year paragraphs. Towanda last-year paragraph from a 2025 snippet.

## Held
Bradley Fair stroll, Holly Jolly Jurassic, Chicken N Pickle ice pond, Tanganyika (no lights 2026), Magic of Lights dragway, Kansas Aviation maker market, adult Candlelight and Messiah, Mannheim Steamroller, Derby Zoom with Santa and PTO breakfast, Bel Aire Christmas (venue conflict), Cheney (Facebook/allevents only), Rose Hill (no 2026 date), Goddard toy drive, Mulvane tree lighting, Newton Seven Saturdays (2025) and Main Street photo booths, McPherson Pet Photos, El Dorado Old Fashioned Christmas parade (Dec 3 vs Dec 5), Kingman parade (Facebook only), Cosmosphere (2025 pages), Strataca 5K, Towanda NYE party (21+).
