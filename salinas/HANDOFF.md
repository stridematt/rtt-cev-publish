# Salinas and Monterey County run handoff (2026-11-26)

REGISTRY COMMAND (Rally, Terminal, run once; commit 27a37698a0d57dbaae3a9cebe86d9ed75b8733db, branch claude/project-thread-j1ott9 in stridematt/rtt-cev-publish, raw file verified identical to reg_salinas.sh; 26 adds, unchanged by the Marina fold):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/27a37698a0d57dbaae3a9cebe86d9ed75b8733db/salinas/reg_salinas.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Three Sonnet helpers. Cand 45000-45999 (used: 45000-45006, 45200, 45260-45261, 45330-45332, 45450, 45510-45511, 45550-45553, 45660, 45760-45762, 45860, 45930). Pacific, -08:00 verified on every timed JSON-LD. Lead checks passed: all JSON valid, no duplicate slugs, no dashes in page text, no empty price, intro_html/seo_title/seo_description in every page.json. Bundles, page.json files, moves and registry rows are also in rtt-cev-publish under salinas/ (<town>-bundle.json.gz, <town>-page.json, salinas_moves.json). Folders: /mnt/project-files/salinas-run/<town>-ca/.

Key finding: salinas-ca was holding 16 Monterey Peninsula cards and no Salinas events; monterey-ca did not exist. Master moves: salinas_moves.json (17 entries).

## Towns (counts include moved-in cards; recount with RTTUS.intro and quick-counts)
NEW pages (3): monterey-ca 13 events (3 new + 10 moved from salinas-ca), carmel-by-the-sea-ca 5 (3 new incl. Carmel Valley and Pebble Beach events + 2 moved), hollister-ca 5 (3 new, Polar Express moved from gilroy-ca, 1 San Juan Bautista parade built into it; SJB folded).
EXISTING with new events: salinas-ca 8 new (all old cards move or drop, so page = the 8 new incl. a Soledad merged event), pacific-grove-ca 9 (4 live + wreathmaking moved in + 4 new; live intro says "all free" but Asilomar breakfast is paid, new intro fixes it), watsonville-ca 3 (1 new), gilroy-ca 4 (1 new, Polar Express moves out).
EXISTING: seaside-ca 4 events, 3 free: 2 live (the two salinas-ca duplicates are dropped) plus the 2 Marina events folded in (Marina Christmas Tree Lighting Dec 4 and Santa in the Neighborhood Dec 5, free). Bundle seaside-ca/bundle.json.gz carries those 2 Marina cards (slugs unchanged, parent links rewritten to seaside-ca). marina-ca page and bundle are superseded (coordinator, 2-event fold); do NOT create marina-ca.
FOLDED: Marina (into seaside-ca, 2 events built), Soledad (into salinas-ca, event built), Greenfield, Gonzales, King City, Chualar (into salinas-ca, nothing built), Sand City and Del Rey Oaks (into monterey-ca), Big Sur, Carmel Valley, Pebble Beach (into carmel-by-the-sea-ca), San Juan Bautista (into hollister-ca).

## Publisher actions
1. Moves per salinas_moves.json (verify each source card exists live first): 10 Monterey cards to monterey-ca; 2 Carmel cards to carmel-by-the-sea-ca; wreathmaking to pacific-grove-ca; drops: pacific-grove-holiday-parade-of-lights-ca (duplicate of the Dec 3 parade on pacific-grove-ca), and the two Seaside cards (same slugs live on seaside-ca); gilroy-ca Polar Express to hollister-ca. The live Del Monte Center tree lighting event page (holiday-tree-lighting-at-del-monte-center-monterey-ca) ended Nov 21 and is not carded on any page: do not card it; repoint its parent links to monterey-ca if the page stays. Also repoint breadcrumb and 'more near' links on every moved event page from salinas-ca to its new parent. Remove dead planner rows after.
2. Create monterey-ca, carmel-by-the-sea-ca, hollister-ca (page.json each). Link salinas-ca to each new page; each links back (nearby). Salinas hub_line points to the Monterey Peninsula guide.
3. Set intro_html, seo_title, seo_description from page.json on every changed page incl. seaside-ca; recount against live pages.
4. Christmas Eve services pages: yes for salinas-ca and gilroy-ca; no for monterey, carmel, marina, hollister, pacific-grove, seaside; watsonville not checked.
5. Registry first, then quick-counts for every changed path. Do not request indexing. Page date = publish day, -08:00. Drop events already ended on publish day.

## Flags
Salinas Tree for Peace and Soledad event facts come from city pages and posts; Soledad Free rests on the parade rule; tree lighting start varies 5 to 5:30 pm. Monterey and Carmel use Visit Monterey or town calendars where the host has no page; Holiday at the Inns price ($30) and Bernardus brunch ($125 adult) from Visit Monterey. Hollister sensory event from Zeffy ticket page only; Bourdet season end date not printed. Some event paragraphs 33 to 46 words. Watsonville and Gilroy counts depend on live cards. Carmel intro states no free count.

## Held
Soledad Holly Jolly Christmas (registration page only), Greenfield Dec 4 (venue and times conflict), Gonzales Holiday Lights (Instagram only), King City parade (no 2026 date) and Nutcracker (2025), Big Sur Lodge Breakfast with Santa (Dec 19 vs 20), Carmel Mission concert and Oratorio (adult), Hollister City Breakfast with Santa (social), Elks Dec 19, stage show (conflicting times), North Pole adventure (no 2026 dates), Watsonville Santa Tour (2024), Chorale (Facebook), Gilroy LJB Farms (2025), SantaCon (adult), SJB Star Lighting (Eventbrite only), Capitola Surfin' Santa, palm tree lighting, boat parade (no 2026 host page), Scotts Valley Light Up the Night (2019).

## Strays
Capitola events above and Aptos (already on santa-cruz-ca) belong to the Santa Cruz area; no Santa Cruz run built.

## Queue coverage
Covered: Salinas (and Monterey County). Santa Cruz and the Bay Area are other runs.
