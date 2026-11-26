# Fort Collins run handoff (2026-11-26)

## Registry command (Rally runs once; re-runs add duplicates; 21 adds)
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/bbd871ffb932dbfb7b8b629f7a8f9200b5b69d86/co-fort-collins/reg_fort_collins.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Repo stridematt/rtt-cev-publish, branch claude/project-thread-8v9w2v, commit bbd871ffb932dbfb7b8b629f7a8f9200b5b69d86 (raw script verified identical). Folder co-fort-collins/ holds reg_fort_collins.sh, registry_rows.json, windsor_moves.json, <town>-bundle.json.gz and <town>-page.json for fort-collins-co, windsor-co, wellington-co. Cand range 52000-52999 (used 52000-52012, 52500-52504, 52510-52512). Mountain, -07:00 verified in every JSON-LD time; no dashes, no exclamation marks, no Paid pill (Free pill class also stripped); uniqueness 60%+.

## Towns
EXISTING (add cards, apply intro_html from page.json):
- fort-collins-co: 13 new cards (intro: 18 events, 6 free; live had 5 cards, 2 free). No moves. Eve page: yes (/christmas-eve-services/fort-collins-co).
- windsor-co: 5 new cards (Windsor Cone Tree Lighting, Clearview Frostival, plus Severance, Timnath and Eaton events carded here) plus Breakfast with Santa moved in from greeley-co (windsor_moves.json). Intro: 9 events, 2 free. Eve page: yes (4 churches, no 2026 times yet).
NEW page:
- wellington-co: 3 events (1 free). Nearby: fort-collins, windsor, loveland. train_links: Colorado Model Railroad Museum Greeley. Eve page: 404.
Folded into windsor-co: Timnath, Severance, Eaton (1 verified event each; folded.json says why). Laporte: nothing found.

## Publisher actions
1. Move breakfast-with-santa-windsor-co from greeley-co to windsor-co.
2. New page wellington-co; link Fort Collins and Windsor to it; Wellington links back to fort-collins-co. Windsor FAQ/Eve line already exists on live eve page; add Eve link on windsor-co and fort-collins-co if missing.
3. Orphan live page downtown-holiday-lighting-ceremony-fort-collins-co (Nov 6 event, ended) is not linked from the town page; consider delete/redirect (ask Rally).
4. Recheck intro counts at publish time; publish date today; quick-counts for changed paths.

## Flags
- NightLights and TUBA Christmas facts come from Visit Fort Collins' calendar (stated on the pages).
- Clearview Frostival is full with a waitlist (registration required, stated on page).
- Wellington "lastyear" uses a Town Facebook post seen only as a search excerpt; treat as unverified. Timnath/Severance/Eaton populations in fold notes are estimates.
- Not researched for Windsor: Windsor Chamber (reCAPTCHA), church kids' events, Nutcracker listings, Windsor Lake.

## Held
Wellington Mingle on Main Dec 18 (no kids' description or price). La Porte hits were Indiana.
