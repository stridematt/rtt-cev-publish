# Rally Takes the Train: finding new events and updating US city pages

This guide shows any agent how to find new Christmas events for kids in a US town and get them onto rallytakesthetrain.com. Each event gets its own page and a card on its city page.

It is the process used on November 25, 2026, which added 48 events to the Atlanta suburbs. All the code is in this kit. `ALL_EXAMPLE_CODE.md` has every command and snippet in one place.

## What you need

| Thing | Where | Used for |
|---|---|---|
| Cloud workspace with Python 3.12+ | this kit, copied to `/home/claude/rtt` | building pages |
| Firecrawl tools | `firecrawl_search`, `firecrawl_scrape` | research |
| Claude in Chrome, signed in to Squarespace | tab on `https://rally-takes-the-train-site.squarespace.com/config/pages` | publishing |
| Matt's Mac through device_bash | `$HOME/mnt/sa/registry` (`registry.py` and `.env` with the token) | the events directory |
| `gh` CLI with access to `stridematt/sitemaps` | cloud shell | event counts |

The cloud shell cannot reach www.rallytakesthetrain.com. Check live pages from the Squarespace tab with same-origin fetches instead.

## House rules (never break these)

1. **Accuracy first.** Every fact must come from the host's own page, or from a city or tourism-bureau calendar. If anything is in doubt (date, price, place), hold the event.
2. **No limited facts.** Never write "price not stated", "see the host page for prices" and the like. If the cost is unknown, hold the event (the builder writes an empty price and a "Paid" tag).
3. **Christmas events for kids only.** No adult-only events, no plain shopping markets, and nothing that is sold out or falls after Christmas season.
4. **Event pages must be at least 60% unique** (5-gram check against every built page).
5. **No em or en dashes, no exclamation marks, no AI filler.** Use plain, parent-friendly English.
6. **Dates:**
   - Squarespace publish date is today.
   - The schema has `datePublished` only (today), with no `dateModified` or `lastReviewed`.
   - Times use the local offset (-05:00 in the Eastern zone).
7. **Links:**
   - Host links go to the host's own site.
   - Eventbrite and other ticket sites appear only on the tickets button.
   - When the facts came from a calendar, say so rather than claiming "the host's own website".
8. **Counts:** never edit them by hand. Run the `quick-counts` workflow.
9. **Do not request indexing** in Google Search Console.
10. **Security:** never type, print or paste passwords, keys or tokens. Source `.env` silently and never print `RTT_SECRETS_PRIVATE.txt`.
11. **New pages:** no Meet Rally box, compact sign-up strip only. The site-wide -08:00 offset sweep is on hold, so don't do it.

## The flow at a glance

```
1 research (Firecrawl)  ->  2 verify each event on the host's page  ->  3 directory check (Mac)
4 facts.json  ->  disc_build.py  ->  us_city.py multi  ->  tweak_pages.py  ->  uniq.py  ->  split_cards + mkbundle_us.py
5 Chrome: RTTUS.load / publish / addCards (dry run, then save)  ->  6 live + date audit
7 directory add (Mac)  ->  8 quick-counts  ->  9 project doc + report to Matt
```

## Step by step

### 1. Research

- Search the way a parent would, with one Firecrawl search per town: `christmas events for kids in <Town> GA 2026`. Then read the round-up pages it finds (the city calendar, the tourism bureau's holiday list, Macaroni Kid, local news) with `firecrawl_scrape`, using formats `["markdown"]` or `["summary"]`.
- Compare against the cards already on the city page. Fetch `/christmas-events/<city>-ga?format=json` from the Squarespace tab and read the card titles.
- Firecrawl's JSON extraction can hallucinate (it once named a sponsor as the organizer). Use markdown or summary to verify facts.
- Facebook-only or aggregator-only events are held unless an official page confirms them.

### 2. Verify every candidate

For each event, read the host's page, or the city or tourism-bureau calendar entry, and record:

- date(s), times, venue name and full address
- cost, ages, host, booking needs and the source URL

If two sources disagree, open a third (the ticket system wins). If you still can't settle it, hold the event.

### 3. Directory check (Mac)

Run `registry.py check` for each candidate (shell snippet B).

- A `match:` line means the event is already live. Check that it is on the right city page instead of rebuilding it.
- A clearly wrong match (a different event at the same place) is fine. Add it later with `--confirm-new`.

### 4. Build

1. **Write `facts.json`.** Copy `examples/facts_example.json`; it has 19 real entries. Each entry needs:
   - `cand`: unique number
   - `name`, `town`, `venue`, `address` ("street, town, ST zip")
   - `times` as `[[date,start,end],...]`, or `range` as `[start,end,open,close]` for a season. Range start must be 2026-10 to 12. Times dates must be 2026-11 or 12, or 2027-01-01 to 06.
   - optional `when_note`
   - `cost` (never empty), `ages`, `host`
   - `url` (the source), optional `tickets`
   - `kind` (santa, market, lights, show, parade, crafts, story, food, outing, trains)
   - `indoor`
   - `page` (city slug, e.g. `canton-ga`) and `page_name`
   - `paras`: two sourced paragraphs of about 50 to 70 words, unique wording
   - `tip`: one practical, sourced line
2. **Make sure each city page has a stub:** `work/<city>/<city>.html` must exist (`cp ../tools/empty_city.html ...`).
3. **Generate the pages:**
   - `python3 disc_build.py <facts> <any-city> <cards.json>` writes the cards.
   - `python3 us_city.py multi <cards.json>` writes `ev/<slug>.json` and `out/<slug>/page.html`.
4. **Write `tweaks.json`** (copy `examples/tweaks_example.json`). For each slug add:
   - `kids`: what children do
   - `site`: what is there
   - `table`: fact rows
   - `about`: extra sourced paragraph(s)
   - `faq`: 2 event-specific questions
   - optional `when`: a clean "When is" answer when the generated one reads awkwardly
   - `source`: when the url is a city or tourism-bureau calendar, e.g. "Visit Henry County's events calendar"
   - optional `org`: the host's own site

   Then run `python3 ../tools/tweak_pages.py <facts> <tweaks>`. It always fixes two generator bugs: the venue name (the generator uses the street) and the "Where is" answer that repeats the street.
5. **Run `python3 ../tools/uniq.py <slugs...>`.**
   - Every page must be at least 60% unique and show no issues.
   - Pages at the same venue or with the same host (three Cannon Park events, say) share template text. Add more sourced `about`, `faq`, `kids` and `table` content until each clears 60%.
   - Never pad with unsupported claims. "Kids will remember this" or "no tickets needed" are not allowed unless a source says so.
6. **Bundle the cards:**
   - `A=$(python3 ../tools/split_cards.py <facts> <cards.json>)`
   - `python3 mkbundle_us.py <run>/bundle.json.gz winterfest-seattle-wa $A`
   - The bundle must be under 3.8 MB for the Chrome upload.

### 5. Publish (Chrome, `examples/browser_snippets.js`)

1. Load RTTUS (section 0).
2. Upload the bundle to `#ar-file` with the find tool and file_upload.
3. Run `RTTUS.load()`, then `RTTUS.publish()` (async; poll with section 2). Each page must show seo 200, live 200 and quick true.
4. Run `RTTUS.tplFrom('roswell-ga')`, then a dry run of `addCards(city)` for every city (`ok` must be true). Then save with `{save:1}`.
5. **Notes:**
   - `publish()` skips slugs that already exist ("EXISTS"). To change a live event page, rebuild it and run `RTTUS.update()` (section 6), which keeps the publish date.
   - Squarespace returns 429 when busy; RTTUS waits and retries.
   - Keep each Chrome JavaScript call under 45 seconds. Start long jobs in the background (`.then(x=>window.__x=x)`) and poll.

### 6. Live check and date audit

- Section 4 confirms each card is on its city page.
- Section 5 checks every new event page:
  - publish date is today (Pacific)
  - `datePublished` is today and is the only date
  - no `dateModified` or `lastReviewed`
  - every JSON-LD block parses
- Event pages live at `/christmas-events/<slug>`.

### 7. Directory add (Mac)

`registry.py add ... --status live` for each published event (shell snippet D). It returns the RTT id; record the range.

### 8. Counts

Dispatch the `quick-counts` workflow with every changed city path (shell snippet E), then confirm the run succeeded. The Cloudflare Worker updates hubs and guides from the counts files, so never edit those numbers by hand.

### 9. Record and report

- **Project doc:** update the project doc for the area (e.g. `claude/atlanta-ga-build.md` in the County Pages project) with the events published, the RTT id range, what was held and why, and any pipeline issues.
- **Report to Matt:**
  - a table of towns, card counts before and after, and the new events
  - what was already on the site
  - what was held and why
  - anything that needs his decision

## Fixing an existing city card

Use browser snippet 7. For example, the Brookhaven Santa card needed December 19 added:

1. **Confirm the new fact on the official source.** For Brookhaven that was the city calendar entries and the city's news release.
2. **Find every place the old fact appears:**
   - intro text and the quick facts box
   - card "When", card badge ("2 dates"), and the card's `data-cal` dates
   - card text and FAQ (html and FAQPage schema)
   - Event schema description and `endDate`
   - planner row and BlogPosting description
   - the item's excerpt and SEO description
   - the locked-gate preview copy of the card
3. **Edit both the html and the editor copy (`wysiwyg.source`).** They often differ in formatting (the editor copy may have spaced JSON), so count matches in each before saving.
4. **Update the card's "checked" date** to today.
5. **Back up the old html first** (IndexedDB `rtt_us/backup`), then PUT and read it back.

## Known pitfalls

- **JS `string.replace`:** with a replacement containing `$15`, it treats `$1` as a capture group. Use `split(a).join(b)`.
- **Chrome tool output:** it blocks any output containing `=`, `?`, `&` or `%`. Sanitize with `.replace(/[=?&%]/g,'_')`, and write `'?format'+'=json'`.
- **`build_listed.py` rebuilds** put the "We listed X from <Host>'s public website" line back. `tweak_pages.py` reruns `post_source.py` for slugs with `source`; run it yourself after any other rebuild.
- **Empty cost:** `us_city.py` writes an empty price and a "Paid" tag when `cost` is empty. Hold those events.
- **`device_bash`** allows at most 180 s per call; split directory adds into batches of about 10.
- **City page caching:** the counts Worker caches city pages for up to an hour (`x-rtt-counts: hit`). Check the stored item through `?format=json`, not the public page.
- **Cross-city events:** an event carded on Atlanta can't be copied to a suburb page with RTTUS, and it would double count. Ask Matt.

## Files in this kit

- `pipeline/`: `disc_build.py`, `us_city.py`, `build_listed.py`, `enrich_listed.py`, `mkbundle_us.py`, `quick_answers.py`, `locale_rules.py`, `marquee.py`, `tracker.py`, `og.py`, `city2/` (conv, parse), `assets/xn_scene.svg`, and `rtt_us_lib_v5.js` (the RTTUS browser library). `us_city.py` reads the live-pages list from `$RTT_LIVE_JSON`.
- `tools/`:
  - `tweak_pages.py`: generator fixes plus extra content, then rebuild
  - `post_source.py`: fixes the source line
  - `split_cards.py`: splits cards per city
  - `uniq.py`: uniqueness, dash and limited-fact check
  - `empty_city.html`: city page stub
  - `live.json`: snapshot of live pages; refresh it from `stridematt/sitemaps`
- `examples/`:
  - `facts_example.json`: 19 real, published facts
  - `tweaks_example.json`
  - `ev_example_christmas-in-canton-ga.json`: a full built event JSON
  - `browser_snippets.js`
  - `shell_snippets.sh`
- `ALL_EXAMPLE_CODE.md`: everything above in one file.
