#!/bin/bash
# Pittsburgh fix 1: Open Days (Dec 28 and 29) was refused as a false match for Winter Nights (Fridays Nov 27 to Dec 18). Different dates, different source. Run once.
echo "--- check with the distinct internal name"
python3 registry.py check --name 'Greensburg Art Museum Post-Christmas Open Days Dec 28 and 29' --city Greensburg --cc pa --date 2026-12-28
echo "--- add with distinct internal name"
python3 registry.py add --slug special-holiday-open-days-at-the-westmoreland-museum-of-american-greensburg-pa --name 'Greensburg Art Museum Post-Christmas Open Days Dec 28 and 29' --city Greensburg --cc pa --url https://www.jeannettepubliclibrary.org/community-events-2/ --date 2026-12-28 --status live --confirm-new || true
echo "--- alias to the public name"
python3 registry.py alias --slug special-holiday-open-days-at-the-westmoreland-museum-of-american-greensburg-pa --name 'Special Holiday Open Days at The Westmoreland Museum of American Art' || true
true
