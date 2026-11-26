#!/bin/bash
# Kansas City run registry adds, part 10 of 10. Run once from the registry folder after: source ./.env
ADDED=0; REFUSED=0; REFUSED_LIST=""
if python3 registry.py add --slug holiday-lights-and-festive-sights-in-mission-ks --name 'Holiday Lights and Festive Sights in Mission' --city Mission --cc ks --url https://www.missionks.org/event/holiday-lights-festive-sights-2/ --date 2026-12-04 --status live --confirm-new; then ADDED=$((ADDED+1)); else REFUSED=$((REFUSED+1)); REFUSED_LIST="$REFUSED_LIST holiday-lights-and-festive-sights-in-mission-ks"; fi || true
echo "added $ADDED, refused $REFUSED"; [ -n "$REFUSED_LIST" ] && printf "refused slugs:\n%s\n" "$REFUSED_LIST" | tr " " "\n"; true
