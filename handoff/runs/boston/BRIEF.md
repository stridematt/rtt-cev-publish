# Boston-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Massachusetts towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, a browser, or the registry. The lead publishes.

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-ma" and Illinois sources with Massachusetts ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-ma with formats ["links"]; every /christmas-events/<slug> link is already live.
- The Boston page already cards many suburb events (Cambridge, Quincy, Newton, Brookline, Wellesley, Revere, Lynn, Medford, Salem, Beverly, Canton, Stoneham, Brockton...). Full list: /mnt/project-files/boston-run/boston_existing_cards.txt. Never rebuild those.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> MA" (limit 15) and "<Town> MA holiday events 2026" and work through every result. Round-ups (Macaroni Kid, Mommy Poppins, Boston Central, Patch, Boston.com, Boston Globe, Axios, Eventbrite listings, mykidlist, Facebook pages of third parties) are DISCOVERY ONLY; never link to them or use them as fact sources.
2. Then, in order: the town's own holiday/events page (town hall, recreation department), the chamber/downtown/business association, the public library calendar (LibCal / Assabet / communico / libnet; scrape with waitFor 4000), historical society and museums, farms (tree farms with Santa, light trails), theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains/trolleys (MBTA, Edaville, Cape Cod Central, Mass Bay Railroad, Waltham, Boston Children's Museum), light displays, parades, tree lightings, Santa visits, breakfasts with Santa.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> ma" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official town/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/boston-run/<town>-ma/)
- facts.json (format as wheaton). page "<town>-ma", page_name "<Town>". Address like "123 Main St, Town, MA 01234". cand numbers start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train at Edaville Family Theme Park").
- NEW towns also get page.json per NEWPAGE_SPEC, with these Massachusetts changes: "trains" paragraph covers the MBTA Commuter Rail line and station(s), Edaville, Boston-area train attractions; train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (else []); "nearby" MUST start with ["boston-ma","Boston"], then 2 to 5 existing pages that return 200 (existing MA pages: andover brockton framingham hingham lawrence lexington lowell melrose natick norwood stoneham westwood weymouth marblehead haverhill newburyport gloucester; other new towns in this run may not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Quincy, MA 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-ma-run; mkdir -p $RUN; cp /mnt/project-files/boston-run/<town>-ma/facts.json $RUN/
mkdir -p work/<town>-ma; [ -f work/<town>-ma/<town>-ma.html ] || cp ../tools/empty_city.html work/<town>-ma/<town>-ma.html
python3 disc_build.py $RUN/facts.json <town>-ma $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/boston-run/<town>-ma/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/boston-run/<town>-ma/bundle.json.gz winterfest-seattle-wa $A
```
Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with boston_existing_cards.txt. Also check generated pages for "–", "—", "!" outside scripts. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.
