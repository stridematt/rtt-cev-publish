#!/bin/bash
# Fix for the one refused Corpus Christi add (false match against another Christmas Tree Forest). Source ./.env first, run once.
echo "--- check (shows what the old name matched) ---"
python3 registry.py check --name 'Christmas Tree Forest at Portland Community Center' --city Portland --cc tx --date 2026-11-30 || true
echo "--- add under a distinct internal name ---"
python3 registry.py add --slug christmas-tree-forest-at-portland-community-center-tx --name 'Portland Community Center Decorated Trees Display' --city Portland --cc tx --url https://portlandtx.com/659/Christmas-on-the-Coast --date 2026-11-30 --status live --confirm-new && echo "added 1" || echo "refused 1: christmas-tree-forest-at-portland-community-center-tx"
echo "--- alias back to the public name ---"
python3 registry.py alias --slug christmas-tree-forest-at-portland-community-center-tx --name 'Christmas Tree Forest at Portland Community Center' || true
true
