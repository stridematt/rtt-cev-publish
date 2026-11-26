# San Francisco / Bay Area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the California towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website admin, Squarespace, any browser, or the registry. The lead publishes. Today is Wednesday 2026-11-25. Time zone Pacific (-08:00).

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-ca" and Illinois sources with California ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and the example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-ca with formats ["links"] (maxAge 0); every /christmas-events/<slug> link is already live. Also check neighbor pages you see linked there.
- The San Francisco page already cards some Bay Area events: /mnt/project-files/san-francisco-run/sf_existing_cards.txt (Dickens Fair at Cow Palace, Pacifica youth Nutcracker, Filoli, Oakland Zoo Glowfari, Pleasanton Hometown Holiday, Six Flags Vallejo, Sausalito boat parade and Discovery Museum). Never rebuild those.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> CA" (limit 15) and "<Town> CA holiday events 2026" and work through EVERY result. Round-ups (Macaroni Kid, Mommy Poppins, Red Tricycle/Tinybeans, Bay Area Kid Fun, Bay Area Parent, SF Funcheap, Patch, SFGate, KQED, Eventbrite listings, Facebook pages of third parties, 510families, Marin Mommies, Hey Kiddo) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the city's own holiday page (city hall, Parks and Recreation; many Bay Area cities use CivicPlus, Activenet, CivicRec or PerfectMind registration with prices), the downtown association / chamber / Business Improvement District, the public library calendar (county libraries: San Mateo County Libraries smcl.org, Peninsula Library System, Alameda County Library aclibrary.org, Contra Costa County Library ccclib.org, Marin County Free Library; city libraries in Berkeley, Oakland, San Mateo, Redwood City, Burlingame, etc; LibCal/bibliocommons/communico events: scrape with waitFor 4000), historical societies and museums, big attractions (Oakland Zoo, CuriOdyssey, Lindsay Wildlife, Chabot Space and Science, Ardenwood Historic Farm, Hiller Aviation, Children's Fairyland, Tilden Park, Habitot, Lawrence Hall of Science), farms and tree lots with Santa, theaters and dance schools (Nutcracker, holiday shows), light displays and lit neighborhoods, boat parades, parades, tree lightings, Santa visits, breakfasts with Santa.
3. TRAIN RIDES rank best for us. Look hard: Niles Canyon Railway Train of Lights (Sunol/Fremont), Tilden Park Steam Trains / Redwood Valley Railway holiday runs (Berkeley/Orinda), Golden Gate Live Steamers, Ardenwood railroad, Walnut Creek Model Railroad Society holiday open house, Bay Area Electric Railroad Assn (Rio Vista), Caltrain Holiday Train (Peninsula), Roaring Camp (outside area, list only), SF cable car and Muni holiday streetcars, BART/ACE holiday rides, Livermore/Pleasanton railroad (LPRR), Society for the Preservation of Carter Railroad Resources (Ardenwood), Fremont's train museums, model railroad shows. NEW events also rank well.
4. CivicPlus sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> ca" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note). 2025 pages are NOT proof of 2026 dates: hold if the host only shows last year.

## Write (per town, in /mnt/project-files/san-francisco-run/<town>-ca/)
- facts.json (format as wheaton). page "<town>-ca", page_name "<Town>". Address like "123 Main St, Town, CA 94xxx". cand numbers start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- tweaks.json (format as wheaton tweaks), keyed by the generated slugs.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Train of Lights at Niles Canyon Railway").
- status.json for EVERY town (new or existing): {"slug": "<town>-ca", "exists": true/false, "cards_before": N (existing cards counted from the links scrape), "links_to_sf": true/false (does the existing page link /christmas-events/san-francisco-ca), "eve_page": true/false, "eve_churches": N or null, "new_events": N, "held": [["name","reason"], ...], "other_towns": [["event","town","url"], ...]}. Check the eve page with firecrawl_scrape https://www.rallytakesthetrain.com/christmas-eve-services/<town>-ca (formats ["markdown"], onlyMainContent true): exists only if statusCode 200 and it is a real services list; record how many churches it lists if it says so.
- NEW towns also get page.json per NEWPAGE_SPEC, with California changes: "trains" paragraph covers the Caltrain / BART / ACE / Amtrak Capitol Corridor line and station(s) and Bay Area train attractions near the town; train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/san-francisco-cable-car-museum-california, /museums/san-francisco-railway-museum-california, /museums/market-street-railway-san-francisco-california; others must be verified, else []); "nearby" MUST start with ["san-francisco-ca","San Francisco"], then 2 to 5 EXISTING pages that return 200 (use only these existing Bay Area pages: oakland alameda castro-valley concord danville dublin foster-city hayward livermore moraga oakley pinole pleasant-hill pleasanton richmond san-bruno san-rafael south-san-francisco vallejo napa san-jose; add "-ca"). seo_title under 60 chars like "Christmas Events for Kids in San Mateo, CA 2026". If a new town ends up with 0 verified events, still write page.json and status.json, and say so.

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-ca-run; mkdir -p $RUN; cp /mnt/project-files/san-francisco-run/<town>-ca/facts.json $RUN/
mkdir -p work/<town>-ca; [ -f work/<town>-ca/<town>-ca.html ] || cp ../tools/empty_city.html work/<town>-ca/<town>-ca.html
python3 disc_build.py $RUN/facts.json <town>-ca $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/san-francisco-run/<town>-ca/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <this town's slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/san-francisco-run/<town>-ca/bundle.json.gz winterfest-seattle-wa $A
```
Clear `out/` of the previous town's slugs before building the next town (move them into work/<prev>-run/out_done/) so uniq and bundles only see this town. Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with sf_existing_cards.txt or the town's existing links. Also check generated pages for "–", "—", "!" outside scripts. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.

## ADDED (23:10Z): event pages already live
Many Bay Area event pages already exist even where the town has no city page (e.g. train-of-lights-at-niles-canyon-railway-fremont-ca, magic-of-lights-concord-ca, holiday-tree-lighting-ceremony-walnut-creek-ca, the-great-dickens-christmas-fair-daly-city-ca). Full list: /mnt/project-files/san-francisco-run/bay_existing_event_pages.txt. NEVER rebuild any of them, even with a different name. For a NEW town, list the already-live event pages that belong to it in status.json as "existing_event_pages": [slugs] so the lead can card them on the new page.

## ADDED (23:06Z): cand numbers changed
Use cand 94000 to 94999 only (coordinator rule so metros don't collide). Your start number = the one you were given + 12000 (82100 -> 94100). Fix any facts.json/tweaks.json already written and rebuild their bundle.

## ADDED (Nov 26, supersedes earlier rules where they conflict)
1. Date today is 2026-11-26. Drop events that ended before Nov 26. 2026 season only.
2. PRICE: unknown cost no longer means hold. Build such events with cost exactly "Price not listed" (card, page, facts). Check the built page shows "Price not listed" and no "Paid" tag or "Admission: ." text; if disc_build mishandles it, patch your own kit copy and tell the lead. Public street parades (and shore-viewed boat parades) count as FREE: cost "Free". Still HOLD: canceled, ended, wrong year, unverifiable date/place, ticketed-only events with no way to confirm they are kids/family.
3. Previously held-for-price events are now buildable: re-check each status.json "held" list in your towns plus the held lists in /mnt/project-files/san-francisco-run/PAUSED_STATE.md and build them if the facts are otherwise verified.
4. Stopped helpers' files are UNREVIEWED. For every town with files already present: re-read facts.json, spot-check each event against its host page (dates, address, cost, URL), fix, rebuild, rerun uniq (>=60%), dash/"!" and price checks, and rewrite bundle.json.gz. Do not trust earlier status.json.
5. Every NEW town needs page.json (NEWPAGE_SPEC) AND status.json. Every town (new or existing) then gets its intro via: python3 /mnt/project-files/tools/make_intro.py <town>-ca "<Name>" <town>/page.json --cards <cards.json> [--existing <parsed live cards json>] --hub san-francisco-ca:San Francisco --state california:California. For EXISTING towns first fetch the live page rawHtml with firecrawl (formats ["rawHtml"], maxAge 0; it is huge so it lands in a file: read the file with python, take JSON ["rawHtml"]), save it, and run /home/claude/rtt/rtt-city-kit/pipeline/city2/parse.py <html> <out.json> to get existing cards. The run cards.json is in your kit copy work/<town>-ca-run/cards.json. Intro text must stay free of dashes and "!".
6. Move rule (Rally): when a suburb gets its own page, its events leave the San Francisco page and appear on the town page. For your towns, list in status.json "move_from_sf": [card slugs on the SF page that physically belong to your town] (see sf_existing_cards.txt); the lead removes them from SF. Do NOT rebuild those events as new pages; instead include them in status.json "existing_event_pages" so the lead cards them on the town page.
7. Use only Sonnet-level effort: be economical, no repeated scrapes of the same page, no research beyond the brief's order of sources.
