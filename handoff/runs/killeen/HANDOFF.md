# Killeen and Central Texas run handoff (2026-11-26)

Built by three Sonnet helpers (A Killeen/Harker Heights/Copperas Cove, B Temple/Belton/Salado, C Lampasas/Gatesville/Cameron); lead checked JSON validity, -06:00 on every timed JSON-LD, no dashes or exclamation marks, uniqueness 60%+, intro_html/seo_title/seo_description in each page.json. Cand range 48000-48999 (used 48000-48002, 48120, 48180, 48330-48335, 48550-48555, 48660-48663, 48731-48732, 48790-48793, 48800; 48730 held). 28 new events. Central time -06:00. Waco left for its own run.

Registry: rtt-cev-publish branch claude/project-thread-0xibyh, killeen/reg_killeen.sh, commit 273d6f1d168d3a4e59f8260dd5a71391e1d9134f (28 adds, no set -e, || true, --confirm-new, prints "added N, refused M"; verified identical to the raw file at that commit). Rows: registry_rows.json.

Registry command (Rally, Terminal, run once):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/273d6f1d168d3a4e59f8260dd5a71391e1d9134f/killeen/reg_killeen.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

## Towns (folder: bundle.json.gz, page.json with intro_html; counts are events, free)
EXISTING pages with new events (use intro_html from page.json, replace the live intro):
- killeen-tx 8, 4 free (+3 new: Nutcracker and Sugar Plum Tea, Santa Switch, Home Depot train workshop; 5 live cards stay; Harker Heights, Temple, Belton and duplicate cards move off or drop)
- temple-tx 13, 6 free (+6 new; +2 moved from Killeen: jingle-jam-temple-tx, rink-on-the-rails-downtown-temple-tx; +1 moved from Killeen: christmas-on-the-chisholm-trail-belton-tx (Belton folded in, no printed price); +1 card from the holland-tx bundle)
- harker-heights-tx 5, 2 free (+1 new; +2 moved from Killeen: frost-fest-harker-heights-tx, cookies-and-cocoa-with-city-council-and-christmas-tree-harker-heights-tx)
- copperas-cove-tx 6, 5 free (+1 new; +2 Gatesville cards from the gatesville-tx bundle, see below)
NEW pages (full page.json):
- salado-tx 7, 1 free (6 new + salado-glassworks-ornament-event-tx moves from austin-tx; destination town)
- lampasas-tx 4, 1 free
- cameron-tx 4, 2 free (includes Rockdale and Thorndale events; both folded in)
No page, bundle only: holland-tx/bundle.json.gz (1 event, card for temple-tx) and gatesville-tx/bundle.json.gz (2 events, cards for copperas-cove-tx; Gatesville has 2 verified events so no own page). Load each with its target page's bundle (addCards).
Folded, no page: Belton (1 event, card moves from Killeen to Temple), Gatesville (into Copperas Cove), Holland, Troy and Little River-Academy (into Temple), Morgan's Point Resort (into Temple with Belton), Nolanville and Kempner (into Killeen). See each folded.json.

## Publisher actions
1. Moves: killeen_moves.json (9 entries): 2 to harker-heights-tx, 3 to temple-tx (including Chisholm Trail), drops of duplicates krist-kindl-markt-copperas-cove-tx, santa-at-the-depot-temple-tx, christmas-at-the-plaza-downtown-temple-tx, 80th-annual-christmas-parade-temple-tx. The drops are duplicates of cards already live on temple-tx and copperas-cove-tx. Also move salado-glassworks-ornament-event-tx from austin-tx to salado-tx (salado-tx/moves.txt).
2. Links: killeen-tx links harker-heights, temple, copperas-cove, salado, lampasas, cameron; each new page links back to killeen-tx (page.json nearby starts killeen-tx).
3. Christmas Eve services pages exist for killeen, temple, harker-heights (link them); none for copperas-cove, salado, lampasas, gatesville, cameron.
4. The live Chisholm Trail card (moving to temple-tx) shows a Paid pill and "See the host page for prices"; no host prints a price: change it to Price not listed with no Paid pill.
5. Intros: replace live intros with each page.json intro_html (recount against the live page at publish time). Page date = publish day, times -06:00. Drop events already ended on publish day.
6. Registry, then quick-counts for every changed path, including austin-tx (Salado move). Do not request indexing.

## Flags (facts not from a host page, or weak)
- Cameron parade date: chamber says Dec 3, welcometocameron.com says Dec 4 (used Dec 3). Rockdale facts from host Facebook posts and KMIL (chamber page is image only); Charlie Brown end times not printed.
- Salado Trail of Lights end date: tablerock.org says Dec 31, Visit Salado says Jan 31 (used Dec 31). A Christmas Carol price is the host's $20/$10; the ticket seller shows different fees.
- Home Depot workshop address from a third-party listing; homedepot.com says free, ages 5 to 12, 9 am to noon.
- Copperas Cove Christmas in the Park source is the city's listing on Yodel (city calendar rendered empty).
- Lampasas Tour of Homes ($15) is borderline for kids.
- Harker Heights library phone numbers differ between calendar page and flyer.
- Intro counts rest on the Nov 10 to 16 live snapshots; Waco not touched.

## Held (reasons)
Gatesville Christmas at the Ballpark (Dec 1 to 31, free): only Facebook and the Gatesville Brief news site, no host or city page; build it if a city page confirms it. Killeen Mall Santa, Toyota of Killeen Santa, Little Cloud Playhouse (Facebook only or 2025), Jingle of Joy (Instagram only), Fort Hood Exchange workshop (base access); Harker Heights Santa Shuffle (fun run), Trashy Art Club (13+); Copperas Cove Christmas on the Hill (church social only), Santa's Magical Mailbox (Facebook); Nolanville parade, Kempner Christmas at the Park (flyer only); Temple Kringle Krawl, Polar Express Pajama Party and Gingerbread Showdown (adults), Merry & Bright tour (no dates), A Very Special Christmas (no venue); Belton Holiday Fest (no 2026 date), MK&T Depot market, Holly Jolly Jingle (adult); Salado tree lighting (conflicting dates), Home Tour (adult), Live Nativity, Yuletide Market; Lampasas Mrs. Claus and Santa (Facebook or Instagram), Troy tree lighting (past). Strays for other runs: Jarrell Christmas Festival and Florence Christmas on Main (Austin run).
