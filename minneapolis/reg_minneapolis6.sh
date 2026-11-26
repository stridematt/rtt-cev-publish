#!/bin/bash
# Minneapolis run registry adds, part 6 of 10 (no set -e: refused duplicates do not stop the run). Source ./.env first. Run each part once; re-runs add duplicates.
A=0;R=0;REF=""
add(){ if python3 registry.py add "$@"; then A=$((A+1)); else R=$((R+1)); REF="$REF ${2}"; fi; }
add --slug santas-wonderland-at-cabelas-woodbury-mn --name 'Santa'"'"'s Wonderland at Cabela'"'"'s Woodbury' --city Woodbury --cc mn --url https://www.cabelas.com/b/santas-wonderland --date 2026-11-27 --status live --confirm-new || true
add --slug light-up-lake-elmo-mn --name 'Light Up Lake Elmo' --city 'Lake Elmo' --cc mn --url 'https://www.lakeelmo.gov/CivicAlerts.aspx?AID=255' --date 2026-12-05 --status live --confirm-new || true
add --slug hometown-for-the-holidays-twinkle-party-and-tree-lighting-stillwater-mn --name 'Hometown for the Holidays Twinkle Party and Tree Lighting at Chestnut Plaza' --city Stillwater --cc mn --url 'https://www.stillwatermn.gov/Calendar.aspx?EID=840&month=12&year=2026&day=5&calType=0' --date 2026-12-05 --status live --confirm-new || true
add --slug the-great-gingerbread-man-hunt-in-downtown-stillwater-mn --name 'The Great Gingerbread Man Hunt in Downtown Stillwater' --city Stillwater --cc mn --url https://events.discoverstillwater.com/event/hometown-for-the-holiday-twinkle-weekend/ --date 2026-11-30 --status live --confirm-new || true
add --slug light-up-hudson-at-lakefront-park-wi --name 'Light Up Hudson at Lakefront Park' --city Hudson --cc wi --url https://www.hudsonwi.org/have-a-hudson-holiday/ --date 2026-11-27 --status live --confirm-new || true
add --slug santa-and-his-critters-at-lakefront-park-hudson-wi --name 'Santa and His Critters at Lakefront Park' --city Hudson --cc wi --url https://business.hudsonwi.org/events/details/santa-and-his-critters-2026-38344 --date 2026-12-05 --status live --confirm-new || true
add --slug candlelight-stroll-in-downtown-hudson-wi --name 'Candlelight Stroll in Downtown Hudson' --city Hudson --cc wi --url https://www.hudsonwi.org/have-a-hudson-holiday/ --date 2026-12-04 --status live --confirm-new || true
add --slug visit-with-santa-at-thorcraft-custom-kitchens-hudson-wi --name 'Visit with Santa at Thorcraft Custom Kitchens' --city Hudson --cc wi --url https://www.hudsonwi.org/have-a-hudson-holiday/ --date 2026-12-13 --status live --confirm-new || true
add --slug find-santa-passport-hunt-in-hudson-wi --name 'Find Santa Passport Hunt in Hudson' --city Hudson --cc wi --url https://www.hudsonwi.org/have-a-hudson-holiday/ --date 2026-11-02 --status live --confirm-new || true
add --slug holiday-hoopla-in-downtown-hastings-mn --name 'Holiday Hoopla in Downtown Hastings' --city Hastings --cc mn --url https://hastingsdba.com/holiday-hoopla --date 2026-11-28 --status live --confirm-new || true
echo "added $A, refused $R"; [ "$R" -gt 0 ] && echo "refused slugs:$REF"
exit 0
