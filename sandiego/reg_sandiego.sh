#!/usr/bin/env bash
# San Diego metro run registry adds (84 events). Run from ~/Downloads/sa/registry AFTER the pages are live.
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

reg holiday-at-the-rancho-at-leo-carrillo-ranch-carlsbad-ca 'Holiday at the Rancho at Leo Carrillo Ranch' 'Carlsbad' 'https://www.carlsbadca.gov/departments/parks-recreation/programs-and-events/special-events/holiday-at-the-rancho' 2026-12-05
reg carlsbad-village-tree-lighting-and-santa-photos-at-village-faire-ca 'Carlsbad Village Tree Lighting and Santa Photos at Village Faire' 'Carlsbad' 'https://www.shopvillagefaire.com/event/carlsbad-holiday-tree-lighting/' 2026-12-06
reg coastal-holiday-magic-tree-lighting-at-cape-rey-carlsbad-beach-ca 'Coastal Holiday Magic Tree Lighting at Cape Rey Carlsbad Beach' 'Carlsbad' 'https://www.chandlerscarlsbad.com/event/holiday-tree-lighting-market-santa-photos/' 2026-12-03
reg santa-visits-at-the-forum-carlsbad-ca 'Santa Visits at The Forum Carlsbad' 'Carlsbad' 'https://theforumcarlsbad.com/events/the-forum-carlsbad-santa-visits-the-forum-2' 2026-12-05
reg a-very-furry-christmas-celebration-at-sesame-place-san-diego-chula-vista-ca 'A Very Furry Christmas Celebration at Sesame Place San Diego' 'Chula Vista' 'https://sesameplace.com/san-diego/events/a-very-furry-christmas/' 2026-11-07
reg dazzling-holiday-light-show-and-snowfall-at-village-walk-chula-vista-ca 'Dazzling Holiday Light Show and Snowfall at Village Walk at EastLake' 'Chula Vista' 'https://shopvillagewalk.com/special-events/' 2026-11-29
reg holiday-express-train-rides-with-santa-at-village-walk-chula-vista-ca 'Holiday Express Train Rides with Santa at Village Walk' 'Chula Vista' 'https://shopvillagewalk.com/special-events/' 2026-12-05
reg xmas-posada-at-chula-vista-center-ca 'Xmas Posada at Chula Vista Center' 'Chula Vista' 'https://chulavistacenter.com/news-events/' 2026-12-12
reg celebrate-christmas-and-christmas-fair-at-hilltop-tabernacle-chula-vista-ca 'Celebrate Christmas and Christmas Fair at Hilltop Tabernacle' 'Chula Vista' 'https://www.zeffy.com/en-US/ticketing/celebrate-christmas--2026' 2026-12-13
reg breakfast-with-santa-at-the-coronado-community-center-ca 'Breakfast with Santa at the Coronado Community Center' 'Coronado' 'https://ca-coronado.civicrec.com/CA/coronado-ca/catalog/index/072e040566764cb1d2d99ba5340ef598?filter=c2VhcmNoPWJyZWFrZmFzdA==' 2026-12-12
reg a-holiday-cabaret-at-coronado-playhouse-ca 'A Holiday Cabaret at Coronado Playhouse' 'Coronado' 'https://www.coronadoplayhouse.org/event/holiday-cabaret-2026/2026-12-19/' 2026-12-18
reg childrens-library-decorating-day-at-the-coronado-public-library-ca 'Children'"'"'s Library Decorating Day at the Coronado Public Library' 'Coronado' 'https://coronadolibrary.org/CivicAlerts.aspx?AID=100' 2026-12-01
reg coronado-artisans-alley-craft-fair-ca 'Coronado Artisans Alley Craft Fair' 'Coronado' 'https://coronadoartisansalley.com/schedule/' 2026-12-05
reg lambs-festival-of-christmas-fargo-north-of-normal-coronado-ca 'Lamb'"'"'s Festival of Christmas: Fargo North of Normal' 'Coronado' 'https://www.lambsplayers.org/fargo-north-of-normal-description' 2026-11-26
reg coastal-christmas-holiday-light-spectacular-at-the-del-mar-fairgrounds-ca 'Coastal Christmas Holiday Light Spectacular at the Del Mar Fairgrounds' 'Del Mar' 'https://www.coastalchristmasdelmar.com/' 2026-12-11
reg winter-wonderland-at-wells-park-el-cajon-ca 'Winter Wonderland at Wells Park' 'El Cajon' 'https://www.elcajon.gov/your-government/departments/parks-recreation/special-events/winter-wonderland' 2026-12-05
reg heritage-tree-lighting-and-holiday-village-at-moonlight-beach-encinitas-ca 'Heritage Tree Lighting and Holiday Village at Moonlight Beach' 'Encinitas' 'https://local.encinitaschamber.com/events/details/encinitas-holiday-village-market-14226' 2026-12-04
reg cardiff-kringle-mingle-ca 'Cardiff Kringle Mingle' 'Encinitas' 'https://www.cardiff101.com/events-calendar/kringlemingle2026' 2026-12-06
reg north-coast-symphony-sleigh-bells-and-snowflakes-concert-encinitas-ca 'North Coast Symphony Sleigh Bells and Snowflakes Concert' 'Encinitas' 'https://www.northcoastsymphony.com/concertstickets.html' 2026-12-10
reg escondido-holiday-festival-at-grape-day-park-ca 'Escondido Holiday Festival at Grape Day Park' 'Escondido' 'https://usamulticultural.org/holiday-festival/' 2026-12-12
reg bethlehem-walk-of-escondido-ca 'Bethlehem Walk of Escondido' 'Escondido' 'https://sites.google.com/view/felicitaward/news/bethlehem-walk' 2026-12-11
reg ups-and-downtown-roller-rink-in-downtown-escondido-ca 'Ups and Downtown Roller Rink in Downtown Escondido' 'Escondido' 'https://www.downtownescondido.com/holidays-downtown-escondido' 2026-12-05
reg the-nutcracker-by-san-elijo-dance-and-music-academy-escondido-ca 'The Nutcracker by San Elijo Dance and Music Academy' 'Escondido' 'https://artcenter.org/event/sedma_nutcracker/' 2026-12-12
reg world-ballet-company-the-nutcracker-in-escondido-ca 'World Ballet Company The Nutcracker in Escondido' 'Escondido' 'https://worldballetcompany.com/event/california-center-for-the-arts/' 2026-12-27
reg cirque-musica-holiday-wonderland-at-california-center-for-the-arts-escondido-ca 'Cirque Musica Holiday Wonderland at California Center for the Arts' 'Escondido' 'https://artcenter.org/event/cirque-musica-holiday-wonderland/' 2026-12-09
reg fallbrook-tree-lighting-festival-at-fallbrook-community-center-ca 'Fallbrook Tree Lighting Festival at Fallbrook Community Center' 'Fallbrook' 'https://www.fallbrookcommunitycenter.com/programs' 2026-12-04
reg fused-glass-snowman-ornament-workshop-at-fallbrook-school-of-the-arts-ca 'Fused Glass Snowman Ornament Workshop at Fallbrook School of the Arts' 'Fallbrook' 'https://www.fallbrookschoolofthearts.org/event-details/fusedglassholidayornaments' 2026-12-05
reg christmas-open-house-at-fallbrook-historical-society-ca 'Christmas Open House at Fallbrook Historical Society' 'Fallbrook' 'https://www.fallbrookhistoricalsociety.org/events/fhs-christmas-open-house-5/' 2026-12-12
reg breakfast-with-santa-at-fallbrook-community-center-ca 'Breakfast with Santa at Fallbrook Community Center' 'Fallbrook' 'https://www.fallbrookcommunitycenter.com/programs' 2026-12-19
reg small-town-holiday-and-tree-lighting-at-portwood-pier-plaza-imperial-beach-ca 'Small Town Holiday and Tree Lighting at Portwood Pier Plaza' 'Imperial Beach' 'https://www.imperialbeachca.gov/1729/Small-Town-Holiday-Holiday-Tree-Lighting' 2026-12-05
reg santa-at-julian-town-hall-ca 'Santa at Julian Town Hall' 'Julian' 'https://events.timely.fun/gvps21e5/event/78495756/20261205100000' 2026-12-05
reg gingerbread-house-display-at-julian-town-hall-ca 'Gingerbread House Display at Julian Town Hall' 'Julian' 'https://events.timely.fun/gvps21e5/event/78495727/20261208100000' 2026-12-08
reg a-christmas-carol-at-julian-high-school-little-theater-ca 'A Christmas Carol at Julian High School Little Theater' 'Julian' 'https://eastcountyarts.org/tickets/' 2026-12-11
reg holiday-hayride-at-fort-cross-old-timey-adventures-santa-ysabel-ca 'Holiday Hayride at Fort Cross Old Timey Adventures' 'Santa Ysabel' 'https://www.fortcross.com/holiday-hayride' 2026-11-28
reg christmas-on-mt-helix-at-mount-helix-park-la-mesa-ca 'Christmas on Mt. Helix at Mount Helix Park' 'La Mesa' 'https://www.mthelixpark.org/christmas/' 2026-12-05
reg home-for-the-holidays-at-lamplighters-theatre-la-mesa-ca 'Home for the Holidays at Lamplighters Theatre' 'La Mesa' 'https://www.lamplighterslamesa.com/' 2026-11-27
reg lakeside-spirit-of-christmas-on-maine-avenue-ca 'Lakeside Spirit of Christmas on Maine Avenue' 'Lakeside' 'https://lakesidechamber.org/spirit-of-christmas' 2026-12-05
reg snow-day-at-lindo-lake-county-park-lakeside-ca 'Snow Day at Lindo Lake County Park' 'Lakeside' 'https://tockify.com/sdparkscalendar/detail/1000/1796425200000' 2026-12-04
reg construction-christmas-at-omas-family-farm-lakeside-ca 'Construction Christmas at Oma'"'"'s Family Farm' 'Lakeside' 'https://omasfamilyfarm.ticketspice.com/omas-christmas-2026' 2026-12-02
reg lemon-grove-community-bonfire-at-treganza-heritage-park-ca 'Lemon Grove Community Bonfire at Treganza Heritage Park' 'Lemon Grove' 'https://www.lemongrove.ca.gov/media/l1obqzfw/bonfire-2026.pdf' 2026-12-04
reg sensory-friendly-santa-experience-at-plaza-bonita-national-city-ca 'Sensory-Friendly Santa Experience at Plaza Bonita' 'National City' 'https://shopplazabonita.com/event/44116-sensory-friendly-santa-experience' 2026-12-06
reg christmas-light-show-spectacular-at-calvary-chapel-oceanside-ca 'Christmas Light Show Spectacular at Calvary Chapel Oceanside' 'Oceanside' 'https://www.calvaryoceanside.org/christmas' 2026-11-30
reg light-up-the-night-christmas-festival-in-oceanside-ca 'Light Up the Night Christmas Festival in Oceanside' 'Oceanside' 'https://www.calvaryoceanside.org/christmas' 2026-12-05
reg snowside-winter-festival-at-emerald-isle-golf-course-oceanside-ca 'SnowSide Winter Festival at Emerald Isle Golf Course' 'Oceanside' 'https://snowsidewinterfestival.com/' 2026-12-11
reg boat-ride-with-santa-in-oceanside-harbor-ca 'Boat Ride with Santa in Oceanside Harbor' 'Oceanside' 'https://www.oceansidewhalewatching.com/cruises/boat-ride-with-santa/' 2026-12-12
reg christmas-4-kidz-charity-concert-at-miracosta-college-oceanside-ca 'Christmas 4 Kidz Charity Concert at MiraCosta College' 'Oceanside' 'https://www.christmas4kidz.com/' 2026-12-13
reg night-at-the-museum-at-mission-san-luis-rey-oceanside-ca 'Night at the Museum at Mission San Luis Rey' 'Oceanside' 'https://sanluisrey.org/christmas-events-san-diego/' 2026-12-26
reg poway-midland-railroad-train-rides-at-old-poway-park-ca 'Poway-Midland Railroad Train Rides at Old Poway Park' 'Poway' 'https://powaymidlandrr.org/visit/' 2026-11-28
reg prodigy-holiday-showcase-at-the-poway-center-for-the-performing-arts-ca 'Prodigy Holiday Showcase at the Poway Center for the Performing Arts' 'Poway' 'https://powaycenter.com/CivicAlerts.aspx?AID=1138' 2026-12-13
reg the-enchanted-garden-holiday-event-in-poway-ca 'The Enchanted Garden Holiday Event in Poway' 'Poway' 'https://www.instagram.com/p/DfxnrrNS3-c/' 2026-12-13
reg candlelight-christmas-dinner-with-santa-at-the-ramona-heritage-museum-ca 'Candlelight Christmas Dinner with Santa at the Ramona Heritage Museum' 'Ramona' 'https://ramonachamber.com/christmas-tree-lighting/' 2026-12-05
reg free-kids-stockings-and-photos-with-santa-at-tb-the-brokerage-in-ramona-ca 'Free Kids Stockings and Photos with Santa at TB The Brokerage in Ramona' 'Ramona' 'https://www.instagram.com/reel/DgAzcoSyGo-/' 2026-12-06
reg san-diego-civic-youth-ballet-the-nutcracker-at-casa-del-prado-theater-ca 'San Diego Civic Youth Ballet The Nutcracker at Casa del Prado Theater' 'San Diego' 'https://www.sdcyb.org/tickets' 2026-12-11
reg nutcracker-and-family-sing-along-sundays-at-the-spreckels-organ-san-diego-ca 'Nutcracker and Family Sing-Along Sundays at the Spreckels Organ Pavilion' 'San Diego' 'https://www.spreckelsorgan.org/sundays' 2026-11-29
reg camarada-let-it-snow-family-concert-at-the-san-diego-museum-of-art-ca 'Camarada Let It Snow Family Concert at The San Diego Museum of Art' 'San Diego' 'https://www.sdmart.org/event/camarada-let-it-snow-family-concert/' 2026-12-12
reg polar-express-family-day-at-the-san-diego-model-railroad-museum-ca 'Polar Express Family Day at the San Diego Model Railroad Museum' 'San Diego' 'https://www.sdmrm.org/polarexpressfamilyday' 2026-12-19
reg swiss-winter-village-at-liberty-station-san-diego-ca 'Swiss Winter Village at Liberty Station' 'San Diego' 'https://swisswintervillage.com/san-diego/' 2026-11-27
reg jingle-belle-family-cruise-with-santa-on-mission-bay-san-diego-ca 'Jingle Belle Family Cruise with Santa on Mission Bay' 'San Diego' 'https://www.bahiahotel.com/event/jingle-belle-family-cruise-santa-mission-bay' 2026-12-20
reg christmas-in-old-town-at-fiesta-de-reyes-san-diego-ca 'Christmas in Old Town at Fiesta de Reyes' 'San Diego' 'https://fiestadereyes.com/' 2026-11-27
reg winter-wonderland-snow-hill-at-hilltop-recreation-center-san-diego-ca 'Winter Wonderland Snow Hill at Hilltop Recreation Center' 'San Diego' 'https://www.sandiego.gov/event/winter-wonderland-hilltop-recreation-center-1' 2026-12-05
reg winter-wonderland-snow-day-at-montgomery-waller-recreation-center-san-diego-ca 'Winter Wonderland Snow Day at Montgomery Waller Recreation Center' 'San Diego' 'https://www.sandiego.gov/event/winter-wonderland-snow-day-montgomery-waller-recreation-center-0' 2026-12-05
reg winter-carnival-at-park-de-la-cruz-in-city-heights-san-diego-ca 'Winter Carnival at Park de la Cruz in City Heights' 'San Diego' 'https://www.sandiego.gov/event/winter-carnival-park-de-la-cruz-community-center' 2026-12-05
reg hot-cocoa-by-the-bay-at-santa-clara-recreation-center-san-diego-ca 'Hot Cocoa by the Bay at Santa Clara Recreation Center' 'San Diego' 'https://www.sandiego.gov/event/hot-cocoa-bay-santa-clara-recreation-center' 2026-12-05
reg cookies-with-the-grinch-at-paradise-hills-recreation-center-san-diego-ca 'Cookies with the Grinch at Paradise Hills Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/paradise' 2026-12-04
reg santa-visits-north-park-library-san-diego-ca 'Santa Visits North Park Library' 'San Diego' 'https://sandiego.events.mylibrary.digital/event?id=451260' 2026-12-07
reg holiday-on-adams-avenue-snow-play-in-kensington-park-san-diego-ca 'Holiday on Adams Avenue Snow Play in Kensington Park' 'San Diego' 'https://www.adamsavenuebusiness.com/event-info/holiday-on-adams-avenue/' 2026-12-13
reg churros-with-santa-and-the-grinch-at-mlk-jr-recreation-center-san-diego-ca 'Churros with Santa and the Grinch at MLK Jr. Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/dr-mlk-jr' 2026-12-16
reg dinner-in-whoville-and-cookies-with-santa-at-encanto-recreation-san-diego-ca 'Dinner in Whoville and Cookies with Santa at Encanto Recreation Center' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/encanto' 2026-12-17
reg winter-wonderland-at-willie-henderson-sports-complex-san-diego-ca 'Winter Wonderland at Willie Henderson Sports Complex' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/willhenderson' 2026-12-18
reg breakfast-with-santa-at-the-municipal-gym-in-balboa-park-san-diego-ca 'Breakfast with Santa at the Municipal Gym in Balboa Park' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/munigym' 2026-12-19
reg santas-workshop-at-san-ysidro-larsen-field-san-diego-ca 'Santa'"'"'s Workshop at San Ysidro Larsen Field' 'San Diego' 'https://www.sandiego.gov/park-and-recreation/centers/recctr/larsenfield' 2026-12-19
reg lakehouse-winter-wonderland-at-lake-san-marcos-ca 'Lakehouse Winter Wonderland at Lake San Marcos' 'San Marcos' 'https://www.thelakehouseresort.com/lakehouse-winter-wonderland' 2026-11-27
reg santa-sundays-at-lakehouse-winter-wonderland-san-marcos-ca 'Santa Sundays at Lakehouse Winter Wonderland' 'San Marcos' 'https://events.thelakehouseresort.com/e/lakehouse-winter-wonderland' 2026-11-29
reg san-marcos-holly-jolly-holiday-market-at-north-city-ca 'San Marcos Holly Jolly Holiday Market at North City' 'San Marcos' 'https://www.northcity.com/events/holiday-market' 2026-12-06
reg merry-grinchmas-paint-party-on-the-deck-at-santee-lakes-ca 'Merry Grinchmas Paint Party on The Deck at Santee Lakes' 'Santee' 'https://www.santeelakes.com/event/merry-grinchmas-paint-party-on-the-deck%f0%9f%92%9a/' 2026-12-05
reg water-lantern-festival-holiday-edition-at-santee-lakes-ca 'Water Lantern Festival Holiday Edition at Santee Lakes' 'Santee' 'https://www.waterlanternfestival.com/events/san-diego' 2026-12-12
reg starlight-circle-christmas-lights-santee-ca 'Starlight Circle Christmas Lights' 'Santee' 'https://www.cityofsanteeca.gov/visitors/starlight-circle' 2026-12-01
reg christmas-kids-camp-at-heart-art-studio-santee-ca 'Christmas Kids Camp at Heart Art Studio' 'Santee' 'https://heartartsd.com/products/christmas-kids-camp-ages-6-12-dec-21-23' 2026-12-21
reg fletcher-cove-holiday-tree-lighting-solana-beach-ca 'Fletcher Cove Holiday Tree Lighting' 'Solana Beach' 'https://cityofsolanabeach.ca.gov/en/node/3575' 2026-12-06
reg holiday-tree-lighting-at-la-colonia-park-solana-beach-ca 'Holiday Tree Lighting at La Colonia Park' 'Solana Beach' 'https://cityofsolanabeach.ca.gov/en/node/3577' 2026-12-13
reg spring-valley-winter-fest-at-spring-valley-community-center-ca 'Spring Valley Winter Fest at Spring Valley Community Center' 'Spring Valley' 'https://tockify.com/sdparkscalendar/detail/1001/1797033600000' 2026-12-11
reg rancho-christmas-at-rancho-guajome-adobe-vista-ca 'Rancho Christmas at Rancho Guajome Adobe' 'Vista' 'https://www.sdparks.org/content/sdparks/en/park-pages/RanchoGuajomeAdobe.html' 2026-12-12
reg holiday-fest-at-vista-historical-society-museum-ca 'Holiday Fest at Vista Historical Society Museum' 'Vista' 'https://www.vistahistoricalsociety.com/about/calendar/holiday-fest' 2026-12-13
reg the-nightmare-before-christmas-kids-show-at-broadway-theater-vista-ca 'The Nightmare Before Christmas Kids Show at Broadway Theater Vista' 'Vista' 'https://www.broadwayvista.biz/drama-camps.html' 2026-12-21
echo "added $ok, need review $skip"
