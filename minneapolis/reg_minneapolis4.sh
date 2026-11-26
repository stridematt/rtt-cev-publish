#!/bin/bash
# Minneapolis run registry adds, part 4 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug holiday-fest-parade-and-tree-lighting-in-downtown-shakopee-mn --name 'Holiday Fest Parade and Tree Lighting in Downtown Shakopee' --city Shakopee --cc mn --url https://shakopee.org/holiday-fest/ --date 2026-12-05 --status live --confirm-new || true
add --slug trista-lights-at-severs-drive-thru-holiday-light-show-shakopee-mn --name 'Trista Lights at Sever'"'"'s Drive-Thru Holiday Light Show' --city Shakopee --cc mn --url https://tristalights.com/ --date 2026-11-26 --status live --confirm-new || true
add --slug decembrrr-dazzle-tree-lighting-and-fireworks-prior-lake-mn --name 'DecemBRRR Dazzle Tree Lighting and Fireworks' --city 'Prior Lake' --cc mn --url 'https://www.priorlakemn.gov/Calendar.aspx?EID=803' --date 2026-12-04 --status live --confirm-new || true
add --slug savage-tree-lighting-ceremony-mn --name 'Savage Tree Lighting Ceremony' --city Savage --cc mn --url https://www.savagemn.gov/Home/Components/Calendar/Event/3900/18 --date 2026-12-03 --status live --confirm-new || true
add --slug canadian-pacific-holiday-train-in-st-louis-park-mn --name 'Canadian Pacific Holiday Train in St. Louis Park' --city 'St. Louis Park' --cc mn --url https://www.stlouisparkmn.gov/Events-and-Meetings/2026/Canadian-Pacific-Holiday-Train --date 2026-12-14 --status live --confirm-new || true
add --slug holiday-in-hopkins-mn --name 'Holiday in Hopkins' --city Hopkins --cc mn --url 'https://www.thinkhopkins.com/Calendar.aspx?EID=2778' --date 2026-12-05 --status live --confirm-new || true
add --slug canadian-pacific-holiday-train-in-golden-valley-mn --name 'Canadian Pacific Holiday Train in Golden Valley' --city 'Golden Valley' --cc mn --url https://www.exploreminnesota.com/holiday-train-minnesota --date 2026-12-14 --status live --confirm-new || true
add --slug crystal-winterfest-and-light-up-crystal-mn --name 'Crystal Winterfest and Light Up Crystal' --city Crystal --cc mn --url 'https://www.crystalmn.gov/workspaces/one.aspx?objectId=19938100&contextId=11780733' --date 2026-12-05 --status live --confirm-new || true
add --slug robbinsdale-annual-holiday-tree-lighting-at-city-hall-mn --name 'Robbinsdale Annual Holiday Tree Lighting at City Hall' --city Robbinsdale --cc mn --url https://www.robbinsdalemn.gov/m/calendar/event/detail/1105 --date 2026-12-01 --status live --confirm-new || true
add --slug tri-city-santa-parade-new-hope-mn --name 'Tri-City Santa Parade' --city 'New Hope' --cc mn --url 'https://www.crystalmn.gov/workspaces/one.aspx?objectId=21039163&contextId=11780733' --date 2026-12-05 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
