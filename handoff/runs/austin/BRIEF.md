# Austin-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Texas towns you are given, verify them, and BUILD the kit bundle for each town (unless told research only). You never touch the website, Squarespace, any browser, or the registry. The lead publishes. Today is Wednesday, November 25, 2026. Austin is Central time; every event time in JSON-LD must carry -06:00 (the kit sets it from the "tx" state code).

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-tx" and Illinois sources with Texas ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-tx with formats ["links"] and maxAge 0; every /christmas-events/<slug> link is already live.
- The Austin page already cards 47 events, many in suburbs: Light Up the Lake (Round Rock), Cedar Park tree lighting, Breakfast with Santa and Photos with Santa (Cedar Park), Old Town Christmas Festival (Leander), Lighting of the Square and Hometown Christmas Stroll (Georgetown), Sights and Sounds of Christmas (San Marcos), Budafest and Buda Holiday Lights, Lights on Lakeway, Deck the Park (Manor), North Pole Flyer (Bertram), Bastrop, Wimberley, Taylor, Liberty Hill, Marble Falls, Salado. Full list: /mnt/project-files/austin-run/austin_existing_cards.txt. Never rebuild those (same event under a slightly different name counts as the same event).
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> TX" (limit 15) and "<Town> TX holiday events 2026" and work through every result. Round-ups (Do512 / Do512 Family, Austin Moms, Austin Macaroni Kid, Mommy Poppins, Kids Out and About, Austin Chronicle, KXAN, KVUE, CultureMap, Austin American-Statesman, Community Impact, Patch, Eventbrite listings, mykidlist, third-party Facebook) are DISCOVERY ONLY; never link to them or use them as fact sources. Do512 Family and Community Impact's holiday guides are the best discovery lists for this area: read them.
2. Then, in order: the city's own holiday/events page and parks and recreation calendar (many use CivicPlus, ActiveNet, RecDesk, CivicRec or Amilia for registration with prices), the tourism bureau (Visit Austin, Visit Round Rock, Visit Georgetown, Visit San Marcos, Cedar Park / Leander chambers), downtown association or chamber, the library calendar (Austin Public Library library.austintexas.gov, Round Rock, Cedar Park, Pflugerville, Georgetown libraries; scrape with waitFor 4000), museums (Thinkery, Bullock Texas State History Museum, Austin Nature and Science Center, Williamson Museum, Neill-Cochran House), zoos/farms/ranches (Austin Zoo, Pioneer Farms, Sweet Berry Farm, Barton Hill Farms, Elgin Christmas Tree Farm), light displays, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains (Austin Steam Train Association, Capital MetroRail, model railroads, mall and park trains), parades, tree lightings, Santa visits, breakfasts with Santa, skating rinks with Santa.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths. Austin city pages (austintexas.gov) often load with JS; use waitFor.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> tx" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Library programs: only call them free if you find and cite the library's own statement. Unknown cost = HOLD. Drop past events (before Nov 26, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/austin-run/<town>-tx/)
- facts.json (format as wheaton). page "<town>-tx", page_name "<Town>". Address like "123 Main St, Round Rock, TX 78664". cand numbers start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO (from Search Console): name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train at Old Settlers Park"). Use the host's exact event name.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Texas changes: "trains" paragraph covers Capital MetroRail (Red Line) stations near the town if any, Amtrak (Austin, San Marcos, Taylor stations), the Austin Steam Train Association, and other real train attractions near it; train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/austin-steam-train-association-cedar-park-texas), else []; "nearby" MUST start with ["austin-tx","Austin"], then 2 to 5 existing pages that return 200 (existing pages in this area: georgetown-tx hutto-tx kyle-tx san-marcos-tx temple-tx new-braunfels-tx killeen-tx; other new towns in this run may not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Round Rock, TX 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-tx-run; mkdir -p $RUN; cp /mnt/project-files/austin-run/<town>-tx/facts.json $RUN/
mkdir -p work/<town>-tx; [ -f work/<town>-tx/<town>-tx.html ] || cp ../tools/empty_city.html work/<town>-tx/<town>-tx.html
python3 disc_build.py $RUN/facts.json <town>-tx $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/austin-run/<town>-tx/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/austin-run/<town>-tx/bundle.json.gz winterfest-seattle-wa $A
```
Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with austin_existing_cards.txt or the town page's existing links. Also check generated pages for "–", "—", "!" outside scripts. Check every event time in the generated JSON-LD carries -06:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.
