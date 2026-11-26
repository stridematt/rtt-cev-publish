#!/usr/bin/env bash
# usage: bash run.sh check   directory check for every Portland event (before publishing)
#        bash run.sh add     directory add for every Portland event (after the pages are live and carded)
B=https://raw.githubusercontent.com/stridematt/rtt-cev-publish/claude/project-thread-liw06u/portland
cd "$HOME/Downloads/sa/registry" || exit 1
set -a; . ./.env >/dev/null 2>&1; set +a
curl -fsSL "$B/events.tsv" -o /tmp/pdx_events.tsv || exit 1
MODE="${1:-}" python3 - <<'PY'
import csv, os, subprocess, sys
mode = os.environ["MODE"]
if mode not in ("check", "add"): sys.exit("usage: bash run.sh check|add")
for slug, name, city, cc, url, date in csv.reader(open("/tmp/pdx_events.tsv"), delimiter="\t"):
    print("--", slug, flush=True)
    if mode == "check":
        cmd = ["python3", "registry.py", "check", "--name", name, "--city", city, "--cc", cc, "--date", date]
    else:
        cmd = ["python3", "registry.py", "add", "--slug", slug, "--name", name, "--city", city, "--cc", cc, "--url", url, "--date", date, "--status", "live", "--confirm-new"]
    r = subprocess.run(cmd, capture_output=True, text=True)
    out = (r.stdout + r.stderr).strip().splitlines()
    print("\n".join(out[:3]), flush=True)
PY
