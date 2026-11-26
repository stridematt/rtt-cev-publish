# San Francisco / Bay Area run: publish plan (2026-11-26)

Repo branch: stridematt/rtt-cev-publish, branch claude/project-thread-tbn2pn, folder sf/ (commit cfbc0cf): per town bundle.json.gz, page.json (intro_html, seo_title, seo_desc, new-town content), status.json; reg_sf1.sh (151 registry adds); publish_manifest.json (town -> event slugs); plan_data.json.
Same files live in /mnt/project-files/san-francisco-run/<town>-ca/.

## Totals
151 new event pages (cand 94000 to 94812, no duplicates, no slug collisions with live pages, no dashes or "!", no empty price).
28 NEW city pages, 98 events: albany antioch belmont berkeley brentwood burlingame daly-city east-palo-alto fremont hercules lafayette larkspur martinez menlo-park mill-valley millbrae newark novato pittsburg redwood-city san-carlos san-leandro san-mateo san-pablo san-ramon sausalito union-city walnut-creek.
15 EXISTING city pages get new cards (53 events): san-francisco 13, oakland 10, livermore 5, alameda 5, concord 4, danville 3, castro-valley 2, pleasant-hill 2, richmond 2, san-rafael 2, dublin 1, moraga 1, oakley 1, pleasanton 1, south-san-francisco 1. Intro refresh only (no new events): foster-city, hayward, pinole, san-bruno.
Not built (list below): el-cerrito, pacifica, plus 10 small towns.

## Publish order
1. New city pages first (newCity from page.json with intro_html, then bundle events), then existing pages (addCards).
2. Use each page.json intro_html as the lede + "What Rally found" block (Chicago style) and seo_title / seo_desc; today's date on every changed page.
3. NOTE newCity helper must be patched for California (state California, tz -08:00, hub san-francisco-ca) and must NOT strip "$" from prices (berwyn-il shows "Cost: 0 residents": the JS replace "$1" pitfall); check a rendered new page against san-francisco-ca (top picks nav, free/paid sections, story section, FAQ, sources).
4. Then SF edits, CTR fixes, registry, quick-counts for every changed path.

## San Francisco page edits (Rally: move events to town pages, link both ways)
- Remove these cards from the SF page (they move to the town page, which is built; plus Vallejo and Napa below): the-great-dickens-christmas-fair-daly-city-ca (Daly City), glowfari-oakland-ca (Oakland), hometown-holiday-celebration-pleasanton-ca (Pleasanton, already carded there), sausalito-lighted-boat-parade-sausalito-ca and winter-wonderlab-sausalito-ca (Sausalito).
- Keep on SF (no town page built): holidays-at-filoli-woodside-ca (Woodside), the-nutcracker-by-san-francisco-youth-ballet-theatre-pacifica-ca (Pacifica: no verified 2026 events beyond it).
- DECIDED (coordinator, Nov 26): move winterfest-at-six-flags-discovery-kingdom-vallejo-ca to vallejo-ca and christmas-parade-napa-ca to napa-ca (add the card to the town page if missing, then remove from SF; Vallejo and Napa pages link SF and are linked from the SF suburb block). calistoga-lighted-tractor-parade-ca stays on SF (no Calistoga page), as do Filoli and the Pacifica Nutcracker. The Vallejo/Napa pages are outside this run's builds: use RTTUS addCards-style move of the existing card, no new bundle needed.
- Add a "More Bay Area suburbs" link block on SF (and refresh the count in intro): all 28 new pages plus the 19 existing Bay Area pages (alameda castro-valley concord danville dublin foster-city hayward livermore moraga oakland oakley pinole pleasant-hill pleasanton richmond san-bruno san-rafael south-san-francisco). Every new page.json nearby already starts with San Francisco; existing suburb pages: castro-valley does not link SF, add it.
- Oakland live page carries cards for Piedmont (A Merry Little Christmas), Livermore parade, Berkeley (winterdance-a-celtic-christmas-celebration-berkeley-ca) and San Leandro (community-christmas-giveaway-at-encounter-church-san-leandro-ca): move the last two to Berkeley and San Leandro pages (listed as existing_event_pages there). Piedmont and Livermore cards: leave on Oakland unless Piedmont gets a page; move the Livermore parade card to livermore-ca if not already there.
- Existing live event pages to card on new town pages (status.json existing_event_pages): concord (magic-of-lights-concord-ca, tree-lighting-and-mayors-sing-along-concord-ca already on concord), fremont (train-of-lights-at-niles-canyon-railway-fremont-ca, creative-reuse-crafty-christmas-cards-fremont-ca), walnut-creek (holiday-tree-lighting-ceremony-walnut-creek-ca, over: do not card), east-palo-alto, redwood-city (christmas-eve-at-the-fox-theatre-redwood-city-ca), mill-valley (breakfast-with-santa-at-tam-valley-community-center-mill-valley-ca), sausalito (once-upon-a-holiday-at-cavallo-point-sausalito-ca), san-bruno, san-rafael, south-san-francisco, pleasanton (3 more live pages).

## Christmas Eve pairs
Only san-francisco, oakland (8 churches, no 2026 times) and livermore (17 churches) have /christmas-eve-services pages; the other 44 return 404. Add the eve link/FAQ only on those three (SF already linked; check oakland and livermore).

## SEO click-through fixes
seo/ctr_fixes.md: Magic of Lights Concord, Niles Canyon Train of Lights, Dickens Fair, Let's Glow SF, PIER 39 tree lighting, SWEA fair (titles/descriptions, plus page bugs found: Concord "more near 2", PIER 39 repeated time, Oakland intro/filter counts and "$" bug, SWEA tag).

## Not built (reasons in each status.json)
pacifica (nothing verified for 2026 with a host date), el-cerrito, hayward-new, pinole-new, san-bruno-new, foster-city-new (no new events), half-moon-bay (1), tiburon (1), corte-madera (1, no address), emeryville (2), alamo (1, weak sources), clayton (1), discovery-bay (boat parade), orinda, piedmont, woodside (0). verified_not_built events are in status.json for later cards on neighbor pages.

## Held (not built) summary
See status.json "held" per town. Main reasons: past, 2025-only host pages, Facebook-only, adult-only, shopping markets, wrong state (Alamo TX, Burlingame KS, Newark NJ, Pacific Grove).

## Items to verify before/after publish
Unverified or inherited facts: Millbrae Pictures with Santa "Free" (fetch failed), Burlingame Winterfest (JS page), Walnut Creek Garden of D'Lights / Lesher Center / Blackhawk prices (carried over), Menlo Park/Redwood City/Novato Nutcracker (spot-checked), Tilden Merry-Go-Round Breakfast with Santa price (earlier helper $50/$40 vs a third-party $55/$35), Tilden Steam Train zip (Berkeley street address assumed; host prints Orinda), East Palo Alto Winterfest "Free" rests on Eventbrite, Noe Valley and Fillmore SF "free" calls, Teddy Bear Tea seatings, addresses assumed for Larkspur, Sausalito Tracy Way Plaza, Mill Valley Depot Plaza and Marin Country Mart. Several pages sit just above 60% unique (Mill Valley 60.2, Walnut Creek Fratello 60.1, SF Ritz tree lighting 60.0): re-run uniq after any edit.

## Registry
One Terminal command for Rally, after the pages are live:
cd ~/Downloads/sa/registry && curl -sO https://raw.githubusercontent.com/stridematt/rtt-cev-publish/claude/project-thread-tbn2pn/sf/reg_sf1.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash reg_sf1.sh
(.env sourced silently as in earlier runs; adjust to how the Chicago reg scripts were run if different.) 151 adds; stop on error output and paste it back.

## Counts
Dispatch quick-counts in stridematt/sitemaps for every changed path (new pages + 15 existing + SF edits): list in urls-to-index.txt sections 1 and 2.
