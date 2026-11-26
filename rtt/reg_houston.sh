# Houston run registry adds (106). Run from ~/Downloads/sa/registry AFTER the pages are live.
# Usage: bash reg_houston.sh [start] [count]   (default 1 10; about 10 per call because of the 180 s limit)
S=${1:-1}; N=${2:-10}
tail -n +$((S+8)) "$0" | head -n "$N" | while IFS='|' read -r slug name city url date; do
  python3 registry.py add --slug "$slug" --name "$name" --city "$city" --cc tx --url "$url" --date "$date" --status live --confirm-new
done
exit 0
#DATA
home-for-the-holidays-christmas-festival-and-light-parade-at-national-alvin-tx|Home for the Holidays Christmas Festival and Light Parade at National Oak Park|Alvin|https://www.alvin.gov/CivicAlerts.aspx?AID=193|2026-12-05
productions-in-the-park-at-home-for-the-holidays-in-alvin-tx|Productions in the Park at Home for the Holidays in Alvin|Alvin|https://www.alvin.gov/CivicAlerts.aspx?AID=193|2026-12-04
winter-wonderland-at-houston-northeast-church-humble-tx|Winter Wonderland at Houston Northeast Church|Atascocita|https://www.houstonnortheast.org/christmas|2026-12-11
pancakes-with-santa-and-frosty-at-the-pentecostal-church-of-atascocita-humble-tx|Pancakes with Santa and Frosty at The Pentecostal Church of Atascocita|Atascocita|https://www.atascocitaupc.com/event-detail?mc-slug=24371549-2026-12-12-pancakes-with-santa-and-frosty|2026-12-12
free-photos-with-santa-at-crcu-atascocita-branch-tx|Free Photos with Santa at CRCU Atascocita Branch|Atascocita|https://www.crcu.org/|2026-12-01
midwinter-melodies-and-polar-express-steam-at-atascocita-branch-humble-tx|Midwinter Melodies and Polar Express STEAM at Atascocita Branch Library|Atascocita|https://hcpl.bibliocommons.com/v2/events/6b0762392c9511004534a715|2026-12-12
humble-christmas-parade-of-lights-in-downtown-humble-tx|Humble Christmas Parade of Lights in Downtown Humble|Humble|https://www.cityofhumbletx.gov/events/|2026-12-01
homestead-for-the-holidays-at-jesse-h-jones-park-and-nature-center-humble-tx|Homestead for the Holidays at Jesse H. Jones Park and Nature Center|Humble|https://www.pct3.com/Explore/Events-Registration/Event-Calendar/EventID/6623/Homestead-for-the-Holidays-Jesse-H-Jones-Park-Nature-Center|2026-12-12
christmas-on-texas-avenue-festival-at-baytown-town-square-tx|Christmas on Texas Avenue Festival at Baytown Town Square|Baytown|https://www.acedistrictbaytown.org/event-details/2026-christmas-on-texas-avenue-festival|2026-12-05
the-muppet-christmas-carol-at-lee-college-performing-arts-center-baytown-tx|The Muppet Christmas Carol at Lee College Performing Arts Center|Baytown|https://www.lee.edu/pac/|2026-12-17
holiday-market-and-gingerbread-habitats-at-nature-discovery-center-bellaire-tx|Holiday Market and Gingerbread Habitats at Nature Discovery Center|Bellaire|https://naturediscoverycenter.org/event/holiday-market/|2026-12-05
christmas-over-conroe-at-west-conroe-baptist-church-tx|Christmas Over Conroe at West Conroe Baptist Church|Conroe|https://www.wcbc.us/event/christmas-over-conroe-2/2026-12-04/|2026-12-04
christmas-festival-at-first-methodist-conroe-tx|Christmas Festival at First Methodist Conroe|Conroe|https://fmconroe.org/event/24479714-2026-12-05-christmas-festival/|2026-12-05
pictures-with-santa-at-the-table-at-madeley-conroe-tx|Pictures with Santa at The Table at Madeley|Conroe|https://conroetable.com/events/santa-nate-live-at-the-table-at-madeley-2026-12-08|2026-12-09
christmas-tree-lighting-at-juergens-hall-community-center-cypress-tx|Christmas Tree Lighting at Juergen's Hall Community Center|Cypress|https://www.pct3.com/Explore/Events-Registration/Event-Calendar/EventID/6647/CRC/336201CE81BC5746D828C8A5F954CE76|2026-12-18
santa-in-pajamas-at-play-street-museum-cypress-tx|Santa in Pajamas at Play Street Museum Cypress|Cypress|https://book.playstreetmuseum.com/p/n/G7TLB2rJ|2026-12-13
reindeer-park-at-jimmy-burke-activity-center-tx|Reindeer Park at Jimmy Burke Activity Center|Deer Park|https://www.deerparktx.gov/2336/Reindeer-Park|2026-12-05
gingerbread-house-decorating-class-at-dow-active-complex-deer-park-tx|Gingerbread House Decorating Class at Dow Active Complex|Deer Park|https://txdeerparkweb.myvscloud.com/webtrac/web/iteminfo.html?Module=AR&FMID=20367892|2026-12-12
geocaching-twas-the-night-at-dow-park-deer-park-tx|Geocaching 'Twas the Night at Dow Park|Deer Park|https://txdeerparkweb.myvscloud.com/webtrac/web/iteminfo.html?Module=AR&FMID=20367858|2026-12-15
pancakes-and-pajamas-at-deer-park-theatre-building-tx|Pancakes & Pajamas at Deer Park Theatre Building|Deer Park|https://txdeerparkweb.myvscloud.com/webtrac/web/iteminfo.html?Module=AR&FMID=20368084|2026-12-19
winter-holiday-storytime-and-movie-matinee-at-deer-park-public-library-tx|Winter Holiday Storytime and Movie Matinee at Deer Park Public Library|Deer Park|https://deerparktx.gov/Calendar.aspx?EID=9788|2026-12-10
dickinson-festival-of-lights-at-paul-hopkins-park-tx|Dickinson Festival of Lights at Paul Hopkins Park|Dickinson|https://dfoltx.com/|2026-11-28
santa-in-the-park-at-stevenson-park-friendswood-tx|Santa in the Park at Stevenson Park|Friendswood|https://www.ci.friendswood.tx.us/386/Santa-in-the-Park-December|2026-12-12
holiday-tree-lighting-at-cross-creek-ranch-welcome-center-fulshear-tx|Holiday Tree Lighting at Cross Creek Ranch Welcome Center|Fulshear|https://www.mycrosscreektexas.com/|2026-11-28
holiday-movie-night-at-the-landing-in-cross-creek-ranch-fulshear-tx|Holiday Movie Night at The Landing in Cross Creek Ranch|Fulshear|https://www.mycrosscreektexas.com/|2026-12-03
christmas-tree-lighting-and-holiday-market-at-fulshear-municipal-complex-tx|Christmas Tree Lighting and Holiday Market at Fulshear Municipal Complex|Fulshear|https://www.fulsheartexas.gov/about-us/special-events/holiday-events|2026-12-05
galveston-christmas-parade-tx|Galveston Christmas Parade|Galveston|https://www.galvestontx.gov/1022/Christmas-Parade|2026-12-12
holiday-train-on-the-hermann-park-railroad-houston-tx|Holiday Train on the Hermann Park Railroad|Houston|https://hermannpark.org/event/holiday-train-holiday-carousel/|2026-11-20
holidays-in-hermann-park-houston-tx|Holidays in Hermann Park|Houston|https://hermannpark.org/event/holidays-in-hermann-park/|2026-12-05
galaxy-lights-at-space-center-houston-tx|Galaxy Lights at Space Center Houston|Houston|https://spacecenter.org/galaxy-lights/|2026-11-14
christmas-village-at-bayou-bend-houston-tx|Christmas Village at Bayou Bend|Houston|https://www.mfah.org/events/christmas-village-bayou-bend|2026-12-04
radiant-nature-at-houston-botanic-garden-tx|Radiant Nature at Houston Botanic Garden|Houston|https://hbg.org/series/radiant-nature/|2026-11-20
holly-jolly-santa-events-and-polar-express-movie-party-at-hmns-houston-tx|Holly Jolly Santa Events and Polar Express Movie Party at HMNS|Houston|https://www.hmns.org/holly-jolly/|2026-12-05
snow-flurry-at-the-houston-museum-of-natural-science-tx|Snow Flurry at the Houston Museum of Natural Science|Houston|https://www.hmns.org/events/snow-flurry/|2026-12-20
polar-palooza-real-snow-days-at-childrens-museum-houston-tx|Polar Palooza Real Snow Days at Children's Museum Houston|Houston|https://www.cmhouston.org/events/polar-palooza|2026-12-19
very-merry-pops-at-jones-hall-houston-tx|Very Merry Pops at Jones Hall|Houston|https://houstonsymphony.org/performance/very-merry-pops/|2026-12-10
breakfast-with-santa-at-the-downtown-aquarium-houston-tx|Breakfast with Santa at the Downtown Aquarium|Houston|https://www.downtownaquariumhouston.com/breakfast-with-santa|2026-12-12
winter-wonderlawn-at-post-houston-tx|Winter Wonderlawn at POST Houston|Houston|https://www.posthtx.com/program/winter-wonderlawn-26|2026-11-06
junie-b-in-jingle-bells-batman-smells-at-main-street-theater-houston-tx|Junie B. in Jingle Bells, Batman Smells at Main Street Theater|Houston|https://mainstreettheater.com/junie-b-in-jingle-bells-batman-smells/|2026-11-28
photos-with-santa-at-memorial-city-mall-houston-tx|Photos with Santa at Memorial City Mall|Houston|https://www.visithoustontexas.com/event/photos-with-santa/117673/|2026-11-09
deck-the-hall-mayors-holiday-tree-lighting-and-concert-at-hermann-houston-tx|Deck the Hall: Mayor's Holiday Tree Lighting and Concert at Hermann Square|Houston|https://houstontx.gov/deckthehall|2026-12-05
neighborhood-nights-presented-by-h-e-b-holiday-edition-at-memorial-houston-tx|Neighborhood Nights presented by H-E-B: Holiday Edition at Memorial Park|Houston|https://www.memorialparkconservancy.org/event/neighborhood-nights-presented-by-h-e-b-holiday-edition/|2026-12-04
holiday-on-the-harbor-at-kings-harbor-waterfront-village-kingwood-tx|Holiday on the Harbor at Kings Harbor Waterfront Village|Houston|https://kings-harbor.com/calendar|2026-12-20
holiday-extravaganza-at-clear-lake-city-community-association-houston-tx|Holiday Extravaganza at Clear Lake City Community Association|Houston|https://www.clcca.org/holiday_extrvaganza|2026-12-12
lith-holiday-hayride-in-woodland-heights-houston-tx|LITH Holiday Hayride in Woodland Heights|Houston|https://www.woodland-heights.org/store/lith-holiday-hayride|2026-12-06
houston-public-library-winter-celebrations-at-alief-henington-and-walker-tx|Houston Public Library Winter Celebrations at Alief-Henington and Walker Libraries|Houston|https://calendar.houstonlibrary.org/event/18034306|2026-12-17
holiday-festival-at-levy-park-houston-tx|Holiday Festival at Levy Park|Houston|https://www.levyparkhouston.org/events/2026-holiday-festival/|2026-12-05
astros-light-up-the-park-at-daikin-park-houston-tx|Astros Light Up the Park at Daikin Park|Houston|https://www.mlb.com/astros/tickets/light-up-the-park|2026-12-04
a-christmas-carol-at-alley-theatre-houston-tx|A Christmas Carol at Alley Theatre|Houston|https://www.alleytheatre.org/plays/christmas-carol-2026/|2026-11-27
christmas-trains-at-second-baptist-woodway-houston-tx|Christmas Trains at Second Baptist Woodway|Houston|https://www.second.org/events/604|2026-11-29
ice-rink-at-discovery-green-houston-tx|Ice Rink at Discovery Green|Houston|https://www.discoverygreen.com/signature-experiences/ice-rink-at-discovery-green/|2026-11-13
lights-in-the-heights-in-woodland-heights-houston-tx|Lights in the Heights in Woodland Heights|Houston|https://www.woodland-heights.org/2026-lights-in-the-heights|2026-12-12
uptown-houston-holiday-lights-on-post-oak-boulevard-tx|Uptown Houston Holiday Lights on Post Oak Boulevard|Houston|https://www.visithoustontexas.com/events/holiday-lights-in-houston/|2026-11-11
a-katy-old-fashioned-christmas-market-and-photos-with-santa-at-the-dryer-tx|A Katy Old Fashioned Christmas Market and Photos with Santa at The Dryer|Katy|https://www.thedryer.com/events/1077/a-katy-old-fashioned-christmas|2026-12-04
historic-katy-christmas-tree-lighting-at-the-dryer-tx|Historic Katy Christmas Tree Lighting at The Dryer|Katy|https://www.thedryer.com/events/1055/historic-katy-christmas-tree-lighting|2026-12-02
santas-list-at-lacenterra-at-cinco-ranch-katy-tx|Santa's List at LaCenterra at Cinco Ranch|Katy|https://lacenterra.com/events/lacenterra-santa-s-list/|2026-12-11
the-light-park-drive-thru-christmas-lights-in-katy-tx|The Light Park Drive-Thru Christmas Lights in Katy|Katy|https://www.thelightpark.com/locations/katy-texas|2026-11-06
good-grief-its-christmas-charlie-brown-and-holiday-story-times-at-la-porte-tx|Good Grief, It's Christmas, Charlie Brown and Holiday Story Times at La Porte Branch Library|La Porte|https://hcpl.bibliocommons.com/v2/events?locations=LAP|2026-12-03
walk-the-lights-holiday-storywalk-at-maclean-park-lake-jackson-tx|Walk the Lights Holiday StoryWalk at MacLean Park|Lake Jackson|https://www.lakejackson-tx.gov/788/Light-Up-Lake-Jackson|2026-12-01
santa-in-the-lights-santa-tour-lake-jackson-tx|Santa in the Lights Santa Tour|Lake Jackson|https://www.lakejackson-tx.gov/944/Santa-Tours-GPS-Map|2026-12-19
tour-the-lights-interactive-map-of-lake-jackson-tx|Tour the Lights Interactive Map of Lake Jackson|Lake Jackson|https://www.lakejackson-tx.gov/788/Light-Up-Lake-Jackson|2026-12-11
holiday-in-the-park-at-league-park-league-city-tx|Holiday in the Park at League Park|League City|https://www.leaguecitytx.gov/CivicAlerts.aspx?AID=6501|2026-12-04
holiday-open-house-at-helen-hall-library-league-city-tx|Holiday Open House at Helen Hall Library|League City|https://www.leaguecitytx.gov/DocumentCenter/View/53060/December-2026-Events-and-Reminders|2026-12-03
jingle-on-the-boardwalk-at-kemah-boardwalk-tx|Jingle on the Boardwalk at Kemah Boardwalk|Kemah|https://www.kemahboardwalk.com/jingle-on-the-boardwalk|2026-11-28
christmas-in-the-park-at-texas-avenue-park-webster-tx|Christmas in the Park at Texas Avenue Park|Webster|https://www.webstertx.gov/CivicAlerts.aspx?AID=473|2026-12-12
magic-of-christmas-parade-of-lights-magnolia-tx|Magic of Christmas Parade of Lights|Magnolia|https://swmcchamber.org/event/the-magic-of-christmas-parade-of-lights/|2026-12-05
holidays-at-the-havyn-magnolia-tx|Holidays at The Havyn|Magnolia|https://woodhavyn.com/holidays-at-the-havyn-2026/|2026-12-05
winter-fest-at-magnolia-bible-church-tx|Winter Fest at Magnolia Bible Church|Magnolia|https://magnolia.church/|2026-12-18
photos-with-santa-at-spring-creek-growers-magnolia-tx|Photos with Santa at Spring Creek Growers|Magnolia|https://springcreekgrowers.com/santa/|2026-11-27
tinsel-and-tackle-kids-christmas-fishing-at-spring-creek-growers-magnolia-tx|Tinsel & Tackle Kids Christmas Fishing at Spring Creek Growers|Magnolia|https://springcreekgrowers.com/farm-adventures/|2026-11-29
snowfest-festival-and-tree-lighting-at-missouri-city-hall-complex-tx|SnowFest Festival and Tree Lighting at Missouri City Hall Complex|Missouri City|https://www.missouricitytx.gov/999/SnowFest|2026-12-05
christmas-by-the-campfire-and-nativity-stones-at-the-harvest-missouri-city-tx|Christmas By The Campfire and Nativity Stones at The Harvest Methodist Church|Missouri City|https://theharvestmethodist.churchcenter.com/registrations/events/3971054|2026-11-29
lone-star-christmas-parade-in-historic-downtown-montgomery-tx|Lone Star Christmas Parade in Historic Downtown Montgomery|Montgomery|https://www.montgomerytexas.gov/m/newsflash/Home/Detail/28|2026-12-12
christmas-in-historic-montgomery-and-candlelight-home-tour-tx|Christmas in Historic Montgomery and Candlelight Home Tour|Montgomery|https://www.mhs-tx.org/christmasinhistoricmontgomery|2026-12-12
deck-the-pines-at-pine-market-in-woodforest-montgomery-tx|Deck the Pines at Pine Market in Woodforest|Montgomery|https://www.woodforesttx.com/news/11322/celebrate-the-season-at-deck-the-pines-in-woodforest|2026-12-04
kressmas-at-kresston-montgomery-tx|Kressmas at Kresston|Montgomery|https://kresston.com/community-events/kressmas-detail-s-45-1797055200|2026-12-12
christmas-by-the-bayou-at-armand-bayou-nature-center-pasadena-tx|Christmas by the Bayou at Armand Bayou Nature Center|Pasadena|https://www.abnc.org/christmas-bayou|2026-12-06
christmas-at-the-museum-open-house-at-pasadena-heritage-park-and-museum-tx|Christmas at the Museum Open House at Pasadena Heritage Park and Museum|Pasadena|https://www.pasadenatx.gov/869/Christmas-in-Pasadena|2026-12-19
hometown-christmas-festival-at-independence-park-pearland-tx|Hometown Christmas Festival at Independence Park|Pearland|https://www.parks.pearlandtx.gov/special-events/hometown-christmas-festival|2026-12-04
tree-lighting-and-holiday-nights-at-pearland-town-center-tx|Tree Lighting and Holiday Nights at Pearland Town Center|Pearland|https://www.pearlandtowncenter.com/store/santas_workshop/event/tree-lighting-2026|2026-11-28
tour-de-lites-bike-ride-and-hayride-at-independence-park-pearland-tx|Tour de Lites Bike Ride and Hayride at Independence Park|Pearland|https://foreverparksfoundation.org/events|2026-12-12
free-christmas-collaboganza-at-greater-grace-pearland-tx|Free Christmas CollaboGanza at Greater Grace|Pearland|https://seasonsofchangeinc.com/site/event/16th-annual-christmas-collaboganza-pearland-2026/|2026-12-11
community-day-free-admission-at-rosenberg-railroad-museum-tx|Community Day Free Admission at Rosenberg Railroad Museum|Rosenberg|https://www.rosenbergrrmuseum.org/product/community-day/RN7OGQZH7QEIRCQH6RHARHLR|2026-12-05
hometown-holiday-festival-in-downtown-rosenberg-tx|Hometown Holiday Festival in Downtown Rosenberg|Rosenberg|https://rosenbergtx.gov/m/calendar/event/detail/1125|2026-12-05
breakfast-with-santa-at-rosenberg-railroad-museum-tx|Breakfast with Santa at Rosenberg Railroad Museum|Rosenberg|https://www.rosenbergrrmuseum.org/product/breakfast-with-santa/QSIU4PUOAZKMZVPY6KPDLABL|2026-12-19
holly-jolly-holiday-fun-day-at-rosenberg-railroad-museum-tx|Holly Jolly Holiday Fun Day at Rosenberg Railroad Museum|Rosenberg|https://www.rosenbergrrmuseum.org/product/holly-jolly-holiday-fun-day/2SPFJSORK2HVUEKXRJWNXSWM|2026-12-27
the-light-park-spring-drive-thru-christmas-lights-tx|The Light Park Spring Drive-Thru Christmas Lights|Spring|https://www.thelightpark.com/locations/spring-texas|2026-11-06
christmas-train-rides-and-santa-at-old-time-christmas-tree-farm-spring-tx|Christmas Train Rides and Santa at Old Time Christmas Tree Farm|Spring|https://www.oldtimechristmastree.com/christmasseason|2026-11-27
oh-what-fun-holiday-tree-lighting-celebration-at-city-place-spring-tx|Oh, What Fun Holiday Tree Lighting Celebration at City Place|Spring|https://cityplacenow.com/events/oh-what-fun-holiday-tree-lighting-celebration-2026/|2026-11-29
free-holiday-story-times-and-kids-shows-at-city-place-plaza-spring-tx|Free Holiday Story Times and Kids Shows at City Place Plaza|Spring|https://cityplacenow.com/events/a-gingerbreads-holiday-adventure-free/|2026-12-06
christmas-in-the-park-at-meyer-park-spring-tx|Christmas in the Park at Meyer Park|Spring|https://www.pct3.com/Explore/Events-Registration/Event-Calendar/EventID/6624/Christmas-in-the-Park|2026-12-05
holiday-celebration-open-house-at-barbara-bush-branch-library-spring-tx|Holiday Celebration Open House at Barbara Bush Branch Library|Spring|https://hcpl.net/locations/cc/|2026-12-05
hometown-holidays-movie-nights-at-the-spring-historical-museum-tx|Hometown Holidays Movie Nights at the Spring Historical Museum|Spring|https://m.oldtownspringapp.com/events-1/i/3942aeeb549749f41587642b2af62b80/old-town-spring-home-town-holidays-holiday-movie-night-polar-express|2026-11-28
deck-the-depot-tree-lighting-at-tomball-depot-plaza-tx|Deck the Depot Tree Lighting at Tomball Depot Plaza|Tomball|https://tomballtx.gov/Calendar.aspx?EID=8284|2026-12-05
photos-with-santa-at-sugar-land-town-square-tx|Photos with Santa at Sugar Land Town Square|Sugar Land|https://www.sugarlandtownsquare.com/events/photos-with-santa/|2026-11-28
jingle-tree-cookies-with-santa-at-hmns-at-sugar-land-tx|Jingle Tree Cookies with Santa at HMNS at Sugar Land|Sugar Land|https://sugarland.hmns.org/events/jingle-tree-cookies-with-santa/|2026-12-05
all-aboard-polar-express-day-and-santa-meet-and-greet-at-fort-bend-sugar-land-tx|All Aboard Polar Express Day and Santa Meet and Greet at Fort Bend Children's Discovery Center|Sugar Land|https://www.childrensdiscoveryfb.org/dec-5-all-aboard|2026-12-05
a-magical-cirque-christmas-at-smart-financial-centre-sugar-land-tx|A Magical Cirque Christmas at Smart Financial Centre|Sugar Land|https://us.atgtickets.com/events/a-magical-cirque-christmas/smart-financial-centre/|2026-12-08
christmas-in-the-bend-tree-lighting-at-richmond-city-hall-park-plaza-tx|Christmas in the Bend Tree Lighting at Richmond City Hall Park Plaza|Richmond|https://www.richmondtx.gov/Home/Components/News/News/9063/17|2026-12-04
smores-with-santa-at-the-george-ranch-historical-park-richmond-tx|S'mores with Santa at The George Ranch Historical Park|Richmond|https://www.georgeranch.org/things-to-do/smores-with-santa/|2026-12-12
holiday-on-the-plaza-at-smsd-plaza-in-stafford-tx|Holiday on the Plaza at SMSD Plaza in Stafford|Stafford|https://www.staffordtx.gov/m/newsflash/Home/Detail/207|2026-12-12
mayors-lighting-of-the-city-at-nessler-park-texas-city-tx|Mayor's Lighting of the City at Nessler Park|Texas City|https://texascitytx.gov/1289/Mayors-Tree-Lighting|2026-11-28
waterway-winter-nights-the-woodlands-tx|Waterway Winter Nights|The Woodlands|https://www.visitthewoodlands.com/event/waterway-winter-nights/3063/|2026-12-04
sensory-santa-at-the-woodlands-childrens-museum-tx|Sensory Santa at The Woodlands Children's Museum|The Woodlands|https://woodlandschildrensmuseum.org/events/sensory-santa/|2026-12-13
christmas-fest-at-the-woodlands-methodist-church-tx|Christmas Fest at The Woodlands Methodist Church|The Woodlands|https://thewoodlandsmethodist.org/event/1979|2026-12-05
photos-with-santa-at-market-street-the-woodlands-tx|Photos with Santa at Market Street|The Woodlands|https://shopatmarketstreet.com/events/santa-schedule-2026/|2026-11-26
