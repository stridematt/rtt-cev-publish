#!/bin/bash
# Minneapolis run registry adds, part 2 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug breakfast-with-santa-at-the-saint-paul-hotel-mn --name 'Breakfast with Santa at The Saint Paul Hotel' --city 'Saint Paul' --cc mn --url https://www.saintpaulhotel.com/events/breakfast-with-santa/ --date 2026-12-05 --status live --confirm-new || true
add --slug vis-the-season-at-visitation-school-mendota-heights-mn --name 'Vis the Season at Visitation School' --city 'Mendota Heights' --cc mn --url https://www.visitation.net/campus-life/vis-the-season --date 2026-12-05 --status live --confirm-new || true
add --slug holidays-on-the-hill-at-the-james-j-hill-house-saint-paul-mn --name 'Holidays on the Hill at the James J. Hill House' --city 'Saint Paul' --cc mn --url https://www.mnhs.org/hillhouse --date 2026-11-28 --status live --confirm-new || true
add --slug holiday-with-santa-at-maplewood-community-center-mn --name 'Holiday with Santa at Maplewood Community Center' --city Maplewood --cc mn --url 'https://www.maplewoodmn.gov/CivicAlerts.aspx?AID=769' --date 2026-12-19 --status live --confirm-new || true
add --slug a-hygge-holiday-at-the-circus-juventas-big-top-saint-paul-mn --name 'A Hygge Holiday at the Circus Juventas Big Top' --city 'Saint Paul' --cc mn --url https://circusjuventas.org/holiday-show-2026/ --date 2026-12-04 --status live --confirm-new || true
add --slug holiday-flower-show-at-como-park-zoo-and-conservatory-saint-paul-mn --name 'Holiday Flower Show at Como Park Zoo and Conservatory' --city 'Saint Paul' --cc mn --url https://comozooconservatory.org/como/sunken-garden-2/ --date 2026-12-04 --status live --confirm-new || true
add --slug santa-at-rosedale-center-santas-arrival-party-and-santa-photos-roseville-mn --name 'Santa at Rosedale Center: Santa'"'"'s Arrival Party and Santa Photos' --city Roseville --cc mn --url https://www.rosedalecenter.com/events/santa-photos/ --date 2026-11-27 --status live --confirm-new || true
add --slug cookies-and-cocoa-with-kris-kringle-at-cedarholm-community-building-roseville-mn --name 'Cookies and Cocoa with Kris Kringle at Cedarholm Community Building' --city Roseville --cc mn --url https://www.cityofroseville.com/3284/Cookies-Cocoa-with-Kris-Kringle --date 2026-12-05 --status live --confirm-new || true
add --slug new-years-eve-celebration-on-ice-at-the-john-rose-minnesota-oval-roseville-mn --name 'New Year'"'"'s Eve Celebration on Ice at the John Rose Minnesota OVAL' --city Roseville --cc mn --url https://www.cityofroseville.com/979/New-Years-Eve-Celebration-on-Ice --date 2026-12-31 --status live --confirm-new || true
add --slug roseville-holiday-light-map-tour-and-vote-mn --name 'Roseville Holiday Light Map Tour and Vote' --city Roseville --cc mn --url https://www.cityofroseville.com/3508/Holiday-Light-Map --date 2026-12-04 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
