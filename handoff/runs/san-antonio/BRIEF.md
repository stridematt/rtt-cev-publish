# San Antonio-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Texas towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, any browser, or the registry. The lead publishes.

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-tx" and Illinois sources with Texas / Bexar, Comal, Guadalupe, Kendall County ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-tx with formats ["links"] and maxAge 0; every /christmas-events/<slug> link is already live.
- The San Antonio page already cards many suburb events (New Braunfels Santa's Ranch, Cowboy Kringle and Gruene lighting; Boerne Dickens on Main, Oma's Christmas Fair, Weihnachts Parade; Helotes Lighting of the Lights and parade; Cibolo Holidays on Main; Seguin Holiday Stroll; Fredericksburg; Stonewall). New Braunfels page cards Wassailfest; Schertz page cards the 3 Holidazzle events. Full list: /mnt/project-files/san-antonio-run/sa_existing_cards.txt. Never rebuild those, and never rebuild the same event under a new name (match by host + date + venue).
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> TX" (limit 15) and "<Town> TX holiday events 2026" and work through every result. Round-ups (MySA / San Antonio Express-News, San Antonio Current, KSAT, KENS 5, News 4 SA, San Antonio Report, Community Impact, Macaroni Kid, Mommy Poppins, Patch, Eventbrite listings, Allevents, Facebook pages of third parties, visitsanantonio.com or visitnbtx.com listings that just restate a host, mysanantonio "things to do" lists) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the city's own holiday/events page and Parks and Recreation (CivicPlus, ActiveNet / RecDesk / CivicRec for prices), the chamber / downtown / Main Street association, the tourism bureau (visitsanantonio.com, visitnbtx.com, visitseguin.com: discovery, but its event listing may serve as an official calendar source if it names the host), the library calendar (mysapl.org events, nbtexas.org library, LibCal / BiblioCommons / Communico; scrape with waitFor 4000), historical society and museums, farms and tree lots with Santa, light displays and drive-throughs, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events (Las Posadas, nativity walk-throughs, living nativities), malls' Santa (only when the mall's own page prints price), and holiday trains.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard: San Antonio Railroad Heritage Museum (Elmendorf), Texas Transportation Museum (San Antonio, Santa/holiday train rides), Brackenridge Park Eagle miniature train, Polar Express or Santa trains at parks and farms, Hill Country train rides, live steamers, model train holiday displays (e.g. at museums, libraries, the Witte), Holiday Express rides. Also Las Posadas and Mexican Christmas traditions (Paseo del Rio, Market Square / Historic Market Square, La Villita, Mission San Jose, Hispanic heritage events) and German traditions (New Braunfels, Boerne Weihnachtsmarkt).
4. CivicPlus city sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths. Granicus/OpenCities pages need waitFor too.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> tx" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 26, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters, toy drives. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/san-antonio-run/<town>-tx/)
- facts.json (format as wheaton). page "<town>-tx", page_name "<Town>". Address like "123 Main St, Town, TX 78155". cand numbers start at the number you were given, +1 per event (never go past your block of 100). Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train Rides at the Texas Transportation Museum"). Rally's Search Console data: our pages win on small/new events and train rides; titles must carry the exact event name plus the venue/park alias people type.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Texas changes: "trains" paragraph covers the nearest Amtrak station (San Antonio Sunset Limited / Texas Eagle; San Marcos), the Union Pacific heritage near the town, and San Antonio-area train attractions (San Antonio Railroad Heritage Museum in Elmendorf, Texas Transportation Museum, Brackenridge Park Eagle, Austin Steam Train Hill Country Flyer in Cedar Park); only facts you read on a source. train_links only for these verified pages (check each returns 200): ["/museums/san-antonio-railroad-heritage-museum-elmendorf-texas","San Antonio Railroad Heritage Museum",...], ["/museums/austin-steam-train-association-cedar-park-texas","Austin Steam Train Association",...]; also ["/museums/texas-transportation-museum-san-antonio","Texas Transportation Museum",...] (verified 200; the -texas suffix 404s). "nearby" MUST start with ["san-antonio-tx","San Antonio"], then 2 to 5 EXISTING pages that return 200 (existing area pages: new-braunfels-tx schertz-tx san-marcos-tx kyle-tx; other new towns in this run do not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Seguin, TX 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-tx-run; mkdir -p $RUN; cp /mnt/project-files/san-antonio-run/<town>-tx/facts.json $RUN/
mkdir -p work/<town>-tx; [ -f work/<town>-tx/<town>-tx.html ] || cp ../tools/empty_city.html work/<town>-tx/<town>-tx.html
python3 disc_build.py $RUN/facts.json <town>-tx $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/san-antonio-run/<town>-tx/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/san-antonio-run/<town>-tx/bundle.json.gz winterfest-seattle-wa $A
```
Times use Central offset -06:00. Clear out/ between towns (or check that the bundle only holds this town's slugs). Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with sa_existing_cards.txt or the town page's live links. Also check generated pages for "–", "—", "!" outside scripts, and that times show -06:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.

## Intro section (Rally, 2026-11-25): every city page needs the Chicago-style intro
Handoff format (coordinator standard): every town's page.json (existing towns too) holds "intro_html", "seo_title" and "seo_description", with bundle.json.gz next to it. The lead writes intro_html after the build, matching the live markup on schertz-tx / chicago-il:
`<p class="rtt-post__lede">` ("Rally the corgi has sniffed out..." with counts, date range, highlights, Texas guide link) + `<p class="rtt-metro-up">` (link up to San Antonio for suburbs; link to suburbs on San Antonio) + `<div class="rtt-post__tldr"><p class="rtt-post__tldr-k">What Rally found in <Town></p><ul>...</ul></div>`.
Workers: put 3 to 5 sourced "highlight" facts per town in page.json under "highlights" (strings) so the lead can use them.
