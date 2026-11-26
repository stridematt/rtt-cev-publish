# Eugene OR (Lane County and south coast) run handoff (2026-11-26)

REGISTRY COMMAND (Rally, Terminal, run once; paste back the "added N, refused M" lines):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/d1c9f07bce6638027f5ba852151d96dc59859cd3/eugene/reg_eugene.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

(repo stridematt/rtt-cev-publish, branch claude/project-thread-92ny7d, commit d1c9f07bce6638027f5ba852151d96dc59859cd3; raw file verified byte-identical to eugene-run/reg_eugene.sh; 42 adds, no set -e, --confirm-new on each, || true per add.)

Built by three Sonnet helpers (A: Eugene, Junction City, Veneta; B: Springfield, Cottage Grove and the south and east towns; C: Florence and the coast). Cand range 52000-52999 (used 52000-52011, 52300-52307, 52310-52313, 52320, 52600-52610, 52700-52708). Pacific, -08:00 verified on every timed JSON-LD; no dashes or exclamation marks; Paid pill stripped on Price not listed pages; uniqueness 60%+ on every page; 42 new events. registry_rows.json lists them. Bundles are in each town folder (all under 1.3 MB).

## Towns
NEW pages (page.json carries intro_html, seo_title, seo_description; counts are events, free):
- springfield-or 11, 3 free (3 moved from eugene-or + 8 new: parade, Oakridge tree lighting, Shred with Santa at Willamette Pass, Elf Jr., Santa's Workshop escape room, Bass Pro Santa's Wonderland, McKenzie River boat parade at Leaburg, Belknap bridge lighting; Oakridge, Lowell, Dexter and McKenzie River folded here)
- cottage-grove-or 5, 1 free (Creswell festival carded here)
- florence-or 8, 5 free (Mapleton and Yachats events carded here)
- coos-bay-or 12, 6 free (North Bend, Charleston, Reedsport, Winchester Bay and Gardiner events carded here; Reedsport/Winchester Bay/Gardiner has 3 events and could be split to its own page, left folded because Reedsport is not a 20,000 town; the cands 52607-52609 are self-contained if Rally wants that)
EXISTING:
- eugene-or: 9 new events (includes Junction City and Veneta, which are folded here, and Pleasant Hill tree farm). After the 3 moves: 23 events, 5 free. page.json has intro_html, seo_title ("Eugene Christmas Events for Kids 2026: 23 Events, 5 Free") and seo_description. Recompute counts at publish time.
Folded, no page (folded.json each): Junction City and Veneta (to Eugene), Oakridge, Lowell, Dexter (to Springfield), Creswell (to Cottage Grove), Mapleton, Yachats, Waldport (to Florence; Waldport held), North Bend, Charleston, Reedsport, Winchester Bay (to Coos Bay). junction-city-or/page.json and veneta-or/page.json exist only as stand-ins; do not publish them as pages.

## Publisher actions
1. Moves: eugene_moves.json (3 Springfield cards from eugene-or to springfield-or: ugly-sweater-skate-party-springfield-or, holiday-tea-springfield-or, winter-solstice-celebration-springfield-or). The springfield-or bundle does not include them, so move the live cards. Then remove dead planner rows on eugene-or.
2. Links: eugene-or links springfield-or, cottage-grove-or, florence-or, coos-bay-or; each new page links back to eugene-or. Springfield and Cottage Grove also link salem-or (live); Florence and Coos Bay link only eugene-or until published (cross-link florence-or and coos-bay-or after).
3. Christmas Eve services pages: eugene-or yes (200); springfield, cottage-grove, florence, coos-bay all 404. Eugene already links its page; check it.
4. Intros: use intro_html, seo_title, seo_description from each page.json.
5. Page date = publish day, offset -08:00. Registry, then quick-counts for every changed path (eugene-or, springfield-or, cottage-grove-or, florence-or, coos-bay-or). Do not request indexing. Drop events ended on publish day and recheck counts against the live page.
6. train_links: none ([] on every new page). Eugene keeps its live museum links.

## Flags (facts not from a host page, or weak)
- Elf The Musical Jr. (Springfield, 52303): host /elf page renders empty; showtimes and prices came from the search-index snippet; zip 97478 is a guess. Re-check before publish.
- Photos with Santa and Snow Shows at 5th Street Public Market (Eugene, 52003): host page is image only; details from the Travel Lane County listing, and the page says so.
- Springfield Christmas Parade: time and route from the Eugene, Cascades & Coast calendar and KEZI; the Oregon Riders Society page only confirms Dec 5.
- Bass Pro Shops Springfield Santa's Wonderland: dates from the company's 2026 announcement covering all stores; store events beyond Santa photos not confirmed.
- McKenzie River boat parade and Belknap lighting are in the McKenzie River valley, carded on Springfield (nearest big town).
- Oregon Coast Historic Railway Museum lights: host site is a "Coming Soon" shell; free admission and address from the tourism listing and a snippet.
- Coos Bay library address (525 W Anderson Ave), Lions Park address in Reedsport, Winchester Bay and Ed Lund Park addresses are partly from memory or older pages; Veneta and Junction City parade end times are estimated and noted on the cards. Veneta tree lighting cost is "Free" (parade is public, donations welcome); change to Price not listed if preferred.
- Creswell festival time not yet announced; Stained Glass and Candlelight and several Coos Bay events come from chamber or tourism calendars (source lines are on the pages). Florence Lantern Walk times conflict (RiverCal 5:45-6:15 vs host Eventbrite 5-6); the host Eventbrite agenda was used.
- Rotary-style ticket-site-only events: none.

## Held or dropped
Junction City Yule Fest (canceled), JC Santa night (Instagram only), JC Pictures with Santa (listing only), Veneta Lights on Broadway and Winter Wonderland (Facebook only), Eugene library storytimes (not Christmas specific), Eugene Science Center solstice concert, Carols on Strings, Charlie Brown Christmas jazz trio (ticket link only; worth a host check), Dr. Snapp House bazaar (2025 recap only), Cottage Grove chamber flyer (image only), Speedway Nov 26 night (tonight), Lowell and Dexter (Facebook only), Waldport parade (Facebook, conflicting dates), Reedsport Light Parade (host is a sign-in page), Florence Dance Academy recital (no time or price), Jawsome Santa photos (listing only), Gingerbread Homes Contest display (no hours), Heceta Lighthouse brunch ($80, ages 10+), Mahaffy Ranch festival (no year), North Bend ice rink (2025 dates), letters to Santa, Dec 19 Breakfast with Santa, Reedsport Moonlight Madness and Elf hunt.
Not built (belong to other runs): Harrisburg parade (albany-or) and Monroe parade (monroe-or, folded to Corvallis), both Salem run.

## Method fixes
Add "Oregon" or "Lane County" to every search (Springfield MO, Florence Italy and SC, Cottage Grove WI and Lowell IN or MI all surfaced). Read regional tourism calendars first (Travel Lane County print view, Oregon's Adventure Coast); the RiverCal Tribe API covers Siuslaw-area events in one call. A church or small-business site that scrapes empty needs a search with includeDomains. Rerun split_cards.py after every facts change.
