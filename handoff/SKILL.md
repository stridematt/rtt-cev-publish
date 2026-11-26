---
name: rtt-metro-city-pages
description: Run the metro-by-metro build of kids' Christmas event pages for rallytakesthetrain.com. Covers Rally's standards, the coordinator, builder and publisher roles, the paste-ready builder brief, research, the build pipeline, registry commands, publishing rules, known bugs and queue handling. Use when asked to "do <city>", continue the city queue, or take over this project.
---

# Rally Takes the Train: metro-by-metro city page runs

This is the exact process used on 2026-11-25 and 2026-11-26 to build about 45 metros (Chicago, Boston, Dallas, Houston, Tampa and more). Read it with `HANDOFF_STATE.md` (current state, setup, first-hour checklist, open work) and the uploaded kit (`README.md`, `ALL_EXAMPLE_CODE.md`, `rtt-city-kit.tar.gz`). All of these live in the project files folder and are mirrored in `stridematt/rtt-cev-publish` under `handoff/` for agents who cannot reach the project folder. Everywhere this file says `/mnt/project-files/...`, use the `handoff/` mirror (and `handoff/runs/<metro>/`) if the project folder is not reachable.

## 1. Goal and how Rally works

- Goal: every US metro has a core city page and suburb pages on rallytakesthetrain.com (Squarespace). Each kids' Christmas event gets its own page at `/christmas-events/<slug>` and a card on its town page `/christmas-events/<town>-<st>`.
- Area standard (set on Chicago): all city and suburb pages exist, SEO optimized, the city page links every suburb, every event page is unique and built properly, every event a parent could find for each suburb is on the right page. After each suburb, critique how well Firecrawl searches covered it and improve the search for the next one.
- Rally sends metros one at a time: "do <city>". Keep building while earlier metros publish, unless Rally has paused new cities (see below). Rally runs the registry command in Terminal and pastes the output back. When a metro is built, send Rally the pinned registry command and a short summary and keep working. Rally: "send me more commands as you finish."
- Rally's usage is limited, so use Sonnet 5.5 for builders (Rally asked for this on Nov 26). A builder thread uses at most 3 helper agents, and at most 3 cities run at once. Be economical: never re-research what a folder already holds.
- PAUSE (Rally, Nov 26 20:59Z): after the in-flight metros were live, Rally asked to pause new cities until they say go. Tell Rally when everything is live, then wait. Check `HANDOFF_STATE.md` for whether the pause still stands.
- Decide without asking when the rules below cover the case (Rally: "do whatever you would recommend"). Ask only when a choice changes Rally's goal.

## 2. Roles

| Role | Does | Never does |
|---|---|---|
| Coordinator (the project chat session) | Takes Rally's "do <city>", assigns a cand range, starts a builder thread with the brief in section 4, reviews handoffs, queues finished metros with the publisher, posts Rally the registry command, keeps memory current | Publish to Squarespace |
| Metro builder (one thread per metro, Sonnet 5.5, max 3 helpers) | Research, verify, build bundles, intros, moves, registry script, HANDOFF.md | Touch Squarespace, any admin browser, the registry, or the publisher's tab |
| Publisher (one thread, "Complete Boston and suburb event pages") | Owns the single signed-in Squarespace tab. Publishes metros in queue order: new pages, cards, moves, links, intros, dates, checks, quick-counts | Share the tab. Other threads must never navigate it (one thread wiped it once; the in-page state is lost on any reload) |
| Rally | Runs registry commands in Terminal on the Mac, decides open questions | |

Why one publisher: Squarespace sign-in lives in the Claude desktop app's built-in browser (restarting the app signs it out), and the publish library keeps in-page state. Two agents in one tab destroy each other's work.

## 3. Standards (Rally's rules, all metros)

Accuracy
1. Every fact comes from the host's own page, or a city, park, library or tourism-bureau calendar. If the calendar was the source, say so on the page. Any doubt on date, price or place: hold.
2. Hold: canceled, ended, wrong-year (2025 pages), unverifiable, conflicting dates, Facebook-only or Instagram-only (a host's own social post is enough only to prove a price is free, never to prove an event exists), image-only, adult-only, sold out, plain shopping markets, mail-in Santa letters, fun runs. If sources disagree, the ticket system or host wins, else hold. A host's own social post saying "free" counts as free.
3. PRICE RULE (Rally, Nov 26): an event with no printed price is built with cost `Price not listed` (2026 events only). No Paid tag, no guessed number. This replaces the old "unknown cost means hold".
4. Public parades count as free: cost `Free` (Rally, Nov 26). Library programs are free only if the library itself says so; otherwise "Price not listed".
5. Same-host small programs (several storytimes, library series) go in one merged event.
6. Drop events that end before today.

Writing
7. Plain, parent-friendly English. No em or en dashes, no exclamation marks, no filler, no claims the source does not make, no unsourced filler sentences (general-knowledge town history or atmosphere lines count as filler; Rally flagged them). No "price not stated" wording. A thin research pass (a town searched less than a full pass) must be flagged in the handoff, never hidden.
8. Event pages at least 60% unique (5-gram check, `uniq.py`).
9. Link only host pages. Round-ups (newspapers, Macaroni Kid, Eventbrite lists, Mommy Poppins, third-party Facebook) are discovery only and never linked. Ticket sites appear only on the tickets button.
10. SEO: title the event with the exact searched name plus the venue or park ("Santa Train at Florida Railroad Museum"). Search Console data (via Supermetrics) shows we win on new or small events and train or Santa train rides, and lose where the official site outranks us. Hunt trains, boat parades and new events first. Page `seo_title` under 60 characters, e.g. "Christmas Events for Kids in Brandon, FL 2026". Event SEO title pattern: exact name + city/venue + 2026 + day/date/time + "Free" when free.

Pages and structure
11. Town rule: own page for towns of 20,000+ people, plus smaller towns parents search by name at Christmas (destination towns, hosts of well-known events) when they have at least 3 verified events. Thinner towns (1 or 2 verified events) fold into the nearest larger town page: build the card for the target page (bundle `cities` key, `card.page` and breadcrumb links point at the target), keep the event slug and registry row unchanged, mark the old `page.json` as `page.json.superseded`, and record why in `folded.json`. Fold at build time, not after publish (Rancho Cucamonga had to fold San Dimas, Highland and Loma Linda late).
12. Moves: when a suburb gets its own page, its events move off the core city page (and any neighbor page) to the town page, and the city links to the town. Never show an event on two pages.
13. Every city page gets the full Chicago-style intro (section 7) and must match the main city page style (lede, "What Rally found in X" list, same layout and sections). Refresh counts whenever cards change. Pages built with the `newCity` generator skipped the intro once and Rally flagged it.
14. A city page links its paired Christmas Eve services page when one exists (`/christmas-eve-services/<slug>`): an "rb-q" line "Planning Christmas Eve in X? ... see Christmas Eve service times in X", an FAQ `<details>` "Are there Christmas Eve services for families in X?" and a matching FAQPage schema Question. Check each town by scraping the URL (404 means none).
15. Changed pages get today's publish date. Schema carries `datePublished` only, no `dateModified` or `lastReviewed`.
16. Never hand-edit counts. Dispatch the `quick-counts` workflow. Never request indexing in Search Console. Never print secrets (`.env`, token, `RTT_SECRETS_PRIVATE.txt`).
17. New pages are the compact layout (no Meet Rally box); open question: Rally was asked whether to rebuild larger Chicago suburbs in the full layout.

Time zones (December standard-time offsets in every JSON-LD event time). Never default to Pacific.

| Zone | Offset | Notes |
|---|---|---|
| Eastern | -05:00 | |
| Central | -06:00 | |
| Mountain | -07:00 | |
| Pacific | -08:00 | |
| Arizona | -07:00 | no daylight saving all year |
| Hawaii | -10:00 | |
| Alaska | -09:00 | |

Watch split states: west Kansas and Nebraska (Mountain), El Paso TX (Mountain), Florida panhandle (Central), parts of Indiana, Kentucky, Tennessee, the Dakotas, north Idaho (Pacific). The kit sets the offset from the state code (`tx` gives -06:00, `az` gives America/Phoenix). Verify with grep in the generated pages. The Miami run shipped -08:00 by mistake; the publisher repaired pages it touched and other old Florida pages may still carry -08:00.

## 4. Metro-builder brief (paste into the new thread; fill the brackets)

```
# <Metro> run: research + build brief (<date>)

You research kids' Christmas events (2026 season) for the <State> towns below, verify them, and BUILD the kit bundle for each town. Read first and follow exactly: /mnt/project-files/handoff/SKILL.md sections 3 to 9 (standards, research, build, intro, registry). Finished examples: /mnt/project-files/tampa-run/largo-fl/ (NEW town) and /mnt/project-files/tampa-run/clearwater-fl/ (existing town); handoff examples tampa-run/HANDOFF.md and wichita-run/HANDOFF.md.

NEVER touch Squarespace, any admin browser, the registry, or the publisher's tab. Firecrawl for research (formats markdown or links; waitFor 4000 or 5000 for JS pages; JSON extraction hallucinates, do not use it for facts). Model: Sonnet only; at most 3 helpers; do not re-research what a folder holds. Today is <weekday, date>; drop events ending before today.

TIME ZONE: <zone>; every JSON-LD event time must carry <offset> in December. Verify with grep. Never Pacific unless this is Pacific.

Cand range for the run: <start>-<start+999>. Helper blocks: A <a-range> (<towns>), B <b-range> (<towns>), C <c-range> (<towns>). Stay inside your block.

Existing pages: confirm each town by firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<slug> formats ["links"] maxAge 0 (every /christmas-events/<slug> link is a live card; 404 or empty = NEW town). Write existing_cards.txt per town and <core>_existing_cards.txt for the core page. Check neighbor pages for cards that belong to your towns (including earlier metros' runs). Write <core>_moves.json (see shape in section 8).
OUT OF SCOPE: <neighbor metros>. List stray events in your reply, do not build them.

Rules: price not printed = build with cost "Price not listed" (2026 only); public parades Free; a host's own social "free" counts; hold canceled, ended, wrong-year, adult-only or unverifiable events (conflicting dates, 2025 pages, Facebook-only or image-only sources); library programs free only if the library says so; same-host programs merged into one event; no em or en dashes; no exclamation marks; link host pages only, never round-ups. Town rule: own page for towns of 20,000+ and smaller destination towns with 3+ verified events, else fold into the nearest larger town (folded.json says why and where). Cards of a town with its own page MOVE OFF the core page; never on two pages.

Research: for each town search "christmas events for kids in <town> <st>" the way Google does (firecrawl_search, limit 15, also "<town> <st> holiday events 2026") and work through every result. Order: city holiday page and parks and recreation calendar (CivicPlus sites may render empty: waitFor 5000 or /m/calendar), tourism bureau guide, chamber or downtown group, library calendar, big attractions, farms, theaters and dance schools (Nutcracker), churches' public kids events, holiday trains and boat parades, parades, tree lightings, Santa visits. Train rides, boat parades and NEW events rank best for us: hunt for them first. After each town, ask what a parent's Google search would show that you missed, fix the method, and mention the fix in your reply.

Per-town outputs in /mnt/project-files/<metro>-run/<town>-<st>/: facts.json, tweaks.json, bundle.json.gz, intro.json, existing_cards.txt, folded.json (when no page), and page.json for NEW towns (see NEWPAGE_SPEC). page.json "nearby" starts ["<core>-<st>","<Core>"] then EXISTING pages only (verified 200). train_links only for rallytakesthetrain.com/museums/<slug> pages that return 200, else []. Christmas Eve services page: check https://www.rallytakesthetrain.com/christmas-eve-services/<slug> and record yes/no. Every town gets a Chicago-style intro.json.

Build block: follow SKILL.md section 6 exactly. Validate every JSON with python3 json.load. The folder is a network mount: re-read files about ten seconds after writing.

Reply (short): per town new or existing, events built (cand, slug, date, cost), held and why, events belonging to other towns, Christmas Eve page yes/no, best source, flags (facts not from a host page), method fix.
```

Coordinator checklist when starting a builder: pick the next free cand range (counts down from 43000 as of Nov 26; see HANDOFF_STATE.md section 9 and record each assignment in memory and that file), set the time zone offset, list the existing pages from `live.json` for the metro, write the town scope hints per helper block (look at `tampa-run/BRIEF.md` or `tucson-run/BRIEF.md` for style), and note any cities in Rally's queue that are suburbs of the metro.

## 5. Research method with Firecrawl

- Tools: `firecrawl_search` (query like a parent), `firecrawl_scrape` (formats `markdown`, `links`, `summary`; `waitFor` 4000 to 5000 for JS pages; `maxAge: 0` for live checks of rallytakesthetrain.com).
- The live site is reachable only through Firecrawl or from the Squarespace tab. The cloud shell cannot fetch www.rallytakesthetrain.com.
- Per town, work through every search result. Round-ups find events; the host page proves them.
- What ranks first in Google and should be read first: the city's own holiday page, the tourism bureau guide, big attractions. Watch a town's events carded on a neighbor page.
- Useful structured sources: WordPress "Tribe" park sites expose `/wp-json/tribe/events/v1/events?start_date=..&end_date=..` (venue and cost in one call). kiddochicago.com/events/<town> lists 30 days of park and library events with host links (Chicago only). Park district registration systems (CivicRec, RecDesk, ActiveNet, Amilia) print prices.
- Chicago lesson: same-series events at several parks go on one card; park district pages share template text, so add per-venue facts to clear 60% unique. Library pages that print no cost are "Price not listed".
- Method fix loop: after each town critique what you missed and improve the next search. State the fix in the reply.
- Do not spend Firecrawl credits repeating research a folder already holds. The Mac registry has `seen`, `searched` and `log-scrape` commands to avoid repeat spend.

## 6. Build pipeline (kit; run in your own copy)

Setup (the kit tarball is in project files):
```
mkdir -p /home/claude/rtt && cd /home/claude/rtt && tar xzf /mnt/project-files/rtt-city-kit.tar.gz
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=$K/tools/live.json   # snapshot of live pages
```
Per town:
```
RUN=work/<town>-<st>-run; mkdir -p $RUN; cp /mnt/project-files/<metro>-run/<town>-<st>/facts.json $RUN/
mkdir -p work/<town>-<st>; [ -f work/<town>-<st>/<town>-<st>.html ] || cp ../tools/empty_city.html work/<town>-<st>/<town>-<st>.html
python3 disc_build.py $RUN/facts.json <town>-<st> $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/                                   # slugs generated; key tweaks.json by these slugs
cp /mnt/project-files/<metro>-run/<town>-<st>/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>       # every slug >= 60.0% and [] issues; add SOURCED content until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json)
python3 mkbundle_us.py /mnt/project-files/<metro>-run/<town>-<st>/bundle.json.gz winterfest-seattle-wa $A
```
- Clear `out/` between towns, or check `ls out/` lists only this town's slugs before bundling. Bundle under 3.8 MB.
- Check the bundle's event slugs do not collide with `existing_cards.txt` or the town page's current links.
- Check generated pages for `–`, `—` and `!` outside scripts, and that every event time in the JSON-LD carries the right offset.
- `cost` must never be empty. Use `"Price not listed"` or `"Free"` or a printed price.
- Known generator bugs `tweak_pages.py` fixes: venue name (generator used the street) and "Where is" answer that repeated the street. `build_listed.py` rebuilds restore a "We listed X from <Host>'s public website" line; rerun `post_source.py`.
- `tools/conv_price_not_listed.py` (project files `tools/`) converts older held events to the Price not listed form.

### facts.json fields (one entry per event; see `examples/facts_example.json` in the kit for 19 real entries)
`cand` (unique, inside your block), `name`, `town`, `venue`, `address` ("street, town, ST zip"), `times` as `[[date,start,end],...]` or `range` as `[start,end,open,close]` for a season (range start 2026-10 to 12; times dates 2026-11, 2026-12 or 2027-01-01 to 06), optional `when_note`, `cost` (never empty), `ages`, `host`, `url` (source), optional `tickets`, `kind` (santa, market, lights, show, parade, crafts, story, food, outing, trains), `indoor`, `page` (town slug), `page_name`, `paras` (two sourced paragraphs of 50 to 70 words), `tip` (one practical sourced line).

### tweaks.json (see `examples/tweaks_example.json`)
Keyed by event slug: `kids`, `site`, `table` (fact rows), `about`, `faq` (2 event-specific questions), optional `when`, `source` (when the url is a calendar, e.g. "Visit Henry County's events calendar"), optional `org`.

### page.json for a NEW town (spec: `/mnt/project-files/chicago-run/NEWPAGE_SPEC.md`)
`slug`, `name`, `seo_title` (under 60 chars), `seo_desc` (under 155), `lede`, `celebrates` (80 to 120 words), `lastyear` (60 to 100 words about 2025), `facts`, `trains`, `train_links` (verified 200 only), `traditions` (4 to 6), `kidfact`, `faq` (4 to 6), `sources`, `nearby` (starts with the core page; existing pages only), plus `move_from_<core>` listing card slugs that move onto this page, `folded` notes, and the generated `intro_html`, `seo_title`, `seo_description`.

### Bundle shape (`bundle.json.gz`)
`{"v":1,"template":"<slug>","meta":{<event-slug>:{"title":...}},"pages":{"<event-slug>.html":"<html>"},"cities":{"<town-slug>":[{"card":{...cand, name, town, page, cal:{d:[[date,...]],u:url}...}}]}}`. One bundle holds the event pages plus the cards for the town page.

### Moves file (`<core>_moves.json`)
`{"moves":[{"from_page":"st-petersburg-fl","to_page":"largo-fl","card_slug":"holiday-lights-in-the-gardens-largo-fl"}],"note":"why"}`. A move with `to_page` "drop" removes a duplicate. If two moves files exist for a metro (A/B/C), the handoff says which one wins (example: Corpus Christi uses moves_B.json).

## 7. Chicago-style intro (every town page, existing ones too)

Shared generator: `/mnt/project-files/tools/make_intro.py`.
```
python3 make_intro.py <slug> "<Name>" <town>/page.json --cards <cards.json ...> --existing <parsed_existing.json> --hub <core-slug>:<Core Name> --state <state-slug>:<State Name>
```
`--cards` are `disc_build` outputs (new events), `--existing` is `city2/parse.py` output for the live page (already carded). It writes `intro_html`, `seo_title`, `seo_description` and `intro_counts` into page.json (other keys kept), counts only events whose last date is today or later, and asserts no dashes or exclamation marks. Free count comes from the card `fl` flag or "Free" tag.

Alternate used for Florida and Kansas: each builder writes `intro.json` (`lede`, `found` list, `hub_line`) and the lead runs `tampa-run/tools/mk_page_intro.py <run-dir>`, which converts it into page.json. It hardcodes `STATE = {"fl":"Florida"}`; edit before reuse.

intro.json lede pattern: "Rally the corgi has sniffed out the best Christmas events for kids in <Town> for 2026, and here is what he found: N family events, M of them free. The magic runs from <first date> (<event>) through <last date>, with <event> (<date>), <event> (<date>) and <event> (<date>) along the way. We check every date on the host's own website, and each listing links straight there." `found` list: "N Christmas events for kids in <Town>", "M free events, including ...", "Meet Santa: ...", "Parades and tree lightings: ...", "Trains: ...", "Season: <first> to <last>". `hub_line`: "Planning a bigger day out? <Town> families also use our guide to Christmas activities for kids in <Core>, which covers ...". Counts include new events plus events already live on the page plus moved-in cards. Recheck counts against the live page at publish time (handoff counts have been off by a few: Kansas City 53 vs 49, Charlotte 31 vs 24).

## 8. Handoff package (what a builder leaves behind)

In `/mnt/project-files/<metro>-run/`:
- per town folder: `bundle.json.gz`, `facts.json`, `tweaks.json`, `intro.json`, `existing_cards.txt`, `page.json` (full for NEW towns; for existing towns it carries `intro_html`, `seo_title`, `seo_description`), `folded.json` where no page is built
- `HANDOFF.md`: cand range and how much was used, time zone, the registry command, towns (NEW pages with counts and free counts; EXISTING pages with new events), folded towns, publisher actions (moves, links, Christmas Eve pages, dates, quick-counts), flags (facts not from a host page), held list with reasons. Model it on `tampa-run/HANDOFF.md` and `wichita-run/HANDOFF.md`.
- `<core>_moves.json`, `<core>_existing_cards.txt`, `registry_rows.json`, `reg_<metro>.sh`, `BRIEF.md`
- lead checks before handoff: valid JSON, no duplicate cands or slugs, correct offset on every timed JSON-LD, no dashes or exclamation marks, uniqueness 60%+, intro_html, seo_title and seo_description present in every page.json.

## 9. Registry (Rally runs it in Terminal)

The registry is Rally's events directory on the Mac (`/Users/matt/Downloads/sa/registry`, `registry.py` plus a `.env` holding a token; never print it). macOS blocks Claude from the Downloads folder even with Full Disk Access (also via Remote Control), so builders push scripts to the `stridematt/rtt-cev-publish` repo and Rally runs them.

Script generation: copy `tampa-run/tools/mk_registry.py` (hardcodes `cc fl` and `reg_tampa.sh`; edit both) and run it on the run dir. It reads every town bundle and writes `registry_rows.json` and `reg_<metro>.sh`. Script rules:
- no `set -e`; every add ends with `|| true`; every add carries `--confirm-new`
- the script counts and ends with: `echo "added $A, refused $R"; [ -n "$REF" ] && echo "refused slugs:$REF"; true`
- adds run in one script (about 10 adds per Mac call if run through device_bash, 180 s limit)
- re-running adds duplicates; Rally runs it once

Template of one line:
```
add --slug <slug> --name '<Name>' --city '<City>' --cc <st> --url <host url> --date <first date> --status live --confirm-new || true
```
Pushing and pinning: push the script to a branch of `stridematt/rtt-cev-publish` (the session's own development branch; read the branch name from git, never guess one), then get the full 40-character commit hash and verify the raw file at that commit returns HTTP 200 and matches the local file. Always give Rally the pinned command, not a branch URL. Use this guarded form:
```
cd ~/Downloads/sa/registry && rm -f /tmp/rtt_reg.sh && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/<FULL-40-CHAR-SHA>/<metro>/reg_<metro>.sh -o /tmp/rtt_reg.sh && set -a && . ./.env >/dev/null 2>&1; set +a; [ -s /tmp/rtt_reg.sh ] && bash /tmp/rtt_reg.sh
```
404 pitfall (learned Nov 26): the older form ended `; bash /tmp/x.sh`. If the raw URL returned 404 (wrong hash or file not pushed yet), `curl -f` wrote nothing and that trailing `bash` re-ran the PREVIOUS `/tmp/x.sh`, adding duplicates. The guarded form deletes the file first and only runs it if the download produced a non-empty file. Always verify the 200 before posting, and give each fix its own command. Tell Rally to paste back the "added N, refused M" lines.

Refusals: most are false matches (the registry sees a similar name). Handle them like this:
1. Check: `python3 registry.py check --name "<Name>" --city "<City>" --cc <st> --date <date>` (`match:` means an existing event; `NEW 0` means none).
2. If it is a genuine different event, re-add under a distinct internal name (avoid shared words like "Nutcracker" combined with a different source URL), then record the public name: `python3 registry.py alias --slug <slug> --name "<public name>"`.
3. If it still collides, keep the card on the page and skip the registry (like Atrium 916).
4. A "match" for an event already live means do not rebuild: confirm it is carded on the right page.
Guarded fix scripts (Charleston fix1 and Rancho Cucamonga fix1 are the models: `charleston/reg_charleston_fix1.sh`, `rancho-cucamonga/fix1.sh`): one `fix()` function per refused slug that (a) runs `registry.py check` and skips if it prints `match:`, (b) otherwise adds under a distinct internal name with `--confirm-new`, (c) on success runs `alias` to restore the public name, (d) prints `STILL REFUSED: <slug>` on failure; no `set -e`, ends with `true`. Push the fix script as its own commit, verify the 200, and send Rally its own pinned command. Never re-run the main script to pick up refusals. Ask Rally to paste the refused slugs from the main run's output. Some metros have several parts (Virginia Beach has 7).

## 10. Publishing (done only by the publisher thread)

Environment: the Squarespace admin tab `https://rally-takes-the-train-site.squarespace.com/config/pages` in the desktop app's built-in browser (tab nicknamed "seed"). The publish library is `RTTUS` (`pipeline/rtt_us_lib_v5.js` in the kit; the publisher keeps a patched copy in IndexedDB `rtt_us2` key `libMA`). Cloud shell cannot reach the live site; use same-origin fetches from the tab. Chrome-tool outputs block `=`, `?`, `&`, `%` (sanitize with `.replace(/[=?&%]/g,'_')`, write `'?format'+'=json'`); keep each JS call under 45 seconds and run long jobs in the background, then poll.

Workflow per metro (queue order):
1. Pull bundles and page.json from the metro's pinned commit in `rtt-cev-publish` (builders push `<abbr>/<town>-bundle.json.gz` and `<town>-page.json`).
2. New town pages: `newCity` then `convertSoon` with a far-away template page (not one named in the new town's nearby links, e.g. `midlothian-tx` for Dallas), load the town bundle first, then `addCards`. Existing towns: `addCards`. `useState({state,slug,tz,metro,metroName,cc,tpl})` sets the state code, offset and template (pass the state CODE: Dallas new pages once got `data-ke-state` MA).
3. Moves: delete the card from the source page and add it to the target (`RTTUS.moveCards`, helper variants `__mc2`, `__mc3` handle other card formats and `to:'drop'` removes duplicates). Then remove dead planner rows that point to moved cards (helper `__plan(slug,save)`).
4. Links: core page links every new town; each new town links back to the core; sibling links where the handoff says; Christmas Eve FAQ and rb-q line where an eve page exists.
5. Intros via `RTTUS.intro(slug,1)` or the handoff `intro_html`; verify against `chicago-il` style (lede, tldr, one h1, no lost dollars).
6. Dates: set publish date today and `datePublished` today with the local offset (`dateToday` patched per state).
7. Verify (`window.__verify(towns,cc,tz)`): page live 200, card present, counts match handoff, dates, JSON-LD parses, no lost dollars, no `-08:00` outside Pacific.
8. Drop events already ended on publish day (instead of carding past events). Tell the coordinator what was dropped.
9. Dispatch `quick-counts` for every changed path and confirm success.
10. Report to the coordinator: new pages, existing pages, events and free counts per core page, moves done, anything fixed.

Browser snippets are in the kit's `examples/browser_snippets.js` (also section "Browser" of `ALL_EXAMPLE_CODE.md`).

Quick-counts: 
```
gh api -X POST repos/stridematt/sitemaps/actions/workflows/quick-counts.yml/dispatches -f ref=main -f 'inputs[pages]=/christmas-events/canton-ga,/christmas-events/kennesaw-ga'
gh run list -R stridematt/sitemaps -w quick-counts.yml -L 3 --json status,conclusion,createdAt
```
(`gh repo clone` fails because GraphQL is blocked; fetch files with `gh api repos/stridematt/sitemaps/contents/<path>`. Live page list: `tools/truth/live.json`.)

Publishing never overwrites an existing event page; use `RTTUS.update()` after rebuilding. Squarespace returns 429 when busy; the library waits and retries. Bundles must stay under 3.8 MB for browser upload.

## 11. Known bugs and lessons

- `$1` replace bug: JavaScript `String.replace` with a replacement containing `$1` treats it as a capture group, which dropped dollar amounts ("$12.51" lost characters) in `newCity`, `convertSoon` and the `addCards` card template. Fixed with `split(a).join(b)` and a callback replacer (the callback must NOT wrap the value in the doubling helper `D()`; that doubles `$`). Patched in the publisher's `libMA`; re-apply after any library reload. Symptoms: "Free$10 with free rental", "Price not listed$12.51", "Cost: 0 residents", stray "$$". Scan published cards for doubled or digit-only cost values. Real prices like $12.51 on Eventbrite fees-inclusive listings are legitimate.
- Planner dead rows: after cards move off a core page, the planner timeline keeps rows pointing at moved cards (Sacramento 24, Detroit 20). Remove them per metro. Earlier metros still need a sweep after the queue clears.
- Pacific -08:00 mistake: Miami and other runs carried -08:00 offsets in JSON-LD. The publisher repaired touched pages. Always set the offset for the metro's zone and grep.
- Empty cost makes a "Paid" tag and blank price. Never leave `cost` empty.
- Case-insensitive "ocean view" check blocked Del Mar `newCity` (patched to case-sensitive). `convertSoon` fails when the template slug appears in the nearby links or the text (Shoreline: "Aurora Ave"). Use a far template and the donor-card trick (Birmingham, Southfield, Palmetto Bay): build with a donor card from another bundle, move the real cards in, move the donor out.
- Counts Worker caches city pages for up to an hour (`x-rtt-counts: hit`); check stored content through `?format=json`.
- Cross-city events: an event carded on one city cannot be copied to another with RTTUS without double counting; use the moves procedure.
- Squarespace URL Mappings editor is CodeMirror: type with real keys; Save is top right. 301s only work once the old pages are deleted (Seattle duplicates pending Rally's OK).
- Library JS `bad` list on load can just be a sha mismatch from an SEO rewrite (harmless).
- Browser tab: never navigate it from another thread; `navigate` without a tabId loads into the active tab and wipes in-page state (`__Q`, `__R`, `RTTUS`, helpers). Recovery: re-eval the library from IndexedDB, re-queue unfinished items, check for half-saved pages.
- Handoff counts drift: recheck against the live page.
- CivicPlus and OpenCities city sites can render empty without `waitFor`.
- An event physically in another town belongs to that town; list it for the right metro instead of building.
- Registry: false matches are common; see section 9.

## 12. Queue handling

- Rally's queue lives in the project (see `HANDOFF_STATE.md`). When Rally says "do <city>" (and no pause is in force), start the builder thread (Sonnet 5.5) with the brief in section 4, assign the next cand range (counts down by 1000 from the last used; record it), and keep building the next while others publish, at most 3 cities at once. Rally's pause (section 1) overrides this: when Rally says to make sure everything is live first, stop starting cities, let the publisher clear the queue, tell Rally, and wait for "go".
- A metro is "built" when HANDOFF.md exists and the lead's checks (section 8) pass. Then: message the publisher thread with the handoff path, moves file, new pages, existing pages, and any special instructions (flags, which bundle wins). Post Rally the pinned registry command.
- The publisher publishes in queue order and reports each metro. The coordinator relays results to Rally.
- Many cities in Rally's long queue (`/mnt/project-files/queue/rally_city_queue.txt`, about 190 cities) are suburbs of already built metros (Aurora, Naperville, Joliet, Elgin are Chicago; Garden Grove, Fullerton, Orange, Costa Mesa are the Anaheim run; Olathe, Lee's Summit, Independence are Kansas City; Lakeland, Clearwater, Largo are Tampa). Tell Rally they are covered and skip unless more events are needed. For a city that is not covered, run it as a metro (or a small run if it is a standalone city) using the same brief.
- After the publisher queue clears: the planner dead-row sweep over earlier core pages; any held items Rally approves.
- Usage guard: when usage gets tight, pause new metros, finish publishing, and update `HANDOFF_STATE.md` so another agent can resume. Threads run at most 3 Sonnet helpers.
- Lesson (Nov 26): fold 1 to 2 event towns at build time; hold Facebook-only events instead of carding them; flag thin passes; verify 200 on every registry URL before posting it.
- Lesson: a builder that flags a big city as needing a second pass must do that pass before handoff, and must drop Facebook-only or conflicting-date events rather than hand them over.
- Lesson: the kit writes a "Paid" pill on Price not listed pages; builders must strip it, and a sweep of earlier pages is planned.
- Lesson: drop Facebook-only or social-only events at build time. The publisher's sweep list for earlier pages: intro recount (older-card class bug), orphan town headings, dead planner rows, stale FAQs, the Paid pill, and the Spring Hill Christmas Eve page.

## 13. Repos, folders and tools

- Repos: `stridematt/sitemaps` (quick-counts workflow, `tools/truth/live.json`), `stridematt/rally-events`, `stridematt/rtt-cev-publish` (registry scripts and publish bundles, one branch per session named `claude/project-thread-<id>`; read the name from git; pin full SHAs).
- Mirror for other accounts: `stridematt/rtt-cev-publish` folder `handoff/` holds this file, `HANDOFF_STATE.md`, `README.md`, `ALL_EXAMPLE_CODE.md`, the kit tarball, the queue, tools, and every run's `HANDOFF.md`/`BRIEF.md`/moves under `handoff/runs/<metro>/` (branch `claude/project-thread-rhybi7`, ask Rally to merge to main if they want it there). Per-town bundles are on each run's own branch at the pinned SHA.
- Project files: `/mnt/project-files/<metro>-run/` (builds), `/mnt/project-files/queue/rally_city_queue.txt`, `/mnt/project-files/tools/` (`make_intro.py`, `conv_price_not_listed.py`, `brave-url-list/`), `/mnt/project-files/handoff/`, kit files `README.md`, `ALL_EXAMPLE_CODE.md`, `rtt-city-kit.tar.gz`.
- Connectors: Firecrawl (research), Supermetrics (Search Console and Google Analytics for SEO), Cloudflare Developer Platform (not needed for counts), GitHub (the three repos above).
- Kit contents: `pipeline/` (`disc_build.py`, `us_city.py`, `build_listed.py`, `enrich_listed.py`, `mkbundle_us.py`, `quick_answers.py`, `locale_rules.py`, `marquee.py`, `tracker.py`, `og.py`, `city2/`, `assets/`, `rtt_us_lib_v5.js`), `tools/` (`tweak_pages.py`, `post_source.py`, `split_cards.py`, `uniq.py`, `empty_city.html`, `live.json`), `examples/` (`facts_example.json`, `tweaks_example.json`, `ev_example_christmas-in-canton-ga.json`, `browser_snippets.js`, `shell_snippets.sh`). Full commands: `ALL_EXAMPLE_CODE.md`.
- Mac access: the Mac is reachable through the device tools for the Documents folder; Downloads is blocked. Terminal is how Rally runs registry scripts.
- SEO follow-ups: use Search Console (site `sc-domain:rallytakesthetrain.com`) via Supermetrics to find high-impression, low-click pages and fix titles; recheck the 17 retitled Chicago events after about two weeks.
