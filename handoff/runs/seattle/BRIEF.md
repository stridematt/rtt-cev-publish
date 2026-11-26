# Seattle-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Washington towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, any browser, or the registry. The lead publishes. Today is Wednesday, November 25, 2026. Washington is Pacific time (the kit sets -08:00 itself).

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-wa" and Illinois sources with Washington ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-wa with formats ["links"] and maxAge 0; every /christmas-events/<slug> link is already live.
- The Seattle page already cards many suburb events (Snowflake Lane and Garden d'Lights in Bellevue, Redmond Lights, KCLS library programs in Covington, Des Moines, Federal Way, Maple Valley, Mercer Island, Pacific, the North Pole Limited in North Bend, Victorian Christmas Festival in Puyallup, Lights of Christmas in Stanwood, Tulalip Lights and Ice). Full list: /mnt/project-files/seattle-run/seattle_existing_cards.txt. Never rebuild those.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> WA" (limit 15) and "<Town> WA holiday events 2026" and work through every result. Round-ups (ParentMap, Seattle's Child, Macaroni Kid, Red Tricycle/Tinybeans, Patch, The Stranger, Seattle Met, Seattle Times, KING 5, KOMO, MyNorthwest, Everout, Eventbrite listings, mykidlist, third-party Facebook) are DISCOVERY ONLY; never link to them or use them as fact sources. ParentMap's holiday calendars and "Santa" and "holiday lights" guides are the best discovery lists for this area: read them.
2. Then, in order: the city's own holiday/events page and parks and recreation calendar (many use CivicPlus or ActiveNet/RecDesk/CivicRec for registration with prices), the tourism bureau (Visit Seattle, Visit Bellevue, Snohomish County Tourism / snohomish.org, Seattle Southside / seattlesouthside.com, Visit Kirkland), the downtown association or chamber, the library calendar (King County Library System kcls.org, Seattle Public Library spl.org, Sno-Isle Libraries sno-isle.org; scrape with waitFor 4000), historical society and museums, farms and tree farms with Santa, light displays, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains and boats (Northwest Railway Museum, Sounder/Link, Seattle Center Monorail, Argosy Christmas Ships, Mt. Rainier Railroad, Chehalis-Centralia Railroad, Santa at train shops and model railroads), parades, tree lightings, Santa visits, breakfasts with Santa, ice rinks with Santa.
3. Train rides, Santa trains, boat parades and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> wa" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Library programs: KCLS, SPL and Sno-Isle state that their programs are free on their own sites; you may use that only if you find and cite that statement on the library's own site. Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/seattle-run/<town>-wa/)
- facts.json (format as wheaton). page "<town>-wa", page_name "<Town>". Address like "123 Main St, Town, WA 98000". cand numbers (Seattle run range 96000 to 96999) start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train at Northwest Railway Museum"). Use the host's exact event name.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Washington changes: "trains" paragraph covers Sounder commuter rail, Link light rail or Amtrak stations near the town, the Northwest Railway Museum in Snoqualmie, and other real train attractions near it; train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/northwest-railway-museum-snoqualmie-washington, /museums/seattle-center-monorail-washington, /museums/washington-state-history-museum-tacoma), else []; "nearby" MUST start with ["seattle-wa","Seattle"], then 2 to 5 existing pages that return 200 (existing pages in this area: bellevue-wa redmond-wa issaquah-wa mercer-island-wa kent-wa auburn-wa maple-valley-wa edmonds-wa lynnwood-wa everett-wa marysville-wa monroe-wa tacoma-wa puyallup-wa; other new towns in this run may not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Renton, WA 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-wa-run; mkdir -p $RUN; cp /mnt/project-files/seattle-run/<town>-wa/facts.json $RUN/
mkdir -p work/<town>-wa; [ -f work/<town>-wa/<town>-wa.html ] || cp ../tools/empty_city.html work/<town>-wa/<town>-wa.html
python3 disc_build.py $RUN/facts.json <town>-wa $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/seattle-run/<town>-wa/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/seattle-run/<town>-wa/bundle.json.gz winterfest-seattle-wa $A
```
Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with seattle_existing_cards.txt or the town page's existing links. Also check generated pages for "–", "—", "!" outside scripts. Check every event time in the generated JSON-LD carries -08:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.

## ADDENDUM 2026-11-26 (supersedes "unknown cost = HOLD" and the same-host merging limit where it conflicts)
- Rally's new rule: an event that was held ONLY because no price is printed is now built, with cost exactly "Price not listed" (the kit renders "Admission: price not listed" and a Paid tag; that is accepted). If any official page prints a price, use it. Public parades are free: cost "Free".
- Still HOLD: canceled, sold out, ended, past, wrong year (2025 dates), conflicting dates/times that official sources do not settle, Facebook-only with no official page, adult-only, plain markets, fun runs.
- uniq.py's "price not" issue flag is expected for these pages; ignore only that flag. Every page still needs 60%+ unique and no other issue.
- Output for this addendum round: DO NOT edit existing facts.json, tweaks.json or bundle.json.gz. Write facts_held.json, tweaks_held.json and bundle_held.json.gz in the same town folder (for Seattle: facts_c.json etc. as named in your task). Use ONLY the cand numbers given in your task. Page-level intro work is done by the lead.
- Check slugs against seattle_existing_cards.txt, the town page's live links, and the other facts*.json files in /mnt/project-files/seattle-run/.
- For a town that has no page yet and no folder bundle (Snoqualmie, North Bend, Carnation, Duvall): if after this rule 3 or more events qualify, build facts, tweaks, page.json (per NEWPAGE_SPEC) and bundle.
- Use Sonnet-level effort: be efficient, do not re-research events already verified in the existing facts files.
