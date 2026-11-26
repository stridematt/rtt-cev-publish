# Charleston SC run handoff (2026-11-26)

REGISTRY COMMAND (Rally, Terminal, run once; commit 70181a9bc537bcfcc668e9b2bacbab867026d73c, branch claude/project-thread-ba0jsq in stridematt/rtt-cev-publish; raw file verified identical to reg_charleston.sh; 56 adds):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/70181a9bc537bcfcc668e9b2bacbab867026d73c/charleston/reg_charleston.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Three Sonnet helpers. Cand range 46000-46999 (used 46000-46923). Eastern, -05:00 verified on every timed JSON-LD. Lead checks passed: all JSON valid, 56 event pages, no duplicate slugs or cands, no dashes or "!" outside scripts, no empty prices, no -08:00, intro_html, seo_title and seo_description present in every page.json (I generated them for Folly Beach, Isle of Palms, Kiawah and Mount Pleasant from intro.json, and shortened the Mount Pleasant title). Bundles, page.json files, moves and registry_rows.json are in rtt-cev-publish under charleston/ (<town>-bundle.json.gz, <town>-page.json). Folders: /mnt/project-files/charleston-run/<town>/.

## Towns (counts from helper intros; recount against live pages at publish time)
NEW pages (6): hanahan-sc 4 (1 free), moncks-corner-sc 6 (1 free), isle-of-palms-sc 5 (2 free), folly-beach-sc 4 (1 free), kiawah-island-sc 4 (4 free), edisto-beach-sc 3 (2 free).
EXISTING with new events: charleston-sc 25 (8 free; 17 new), north-charleston-sc 6 (3 free; 3 new), summerville-sc 11 (4 free; 5 new plus 4 moved in), mount-pleasant-sc 9 (4 free; 4 new, 2 moved in, 1 folded from Sullivan's Island).
EXISTING, nothing new: goose-creek-sc 4 (Christmas in the Creek, tree lighting, Santa pictures, sensory tree lighting already live).
FOLDED: Sullivan's Island into mount-pleasant-sc (Holy Cross Christmas Eve pageant, cand 46780, bundle in sullivans-island-sc/ carries it for mount-pleasant-sc), Wadmalaw into charleston-sc (Charleston Tea Garden, cand 46015), Ladson and Ridgeville into summerville-sc (nothing built), Ravenel and Awendaw and McClellanville (nothing built).

## Publisher actions
1. Moves: charleston_moves.json. Charleston to Summerville (old-time-christmas-tree-celebration, summerville-christmas-parade, pjs-with-santa, breakfast-with-santa), Charleston to Mount Pleasant (karaoke-and-coloring, ornament-craft), and drop from charleston-sc the three North Charleston duplicates (tree lighting, cookies and cocoa, parade and festival; they stay on north-charleston-sc). Verify each source card exists live first. Bundles do not include moved cards. Remove dead planner rows afterwards.
2. Link charleston-sc to every new page it hubs (hanahan, moncks-corner, isle-of-palms, folly-beach, kiawah-island, edisto-beach); each new page links back (page.json nearby).
3. Set intro_html, seo_title, seo_description from page.json on every changed page (mount-pleasant, north-charleston, summerville, charleston too).
4. Christmas Eve services pages: yes for charleston-sc and summerville-sc; no for the rest.
5. Registry first, then quick-counts for every changed path. Do not request indexing.
6. Drop events already ended on publish day. Page date = publish day, -05:00. TIME SENSITIVE: Kiawah Island's four events run only Nov 27 and 28, so unless published right away that page has nothing left; if every Kiawah event has ended at publish time, skip the page (and tell Rally). Edisto's tree lighting (Nov 29) and Creche Festival (Nov 27 to 28) are also early.

## Flags (not from a host page, or weak)
Charleston: The Charleston Santa (Best Friend Train Museum) from the Visit Charleston calendar and a news release, host site timed out; some paragraphs under 50 words (not padded); extra FAQ entries added to clear uniqueness; seo_title hand-set. Moncks Corner: tree lighting and parade from the Charleston Area CVB calendar (town links Facebook only); Cypress Gardens street address from helper knowledge; Santee Cooper lights end Dec 30 from events page, $10 per car (stale Facebook said $5). Hanahan: parade address only "Murray Dr"; tree lighting price not printed (built as Price not listed). Summerville: end time 8 pm from the description (Tockify header says 9:30). Folly Beach: Tides breakfast ticket link Eventbrite, Host link tidesfollybeach.com. Kiawah: Night Heron Park address not printed. Isle of Palms: Christmas Stories has no start time (CVB listing). Three event pages (Cirque Dreams, Nutcracker Magical Christmas Ballet, Holiday in the Park) were renamed shorter for uniqueness, so slugs lack the venue.

## Held
Charleston: Parade of Boats (domain hijacked), Skating with Santa Hampton Park (Instagram), Christmas at Drayton Hall (adult tour), Sensitive Santa Children's Museum (social only), Middleton Place storytime, Party at the Park, Artfest. North Charleston: Howlidays in the Park (dogs), Stingrays Teddy Bear Toss, library programs (teen and adult). Summerville: Nexton tree lighting, Strive High Christmas Under the Stars, Soso Cute Santa, Seacoast event, Letters to Santa (round-up or social only), markets. Ladson and Ridgeville: Ridgeville festival (Dec 12 vs Dec 13 conflict), McKewn festival (Facebook), Christmas Made in the South (market). Moncks Corner: Tinsel Trot, sleigh rides (no host page). Mount Pleasant: Lights Up and Tree Festival (ended), carriage rides (date conflict), Shem Creek boat parade (social), Christmas Camp St Andrews, One Christmas Carol, markets. Sullivan's Island station lighting. Isle of Palms: Wild Dunes NYE, holiday market (2024 page), pajama breakfast (2025 Facebook). Folly Beach: Menorah, Flip Flop Drop. Kiawah: Sanctuary tree lighting, KICA tree lighting, paid workshops; Seabrook Santa by the Sea (Facebook). Edisto: market and chorus concert. McClellanville and Awendaw events (Facebook only, parade undated).

## Stray and gaps
Johns Island Christmas parade (Dec 12, 5 pm) was spotted but not built (no helper took it; belongs to charleston-sc). Cordesville parade (Dec 6) is rural Berkeley County, not built. Nutcracker at Sottile Theatre Dec 4 (Mount Pleasant Performing Arts Center) is covered as Charleston's Nutcracker.

## Queue coverage
Covered by this run (tell Rally): Charleston, North Charleston, Mount Pleasant, Summerville, Goose Creek. Not in this run: Beaufort, Bluffton, Hilton Head, Myrtle Beach, Georgetown, Columbia.
