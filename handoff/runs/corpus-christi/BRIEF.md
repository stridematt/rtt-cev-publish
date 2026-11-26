# Corpus Christi-area run: research + build brief (2026-11-26)

Same job as the Wichita, Tampa and Omaha runs. READ FIRST and follow exactly: /mnt/project-files/wichita-run/BRIEF.md (this file replaces its Wichita specifics), which chains to tampa-run/BRIEF.md, omaha-run/BRIEF.md, tucson-run/BRIEF.md and houston-run/BRIEF.md (method, verify, write, build block, intro.json, "UPDATED RULES 2026-11-26"), /mnt/project-files/chicago-run/NEWPAGE_SPEC.md, and finished examples /mnt/project-files/tucson-run/oro-valley-az/ (NEW town) and tucson-run/tucson-az/ (existing). Replace "wichita-run"/"-ks" with "corpus-christi-run"/"-tx". Texas Coastal Bend is CENTRAL time: every JSON-LD event time carries -06:00 in December (kit TZ for tx is America/Chicago; grep to verify). Never -08:00.

Never touch Squarespace, an admin browser, or the registry. Firecrawl for research (markdown or links, waitFor 4000 for JS pages). Today is Thursday Nov 26, 2026; drop events ending before today. Copy kit: tar xzf /mnt/project-files/rtt-city-kit.tar.gz into your own dir (live.json at rtt-city-kit/tools/live.json).

## Cand ranges (run range 62000-62999)
HELPER A (Corpus Christi core): 62000-62399. corpus-christi-tx is EXISTING (write its cards to corpus-christi-run/corpus_christi_existing_cards.txt, do not rebuild them). Also Flour Bluff, Padre Island, Calallen, Annaville, Violet. Venues: Texas State Aquarium, USS Lexington, Art Museum of South Texas, Corpus Christi Museum of Science and History, Botanical Gardens, Water Street/Bayfront, Heritage Park, Whataburger Field/Hooks, Selena Auditorium, Harbor Playhouse, Corpus Christi libraries, Parks and Rec, Santa Claus parade, Harbor Lights Festival and boat parade, Christmas tree lighting, Hurricane Alley, Padre Island National Seashore, Oso Bay Wetlands, Texas Surf Museum, Christmas lights displays, Santa photos at La Palmera, trains/rail attractions.
HELPER B (north and Rockport side): 62400-62699. Portland, Ingleside, Aransas Pass, Rockport and Fulton, Port Aransas and Mustang Island, Gregory, Taft, Sinton. Rockport's Christmas on the Bay and Port Aransas Christmas boat parade/Parade of Lights, Fulton Mansion Christmas, Texas Maritime Museum, Rockport Center for the Arts, Port Aransas Community Theatre, Rockport Christmas in the Park, Whooping crane boat cruise Christmas events.
HELPER C (inland and south): 62700-62999. Robstown, Kingsville (King Ranch holiday, Kingsville Christmas parade, Texas A&M Kingsville), Alice, Beeville, Mathis, Bishop, Refugio, Premont, George West, Orange Grove, Falfurrias, Victoria is EXISTING (victoria-tx) and out of scope except leaving it alone. Look for any Santa train or tourist railroad.

## Already live
corpus-christi-tx, victoria-tx. Confirm each town page by firecrawl_scrape https://www.rallytakesthetrain.com/christmas-events/<slug> formats ["links"] maxAge 0 (404 or empty = NEW). Check Coastal Bend neighbors for cards that belong to your towns. Write existing_cards.txt in each town folder; write moves_A.json / moves_B.json / moves_C.json (card slug, from page, target page).

## Moves (Rally rule)
A town with its own page keeps its events; never on two pages. Events inside Corpus Christi city limits stay on corpus-christi-tx. Record move_from_corpus-christi-tx in page.json for NEW towns.

## Per-town outputs in /mnt/project-files/corpus-christi-run/<town>-tx/
facts.json, tweaks.json, bundle.json.gz, intro.json (Chicago-style lede, hub_line "Planning a bigger day out? <Town> families also use our guide to Christmas activities for kids in Corpus Christi, which covers ..."), existing_cards.txt, page.json for NEW towns ("nearby" starts ["corpus-christi-tx","Corpus Christi"], then EXISTING pages only, verified 200). Folded towns get folded.json (why, where). Train links only for verified-200 /museums/ pages. Rules: no printed price = cost "Price not listed" (2026 only); public parades Free; host's own social "free" post counts; hold canceled, ended, wrong-year, adult-only, unverifiable (conflicting dates, 2025 pages, Facebook-only, image-only). No em/en dashes, no exclamation marks. Never link round-up sites; host pages only. Search "christmas events for kids in <town> tx" like Google and work through every result. Christmas Eve services page: check https://www.rallytakesthetrain.com/christmas-eve-services/<slug>.

Town rule: new page for 20k+ places (Portland ~21k, Alice ~18k, Kingsville ~25k, Robstown ~11k, Aransas Pass ~8k, Rockport ~11k, Port Aransas ~3k) and smaller destination towns with 3+ verified events; else fold into the nearest page.

SEO: event names exactly as searched plus venue/park in the title; trains, boat parades and new events first; seo_title under 60 chars.

## Reply (short)
Per town: new/existing, events built (cand, slug, date, cost), held and why, events belonging to other towns, Christmas Eve page yes/no, best source, flags, method fix. Economical: one fetch per page, checks as one script, short report. Stop at a clean town boundary if budget runs low and report what remains. Do NOT write intro_html/seo/page.json intro fields or registry rows; the lead does those.
