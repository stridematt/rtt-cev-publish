# Miami-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Florida towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, a browser, the registry or GitHub. The lead publishes. Several metro runs share the same tools today, so stay inside your own folders.

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-fl" and Illinois sources with Florida ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- The Miami page already cards ~48 events, many in suburbs (Coral Gables, Palmetto Bay, Pinecrest, Hialeah, Kendall, Doral, Cutler Bay, North Miami Beach, Miami Beach, Aventura, Key Biscayne). Full list: /mnt/project-files/miami-run/miami_existing_cards.txt. Never rebuild those. They stay on Miami.
- Existing town page (hialeah-fl, homestead-fl, miami-fl): firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-fl with formats ["links"], maxAge 0; every /christmas-events/<slug> link is already live.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it. Events in unincorporated Miami-Dade with a "Miami, FL" mailing address (Zoo Miami, Tropical Park, Gold Coast Railroad Museum) belong to Miami.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> FL" (limit 15) and "<Town> FL holiday events 2026" and work through EVERY result. Round-ups (Miami Kids Magazine, Macaroni Kid, Mommy Poppins, Kids Out and About, Miami New Times, Time Out, Axios, Patch, Secret Miami, Miami on the Cheap, South Florida Family Fun, Eventbrite listings, Facebook pages of third parties, mykidlist) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the city's own holiday/events page and parks and recreation calendar (many FL cities use CivicPlus, Granicus/OpenCities or ActiveNet/RecDesk/CivicRec for registration and prices), the tourism bureau (miamiandbeaches.com, visitlauderdale.com, the city's own visit-site) as discovery, the CRA/downtown/business district, the library calendar (Miami-Dade Public Library System mdpls.org events, Broward County Library bcl events, city libraries in Coral Gables etc. that are part of MDPLS; scrape with waitFor 4000; library events with no printed cost are HELD), museums and attractions, farms, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains (Gold Coast Railroad Museum Santa train, Brightline, Tri-Rail, Metrorail/Metromover holiday rides, mini trains in parks), boat parades (Winterfest, Miami holiday boat parades), light displays, parades, tree lightings, snow days, Santa visits, breakfasts with Santa.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus city sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> fl" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note). Never write that a 2025 event happened from a preview alone; say "was planned".

## Write (per town, in /mnt/project-files/miami-run/<town>-fl/)
- facts.json (format as wheaton). page "<town>-fl", page_name "<Town>". Address like "123 Main St, Town, FL 33000". cand numbers start at the number you were given, +1 per event. Two paras of 50 to 70 words each. Times use Eastern time.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO (from our Search Console data): name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train at Gold Coast Railroad Museum", "Snow Day at Vista View Park"). Big established events rank below official sites; new, small, train and Santa events win.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Florida changes: "trains" paragraph covers the nearest Metrorail/Metromover, Tri-Rail and Brightline stations and the Gold Coast Railroad Museum (verify facts); train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/gold-coast-railroad-museum-miami-florida); "nearby" MUST start with ["miami-fl","Miami"], then 2 to 5 existing pages that return 200 (existing area pages: hialeah-fl homestead-fl fort-lauderdale-fl coral-springs-fl tamarac-fl pompano-beach-fl deerfield-beach-fl; other new towns in this run do not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Doral, FL 2026". Remember South Florida has no snow: towns import snow for "snow days"; say so only if the source does.
- Also check whether https://www.rallytakesthetrain.com/christmas-eve-services/<town>-fl exists (firecrawl_scrape, formats ["links"], read metadata.statusCode). Report the result per town.

## Build (in your own kit copy; never use another agent's folder)
```
[ -d /home/claude/rtt/rtt-city-kit ] || { mkdir -p /home/claude/rtt && cd /home/claude/rtt && tar xzf /mnt/project-files/rtt-city-kit.tar.gz; }
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-fl-run; mkdir -p $RUN; cp /mnt/project-files/miami-run/<town>-fl/facts.json $RUN/
mkdir -p work/<town>-fl; [ -f work/<town>-fl/<town>-fl.html ] || cp ../tools/empty_city.html work/<town>-fl/<town>-fl.html
python3 disc_build.py $RUN/facts.json <town>-fl $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/miami-run/<town>-fl/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/miami-run/<town>-fl/bundle.json.gz winterfest-seattle-wa $A
```
Clear out/ between towns (or check that only your town's slugs go in each bundle). Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with miami_existing_cards.txt or the town page's live links. Also check generated pages for "–", "—", "!" outside scripts. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read about ten seconds after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, Christmas Eve services page yes/no, best source, method fix.
