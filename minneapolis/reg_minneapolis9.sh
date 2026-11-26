#!/bin/bash
# Minneapolis run registry adds, part 9 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug photos-with-santa-at-tony-langerud-state-farm-in-faribault-mn --name 'Photos With Santa at Tony Langerud State Farm in Faribault' --city Faribault --cc mn --url https://members.faribaultmn.org/events/details/winterfest-2026-20564 --date 2026-12-05 --status live --confirm-new || true
add --slug faribault-parade-of-lights-in-historic-downtown-historic-downtown-faribault-mn --name 'Faribault Parade of Lights in Historic Downtown' --city Faribault --cc mn --url https://members.faribaultmn.org/events/details/winterfest-2026-20564 --date 2026-12-05 --status live --confirm-new || true
add --slug taylors-falls-lighting-festival-mn --name 'Taylors Falls Lighting Festival' --city 'Taylors Falls' --cc mn --url https://lightingfestival.com/ --date 2026-11-27 --status live --confirm-new || true
add --slug storytime-with-mrs-claus-at-the-taylors-falls-library-mn --name 'Storytime with Mrs. Claus at the Taylors Falls Library' --city 'Taylors Falls' --cc mn --url https://lightingfestival.com/ --date 2026-11-27 --status live --confirm-new || true
add --slug farmers-christmas-celebration-at-oliver-h-kelley-farm-elk-river-mn --name 'Farmer'"'"'s Christmas Celebration at Oliver H. Kelley Farm' --city 'Elk River' --cc mn --url https://www.mnhs.org/events/64432540305 --date 2026-12-05 --status live --confirm-new || true
add --slug skate-with-santa-at-furniture-and-things-community-event-center-elk-river-mn --name 'Skate with Santa at Furniture and Things Community Event Center' --city 'Elk River' --cc mn --url https://elkrivermn.gov/m/calendar/event/detail/19103 --date 2026-12-06 --status live --confirm-new || true
add --slug elk-river-holiday-light-tour-mn --name 'Elk River Holiday Light Tour' --city 'Elk River' --cc mn --url https://www.elkrivermn.gov/1830/Holiday-Light-Tour --date 2026-12-01 --status live --confirm-new || true
add --slug santa-day-at-the-otsego-fire-station-mn --name 'Santa Day at the Otsego Fire Station' --city Otsego --cc mn --url https://www.otsegomn.gov/m/newsflash/Home/Detail/156 --date 2026-12-12 --status live --confirm-new || true
add --slug 36th-annual-anoka-tree-lighting-at-city-hall-river-plaza-mn --name '36th Annual Anoka Tree Lighting at City Hall River Plaza' --city Anoka --cc mn --url https://www.anokamn.gov/m/newsflash/Home/Detail/484 --date 2026-12-05 --status live --confirm-new || true
add --slug andover-tree-lighting-event-at-the-community-center-mn --name 'Andover Tree Lighting Event at the Community Center' --city Andover --cc mn --url https://www.andovermn.gov/m/newsflash/Home/Detail/592 --date 2026-12-04 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
