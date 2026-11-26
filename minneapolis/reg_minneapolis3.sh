#!/bin/bash
# Minneapolis run registry adds, part 3 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug light-up-the-square-community-tree-lighting-at-central-square-south-st-paul-mn --name 'Light Up The Square Community Tree Lighting at Central Square' --city 'South St. Paul' --cc mn --url 'https://www.southstpaulmn.gov/Calendar.aspx?EID=4687' --date 2026-11-29 --status live --confirm-new || true
add --slug breakfast-with-santa-at-st-john-vianney-catholic-church-south-st-paul-mn --name 'Breakfast with Santa at St. John Vianney Catholic Church' --city 'South St. Paul' --cc mn --url 'https://www.southstpaulmn.gov/Calendar.aspx?EID=4657' --date 2026-12-12 --status live --confirm-new || true
add --slug skate-with-santa-at-doug-woog-arena-south-st-paul-mn --name 'Skate with Santa at Doug Woog Arena' --city 'South St. Paul' --cc mn --url 'https://www.southstpaulmn.gov/Calendar.aspx?EID=4658' --date 2026-12-13 --status live --confirm-new || true
add --slug holiday-lights-parade-in-richfield-mn --name 'Holiday Lights Parade in Richfield' --city Richfield --cc mn --url https://www.richfieldmn.gov/m/newsflash/Home/Detail/72 --date 2026-12-10 --status live --confirm-new || true
add --slug santa-and-grinch-train-rides-and-photos-at-everly-farms-minnetrista-mn --name 'Santa and Grinch Train Rides and Photos at Everly Farms' --city Minnetrista --cc mn --url https://www.everlyfarmsmn.com/christmas --date 2026-11-27 --status live --confirm-new || true
add --slug photos-with-santa-at-eden-prairie-center-mn --name 'Photos with Santa at Eden Prairie Center' --city 'Eden Prairie' --cc mn --url https://www.edenprairiecenter.com/santa/ --date 2026-11-10 --status live --confirm-new || true
add --slug santa-visits-the-sensory-room-at-plymouth-community-center-mn --name 'Santa Visits the Sensory Room at Plymouth Community Center' --city Plymouth --cc mn --url 'https://history.plymouthmn.gov/Home/Components/Calendar/Event/19373/2648?toggle=all&npage=4' --date 2026-12-06 --status live --confirm-new || true
add --slug santa-at-the-shoppes-at-arbor-lakes-maple-grove-mn --name 'Santa at The Shoppes at Arbor Lakes' --city 'Maple Grove' --cc mn --url https://www.shoppesatarborlakes.com/event/45276-santa-at-the-shoppes --date 2026-12-05 --status live --confirm-new || true
add --slug tree-lighting-ceremony-at-city-center-park-chanhassen-mn --name 'Tree Lighting Ceremony at City Center Park' --city Chanhassen --cc mn --url https://www.chanhassenmn.gov/departments/parks-recreation/community-events/holiday-events --date 2026-12-05 --status live --confirm-new || true
add --slug gingerbread-house-decorating-contest-at-chanhassen-city-hall-mn --name 'Gingerbread House Decorating Contest at Chanhassen City Hall' --city Chanhassen --cc mn --url https://www.chanhassenmn.gov/departments/parks-recreation/community-events/holiday-events --date 2026-12-01 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
