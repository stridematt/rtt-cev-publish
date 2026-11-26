# Portland-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Oregon/Washington towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website admin, Squarespace, any browser, or the registry. The lead publishes.

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-or"/"-wa" and Illinois sources with Oregon/Washington ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-<st> with formats ["links"]; every /christmas-events/<slug> link is already live.
- The Portland page (/christmas-events/portland-or) already cards these suburb events. Rally's rule (2026-11-25): when a suburb gets its own page, its events MOVE from the Portland (or Vancouver) page onto the town page; the lead handles the move. Never rebuild them, but list them in page.json already_carded, since they count as your town's events:
  Beaverton: beaverton-winter-lights-tree-lighting-or, build-your-own-gingerbread-house-beaverton-or, kids-holiday-dance-party-beaverton-or, holiday-storytime-beaverton-or (Beaverton City Library)
  Tigard: bridgeport-village-holiday-parade-and-celebration-tigard-or; Washington Square Santa (photos-with-santa-at-washington-square-portland-or, santa-cares-portland-or)
  Forest Grove: holiday-in-the-grove-forest-grove-or (library). Cornelius: gingerbread-houses-casitas-de-jengibre-cornelius-or
  Gresham: black-family-storytime-winter-joy-for-the-soul-gresham-or. Happy Valley: tree-lighting-ceremony-happy-valley-or
  Sherwood: sherwood-holiday-festival-or. North Plains: jingle-thru-north-plains-parade-or
  Bethany Village tree lighting, Vancouver: vancouver-community-tree-lighting-wa
  Portland city cards: ZooLights, Pioneer Courthouse Square tree lighting, Holiday Express (Oregon Rail Heritage Center), Grotto Festival of Lights, Winter Wonderland PIR, Christmas Ships, Peacock Lane, Lan Su Dongzhi, OBT Nutcracker, Classical Ballet Academy Nutcracker, Dominic Walsh Storybook Nutcracker, Holiday Pops, Home Alone in Concert, Grinchmas Candie Cane Hunt (Glendoveer), Christmas on the Campground, A Christmas Carol (Portland Playhouse), Winter Family Crafts (Kenton Library), Portland Holiday Market.
  In your reply, list for your town which of these already-carded events belong to it (the lead links them from the new town page; do not build cards for them).
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> OR" (or WA) (limit 15) and "<Town> holiday events 2026" and work through every result. Round-ups (Macaroni Kid, PDX Parent, Mommy Poppins, Portland Monthly, Willamette Week, Oregonlive, KGW/KATU/KOIN, Patch, Eventbrite listings, mykidlist, Travel Portland articles, third-party Facebook pages) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the city's own holiday/events page and parks and recreation department (Tualatin Hills Park & Rec District thprd.org for Beaverton/Aloha, North Clackamas Parks (NCPRD) for Milwaukie/Happy Valley, Chehalem Park & Rec for Newberg, Vancouver Parks), the tourism bureau (Explore Washington County / tualatinvalley.org, Travel Portland event calendar, Visit Vancouver USA, Oregon's Mt. Hood Territory / mthoodterritory.com, Visit McMinnville, Willamette Valley), downtown association/chamber, library calendars (WCCLS libraries, Multnomah County Library, Clackamas libraries, Fort Vancouver Regional Library fvrl.org; scrape with waitFor 4000), historical societies and museums (Evergreen Aviation & Space Museum, End of the Oregon Trail Center, Pearson Field), farms (tree farms with Santa, light trails), theaters and dance schools (Nutcracker, holiday shows), malls with Santa, light displays, parades, tree lightings, Santa visits, breakfasts with Santa.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard for them: Mt. Hood Railroad Polar Express/Christmas trains, Chelatchie Prairie Railroad (Battle Ground/Yacolt) Christmas trains, Molalla Train Park, Shady Dell Pacific Railroad, Willamette Shore Trolley (Lake Oswego), TriMet/MAX holiday events, Oregon Electric Railway Museum, Westside Express Service, Santa at the station.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town>" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note). Before building, check each event slug against the town page's existing links and the Portland list above.

## Write (per town, in /mnt/project-files/portland-run/<town>-<st>/)
- facts.json (format as wheaton). page "<town>-<st>", page_name "<Town>". Address like "123 Main St, Beaverton, OR 97005". cand numbers start at the number you were given, +1 per event. Portland run range is 95000 to 95999 only (lead renumbered: add 21000 to any 74xxx number). Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Christmas Train at Chelatchie Prairie Railroad").
- NEW towns also get page.json per NEWPAGE_SPEC, with these changes: "trains" paragraph covers MAX/WES/TriMet or C-TRAN and the local train attractions (Oregon Rail Heritage Center, Mt. Hood Railroad, Chelatchie Prairie Railroad, Washington Park and Zoo Railway, Willamette Shore Trolley, etc.); train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/oregon-rail-heritage-center-portland, /museums/washington-park-and-zoo-railway-portland-oregon), else []; "nearby" MUST start with ["portland-or","Portland"] (Washington towns: ["vancouver-wa","Vancouver"] first, then Portland), then 1 to 4 existing pages that return 200 (existing pages nearby: portland-or, vancouver-wa, milwaukie-or, wilsonville-or, salem-or, woodburn-or; other new towns in this run do not exist yet, do not list them). Add "already_carded": [[slug, name], ...] listing events of your town already live on the Portland page. seo_title under 60 chars like "Christmas Events for Kids in Beaverton, OR 2026".
- Check whether /christmas-eve-services/<town>-<st> exists (firecrawl_scrape formats ["links"], statusCode 200 and title mentions the town). Report yes/no.

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<slug>-run; mkdir -p $RUN; cp /mnt/project-files/portland-run/<slug>/facts.json $RUN/
mkdir -p work/<slug>; [ -f work/<slug>/<slug>.html ] || cp ../tools/empty_city.html work/<slug>/<slug>.html
python3 disc_build.py $RUN/facts.json <slug> $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/portland-run/<slug>/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/portland-run/<slug>/bundle.json.gz winterfest-seattle-wa $A
```
Clear out/ between towns (or check that only your town's slugs go in each bundle). Bundle must be under 3.8 MB. Check generated pages for "–", "—", "!" outside scripts. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing, about 10 s later).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, already-carded events that belong to it, events found that belong to other towns, Christmas Eve services page yes/no, best source, method fix.
