# Houston-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Texas towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website admin, Squarespace, any browser, or the registry. The lead publishes. Today is Wednesday, November 25, 2026. Texas (Houston area) is Central time: every event time in the JSON-LD must carry -06:00 (the kit sets it from the "tx" state code).

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-tx" and Illinois sources with Texas ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-tx with formats ["links"] and maxAge 0; every /christmas-events/<slug> link on it is already live.
- The Houston page already cards many suburb events (Katy x5, Sugar Land Holiday Lights, Conroe x2, Pearland x2, Tomball German Christmas Market, Humble, Jacinto City, La Porte, League City Nutcracker in the Park, The Woodlands x2, Galveston x3, Baytown parade, Kemah boat parade). Full list: /mnt/project-files/houston-run/houston_existing_cards.txt. Never rebuild those. They stay on Houston.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it. Events inside Houston city limits (Kingwood, Clear Lake, Memorial, Heights, Energy Corridor, Uptown, Galleria) belong to houston-tx.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> TX" (limit 15) and "<Town> TX holiday events 2026" and work through every result. Round-ups (Houston Chronicle, Chron, Click2Houston/KPRC, KHOU, ABC13, Houston Press, CultureMap, Axios, Houstonia, Mommy Poppins, Macaroni Kid, Houston Family Magazine, Bay Area Houston Magazine, Community Impact, Patch, Eventbrite listings, mykidlist, third-party Facebook) are DISCOVERY ONLY; never link to them or use them as fact sources. Community Impact and Houston Family Magazine holiday lists are good discovery for suburbs: read them.
2. Then, in order: the city's own holiday/events page and parks and recreation calendar (many Texas cities use CivicPlus, CivicRec, RecDesk, ActiveNet or Amilia for registration with prices), the tourism bureau (Visit Houston, Visit Fort Bend / fortbendcountytx, Visit Katy / katytexas, Visit The Woodlands, Visit Conroe, Clear Lake Area / visitclearlake, Visit Galveston, Visit Baytown, Visit Pearland, Visit Spring / Old Town Spring), the chamber or downtown/management district, the library calendar (Harris County Public Library hcpl.net, Houston Public Library houstonlibrary.org, Fort Bend County Libraries fortbendlibraries.gov, Montgomery County Memorial Library System, Brazoria County Library System, Galveston County libraries; scrape with waitFor 4000), master-planned communities' public events (Cinco Ranch, Bridgeland, Towne Lake, Sienna, Riverstone, Cross Creek Ranch, Shadow Creek Ranch: only if open to the public with a printed price), historical sites and museums, farms and tree farms with Santa, light displays, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains (Polar Express at Galveston Railroad Museum, Rosenberg Railroad Museum, Texas State Railroad, Houston Zoo train, Hermann Park Railroad, Santa train rides at parks and farms, model railroad shows), boat parades, parades, tree lightings, Santa visits, breakfasts with Santa, ice rinks and snow days with Santa.
3. Train rides, Santa trains, boat parades and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> tx" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Library programs: only call them free if you find and cite the library's own statement that programs are free; otherwise HOLD. Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/houston-run/<town>-tx/)
- facts.json (format as wheaton). page "<town>-tx", page_name "<Town>". Address like "123 Main St, Town, TX 77000". cand numbers start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the host's exact event name plus the venue or park when natural (e.g. "Santa Train at Rosenberg Railroad Museum"). That is what parents search and what ranks for us.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Texas changes: "trains" paragraph covers real train links near the town (METRORail in Houston, Amtrak Sunset Limited at Houston station, the Union Pacific lines through town if sourced, Rosenberg Railroad Museum, Galveston Railroad Museum, Hermann Park Railroad, Texas State Railroad in Rusk, etc.); train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/rosenberg-railroad-museum-texas, /museums/galveston-railroad-museum-texas), else []; "nearby" MUST start with ["houston-tx","Houston"], then 2 to 5 existing pages that return 200 (existing pages in this area: baytown-tx bellaire-tx conroe-tx deer-park-tx galveston-tx la-porte-tx league-city-tx magnolia-tx montgomery-tx pasadena-tx pearland-tx texas-city-tx the-woodlands-tx; other new towns in this run may not exist yet, do not list them). Add "already_carded": [[slug, name], ...] listing events of your town already live on the Houston page (from houston_existing_cards.txt). seo_title under 60 chars like "Christmas Events for Kids in Sugar Land, TX 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-tx-run; mkdir -p $RUN; cp /mnt/project-files/houston-run/<town>-tx/facts.json $RUN/
mkdir -p work/<town>-tx; [ -f work/<town>-tx/<town>-tx.html ] || cp ../tools/empty_city.html work/<town>-tx/<town>-tx.html
python3 disc_build.py $RUN/facts.json <town>-tx $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/houston-run/<town>-tx/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/houston-run/<town>-tx/bundle.json.gz winterfest-seattle-wa $A
```
Clear out/ between towns (or check that `ls out/` only lists this town's slugs before bundling). Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with houston_existing_cards.txt or the town page's existing links. Also check generated pages for "–", "—", "!" outside scripts. Check every event time in the generated JSON-LD carries -06:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read about ten seconds after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, already-carded events that belong to it, events found that belong to other towns, Christmas Eve services page yes/no (pages exist for houston, galveston, katy, magnolia, montgomery, pearland, the-woodlands), best source, method fix.

## Added 2026-11-25 23:20Z (Rally: city pages need an intro like the Chicago page)
For every town page you build or change, also write /mnt/project-files/houston-run/<town>-tx/intro.json:
{"lede": "Rally the corgi has sniffed out the best Christmas events for kids in <Town> for 2026, and here is what he found: N family events, M of them free. The magic runs from <first date> (<event>) through <last date>, with <event> (<date>), <event> (<date>) and <event> (<date>) along the way. We check every date on the host's own website, and each listing links straight there.",
 "found": ["N Christmas events for kids in <Town>", "M free events, including ...", "Meet Santa: ...", "Parades and tree lightings: ...", "Trains: ... (if any)", "Season: <first> to <last>"],
 "houston_line": "Planning a bigger day out? <Town> families also use our guide to Christmas activities for kids in Houston, which covers ..."}
Counts include your new events plus the events already live on the town's page (and for new towns, its already_carded Houston events). Only facts from your facts.json or the live page. Same writing rules (no dashes, no exclamation marks).
(Lead converts intro.json into page.json "intro_html", "seo_title", "seo_description" for every town, existing ones too. You only write intro.json.)

## Added 23:20Z: Rally rule, move suburb events off Houston
When a town has its own page, its events move OFF the Houston page onto the town page (see /mnt/project-files/houston-run/houston_moves.json). For your town, treat those events as part of the town page: count them in intro.json and mention them in page.json content where relevant. In page.json, name the list "move_from_houston" instead of "already_carded". Do not rebuild those event pages; the lead moves the cards.

## UPDATED RULES 2026-11-26 (these override anything above that conflicts)
- Model: Sonnet only. At most 3 helpers total for the whole run, so each helper owns many towns. Be economical: do not re-research what a folder already holds.
- Price rule changed (Rally): an event held only because no price is printed is now BUILT with cost "Price not listed" (2026 events only). Still hold canceled, ended, wrong-year, past, adult-only or unverifiable events. Public parades count as free: cost Free. A host's own social post still counts as price proof.
- Town rule: own page for towns of 20,000+; smaller towns only with 3 or more verified events, otherwise fold those events into the nearest larger town's page (say so in your reply). Houston (core) never gets suburb events: events in a suburb with a page go on that suburb's page, not on houston-tx.
- Every town folder must end with: facts.json, tweaks.json, bundle.json.gz, intro.json (Chicago-style lede, see the intro.json section) and, for NEW towns, page.json (with "move_from_houston" from houston_moves.json where it applies, "nearby", train links, FAQ, sources).
- Earlier partial work (unreviewed) may exist in the town folder: review it, keep what verifies, fix or drop the rest, then finish. cand numbers must stay inside your assigned range.
- Dates: today is Nov 26, 2026. Drop events whose last date is before Nov 26.
