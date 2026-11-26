#!/usr/bin/env bash
# San Diego registry: the 57 events flagged REVIEW in rounds 1 and 2, checked by hand as different events
# (different host, venue or program than the registry match). Adds each with --confirm-new.
# Run from ~/Downloads/sa/registry after reg_sandiego.sh and reg_sandiego_round2.sh were downloaded there.
set -a; . ./.env >/dev/null 2>&1; set +a
ok=0; skip=0
reg() {  # slug name city url date
  out=$(python3 registry.py add --slug "$1" --name "$2" --city "$3" --cc ca --url "$4" --date "$5" --status live --confirm-new 2>&1) && ok=$((ok+1)) || { skip=$((skip+1)); echo "REFUSED $1 -> $(echo "$out" | head -2 | tr '\n' ' ')"; }
}
while read -r s; do
  [ -z "$s" ] && continue
  line=$(grep -h "^reg $s " reg_sandiego.sh reg_sandiego_round2.sh | head -1)
  if [ -n "$line" ]; then eval "$line"; else echo "NOT FOUND $s"; fi
done < review_slugs.txt
echo "review batch: added $ok, refused $skip"
