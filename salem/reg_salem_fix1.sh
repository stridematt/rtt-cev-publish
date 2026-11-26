#!/bin/bash
# Re-add the refused Albany carousel Santa photo visits under a distinct internal name, then record the public name. Run once; no set -e.
python3 registry.py add --slug santa-visits-at-the-historic-carousel-albany-or --name 'Carousel Photo Sessions in Albany with Santa Claus' --city Albany --cc or --url https://albanycarousel.com/events/ --date 2026-11-28 --status live --confirm-new && echo "ADDED" || echo "REFUSED"
python3 registry.py alias --slug santa-visits-at-the-historic-carousel-albany-or --name 'Santa Visits at the Historic Carousel' || true
python3 registry.py check --name 'Carousel Photo Sessions in Albany with Santa Claus' --city Albany --cc or --date 2026-11-28 || true
true
