#!/usr/bin/env bash
# San Diego metro run registry adds, round 2 (54 events built with Price not listed or free parades). Run from ~/Downloads/sa/registry AFTER the pages are live.
# Checks each event first and only adds when the directory says NEW; anything else is printed for review.
set -a; . ./.env >/dev/null 2>&1; set +a
ok=0; skip=0
reg() {  # slug name city url date
  out=$(python3 registry.py check --name "$2" --city "$3" --cc ca --date "$5" 2>&1)
  case "$out" in
    NEW*) python3 registry.py add --slug "$1" --name "$2" --city "$3" --cc ca --url "$4" --date "$5" --status live --confirm-new >/dev/null 2>&1 && ok=$((ok+1)) || echo "ADD FAILED: $1" ;;
    *) skip=$((skip+1)); echo "REVIEW $1 -> $(echo "$out" | head -2 | tr '\n' ' ')" ;;
  esac
}

reg 24th-annual-tree-lighting-celebration-at-the-forum-carlsbad-ca '24th Annual Tree Lighting Celebration at The Forum Carlsbad' 'Carlsbad' 'https://theforumcarlsbad.com/events/the-forum-carlsbad-24th-annual-tree-lighting-celebration' 2026-12-04
reg teddy-bear-tea-at-park-hyatt-aviara-carlsbad-ca 'Teddy Bear Tea at Park Hyatt Aviara' 'Carlsbad' 'https://parkhyattaviara.com/upcoming-events/hyatt-experiences/?experienceId=teddy-bear-tea-dbe18bc5' 2026-12-12
reg holiday-brunch-with-santa-at-omni-la-costa-carlsbad-ca 'Holiday Brunch with Santa at Omni La Costa' 'Carlsbad' 'https://www.tickettailor.com/events/omnilacostaresortspa/2518882' 2026-12-19
reg the-sea-star-search-with-the-elf-on-the-shelf-at-sea-life-carlsbad-ca 'The Sea Star Search with The Elf on the Shelf at SEA LIFE Carlsbad' 'Carlsbad' 'https://www.visitsealife.com/california/' 2026-11-27
reg winter-wonderland-and-merry-mean-one-meet-and-greet-at-the-shoppes-ca 'Winter Wonderland and Merry Mean One Meet and Greet at The Shoppes at Carlsbad' 'Carlsbad' 'https://theshoppesatcarlsbad.com/event/holiday-events/' 2026-12-05
reg photos-with-santa-at-otay-ranch-town-center-chula-vista-ca 'Photos with Santa at Otay Ranch Town Center' 'Chula Vista' 'https://www.otayranchtowncenter.com/en/events/55964/' 2026-11-27
reg holiday-programs-at-otay-ranch-library-chula-vista-ca 'Holiday Programs at Otay Ranch Library' 'Chula Vista' 'https://www.chulavistaca.gov/calendar.aspx?view=list&year=2026&month=12&CID=0' 2026-12-02
reg ride-the-lights-holiday-bike-ride-in-coronado-ca 'Ride the Lights Holiday Bike Ride in Coronado' 'Coronado' 'https://www.coronado.ca.us/Calendar.aspx?EID=4287&month=12&year=2026&day=13&calType=0' 2026-12-13
reg santa-storytime-and-holiday-sing-along-at-the-coronado-public-library-ca 'Santa Storytime and Holiday Sing-Along at the Coronado Public Library' 'Coronado' 'https://coronado.librarycalendar.com/events/month/2026/12' 2026-12-11
reg brunch-with-santa-at-lauberge-del-mar-ca 'Brunch with Santa at L'\''Auberge Del Mar' 'Del Mar' 'https://www.laubergedelmar.com/things-to-do/happy-holidays/' 2026-12-13
reg merry-movie-nights-at-lauberge-del-mar-ca 'Merry Movie Nights at L'\''Auberge Del Mar' 'Del Mar' 'https://www.laubergedelmar.com/things-to-do/happy-holidays/' 2026-12-12
reg christmas-tree-lighting-at-shadow-mountain-community-church-el-cajon-ca 'Christmas Tree Lighting at Shadow Mountain Community Church' 'El Cajon' 'https://shadowmountain.org/christmas' 2026-11-29
reg meet-me-at-the-manger-childrens-choir-show-at-shadow-mountain-el-cajon-ca 'Meet Me at the Manger Children'\''s Choir Show at Shadow Mountain Community Church' 'El Cajon' 'https://shadowmountain.org/christmas' 2026-12-06
reg kids-blast-christmas-at-shadow-mountain-community-church-el-cajon-ca 'Kids Blast Christmas at Shadow Mountain Community Church' 'El Cajon' 'https://shadowmountain.org/christmas' 2026-11-29
reg photos-with-santa-at-parkway-plaza-el-cajon-ca 'Photos with Santa at Parkway Plaza' 'El Cajon' 'https://visitparkwayplaza.com/event/photos-with-santa/' 2026-11-27
reg encinitas-holiday-parade-on-highway-101-ca 'Encinitas Holiday Parade on Highway 101' 'Encinitas' 'https://www.encinitasca.gov/government/departments/parks-recreation-cultural-arts/recreation-programs/encinitas-holiday-parade' 2026-12-05
reg annual-christmas-fest-at-seacoast-community-church-encinitas-ca 'Annual Christmas Fest at Seacoast Community Church' 'Encinitas' 'https://www.seacoast-church.org/events/event/398/annual-christmas-fest/2026-12-02' 2026-12-02
reg 75th-escondido-christmas-parade-on-grand-avenue-ca '75th Escondido Christmas Parade on Grand Avenue' 'Escondido' 'https://escondidojaycees.org/75th-christmas-parade' 2026-12-05
reg holiday-tree-trimming-celebration-at-the-escondido-public-library-ca 'Holiday Tree Trimming Celebration at the Escondido Public Library' 'Escondido' 'https://escondido.librarycalendar.com/event/holiday-tree-trimming-celebration-337' 2026-12-10
reg fallbrook-christmas-parade-on-main-avenue-downtown-fallbrook-ca 'Fallbrook Christmas Parade on Main Avenue' 'Fallbrook' 'https://www.fallbrookchamberofcommerce.org/fallbrook-christmas-parade/' 2026-12-05
reg julians-country-christmas-tree-lighting-ca 'Julian'\''s Country Christmas Tree Lighting' 'Julian' 'https://visitjulian.com/to-see-do/special-events/country-christmas/' 2026-11-28
reg locals-tree-lighting-at-julian-town-square-ca 'Local'\''s Tree Lighting at Julian Town Square' 'Julian' 'https://julianchamber.org/events/locals-tree-lighting/' 2026-11-27
reg joy-in-julian-light-parade-on-main-street-ca 'Joy in Julian Light Parade on Main Street' 'Julian' 'https://visitjulian.com/to-see-do/special-events/country-christmas/' 2026-12-05
reg living-nativity-at-the-julian-cider-mill-ca 'Living Nativity at The Julian Cider Mill' 'Julian' 'https://www.juliancidermill.com/events' 2026-12-05
reg polar-express-holiday-party-at-lakeside-library-ca 'Polar Express Holiday Party at Lakeside Library' 'Lakeside' 'https://sdcl.bibliocommons.com/v2/events/6aed2afb9d27a00045560d4f' 2026-12-11
reg afterschool-adventures-holiday-sessions-at-lemon-grove-library-ca 'Afterschool Adventures Holiday Sessions at Lemon Grove Library' 'Lemon Grove' 'https://sdcl.bibliocommons.com/v2/events/69a896a98d5e2d093363279f' 2026-12-03
reg welcome-to-whoville-at-the-national-city-public-library-ca 'Welcome to Whoville at the National City Public Library' 'National City' 'https://www.nationalcityca.gov/Home/Components/Calendar/Event/25414/786?curm=12&cury=2026' 2026-12-05
reg photos-with-santa-at-plaza-bonita-national-city-ca 'Photos with Santa at Plaza Bonita' 'National City' 'https://www.shopplazabonita.com/' 2026-11-27
reg a-kimball-holiday-at-kimball-park-national-city-ca 'A Kimball Holiday at Kimball Park' 'National City' 'https://www.instagram.com/p/Df2hkIviNnW/' 2026-12-12
reg holiday-at-the-park-with-the-oceanside-public-library-ca 'Holiday at the Park with the Oceanside Public Library' 'Oceanside' 'https://oceansidepl.librarycalendar.com/event/holiday-park-62360' 2026-12-14
reg the-nutcracker-by-southern-california-ballet-at-the-poway-center-ca 'The Nutcracker by Southern California Ballet at the Poway Center for the Performing Arts' 'Poway' 'https://www.southerncaliforniaballet.org/nutcracker-2026' 2026-12-19
reg santa-and-symphonette-and-gingerbread-house-decorating-at-the-poway-library-ca 'Santa and Symphonette and Gingerbread House Decorating at the Poway Library' 'Poway' 'https://sdcl.bibliocommons.com/v2/events/6af63f6c6d7b4d002c672390' 2026-12-05
reg ramona-christmas-tree-lighting-in-old-town-ramona-ca 'Ramona Christmas Tree Lighting in Old Town Ramona' 'Ramona' 'https://ramonachamber.com/christmas-tree-lighting/' 2026-12-05
reg holiday-party-with-pictures-with-santa-at-the-ramona-library-ca 'Holiday Party with Pictures with Santa at the Ramona Library' 'Ramona' 'https://sdcl.bibliocommons.com/v2/events/6aff39c532ce6d08d54c0e0c' 2026-12-10
reg the-hip-hop-nutcracker-at-the-balboa-theatre-san-diego-ca 'The Hip Hop Nutcracker at the Balboa Theatre' 'San Diego' 'https://www.sandiegotheatres.org/events/detail/the-hip-hop-nutcracker-2026' 2026-12-04
reg elf-the-musical-at-the-san-diego-civic-theatre-ca 'Elf the Musical at the San Diego Civic Theatre' 'San Diego' 'https://www.broadwaysd.com/upcoming-events/elf-the-musical/' 2026-12-29
reg cygnet-theatre-a-christmas-carol-and-a-magical-holiday-at-liberty-san-diego-ca 'Cygnet Theatre A Christmas Carol and A Magical Holiday at Liberty Station' 'San Diego' 'https://cygnettheatre.org/show/season26-27/cygnets-a-magical-holiday/' 2026-11-27
reg mission-bay-parade-of-lights-hosted-by-mission-bay-yacht-club-san-diego-ca 'Mission Bay Parade of Lights Hosted by Mission Bay Yacht Club' 'San Diego' 'https://mbyc.org/submaster.cfm?aPage=calendardetails.cfm&CalID=6759' 2026-12-12
reg pacific-beach-holiday-parade-on-garnet-avenue-san-diego-ca 'Pacific Beach Holiday Parade on Garnet Avenue' 'San Diego' 'https://www.pacificbeach.org/event/pacific-beach-holiday-parade-4/' 2026-12-12
reg christmas-on-crystal-pier-in-pacific-beach-san-diego-ca 'Christmas on Crystal Pier in Pacific Beach' 'San Diego' 'https://www.pacificbeach.org/event/16341/' 2026-12-05
reg pictures-with-santa-at-serra-mesa-recreation-center-san-diego-ca 'Pictures with Santa at Serra Mesa Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/serramesa' 2026-12-18
reg cookies-with-santa-at-nobel-recreation-center-san-diego-ca 'Cookies with Santa at Nobel Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/nobel' 2026-12-16
reg cookies-with-santa-at-penn-athletic-field-san-diego-ca 'Cookies with Santa at Penn Athletic Field' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/penn' 2026-12-12
reg winter-wonderland-at-azalea-recreation-center-san-diego-ca 'Winter Wonderland at Azalea Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/azalea' 2026-12-16
reg diy-gingerbread-houses-at-la-jolla-riford-library-san-diego-ca 'DIY Gingerbread Houses at La Jolla Riford Library' 'San Diego' 'https://sandiego.events.mylibrary.digital/event?id=456000' 2026-12-05
reg gingerbread-house-making-party-at-balboa-library-san-diego-ca 'Gingerbread House Making Party at Balboa Library' 'San Diego' 'https://sandiego.events.mylibrary.digital/event?id=450917' 2026-12-05
reg santas-cookie-decorating-party-at-san-ysidro-library-san-diego-ca 'Santa'\''s Cookie Decorating Party at San Ysidro Library' 'San Diego' 'https://sandiego.events.mylibrary.digital/event?id=328526' 2026-12-08
reg holiday-program-with-santa-and-a-gift-tag-craft-at-the-san-marcos-library-ca 'Holiday Program with Santa and a Gift Tag Craft at the San Marcos Library' 'San Marcos' 'https://sdcl.bibliocommons.com/v2/events/6afe13806aae8314dad9289e' 2026-12-08
reg storytime-with-santa-claus-at-santee-library-ca 'Storytime with Santa Claus at Santee Library' 'Santee' 'https://sdcl.bibliocommons.com/v2/events/6af7a90415292a005cfbe9fd' 2026-12-01
reg santas-sleigh-ride-in-solana-beach-ca 'Santa'\''s Sleigh Ride in Solana Beach' 'Solana Beach' 'https://cityofsolanabeach.ca.gov/en/node/3576' 2026-12-11
reg ho-ho-holiday-at-solana-beach-library-ca 'Ho-Ho-Holiday at Solana Beach Library' 'Solana Beach' 'https://sdcl.bibliocommons.com/v2/events/6afe372369e1ca185848e301' 2026-12-08
reg gingerbread-house-decorating-at-solana-beach-library-ca 'Gingerbread House Decorating at Solana Beach Library' 'Solana Beach' 'https://sdcl.bibliocommons.com/v2/events/6afcf02ce2267c00335d2421' 2026-12-15
reg vista-village-tree-lighting-ca 'Vista Village Tree Lighting' 'Vista' 'https://shopvistavillage.com/events/vista-village-vista-village-tree-lighting/' 2026-12-06
reg photos-with-santa-at-the-vista-library-ca 'Photos with Santa at the Vista Library' 'Vista' 'https://sdcl.bibliocommons.com/v2/events/6ab57e69ca248a0029183580' 2026-12-02
echo "round 2: added $ok, need review $skip"
