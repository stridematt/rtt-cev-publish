# Anaheim and Orange County run handoff (2026-11-26)

Built by four Sonnet helpers (north, central/coast, south, north resume); lead merged, wrote moves JSON and registry script. Cand range 64000-64999 (used 64000-64006, 64130-64134, 64160-64163, 64260, 64270-64312, 64450-64451, 64550-64553, 64590-64592, 64630-64650, 64660-64674 plus the Santa Ana, Costa Mesa and Irvine blocks). 67 new events. Pacific time: -08:00 on every timed JSON-LD.

Registry: see registry_rows.json and reg_anaheim.sh (67 adds, cc ca). Command is posted by the lead with the pinned commit.

## Towns
NEW pages (page.json + bundle in each folder): fullerton-ca, orange-ca (Villa Park folded), stanton-ca, cypress-ca (La Palma folded), la-habra-ca, santa-ana-ca, costa-mesa-ca, fountain-valley-ca, seal-beach-ca (Los Alamitos, Rossmoor folded), aliso-viejo-ca, san-juan-capistrano-ca, rancho-santa-margarita-ca (Coto de Caza, Trabuco Canyon folded).
EXISTING with new events: anaheim-ca, irvine-ca, tustin-ca, newport-beach-ca, huntington-beach-ca, westminster-ca, lake-forest-ca, laguna-beach-ca, laguna-hills-ca, san-clemente-ca, dana-point-ca, ladera-ranch-ca. Intro-only refresh: buena-park-ca, brea-ca, mission-viejo-ca, laguna-niguel-ca.
Folded, no page: Garden Grove (card stays on anaheim-ca), Yorba Linda (cards stay on anaheim-ca), Placentia (into fullerton-ca, nothing built), Villa Park, La Palma, Los Alamitos, Laguna Woods, Foothill Ranch, Coto de Caza, Trabuco Canyon.

## Publisher actions
1. Moves and deletes: anaheim_moves.json. Apply before or with the new bundles. Duplicates across anaheim-ca and irvine-ca are listed under delete_cards (delete from the page named). Irvine Park Railroad cards for Orange: check for a duplicate pair on irvine-ca vs the anaheim-ca card.
2. Link anaheim-ca to every new town page; each new page back to anaheim-ca. page.json nearby starts ["anaheim-ca","Anaheim"].
3. Existing pages: replace live intro with intro_html and seo_description from page.json (existing towns have intro.json too). Helper B notes: "both free" counts may read 0 free in seo_description on existing towns; run quick-counts and check the intro free count against the live cards.
4. Page date = publish day. -08:00. Registry, then quick-counts for every changed path. Do not request indexing.
5. Live date audit; drop events ended on publish day. Ladera Ranch live Santa card conflicts with the host page (host: Sat Dec 5, 2 to 5 pm sold out; live card: Thu Dec 3); recheck.
6. Christmas Eve services pages: only Irvine has one. Link irvine-ca to it.

## Flags (facts not from a host page)
Addresses from listings or memory: Twila Reid Park, Fullerton plaza, Tustin Library, Pacific City, Seal Beach and Los Alamitos libraries, St. Isidore plaza, San Clemente Pier, Waldorf Astoria Monarch Beach, Ladera Ranch Mercantile East ("Antonio Pkwy"), San Juan Capistrano tree lighting (31852 El Camino Real), La Habra festival and library, La Palma library, Cypress Civic Center Green. Facts from search or social snippets because city sites would not scrape: Fountain Valley tree lighting, Seal Beach events, San Juan Capistrano tree lighting, La Habra Breakfast with Santa, La Palma tree lighting. Laguna Beach Sawdust extras and Dana Point Santa Paws and Breakfast with Santa from Visit pages. Pendry tree lighting from Visit Newport Beach; Sherman Gardens time conflict (5 to 9 vs 5 to 8:30 pm). Westminster Santa on the Go: price not on city page. Fullerton lastyear paragraph from 2022 and 2023 sources. Uniqueness on single-page bundles (Stanton, Fountain Valley, Westminster, single-event towns) was checked by hand or not at all.

## Held
Whoville Wonderland (Facebook), Anaheim Plaza Santa (no date), Holiday Wonderfest (no date, both Anaheim and Rossmoor), library Nutcracker, Villa Park Santa tour (dates only), Dry Land Boat Parade, Breakfast with Santa Yorba Linda, East Lake boat parade, Christ Cathedral Lessons and Carols, Seal Beach tree lighting (ended), Placentia Centennial Bash (conflicting times), Ritz-Carlton Breakfast with Santa (no time), SAMLARC and Candy Cane Lane (HOA), Aliso Viejo Santa's Workshop (2019), Medieval Times (no Christmas show), Tustin teen cookie decorating, Fountain Valley library programs.

## Other runs
Winter Fest OC (OC Fair, Costa Mesa) and Dream Glow (Wild Rivers) were noted by helpers; check they are built under costa-mesa-ca and irvine-ca. Out of area: photos-with-santa-at-california-grill-whittier-ca (on anaheim-ca, LA run), Long Beach 2nd and PCH and Naples boat parade.
