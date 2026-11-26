echo "--- check with the distinct internal name"
python3 registry.py check --name 'Sacred Hearts Academy Holiday Ballet at Hawaii Theatre Dec 12' --city Honolulu --cc hi --date 2026-12-12
echo "--- add with distinct internal name"
python3 registry.py add --slug the-nutcracker-by-sacred-hearts-academy-at-hawaii-theatre-honolulu-hi --name 'Sacred Hearts Academy Holiday Ballet at Hawaii Theatre Dec 12' --city Honolulu --cc hi --url https://www.hawaiitheatre.com/events/sacred-hearts-academy-the-nutcracker-2026/ --date 2026-12-12 --status live --confirm-new || true
echo "--- alias to the public name"
python3 registry.py alias --slug the-nutcracker-by-sacred-hearts-academy-at-hawaii-theatre-honolulu-hi --name 'The Nutcracker by Sacred Hearts Academy at Hawaii Theatre' || true
