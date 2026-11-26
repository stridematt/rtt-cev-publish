#!/bin/bash
# Sheraton Holiday Parade Experience: refused as a name match with the free Manning Family Children's Holiday Parade card (different event: paid hotel viewing party). Source ./.env first, run once.
echo "--- check"
python3 registry.py check --name "Holiday Parade Experience at Sheraton New Orleans Hotel for the Manning Family Children's Holiday Parade" --city 'New Orleans' --cc la --date 2026-12-05 || true
echo "--- add with distinct internal name"
python3 registry.py add --slug holiday-parade-experience-at-sheraton-new-orleans-hotel-for-the-manning-la --name 'Sheraton New Orleans Hotel Paid Parade Viewing Party Canal Street' --city 'New Orleans' --cc la --url https://sheratonneworleans.ipoolside.com/services --date 2026-12-05 --status live --confirm-new || true
