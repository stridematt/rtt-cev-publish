# Springfield MO run handoff (2026-11-26)

Built by three Sonnet helpers (A Springfield core and Springfield-area towns, B Branson and the south Ozarks, C Joplin area). Lead checked: valid JSON, no duplicate cands or slugs in the bundles (folded towns keep facts.json copies of Springfield events but have no bundle), -06:00 on every timed JSON-LD, no dashes or exclamation marks in page text, uniq 60%+, no empty cost. Central time -06:00. Cand range 49000-49999 (used 49000-49013, 49300-49310, 49320-49321, 49340, 49600-49608, 49620-49626, 49640-49641). Next free range 48000 and down. 46 new events.

Registry script: reg_springfield-mo.sh, rtt-cev-publish branch claude/project-thread-qhcqhj, springfield-mo/reg_springfield-mo.sh, commit c33918e494012f2dce69301277684e08c225374c (verified identical to the raw file at that commit; 46 adds, no set -e, prints "added N, refused M").

Registry command (Rally, in Terminal, run once):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/c33918e494012f2dce69301277684e08c225374c/springfield-mo/reg_springfield-mo.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Publisher pulls bundles and page.json from commit 7897771241671b188b209fb90d8fc6d23ff5bf74 (newer than the registry commit; same branch; Carthage and Joplin bundles were rebuilt there; registry script unchanged): springfield-mo/<town>-mo-bundle.json.gz and <town>-mo-page.json (also in this folder under each town).

## Towns (events, free)
NEW pages: branson-mo 11 events, 2 free (Kimberling City, Forsyth, Hollister folded in; train_links branson-scenic-railway-missouri; Silver Dollar City, Polar Express, drive-thru lights); ozark-mo 3, 2 free (2 own + Dashing Through the Glow moves in; Sparta, Highlandville folded in); carthage-mo 7, 7 free.
EXISTING pages with new events (replace live intro with intro_html from page.json): springfield-mo 28, 10 free (14 new + 14 live; see below); joplin-mo 12, 5 free (9 new incl. Webb City and Monett events; Gift of Light Nov 14 already over, not counted); neosho-mo 4, 2 free (2 new, Racine and Diamond folded in); ridgedale-mo 2, 0 free (1 new, Big Cedar lights); nixa-mo 3, 2 free (no new events; Cassidy Station market moves in, intro rewritten).
Folded, no page: Bolivar, Willard, Republic, Marshfield, Mount Vernon, Rogersville, Lebanon (their events are cards on springfield-mo), Strafford, Ash Grove (card stays on springfield-mo), Clever, Webb City, Monett, Racine, Diamond (see each folded.json). Nothing verified: Pierce City, Seneca, Lamar, Aurora, Strafford.

## Publisher actions
1. Moves (springfield_moves_B.json; A and C have none): Cassidy Station market springfield-mo to nixa-mo; Dashing Through the Glow springfield-mo to ozark-mo; DROP ev-ozark-mayor-s-tree-lighting (Nov 20, ended). Also drop from springfield-mo the ended cards: Mayor's Tree Lighting Holiday Show (Nov 21), Springfield Christmas Parade (Nov 21), and the Ozark Christmas Parade if carded. Drop Joplin's Gift of Light (Nov 14) if it still shows as upcoming.
2. Links: springfield-mo links new pages branson-mo, ozark-mo, carthage-mo (and existing nixa-mo, joplin-mo, ridgedale-mo, neosho-mo where not yet linked); each new page links back to springfield-mo; joplin-mo links carthage-mo.
3. Christmas Eve pages: yes for springfield-mo, joplin-mo, neosho-mo, ridgedale-mo; no for branson, ozark, nixa, carthage, lebanon, republic, bolivar (others unchecked).
4. Page date today, times -06:00, quick-counts for every changed path (springfield, joplin, neosho, ridgedale, nixa, branson, ozark, carthage), do not request indexing.
5. Recount intros at publish. Springfield count assumes 3 cards leave and 3 ended cards drop; Nixa and Ridgedale counts rest on live cards not re-scraped.

## Flags
- RESOLVED (Nov 26 ~20:40Z): Carthage and Monett unsourced filler was trimmed and the Carthage and Joplin bundles rebuilt (uniq 60%+ kept). Publish from the newer commit given to the coordinator. Original note: helper C added general advice sentences to clear the 60% unique rule that the hosts do not state (for example Sparkle in the Park "keeps the display free because the utility sees it as a community gift", "Parents of toddlers often prefer the early part of the evening", Candy Cane Hunt "short, easy start", tree lighting "dress in layers"). The same applies to the Monett parade (folding chair and blanket line). Trim these to sourced facts (and add sourced detail so uniq stays 60%) or hold Carthage until that is done.
- Ozark Festival of Lights: dates from the Ozark Community Center Facebook post and the city park page quoted on the old Dashing card; the city's own page did not load, link goes to the city calendar entry (EID=3535). Verify.
- Branson Parks Breakfast with Santa and Paws and Santa: host page returned 502, details from search excerpts. Eiserman Park address from an excerpt.
- Polar Express (Branson Scenic Railway): December departure list did not load; built as a Nov 27 to Jan 2 range with a note.
- Promised Land Zoo host page last updated May 2025 (Jan 4 end confirmed by Explore Branson). Silver Dollar City price is the $79 deal day price; other dates link to tickets. Branson Landing address has no street number.
- Table Rock Lake chamber calendar is the source for Kimberling City parade and Brunch with Santa; Explore Christian County for Sparta; city Zeffy pages for Webb City; city calendar and Connect2Culture for Joplin Tree Trail (free, Dec 3). CPKC Holiday Train cost is Price not listed (only round-ups say free). Mount Vernon "Free to attend" from the chamber (no price printed). Carson's Aglow lists only the first three nights (Nov 27 to 29). Republic: only the 11:15 am Santa seating built. Springfield intro hub line links the Missouri guide (unverified).

## Held
Strafford (2025 page), Battlefield Mall Santa (no 2026 page), Library Holiday Store and Lebanon Storytime (2023 pages), Branson Candy Cane Hunt (Dec 11 vs Dec 15), Branson Christkindlmarkt (shopping market), Branson Landing/Ozark ended events, Kimberling Tour of Homes (adult), Monett Festival of Lights (no dated 2026 page), Gift of Light Nov 14 (ended), Joplin Die Hard Christmas (not for kids), Lake Country Parade Dec 12 Shell Knob (Barry County, belongs elsewhere), Billings parade (no date), Pierce City, Seneca, Lamar (Facebook only).
Not researched: Branson stage shows (Christmas Wonderland, Dolly's Stampede, Sight and Sound). A second Branson pass could add them.
