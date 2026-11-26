# Dallas-area run: research + build brief (2026-11-25)

You research kids' Christmas events (2026 season) for the Texas towns you are given, verify them, and BUILD the kit bundle for each town. You never touch the website, Squarespace, any browser, or the registry. The lead publishes. Today is Wednesday, November 25, 2026. Texas is Central time (the kit sets -06:00 itself from the "-tx" slug).

Read first (format examples, follow exactly):
- /mnt/project-files/chicago-run/AGENT_BRIEF.md (method + "Added rules"; replace "-il" with "-tx" and Illinois sources with Texas ones)
- /mnt/project-files/chicago-run/wheaton-il/facts.json and tweaks.json (format)
- For towns marked NEW: /mnt/project-files/chicago-run/NEWPAGE_SPEC.md and an example /mnt/project-files/chicago-run/berwyn-il/page.json

## Already carded (skip these)
- Existing town page: firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<town>-tx with formats ["links"] and maxAge 0; every /christmas-events/<slug> link is already live. Compare by event, not only by slug (a differently named page for the same event is still a duplicate).
- The Dallas page already cards many suburb events (Richardson Santa's Village at Huffhines Park, Carrollton Santa on the Square, Flower Mound Christmas Parade and Tree Lighting, Grand Prairie Main Street Magic and Prairie Lights, Frisco Breakfast with Santa and Merry Main Street, Denton Holiday Lighting Festival, Sachse Christmas Extravaganza, Waxahachie Christmas Parade, Grapevine, Denison, Gainesville). Full list: /mnt/project-files/dallas-run/dallas_existing_cards.txt. Never rebuild those. Rally's rule (2026-11-25): suburb events now MOVE from the Dallas page to their town's page (the lead handles the card move, see MOVE_PLAN.md), so count them as that town's events when writing the town's story section and seo_title, but do not rebuild their event pages.
- An event physically in another town belongs to that town. If that town is not yours, list it in your reply instead of building it. Towns with no page and under 20,000 people (Addison, Highland Park, Lucas, Fairview, Heath, Red Oak, Royse City, Seagoville, Glenn Heights, Lake Dallas, Hickory Creek...): Rally's rule (2026-11-25): if parents search the town by name at Christmas AND you verify 3 or more events there, build it as a NEW town (facts, tweaks, page.json, bundle in /mnt/project-files/dallas-run/<town>-tx/), using your own cand range. Otherwise list its events in your reply.

## Research (parent's Google search, then every result)
1. firecrawl_search "christmas events for kids in <Town> TX" (limit 15) and "<Town> TX holiday events 2026" and work through every result. Round-ups (DallasNews, Dallas Observer, D Magazine, CultureMap, Candy's Dirt, Dallas Moms / Collin County Moms / Frisco Moms, Macaroni Kid, Red Tricycle, Patch, Community Impact, Star Local Media, NBC DFW, WFAA, Fox 4, CBS Texas, KERA, Eventbrite listings, mykidlist, third-party Facebook) are DISCOVERY ONLY; never link to them or use them as fact sources. Community Impact and Dallas Moms holiday guides list many suburb events: read them for discovery.
2. Then, in order: the city's own holiday/events page and parks and recreation calendar (many Texas cities use CivicPlus, CivicEngage, ActiveNet, RecDesk or CivicRec for registration with prices), the visitor bureau (Visit Dallas, Visit Irving, Visit Frisco, Visit McKinney, Visit Plano, Visit Grand Prairie, Visit Lewisville, Visit Denton, Visit Rockwall, Waxahachie CVB), the downtown association, Main Street program or chamber, the library calendar (scrape with waitFor 4000), historical villages and museums (Dallas Heritage Village, Perot Museum, Heard Museum McKinney, Frontiers of Flight, Sci-Tech Discovery Center Frisco, Farmers Branch Historical Park, Interurban Railway Museum Plano, Museum of the American Railroad Frisco), malls and town centers with Santa (Galleria, NorthPark, Stonebriar, Firewheel, Watters Creek, The Shops at Legacy, Grandscape), farms and pumpkin/Christmas farms, light displays and drive-through lights, theaters and dance schools (Nutcracker, holiday shows), churches' public kids' events, holiday trains and trolleys (DART, DCTA A-train, TEXRail, McKinney Avenue M-Line Trolley, Interurban Railway Museum, Museum of the American Railroad, park miniature trains, model railroads, Santa trains), parades, tree lightings, Santa visits, breakfasts with Santa, ice rinks with Santa.
3. Train rides, Santa trains and NEW events rank best in Google for us. Look hard for them.
4. CivicPlus town sites (URLs like /Calendar.aspx?EID=, /123/Page-Name) can render empty: try waitFor 5000, or /m/calendar paths. If a page loads with JavaScript, rescrape with waitFor.
5. After each town ask: would a parent's Google search for "christmas events for kids in <town> tx" show something I missed? Fix your method before the next town and mention the fix in your reply.

## Verify (strict)
Exact 2026 dates and times, venue name + full street address with zip, cost, ages, host, URL, all from the host's own page or an official city/park/library/tourism calendar. Price must be printed on an official page; the host's OWN social post saying "free" counts (cite it). Library programs: hold unless the library's own site states its programs are free (find and cite that statement). Unknown cost = HOLD. Drop past events (before Nov 25, 2026), sold out, adult only, plain shopping markets with no kids' activity, fun runs, mail-in Santa letters. If official sources disagree, ticket system/host wins, else hold. Same-host small programs (several library storytimes etc.) go in ONE merged event (times list, when_note).

## Write (per town, in /mnt/project-files/dallas-run/<town>-tx/)
- facts.json (format as wheaton). page "<town>-tx", page_name "<Town>". Address like "123 Main St, Town, TX 75000". cand numbers (range 97000 to 97899 for this metro) start at the number you were given, +1 per event. Two paras of 50 to 70 words each.
- Writing: plain parent-friendly English, NO em/en dashes, NO exclamation marks, no filler, no claims not on the source. If facts came from a calendar, say so.
- SEO: name events with the exact name people search plus the venue or park when natural (e.g. "Santa Train at the Interurban Railway Museum"). Use the host's exact event name.
- NEW towns also get page.json per NEWPAGE_SPEC, with these Texas changes: "trains" paragraph covers DART light rail, the DCTA A-train, the TRE or Amtrak stations near the town, and real train attractions near it; train_links only for rallytakesthetrain.com/museums/<slug> pages you verify return 200 (known good: /museums/m-line-trolley-dallas-texas, /museums/interurban-railway-museum-plano-texas, /museums/museum-of-the-american-railroad-frisco-texas), else []; "nearby" MUST start with ["dallas-tx","Dallas"], then 2 to 5 existing pages that return 200 (existing pages in this area: allen carrollton coppell denton desoto flower-mound forney frisco garland grand-prairie highland-village lancaster little-elm mckinney melissa mesquite midlothian murphy plano prosper richardson rowlett terrell the-colony waxahachie wylie, all "-tx"; other new towns in this run may not exist yet, do not list them). seo_title under 60 chars like "Christmas Events for Kids in Irving, TX 2026".

## Build (in your own kit copy; never use another agent's folder)
```
K=/home/claude/rtt/w_<yourname>; [ -d $K ] || cp -r /home/claude/rtt/rtt-city-kit $K
cd $K/pipeline && mkdir -p ev out work && export RTT_LIVE_JSON=/home/claude/rtt/live.json
RUN=work/<town>-tx-run; mkdir -p $RUN; cp /mnt/project-files/dallas-run/<town>-tx/facts.json $RUN/
mkdir -p work/<town>-tx; [ -f work/<town>-tx/<town>-tx.html ] || cp ../tools/empty_city.html work/<town>-tx/<town>-tx.html
python3 disc_build.py $RUN/facts.json <town>-tx $RUN/cards.json && python3 us_city.py multi $RUN/cards.json
ls out/   # slugs that were generated; key tweaks.json by these slugs
cp /mnt/project-files/dallas-run/<town>-tx/tweaks.json $RUN/ && python3 ../tools/tweak_pages.py $RUN/facts.json $RUN/tweaks.json
python3 ../tools/uniq.py <slugs...>     # every slug >= 60.0% and [] issues; add more SOURCED about/faq/kids/table detail until it passes
grep -l 'Admission: \.' out/*/page.html   # must print nothing (empty price = hold)
A=$(python3 ../tools/split_cards.py $RUN/facts.json $RUN/cards.json); python3 mkbundle_us.py /mnt/project-files/dallas-run/<town>-tx/bundle.json.gz winterfest-seattle-wa $A
```
Clear `out/` between towns (or check `ls out/` only shows this town's slugs before bundling). Bundle must be under 3.8 MB. Check the bundle's event slugs do not collide with dallas_existing_cards.txt or the town page's existing links. Also check generated pages for "–", "—", "!" outside scripts. Check every event time in the generated JSON-LD carries -06:00. Validate every JSON file with python3 json.load after writing (the folder is a network mount; re-read after writing).

## Reply (short)
Per town: NEW or existing, path, events built (cand, slug, date, cost), held and why, events found that belong to other towns, best source, method fix.

## City page story section: ALL towns, existing and new (Rally, 2026-11-25)
Rally wants every city page to have a full intro/story section like https://www.rallytakesthetrain.com/christmas-events/chicago-il ("The story of Christmas in Chicago"). Existing Dallas-area pages (e.g. allen-tx) only have a thin version (one "How X celebrates" paragraph, a Wikipedia source). So for EVERY town you cover, existing or new, write /mnt/project-files/dallas-run/<town>-tx/page.json per /mnt/project-files/chicago-run/NEWPAGE_SPEC.md, plus these fields that match the Chicago format:
- "lede": 2 sentences that open "The story of Christmas in <Town>" with the town's signature traditions and the years they began.
- "sections": 3 themed subsections [["Heading", "80 to 130 words"], ...], each about one real tradition or piece of history with names, years and places (e.g. "The courthouse square tree, lit since 1952", "How the Interurban put Plano on the map"). The train subsection goes here too, with train_links.
- "traditions": 4 to 6 [["Name", "one sentence"]], naming the date for 2026 only if it is one of your verified events.
- "kidfact": one sentence a child would enjoy, sourced.
- "sources": 5 or more official, news, museum or historical-society sources (city, county, Texas State Historical Association Handbook of Texas, local historical society, newspaper). Wikipedia never counts toward the 5.
- "intro_html" (Chicago-style lede plus the "What Rally found in <Town>" list) is added by the lead at review time from the final card counts, so do NOT write it. DO write "seo_title" (under 60 chars) and "seo_description" (under 155 chars) using the top searched event names in the town (the NEWPAGE_SPEC "seo_desc" field is named "seo_description" in this run).
- "fixes": for EXISTING pages, list any live lines that break house rules (e.g. "The page does not list drop-off hours", "Where a host has not posted a price yet, the listing says so", "2026 Christmas events are coming in late November" placeholders, Wikipedia-only sources, stale counts in the title), quoting the exact text.
Every fact sourced; no dashes, no exclamation marks; say "was planned" when you only saw a preview.

## Build gotchas learned in this run (2026-11-25)
- tweak_pages.py skips FAQ/about items already in ev/. After changing facts or tweaks: delete this town's files in pipeline/ev and pipeline/out (use `mv` to a trash folder if rm is blocked), rerun disc_build.py and us_city.py multi, then tweak_pages.py, then uniq.py.
- Never put "!" in any text, including event names quoted from hosts (reword, e.g. "Jingle The Christmas Band").
- Same-host events that share most of their activities: merge into ONE event up front (times list), or they fail the 60% check.
- Prices: the host's own Instagram or Facebook post saying "free" counts (Firecrawl can read a single post URL; check the post's year). City weekly news updates and Eventbrite pages the host itself links also work. CivicPlus calendars: use calendar.aspx?view=list&month=12&year=2026&CID=0, or Calendar.aspx?EID=<id>, and the query format with waitFor 5000 to 8000.
- Status files from the first pass: /mnt/project-files/dallas-run/STATUS_<group>.md hold research, held events and live-page fixes per town. Read the one for your towns first. Do not redo research that is already in them.
- nearby links in page.json: only use pages in the brief's existing-page list plus dallas-tx; do not claim 200 checks you did not run.

## Rally's standing rule (2026-11-25): every city page matches the Chicago main page
Format reference: https://www.rallytakesthetrain.com/christmas-events/chicago-il. Required in every page.json: lede, 3 sections, 4 to 6 traditions, kidfact, 4 to 6 "questions about Christmas in <Town>" faq entries (each answer 40 to 70 words, about the town's Christmas and history, not only dates), 5+ non-Wikipedia sources, trains paragraph and train_links, seo_title (under 60) and seo_description (under 155), nearby starting with dallas-tx, and "fixes" for existing pages. Before you finish, run: python3 /mnt/project-files/dallas-run/tools/check_page.py <town>-tx and fix every FIX line. Pages already written without faq (Denton, Frisco, Rockwall) get their faq added.

## NEW RULE (Rally, Nov 26) replaces "Unknown cost = HOLD"
Events held ONLY because no price is printed are now built, with cost exactly "Price not listed" (use that wording in the cost field and Admission line; no other phrasing, no "not stated"). Still hold: canceled, ended, wrong year, sold out, adult only, plain shopping, unverifiable (Facebook-only with no host page), duplicates of already carded events. Everything else (dates, times, venue, address, ages) must still be verified on the host or official page. Library programs and Santa photo events with no price now qualify if the date, time and place are verified. Merge same-host small programs into one event.
