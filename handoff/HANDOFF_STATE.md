# Handoff state: Rally Takes the Train city pages

State as of 2026-11-26 about 22:00 UTC (2:00 PM Pacific). Process, standards, code and tools are in `SKILL.md` (same folder). This file is the current state, setup, and the open work. Where a fact could not be verified it is marked UNVERIFIED. No secrets are in this file or should ever be added.

## 0. Start here (read this first, 5 minutes)

1. Rally has told us to PAUSE. Everything built is live (Nov 26, 21:37Z). Do not start a new city until Rally says "go". Tell Rally when you are ready.
2. Read section 1 (standing rules), then `SKILL.md` end to end.
3. Do the setup in section 2 and the first-hour checklist in section 3.
4. Ask Rally which registry commands in section 6 they have run. Never re-run a script that completed (re-running adds duplicates).
5. Pending decisions for Rally are in section 7. Open items are in section 8.
6. After any metro or fix, update this file (Rally's refresh rule).

## 1. What Rally wants (standing rules)

Goal: every US metro gets a core city page plus suburb pages on rallytakesthetrain.com (Squarespace): linked, SEO optimized, every event page unique, every event a parent could find for each town. Each event has its own page `/christmas-events/<slug>` and a card on its town page `/christmas-events/<town>-<st>`. Full standards are in `SKILL.md` section 3. The short list:

- PAUSE: no new cities until Rally says go. In-flight builds all finished (Charleston, Salinas, Macon). Rally wants to be told when everything is live (it is, as of 21:37Z).
- When running again: up to 3 cities at once, builders on Sonnet 5.5, at most 3 Sonnet helpers per builder thread. Rally's usage is limited.
- Price rule: no printed price means cost `Price not listed` (2026 events only); never "Paid", never a guessed number. Public parades are `Free`. A host's own social post saying "free" counts. Library programs are free only if the library says so.
- Fold towns with fewer than 3 verified events into the nearest larger town page and record why in `folded.json`. Own page: towns of 20,000+ and smaller destination towns with 3+ verified events.
- Suburb move rule: when a suburb gets its own page, its events move off the core and neighbor pages to the town page. Never on two pages.
- Hold, do not build: Facebook-only or social-only events, image-only, canceled, ended, wrong-year (2025 pages), unverifiable or conflicting dates, adult-only, plain shopping markets, mail-in Santa letters.
- No unsourced filler sentences. Thin research passes must be flagged in the handoff. Every fact from a host page (or a city, park, library or tourism calendar, named on the page).
- Local time zone offsets in every JSON-LD event time (Eastern -05:00, Central -06:00, Mountain -07:00, Pacific -08:00, Arizona -07:00, Hawaii -10:00, Alaska -09:00). Never default to Pacific.
- Full Chicago-style intro on every town page, and each page must match the main city page style.
- No em or en dashes, no exclamation marks. Never hand-edit counts (dispatch `quick-counts`). Never request indexing. Never print secrets.
- Rally runs registry commands in Terminal on their Mac and pastes the output back. Claude cannot read the Mac Downloads folder. Pin every command to a full 40-character commit hash and verify the raw URL returns 200 first (a 404 can make the trailing bash re-run the previous script).
- Rally replies in plain terms and expects short messages: lead with the result or the ask.

## 2. Setup and prerequisites (for an agent on any account)

Access needed:
- GitHub: read and write to `stridematt/sitemaps` (quick-counts workflow and `tools/truth/live.json`), `stridematt/rally-events`, `stridematt/rtt-cev-publish` (registry scripts and publish bundles). Connect GitHub at https://claude.ai/connect-github and install the Claude GitHub App on the repos. Work only on your own branch `claude/project-thread-<id>`; push nowhere else. `gh repo clone` fails (GraphQL blocked) but plain `git clone https://github.com/stridematt/<repo>.git` and `gh api repos/...` work.
- Connectors: Firecrawl (all research and live-page checks; the cloud shell cannot fetch rallytakesthetrain.com), Supermetrics (Search Console `sc-domain:rallytakesthetrain.com`, Google Analytics), Cloudflare Developer Platform (not needed for counts). If a connector is missing, call it out; do not substitute.
- Squarespace admin: `https://rally-takes-the-train-site.squarespace.com/config/pages`. Only the publisher thread uses it, in the Claude desktop app's built-in browser, where Rally is signed in. Restarting the app signs it out; Rally must sign in again. A new account has no sign-in unless Rally does it on their machine.
- Rally's Mac registry folder: `~/Downloads/sa/registry` (`registry.py` plus a `.env` holding a token). Only Rally runs registry commands there. Never print, read aloud or commit `.env`, the token or `RTT_SECRETS_PRIVATE.txt`.
- Device folders approved for Claude: `/Users/matt/Documents` (default), `/Users/matt/Downloads/sa`, `/Users/matt/Downloads`; macOS still blocks reads in Downloads, so use Terminal output pasted by Rally.

Where files live (important for a new account):
- `/mnt/project-files/` is the Claude Projects shared folder. It may NOT be reachable from another account. The key files are therefore mirrored into `stridematt/rtt-cev-publish` under `handoff/` (see below). The mirror was made Nov 26 about 22:10Z; the project folder stays the working copy, so mirror again after big changes.
- Mirror contents in the repo (branch `claude/project-thread-rhybi7`, folder `handoff/`): `SKILL.md`, `HANDOFF_STATE.md`, `README.md`, `ALL_EXAMPLE_CODE.md`, `rtt-city-kit.tar.gz` (the build kit), `queue/rally_city_queue.txt`, `tools/` (`make_intro.py`, `conv_price_not_listed.py`; the brave URL list is left out), and `runs/<metro>/` with each run's `HANDOFF.md`, `BRIEF.md` and moves JSON. Per-town bundles and `page.json` files are NOT in the mirror: they live in the repo under `<abbr>/` folders on each run's own branch, reachable by the pinned commit hash in section 5.
- Repo `main` only holds old Nov 22 work. Everything from the metro runs sits on per-session branches (list them with the GitHub API); pin full SHAs, never branch names.
- Project memory (team folder `team/silo/`, index `MEMORY.md`) holds per-metro notes. A new agent without that memory should treat `SKILL.md` and this file as authoritative.
- Metro run folders `/mnt/project-files/<metro>-run/` hold the per-town `facts.json`, `tweaks.json`, `bundle.json.gz`, `intro.json`, `page.json`, `existing_cards.txt`, `folded.json`, plus `HANDOFF.md`, `BRIEF.md`, moves and registry files.

## 3. First-hour checklist

1. Read this file and `SKILL.md`. Skim `README.md` and `ALL_EXAMPLE_CODE.md`, and one finished handoff (`tampa-run/HANDOFF.md`, `charleston-run/HANDOFF.md`).
2. Confirm access: `gh api repos/stridematt/rtt-cev-publish --jq .name`, same for sitemaps and rally-events; run one Firecrawl scrape of `https://www.rallytakesthetrain.com/christmas-events/charleston-sc` with `maxAge: 0`.
3. Tell Rally you have taken over and ask: (a) which registry commands in section 6 are run, (b) the answers to section 7, (c) whether to stay paused.
4. Check whether the publisher thread ("Complete Boston and suburb event pages", id `cmsg_01K6Yzb3gJ3uTvEio7pmAHbTHmKKkRTL5dMt4jUncYHqsH`) is alive. Do not touch its Squarespace tab. If it is gone, Rally must open a new publisher in the signed-in built-in browser; do not publish from a second tab.
5. Do not start research. When Rally says go, take the next city from section 10, assign the next free cand range (section 9), and use the builder brief in `SKILL.md` section 4.

## 4. Roles and tab safety

- Coordinator: the project chat session. Takes Rally's requests, assigns cand ranges, starts builder threads, queues finished metros with the publisher, posts Rally registry commands, keeps this file and memory current. Never publishes.
- Metro builder: one thread per metro (Sonnet 5.5, max 3 helpers). Research, build bundles, intros, moves, registry script, `HANDOFF.md`. Never touches Squarespace, the registry, or the publisher's tab.
- Publisher: one thread, owns the one Squarespace tab (nickname "seed"). Publishes in queue order. No other thread may navigate that tab, and every `navigate` call must pass an explicit tab id (a navigate without it wipes the in-page state and helpers: `useState`, `runTownX`, `runG`, `__fixG`, `__mc2`, `__mc3`, `__plan`, `__verify`, `__eve`, `__fixCost`, `window.__libMA`). The base publish library is `pipeline/rtt_us_lib_v5.js` in the kit; a patched copy lives in the tab's IndexedDB (`rtt_us2`, key `libMA`). If that is lost, re-apply the patches in `SKILL.md` section 11.
- Rally: runs registry commands, decides open questions.

## 5. Metro status (all LIVE unless noted; published by the Boston publisher thread)

"Cand" is the 1000-wide candidate-id block (each run's `HANDOFF.md` is the source; section 9 lists conflicts). "Registry" is the pinned commit (full hash from each run's HANDOFF or the GitHub branch list; short hashes are marked). "Run" is Rally's registry run as far as known; see section 6 for what is outstanding.

| Metro (run folder) | Cand | Registry commit | Caveats |
|---|---|---|---|
| Boston | 71000-76004 extras (overlaps) | scripts 362d184 (short) | Milford (76002), North Andover (76004) parades held (Facebook-only); Stoughton parade held |
| Dallas, Austin (incl. San Marcos, Kyle), Houston, San Diego, San Francisco, San Antonio, Miami, Portland OR, Seattle | 97000, 98000, 99000, 93000, 94000, 91000, 92000, 95000, 96000 | Seattle 6ccffca44c09239dec9c2a530f1fe79029de54d9; others in run HANDOFFs or memory | Miami had -08:00 offsets, fixed on pages the publisher touched; Seattle duplicates pending (section 7); Austin Cedar Park tree lighting rename (Heritage Oak) left for Rally |
| Chicago (city run plus held events) | 60001-60095 | in run HANDOFF | compact layout question open; 17 retitled event pages, recheck CTR about Dec 9 |
| Tampa | 69000-69808 | b76dd3986263b2243a77fc85f435cb1e144fe190 | Spring Hill FL page lists two Tennessee churches (section 7) |
| Wichita | 68000 | de3b8ad6ddebaa59688303ed0c66d53700aa8d39 | |
| Cleveland | 67000 | f1270f54324b8d0aa48d93ae3409ede4006da046 | intro counts need recheck |
| New Orleans | 66000 | 3fd2044c76082f4feb42a0a98466830932eb2b2d | |
| Honolulu | 65000 | bf5ee3f307b05a305a8cec07c95f91122217e770 | Hawaii -10:00; Nutcracker fix v2 15a1e6f (short) result unknown |
| Anaheim | 64000 | in run HANDOFF (none printed) | some facts from search snippets, flagged in its handoff |
| Orlando | 63000 | 762330acdf58d5bbb086e3620ed4ce4892e0c4d2 | |
| Corpus Christi | 62000 | 0f2e74827202d73b9851fb2975aecc39994d2123 and 240d6edfb787eb00646745c070f5e765ac1277d7 | uses moves_B.json |
| Greensboro | 61000 | d08a531b176a217720470fe7ed0edca6250ee466 | |
| Pittsburgh | 60000 | 22eb446b6a95e1c1393495bdebd2dcf780567594 | fix output not yet seen |
| Anchorage | 59000 | 588c2f9e8b423acddde6f107ef7ef3e44617dc02 | Alaska -09:00 |
| Madison | 58000 | b547b63503d1c0d6f619354aea951a86ff431d03 | |
| Philadelphia | 57000 | 89f033c5a28d3f94d8e2a8f4fe613984a0e21156 | |
| New York City | 56000 | 8c7702ba98e0e5f0a2b747de00b906c2b1181316 (two parts) | Snug Harbor lantern page pending (section 7) |
| Longmont | 55000 | 650def16ad2096148b6ff2e5f473f700c74af2d7 | |
| Salem OR | 54000 | 396c15c5ffae30fd58b90474cbb0ac99ae706e63 | fix output not yet seen |
| Santa Rosa | 53000 | 4f17a577d3f641b4d110c8f7188318a22a47f974 | Reindeer Ridge unverified |
| Eugene | 52000 | d1c9f07bce6638027f5ba852151d96dc59859cd3 | Reedsport area could be its own page |
| Fort Collins | 52000 | bbd871ffb932dbfb7b8b629f7a8f9200b5b69d86 | ended page approved as 301 |
| Shreveport | 53000 | 7b8788dbb293c99cc4621d1590cb2d083602f784 | registry run awaited; thinner Ruston, Natchitoches, Marshall passes; use shreveport_moves_final.json |
| Springfield MO | 49000 | c33918e494012f2dce69301277684e08c225374c (Carthage fixed copy 7897771241671b188b209fb90d8fc6d23ff5bf74) | |
| Lancaster (and Palmdale) | 50000 | 4760a13447e106a8cf2b540ee6205487d669349b | |
| Rancho Cucamonga (Corona, Pomona, Menifee, Rialto) | 51000 | ff118c8343d6794a77b8a126884494342e49e9d9; fix1 0383d7d8dcfcd3a840db92aaa1541489465c06cc | Dream Glow, 123 Farm, Crestline strays; Temecula and Murrieta not done |
| Killeen and Central Texas | 48000 | 273d6f1d168d3a4e59f8260dd5a71391e1d9134f (supersedes 14e598e) | Waco left for its own run |
| Alexandria and DC area | 47000 | 635594db930cf3b9b4ffd5f579eec969e935b890 | Carthage fixed copy at 7897771 held for it |
| Charleston and North Charleston SC | 46000-46923 | 70181a9bc537bcfcc668e9b2bacbab867026d73c; fix1 846ca4927decfec34c3936c164aece4457095a6c | Kiawah events ended Nov 28 (confirm the page was skipped or live); Johns Island parade (Dec 12) not built |
| Salinas and Monterey County | 45000 | ba87835e5ef604326166293009acb5eac4a7e144 | Salinas page had 16 Monterey Peninsula cards that all move or drop |
| Macon GA | 44000 | 7927cd3f730cd53a5d94615fc088c85b6d2664ec | Perry Small Business Saturday card must be Free (4 of 4 free); several Macon facts from tourism calendars |
| Omaha, Colorado Springs, Raleigh, Kansas City, Sacramento, Tucson, Fresno, Albuquerque, Baltimore, Memphis, Louisville, Detroit, Denver, Charlotte, Jacksonville, Nashville, Indianapolis, Phoenix, Las Vegas | 72000, 73000, 74000, 75000, 76000, 77000, 78000, 79000, 80000, 81000, 82000, 83000, 84000, 85000, 86000, 87000, 88000, 89000, 90000 | omaha 4abc13a6338a85be38de2ba504b20ec985b7587c, raleigh b4bb0e9b4185dd65e19eaf9431868cba1ad92e54, fresno f6acb53889e4d58e04d5c18b319a8188bad75cee, baltimore d4f794c2331708ada1c2dfdd7b6fbe664891bd93, charlotte d9f81975248f1a19ca671f263a336914b0742040, nashville 5c366d0c15f09996b361f92703edda81816226d8, indianapolis b50e951637f69f2ac27a2c7d3ba6d4e3395bea41, denver 031c24dbdde21a34413a3538a58e8287514d6bbb and d8ec60335badba7a6eab80c1be29346be6f7a494; others in run HANDOFFs (some short hashes: Memphis 619fb18, Kansas City 7550ec2, Sacramento 4fc00ad, Albuquerque 26b8546) | Detroit thin pages (Northville etc.) unchecked; Memphis Bartlett Nutcracker Dec 19 not added (card says Dec 18; needs host check); Indianapolis $13.64 and $13.91 on Avon, Brownsburg, Fishers cards were reconstructed from the lost-dollar rule; Libertyville Hangout and Algonquin Rotary (Chicago) stay held |
| Virginia Beach | 71000 | a4c9a6f8917bfdacd1ba08a5d9e20e33cf2eb583 (7 parts) | LIVE STATUS UNVERIFIED: the publisher was waiting on Rally's go, which depends on the 7 registry summaries; confirm with a live scrape |
| Minneapolis | 70000 | 41d9d29a74facce55507b4d867d832cd15a43e17 | Forest Lake and Osceola trains need a recheck |

Resolve short hashes (Boston 362d184, Albuquerque 26b8546, Honolulu 15a1e6f, Memphis, Kansas City, Sacramento) to 40 characters with `gh api repos/stridematt/rtt-cev-publish/commits/<short> --jq .sha` before giving Rally a command. Bundles and `page.json` sit in the repo under the metro's folder at the pinned commit (for example `charleston/charleston-sc-bundle.json.gz`).

Publisher sweep of earlier pages (in progress, UNVERIFIED whether finished): intro recount (older-card class bug), orphan town headings, dead planner rows, stale FAQs, the Paid pill on Price not listed pages, stale prose.

## 6. Registry commands possibly awaiting Rally's run

Rally said all earlier commands were run. Awaiting Rally's run and pasted output (confirm each):

| Item | Full commit | Script path |
|---|---|---|
| Charleston fix1 (re-adds 2 refused events with alias) | 846ca4927decfec34c3936c164aece4457095a6c | `charleston/reg_charleston_fix1.sh` |
| Salinas (26 adds) | ba87835e5ef604326166293009acb5eac4a7e144 | `salinas/reg_salinas.sh` |
| Macon (39 adds) | 7927cd3f730cd53a5d94615fc088c85b6d2664ec | `macon/reg_macon.sh` |
| Shreveport (42 adds) | 7b8788dbb293c99cc4621d1590cb2d083602f784 | `shreveport/reg_shreveport.sh` |
| Rancho Cucamonga fix1 (2 refused events) | 0383d7d8dcfcd3a840db92aaa1541489465c06cc | `rancho-cucamonga/fix1.sh` |

All five script paths were confirmed to exist at their commit (Nov 26). Killeen (273d6f1d), Alexandria/DC (635594db) and everything earlier: believed run, UNVERIFIED (not in the awaiting list). The fix1 scripts exist because the main Charleston (70181a9) and Rancho (ff118c8) scripts had refused adds, so those main scripts were run.

Command template (replace `<PATH>` and `<SHA>`; guarded so a failed download cannot re-run an old script):
```
cd ~/Downloads/sa/registry && rm -f /tmp/rtt_reg.sh && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/<SHA>/<PATH> -o /tmp/rtt_reg.sh && set -a && . ./.env >/dev/null 2>&1; set +a; [ -s /tmp/rtt_reg.sh ] && bash /tmp/rtt_reg.sh
```
Verify first: `curl -s -o /dev/null -w '%{http_code}' https://raw.githubusercontent.com/stridematt/rtt-cev-publish/<SHA>/<PATH>` prints 200 (run from the cloud shell). Ask Rally to paste back the "added N, refused M" lines. Refusal handling with guarded fix scripts is in `SKILL.md` section 9.

## 7. Pending Rally decisions (do nothing until Rally answers)

1. OK to unpublish the two Tennessee-address `/churches/` pages that sit under Florida slugs (Spring Hill FL; the `/christmas-eve-services/spring-hill-fl` page lists two Spring Hill, Tennessee churches).
2. OK to delete the old Snug Harbor lantern page (301 to the Staten Island card).
3. OK to delete the Seattle duplicates `snowflake-lane-bellevue-wa` and `redmond-lights-wa` (301s are approved and saved in Squarespace URL Mappings but inactive until the old pages are deleted).
4. Chicago layout: new Chicago city pages use the compact layout (no Meet Rally box, no filter bar). Rally was asked whether to rebuild larger suburbs in the full layout; Rally's standing rule (Nov 25) is that every city page must match the main city page style.
5. Already approved (no action needed from Rally): Fort Collins ended page as 301.

## 8. Open items

- Virginia Beach: Rally to paste the other registry summaries (7 parts) and the optional Franklin alias result; the publisher was waiting on that.
- Honolulu Nutcracker fix v2 (commit 15a1e6f, short): sent to Rally, result not seen.
- Minneapolis: recheck Forest Lake and Osceola trains.
- Cleveland: recheck intro counts against the live page.
- Anaheim: some facts came from search snippets; flagged in its handoff, not yet rechecked.
- Pittsburgh and Salem fix outputs not seen.
- Charleston: confirm Kiawah and Edisto early events (Nov 27 to 29) were published or the pages skipped.
- Other old Florida pages may still carry -08:00 in schema (Miami run).
- Planner dead rows: sweep earlier core pages (publisher agreed).
- Detroit thin pages unchecked; Memphis Bartlett Nutcracker host check; Austin Cedar Park rename.
- SEO: recheck CTR of the 17 retitled Chicago event pages about two weeks after Nov 25 (Search Console via Supermetrics, `sc-domain:rallytakesthetrain.com`).
- Stray events spotted but not built: Johns Island parade (Charleston), Dream Glow Festival, 123 Farm and Crestline (Inland Empire), CPKC Holiday Train at Zwolle (Dec 4) and Monroe (Dec 2) LA, Lane Southern Orchards and Fort Valley Grinch breakfast (Macon area), Lightin' the Lake Country (Greensboro GA, Nov 29).

## 9. Cand ranges (unified)

Each range is `<start>` to `<start>999`; cands only need to be unique inside a bundle, so overlaps are harmless but check registry rows for slug clashes. Next free: 43000 and down.

Used (from each run's HANDOFF): Macon 44000, Salinas 45000, Charleston 46000, Alexandria/DC 47000, Killeen 48000, Springfield MO 49000, Lancaster 50000, Rancho Cucamonga 51000, Fort Collins 52000, Eugene 52000, Shreveport 53000, Santa Rosa 53000, Salem 54000, Longmont 55000, New York City 56000, Philadelphia 57000, Madison 58000, Anchorage 59000, Pittsburgh 60000, Greensboro 61000, Corpus Christi 62000, Orlando 63000, Anaheim 64000, Honolulu 65000, New Orleans 66000, Cleveland 67000, Wichita 68000, Tampa 69000 (to 69808), Minneapolis 70000, Virginia Beach 71000, Omaha 72000, Colorado Springs 73000, Raleigh 74000, Kansas City 75000, Sacramento 76000, Tucson 77000, Fresno 78000, Albuquerque 79000, Baltimore 80000, Memphis 81000, Louisville 82000, Detroit 83000, Denver 84000, Charlotte 85000, Jacksonville 86000, Nashville 87000, Indianapolis 88000, Phoenix 89000, Las Vegas 90000, San Antonio 91000, Miami 92000, San Diego 93000, San Francisco 94000, Portland OR 95000, Seattle 96000, Dallas 97000, Austin 98000, Houston 99000.

Known conflicts, resolved by reading the run HANDOFFs: Fort Collins and Eugene both used 52000-52999; Shreveport and Santa Rosa both used 53000-53999. Project memory lists Fort Collins 52000 and Shreveport 53000 and omits Eugene and Santa Rosa. Chicago used 60001-60095 and Boston extras used 71000-76004, overlapping later ranges. Ranges for Baltimore, Houston, Indianapolis, Nashville, New Orleans, Raleigh, Seattle come from the older range list (their HANDOFFs print no range): UNVERIFIED. Small blocks inside a metro are listed in its `BRIEF.md`.

## 10. The long list (`queue/rally_city_queue.txt`, about 190 cities)

Rally: "one more at a time until you run out of usage." Order is the file's order. Skip suburbs of built metros (tell Rally "covered") after a live-page scrape confirms.

Done (built and live, via a metro run): Salem OR, Santa Rosa, Eugene, Rancho Cucamonga, Shreveport, Fort Collins, Lancaster, Palmdale, Springfield MO, Killeen, Alexandria VA, Charleston, North Charleston, Salinas, Macon, Corona, Pomona, Menifee (folded into Moreno Valley), Rialto, Longmont, Pittsburgh, Anchorage, Madison, Philadelphia, New York City, Greensboro.

Skipped as covered by a built metro: Aurora, Naperville, Joliet, Elgin (Chicago); Garden Grove, Fullerton, Orange, Costa Mesa (Anaheim run); Olathe, Lee's Summit, Independence, Kansas City KS (Kansas City); Lakeland, Clearwater, Largo (Tampa); Pembroke Pines, Hollywood FL (Miami); Lakewood CO (Denver); Sunnyvale (San Francisco); Bellevue (Seattle); Mesquite (Dallas); Pasadena TX (Houston); Surprise (Phoenix); Murfreesboro (Nashville); Oceanside (San Diego); Denton (Dallas); Roseville (Sacramento); Paterson (New York City); Rio Rancho (Albuquerque). The coordinator's list names these as covered; the metro in parentheses is inferred from geography (UNVERIFIED), and Rio Rancho comes from the Albuquerque run folder. Scrape the live page to confirm before telling Rally.

Next unbuilt non-covered cities (in file order): Hayward CA, Springfield MA, Bridgeport CT, McAllen TX, Savannah GA, Gainesville FL, Palm Bay FL, Waco TX, Midland TX, Rockford IL, Columbia SC, Visalia CA, Escondido CA (check San Diego), Syracuse NY, Lakewood NJ, Meridian ID, Elizabeth NJ, Victorville CA, Round Rock TX (check Austin), Jackson MS, Stamford CT, then down the file. Also still to do: Temecula and Murrieta (the "Temecula run"), Beaufort/Bluffton/Hilton Head/Myrtle Beach (not in the Charleston run).

When resuming: take cities one at a time (max 3 at once), assign the next free cand range from section 9, set the time zone offset, list existing pages from `tools/live.json` (kit) or `tools/truth/live.json` (sitemaps), and use the brief in `SKILL.md` section 4.

## 11. Refresh rule

After each metro finishes or a fix lands, update sections 0, 5, 6, 7, 8, 9, 10. Keep this file under about 25 KB; move finished-run detail to that run's `HANDOFF.md`.
