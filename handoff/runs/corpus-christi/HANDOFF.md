# Corpus Christi run handoff (2026-11-26)

Built by three Sonnet helpers (core, Rockport/north, inland/south); lead merged intros (corpus-christi-tx recounted with Beeville), generated intro_html, seo_title and seo_description into each page.json (mk_page_intro, Texas), registry script and rows. Cand range 62000-62999 (used 62000-62009, 62400-62410, 62500-62507, 62700-62702, 62710-62711). 34 new events. Central time: -06:00 on every timed JSON-LD (verified, no -08:00).

Registry script: rtt-cev-publish branch claude/project-thread-pqd053, corpus-christi/reg_corpus_christi.sh, commit 0f2e74827202d73b9851fb2975aecc39994d2123 (34 adds, no set -e, || true, --confirm-new, prints "added N, refused M" and refused slugs; size matches the local file, 9260 bytes). Rows: registry_rows.json.

Registry command (Rally, Terminal, run once):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/0f2e74827202d73b9851fb2975aecc39994d2123/corpus-christi/reg_corpus_christi.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

## Towns
NEW pages (page.json + bundle): portland-tx 11 events, 8 free (Ingleside 2, Aransas Pass 1, Sinton 1 folded in; Gregory, Taft nothing); rockport-tx 9 events, 9 free (8 own incl. Fulton and Port Aransas, plus the Santa Soiree boat parade moved from corpus-christi-tx); kingsville-tx 3 events, 3 free.
EXISTING: corpus-christi-tx 31 events, 15 free (20 live - 1 moved to Rockport = 19, + 10 new + 2 Beeville folded in; use intro_html and seo_title from corpus-christi-tx/page.json; intro.json has no hub line). Beeville (2 events: Silver Screen Christmas Lighted Parade, One Christmas Dos Tradiciones) is folded into corpus-christi-tx: its bundle targets corpus-christi-tx.
Folded, no page: Ingleside, Aransas Pass, Sinton, Gregory, Taft into portland-tx; Port Aransas, Fulton into rockport-tx; Beeville into corpus-christi-tx; Alice, Robstown, Mathis, Bishop, Refugio, Premont, George West, Orange Grove, Falfurrias: nothing verifiable (see folded.json files).

## Publisher actions
1. Moves: moves_B.json. Delete the Santa Soiree Lighted Boat Parade and Holiday Drone Show card (santa-soiree-lighted-boat-parade-and-holiday-drone-show-port-aransas-tx) from corpus-christi-tx and add it to rockport-tx (the Rockport bundle holds only the 8 new cards). Ignore moves_A.json (its target port-aransas-tx has no page).
2. Link corpus-christi-tx to portland-tx, rockport-tx, kingsville-tx; each new page back to corpus-christi-tx. page.json nearby starts ["corpus-christi-tx","Corpus Christi"], then victoria-tx.
3. Existing page: replace live intro with intro_html and set seo_title and seo_description from page.json. corpus-christi-tx links to its Christmas Eve page /christmas-eve-services/corpus-christi-tx (live, 9 churches). Eve pages for the new towns not checked.
4. Page date = publish day. Registry, then quick-counts for corpus-christi-tx, portland-tx, rockport-tx, kingsville-tx. Do not request indexing.
5. Run the live date audit; drop events ended on publish day. Santa Photos, Peppermint Lane and La Retama are ranges (started earlier, registry date set to Nov 26).

## Flags (facts not from a host page)
Corpus: Polar Express comes from the Visit Corpus Christi listing (no 2026 host page); Hoopla and Santa Clause drive-in come from the city events calendar; Peppermint Lane end date Dec 31 is "through December"; Dave and Buster's uses its Prekindle ticket page (no prices printed). Rockport: Fulton Mansion address corrected to the Texas Historical Commission's own "317 S. Fulton Beach Rd., Rockport, TX 78382" (bundle, facts and tweaks fixed); Christmas in the District cost now reads "Free to enter; shop stickers need a $5 minimum purchase" (bundle fixed), names no 2026 train date; Christmas on the Beach end date Dec 31 from "nightly in December"; Tropical Christmas address is the city calendar's map address; "Port Aransas is a drive and a ferry ride away" line is unsourced. Portland/Ingleside: Ingleside fire department address from a Parks and Rec Facebook event; Sinton parade has no street address. Kingsville: Children's Day extras from the Parks and Recreation Facebook event, Expo Center address from a local calendar. Beeville: mariachi show has only an Eventbrite link (no host), parade start time from a Bee-Picayune report (city page is 2025). Train links are empty on all new pages (no /museums/ pages exist for these towns).

## Held
Texas State Aquarium Scuba St. Nick (2022 page only), Candy Cane Lane (no dates), Mayor's Sparkling Lights Contest, camps, Flour Bluff Fire Dept Santa float and St. John's UMC breakfast (Facebook only), Redden Family Lights, Padre Island Seashore and CC Museum (no 2026 events), Kingsville depot La Posada weekend (no hours), Art Walk, Kleberg Bank Santa and King Ranch lights (Facebook/Instagram), Alice parade (Facebook only, conflicting Dec 4 vs 5), Wonderland in Alice, Robstown Christmas of Hope (no price or description), Rockport Christmas Belles, Portland market, Tour of Homes, 5K and concert, Ingleside Renaissance Faire, Taft tree lighting, Sinton Avenue of Trees and Dec 6 parade (Facebook only), Beeville Art Museum classes and Christmas Grove (2019 sources), Lake Corpus Christi Light Drive Thru (Facebook only).


## Update (Nov 26, 09:25Z)
- Rockport Fulton Mansion address fixed and Christmas in the District cost line reworded (see above).
- Portland Christmas Tree Forest switched to Free with the City of Portland page (portlandtx.com/659/Christmas-on-the-Coast) as source; Portland now 11 events, 8 free (bundle, intro_html and facts updated). Its registry add was refused as a false match; fix script corpus-christi/fix_portland_forest.sh at commit 240d6edfb787eb00646745c070f5e765ac1277d7 (registry URL for that row is the same city page).
- The 'More free events' side lists on other Portland pages do not yet include the Tree Forest (minor).
