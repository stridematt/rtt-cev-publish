echo "--- check"
python3 registry.py check --name 'City of Franklin Christmas Parade' --city Franklin --cc va --date 2026-12-04
echo "--- add with distinct internal name"
python3 registry.py add --slug city-of-franklin-christmas-parade-va --name 'Franklin Main Street Christmas Parade Downtown Franklin' --city Franklin --cc va --url https://visitfranklinsouthamptonva.com/event/city-of-franklin-christmas-parade/ --date 2026-12-04 --status live --confirm-new || true
echo "--- alias usage"
python3 registry.py alias --help 2>&1 | head -15 || true
