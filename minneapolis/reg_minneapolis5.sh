#!/bin/bash
# Minneapolis run registry adds, part 5 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug skate-with-santa-at-new-hope-ice-arena-mn --name 'Skate with Santa at New Hope Ice Arena' --city 'New Hope' --cc mn --url https://www.newhopemn.gov/city_hall/parks_and_recreation/parks_and_recreation_news/skate_with_santa --date 2026-12-11 --status live --confirm-new || true
add --slug cpkc-holiday-train-in-loretto-mn --name 'CPKC Holiday Train in Loretto' --city Loretto --cc mn --url https://www.exploreminnesota.com/holiday-train-minnesota --date 2026-12-16 --status live --confirm-new || true
add --slug waconia-tree-lighting-in-the-park-mn --name 'Waconia Tree Lighting in the Park' --city Waconia --cc mn --url https://waconia.destinationwaconia.org/events/details/tree-lighting-in-city-square-park-11334 --date 2026-11-27 --status live --confirm-new || true
add --slug spirit-of-winter-festival-of-lights-at-sovereign-estate-waconia-mn --name 'Spirit of Winter Festival of Lights at Sovereign Estate' --city Waconia --cc mn --url https://www.sovereignestatewine.com/minnesota-christmas-light-show-spirit-of-winter --date 2026-11-21 --status live --confirm-new || true
add --slug black-family-light-show-minnetonka-mn --name 'Black Family Light Show' --city Minnetonka --cc mn --url https://www.facebook.com/61584732374329/posts/122155028223157745/ --date 2026-11-27 --status live --confirm-new || true
add --slug meet-santa-and-pet-night-with-santa-at-ridgedale-center-minnetonka-mn --name 'Meet Santa and Pet Night with Santa at Ridgedale Center' --city Minnetonka --cc mn --url https://www.ridgedalecenter.com/en/events/ --date 2026-11-20 --status live --confirm-new || true
add --slug woodbury-tree-lighting-celebration-mn --name 'Woodbury Tree Lighting Celebration' --city Woodbury --cc mn --url https://www.woodburymn.gov/1374/Tree-Lighting-Celebration --date 2026-12-03 --status live --confirm-new || true
add --slug community-christmas-tree-lighting-at-woodbury-lutheran-church-mn --name 'Community Christmas Tree Lighting at Woodbury Lutheran Church' --city Woodbury --cc mn --url https://destinationwoodbury.com/event/community-christmas-tree-lighting-event/198/ --date 2026-12-04 --status live --confirm-new || true
add --slug cookies-and-crafts-with-santa-at-eagle-valley-golf-course-woodbury-mn --name 'Cookies and Crafts with Santa at Eagle Valley Golf Course' --city Woodbury --cc mn --url https://www.woodburymn.gov/414/Seasonal-Events --date 2026-12-19 --status live --confirm-new || true
add --slug the-best-christmas-pageant-ever-at-merrill-arts-center-woodbury-mn --name 'The Best Christmas Pageant Ever at Merrill Arts Center' --city Woodbury --cc mn --url https://merrillartscenter.org/theatre-tickets/ --date 2026-12-04 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
