# San Diego-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the California towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, any browser, or the registry. The lead publishes.

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-ca" and Illinois sources with California / San Diego County ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-ca with formats ["links"] and maxAge 0; every /christmas-events/<slug> link is already live.
- The San Diego page already cards many suburb events (Coronado, Del Mar, El Cajon, Carlsbad LEGOLAND, Encinitas Lightscape, Santee Lakes, Chula Vista Starlight Parade and Gaylord, Bonita, Campo North Pole Limited, Oceanside, Poway, La Mesa). Full list: /mnt/project-files/san-diego-run/sd_existing_cards.txt. Never rebuild those, and never rebuild the same event under a new name (match by host + date + venue).
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> CA" (limit 15) and "<Town> CA holiday events 2026" and work through every result. Round-ups (San Diego Family Magazine, Macaroni Kid, Mommy Poppins, Patch, Times of San Diego, NBC 7, Fox 5, CBS 8, SD Union-Tribune, Axios, Eventbrite listings, Allevents, Facebook pages of third parties, sandiego.org listings that just restate a host) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the city's own holiday/events page and Parks and Recreation (CivicPlus, ActiveNet / RecDesk for prices), the chamber / downtown / Main Street / village association, the San Diego County Library or city library calendar (sdcl.org, sandiego.gov/public-library, LibCal / BiblioCommons events; scrape with waitFor 4000), historical society and museums, farms and tree lots with Santa, light displays and drive-throughs, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events (posadas, nativity walk-throughs), malls' Santa (Westfield etc. only when the mall's own page prints price), and holiday trains and trolleys.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard: Pacific Southwest Railway Museum (Campo, already carded North Pole Limited), Poway-Midland Railroad (Old Poway Park), San Diego Model Railroad Museum (Balboa Park), National City Depot, Coaster/Sprinter/MTS trolley holiday trains, Santa trains at parks (e.g. kiddie trains at Santee Lakes, Kit Carson Park, Linda Vista, Chula Vista's Rohr Park live steamers / Southwest Live Steamers), Holiday Express rides.
4. CivicPlus city sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths. Granicus/OpenCities pages need waitFor too.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> ca" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 26, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters, toy drives. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/san-diego-run/<town>-ca/)
- facts.json (format as wheaton). page "<town>-ca", page_name "<Town>". Address like "123 Main St, Town, CA 92020". cand numbers start at the number you were given, +1 per event (never go past your block of 100). Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Holiday Express Train Rides at Old Poway Park"). Rally's Search Console data: our pages win on small/new events and train rides; titles must carry the exact event name plus the venue/park alias people type.
- NEW towns also get page.json per NEWPAGE_SPEC, with these California changes: "trains" paragraph covers the nearest COASTER / SPRINTER / MTS Trolley / Amtrak Pacific Surfliner station(s) and San Diego-area train attractions (Pacific Southwest Railway Museum in Campo, Poway-Midland Railroad, San Diego Model Railroad Museum, National City Depot); train_links only for these verified pages (they return 200): ["/museums/san-diego-model-railroad-museum-california","San Diego Model Railroad Museum",...], ["/museums/national-city-depot-museum-california","National City Depot Museum",...], ["/museums/poway-midland-railroad-california","Poway-Midland Railroad",...] (pick the relevant 1 to 3, write your own one-liners). "nearby" MUST start with ["san-diego-ca","San Diego"], then 2 to 5 EXISTING pages that return 200 (existing San Diego County pages: chula-vista-ca la-mesa-ca escondido-ca oceanside-ca poway-ca san-marcos-ca vista-ca; other new towns in this run do not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Carlsbad, CA 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-ca-run; mkdir -p $RUN; cp /mnt/project-files/san-diego-run/<town>-ca/facts.json $RUN/
mkdir -p work/<town>-ca; [ -f work/<town>-ca/<town>-ca.html ] || cp ../tools/empty_city.html work/<town>-ca/<town>-ca.html
python3 disc_build.py $RUN/facts.json <town>-ca $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/san-diego-run/<town>-ca/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/san-diego-run/<town>-ca/bundle.json.gz winterfest-seattle-wa $A
```
Clear out/ between towns (or check that the bundle only holds this town's slugs). Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with sd_existing_cards.txt or the town page's live links. Also check generated pages for "–", "—", "!" outside scripts, and that times show -08:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.
