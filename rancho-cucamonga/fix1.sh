#!/bin/bash
# Rancho Cucamonga refusals: check first, then re-add under a distinct internal name and alias to the public name. No set -e.
fix(){ # slug internal-name public-name city url date
  echo "== $1"
  out=$(python3 registry.py check --name "$3" --city "$4" --cc ca --date "$6" 2>&1); echo "$out" | head -6
  if echo "$out" | grep -q 'match:'; then echo "MATCH found: skipping add for $1 (already in registry)"; return; fi
  if python3 registry.py add --slug "$1" --name "$2" --city "$4" --cc ca --url "$5" --date "$6" --status live --confirm-new; then
    python3 registry.py alias --slug "$1" --name "$3" || true
  else echo "STILL REFUSED: $1"; fi
}
fix gingerbread-build-at-the-norco-christmas-festival-ca 'Norco Gingerbread House Workshop for Families 2026' 'Gingerbread Build at the Norco Christmas Festival' Norco 'https://www.norco.ca.us/events-attractions/community-events/christmas-festival-parade-of-lights' 2026-12-12
fix the-polar-express-train-ride-at-southern-california-railway-museum-perris-ca 'Perris Railway Museum Holiday Train Rides 2026' 'THE POLAR EXPRESS Train Ride at Southern California Railway Museum' Perris 'https://socalrailway.org/scrm-events/polar-express/' 2026-11-12
echo "fix1 done"; true
