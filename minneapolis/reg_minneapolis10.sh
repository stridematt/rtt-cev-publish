#!/bin/bash
# Minneapolis run registry adds, part 10 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug community-tree-lighting-at-ramsey-city-hall-mn --name 'Community Tree Lighting at Ramsey City Hall' --city Ramsey --cc mn --url https://www.cityoframseymn.gov/recreation-culture/events/community-events-calendar/ --date 2026-12-01 --status live --confirm-new || true
add --slug rogers-holiday-tree-lighting-ceremony-mn --name 'Rogers Holiday Tree Lighting Ceremony' --city Rogers --cc mn --url 'https://www.rogersmn.gov/Calendar.aspx?EID=688' --date 2026-12-04 --status live --confirm-new || true
add --slug rogers-lions-breakfast-with-santa-mn --name 'Rogers Lions Breakfast with Santa' --city Rogers --cc mn --url https://www.rogersmnlions.org/events/breakfast-with-santa --date 2026-12-06 --status live --confirm-new || true
add --slug skate-with-santa-at-rogers-trustone-center-mn --name 'Skate with Santa at Rogers TruStone Center' --city Rogers --cc mn --url https://www.facebook.com/events/rogers-trustone-center/skate-with-santa/2105749590073280/ --date 2026-12-06 --status live --confirm-new || true
add --slug santas-wonderland-at-cabelas-rogers-mn --name 'Santa'"'"'s Wonderland at Cabela'"'"'s Rogers' --city Rogers --cc mn --url https://www.cabelas.com/b/santas-wonderland --date 2026-11-26 --status live --confirm-new || true
add --slug breakfast-with-santa-at-lino-lakes-public-safety-mn --name 'Breakfast with Santa at Lino Lakes Public Safety' --city 'Lino Lakes' --cc mn --url https://www.linolakes.gov/470/Breakfast-with-Santa --date 2026-11-28 --status live --confirm-new || true
add --slug hugo-santa-party-and-tree-lighting-at-the-peder-pedersen-pavilion-mn --name 'Hugo Santa Party and Tree Lighting at the Peder Pedersen Pavilion' --city Hugo --cc mn --url 'https://www.ci.hugo.mn.us/index.asp?SEC=11A21CAD-A6E4-4BE6-A92C-F655DED4F5EA&DE=E5BB2D32-9614-45DC-B728-9EE3A5F92588' --date 2026-12-09 --status live --confirm-new || true
add --slug winter-park-discovery-night-santa-edition-at-freedom-park-new-brighton-mn --name 'Winter Park Discovery Night Santa Edition at Freedom Park' --city 'New Brighton' --cc mn --url 'https://www.newbrightonmn.gov/calendar.aspx?view=list&year=2026&month=11&day=23' --date 2026-12-01 --status live --confirm-new || true
add --slug mounds-view-tree-lighting-at-city-hall-park-mn --name 'Mounds View Tree Lighting at City Hall Park' --city 'Mounds View' --cc mn --url https://www.moundsviewmn.gov/residents/mounds_view_community_center/communityevents.php --date 2026-12-04 --status live --confirm-new || true
add --slug santas-wonderland-at-riverdale-village-coon-rapids-mn --name 'Santa'"'"'s Wonderland at Riverdale Village' --city 'Coon Rapids' --cc mn --url https://santaswonderlandmn.com/ --date 2026-11-27 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
