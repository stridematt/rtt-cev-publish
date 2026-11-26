#!/bin/bash
# Minneapolis run registry adds, part 7 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug community-tree-lighting-at-hastings-city-hall-mn --name 'Community Tree Lighting at Hastings City Hall' --city Hastings --cc mn --url https://events.hastingsmn.gov/default/detail/2026-11-28-1730-Community-Tree-Lighting --date 2026-11-28 --status live --confirm-new || true
add --slug cpkc-holiday-train-at-depot-park-in-hastings-mn --name 'CPKC Holiday Train at Depot Park in Hastings' --city Hastings --cc mn --url https://www.hastingsmn.gov/parks-recreation-arts/events/ --date 2026-12-12 --status live --confirm-new || true
add --slug christmas-in-the-village-at-dakota-city-heritage-village-farmington-mn --name 'Christmas in the Village at Dakota City Heritage Village' --city Farmington --cc mn --url https://dakotacity.org/events/christmas-in-the-village/ --date 2026-12-05 --status live --confirm-new || true
add --slug farmington-community-lighted-holiday-parade-downtown-farmington-mn --name 'Farmington Community Lighted Holiday Parade' --city Farmington --cc mn --url https://www.homesteadcommunitychurch.org/farmington-holiday-parade --date 2026-12-05 --status live --confirm-new || true
add --slug annual-tree-lighting-at-the-steeple-center-rosemount-mn --name 'Annual Tree Lighting at the Steeple Center' --city Rosemount --cc mn --url 'https://www.rosemountmn.gov/Calendar.aspx?EID=9125&month=11&year=2026&day=19&calType=0' --date 2026-11-28 --status live --confirm-new || true
add --slug santa-tour-through-rosemount-neighborhoods-neighborhoods-across-rosemount-mn --name 'Santa Tour Through Rosemount Neighborhoods' --city Rosemount --cc mn --url https://rosemountmn.gov/m/calendar/event/detail/9146 --date 2026-12-12 --status live --confirm-new || true
add --slug santa-claus-is-coming-to-the-zoo-at-minnesota-zoo-apple-valley-mn --name 'Santa Claus Is Coming to the Zoo at Minnesota Zoo' --city 'Apple Valley' --cc mn --url https://mnzoo.org/special-events/ --date 2026-11-28 --status live --confirm-new || true
add --slug home-for-the-holidays-weekend-at-the-minnesota-zoo-japanese-apple-valley-mn --name 'Home for the Holidays Weekend at the Minnesota Zoo: Japanese Macaques and Clydesdales' --city 'Apple Valley' --cc mn --url https://mnzoo.org/special-events/ --date 2026-12-05 --status live --confirm-new || true
add --slug cpkc-holiday-train-at-cottage-grove-mn --name 'CPKC Holiday Train at Cottage Grove' --city 'Cottage Grove' --cc mn --url https://www.exploreminnesota.com/holiday-train-minnesota --date 2026-12-13 --status live --confirm-new || true
add --slug magic-of-lights-at-viking-lakes-eagan-mn --name 'Magic of Lights at Viking Lakes' --city Eagan --cc mn --url https://www.exploreminnesota.com/event/magic-lights/32358 --date 2026-11-26 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
