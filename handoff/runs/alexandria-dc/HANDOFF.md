# Alexandria / Washington DC area run handoff (2026-11-26)

Three Sonnet helpers (A inner NoVA, B outer NoVA, C DC and Maryland); lead validated JSON, offsets (-05:00 everywhere), no dashes or exclamation marks in page text, unique slugs and cands, page.json (intro_html, seo_title, seo_description) in every town. Cand range 47000-47999: A 47000-47070 used, B 47300-47321 used, C 47600-47613 used. 51 new events. Eastern time -05:00.

Registry: rtt-cev-publish branch claude/project-thread-b7kg43, commit 635594db930cf3b9b4ffd5f579eec969e935b890, alexandria-dc/reg_alexandria_dc.sh (51 adds; no set -e; prints "added N, refused M" and refused slugs; verified identical to the raw GitHub file at that commit). Bundles and page.json for every town are in the same folder (alexandria-dc/<town>-bundle.json.gz, <town>-page.json), plus A_moves, B_moves, C_moves.

Registry command (Rally, in Terminal, run once):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/635594db930cf3b9b4ffd5f579eec969e935b890/alexandria-dc/reg_alexandria_dc.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

## Towns
NEW pages (full page.json): herndon-va 4 events; fredericksburg-va 3 new; warrenton-va 3 new; woodbridge-va 6 (2 new, 4 moved from occoquan, Marine Corps museum card); sterling-va 1 (Starry Nights and Winter Lights series, Loudoun); silver-spring-md 4 (1 new, 3 moved from Germantown/DC); bethesda-md 6 (2 new, 4 moved in from Westfield and Chevy Chase cards). Check each page.json for "new" vs existing: fredericksburg and warrenton were treated by block B as existing in its report; confirm by 200 before publishing.
EXISTING with new events (bundle + intro_html): alexandria-va +2 (8 total), arlington-va +4 (6), fairfax-va +3 (8), reston-va +3 (5), leesburg-va +2 (incl. Purcellville parade, folded), ashburn-va +1, middleburg-va +1, manassas-va +4, stafford-va +4, washington-dc +4 (29), rockville-md +1, gaithersburg-md +1 (10), germantown-md +1 (4), bowie-md +2 (11), hyattsville-md +2 (6).
Intro only (replace live intro, no bundle): vienna-va, centreville-va, chantilly-va, mclean-va, south-riding-va, dale-city-va, front-royal-va, occoquan-va, wheaton-md, college-park-md, laurel-md, greater-upper-marlboro-md.
Folded, no page: falls-church-va into arlington-va, springfield-va (and Burke) into fairfax-va, purcellville-va into leesburg-va; see folded.json.

## Publisher actions
1. Moves and drops: A_moves.json, B_moves.json, C_moves.json (about 60 moves, many `drop` where the card exists on the destination). Never on two pages. The DC page and occoquan-va were catch-alls: 20 of 23 Germantown cards move out (mostly to Gaithersburg); Occoquan cards move to Manassas, Woodbridge, Alexandria, Centreville, Fairfax. Cards that belong to other metros: 5 Frederick cards on Germantown stay for now (Frederick is out of scope; list for a later run), Gunston Hall stays on occoquan-va. Anchor-only inline cards (ev-<town>-* anchors) exist on washington-dc and occoquan-va, so move them with the helper variants.
2. Links: link new town pages from their core (herndon from fairfax/reston, woodbridge from occoquan/manassas, bethesda and silver-spring from washington-dc, sterling from ashburn/leesburg); each new town links back. Add Bethesda <-> Silver Spring sibling links after both publish.
3. Christmas Eve services pages: yes for alexandria, arlington, fairfax, leesburg, manassas, washington-dc, gaithersburg, germantown, bowie; no for herndon, fredericksburg, warrenton, woodbridge, silver-spring, bethesda, rockville; not checked for the rest.
4. Page date today of publishing. Times -05:00. Drop events already ended on publish day. Then registry, then quick-counts for every changed path. Do not request indexing.
5. Recount intro numbers against live cards (counts include moved-in cards).

## Corrections to live cards
- Leesburg parade card: Saturday Dec 12, 2026, 6 pm, rain date Sun Dec 13 (Town of Leesburg), not Dec 5.
- Manassas VRE Santa Train: $10 per rider, online only via Eventbrite from Mon Nov 30, 10 am.
- Manassas ice skating: adults $11 ($18 with rental), youth 12 and under $9 ($16 with rental).
- Greater Manassas parade Dec 5, 10 am to about 12:30 pm, Free. Santa Lights Dec 4, market 4 to 8 pm, tree lighting 6:30 pm, Free.
- Warrenton parade Fri Dec 4, 6 to 8 pm (Visit Fauquier calendar only; older town page says Dec 3 and is a 2023 archive).
- Arlington Rosslyn Holiday Market with Santa card was Nov 21 and has ended: drop it.
- Fairfax Tree Lighting and Songs and Winter Stories cards say "No price listed" but host text says free.
- Gaithersburg: All Aboard with Santa is one event with two sessions (Dec 5, 4 to 6 pm; Dec 6, 2:30 to 5:30 pm): keep one card showing both dates (the -2 card drops). Santa's Enchanted Visit (Dec 5) shows Sold Out on the city site: review that live card.
- Occoquan page text still mentions its Nov 21 tree lighting (past).

## Flags (facts not from a host page)
- Addresses from memory or general knowledge: Leesburg Animal Park (19270 James Monroe Hwy), The Yards (355 Water St SE), National Capital Trolley Museum (1313 Bonifant Rd), Casey Community Center (810 S Frederick Ave), Bethesda Winter Wonderland zip, Marietta House Museum (5626 Bell Station Rd), Glenn Dale zip, Arena Stage, Marine Corps museum (18739 Jefferson Davis Hwy), Claude Moore Park zip 20164; Stafford, Warrenton, Middleburg, Purcellville, Fredericksburg parade venues print no street address.
- Calendar sources, not host pages: Jingle Block Rock, Deck the Alleys, Step Afrika (Destination DC); Starry Nights per-park dates (Ashburn Today quoting the county release; loudoun.gov did not render); Dates for Purcellville parade from a search excerpt; Warrenton parade (Visit Fauquier).
- Maple Tree Farm: only dates named in text; more dates are in an image calendar.
- Marietta House: only six dates visible, may have more.
- Stafford parade Dec 19 per host sites; an old snippet says Dec 20.
- Herndon caboose history from the Historical Society PDF and Wikipedia; no 2025 recap found for several pages.
- Moved-card costs on Gaithersburg, Germantown (Westfield etc.) intros are unverified; recount at publish.
- Winter Wonderland on Norfolk Avenue host page still has one 2025 line (Dec 6, 2025); header says Dec 5.
- Upper Marlboro card ids come from page anchors; Wheaton ice show slug guessed.
- train_links: silver-spring page points to /museums/national-capital-trolley-museum-colesville-maryland (not fetched directly); others [].

## Held
Kentlands Lighting Ceremony (MoCo Show only), Glen Echo Frosty and Puppet Co Nutcracker (no price page), Silver Spring Snowsocial and Flash Bus Winter Wonderland (Instagram only), Silver Spring Christmas Market (shopping), Imagination Stage Grinch (fundraiser), Georgetown Cookie Tour, Frosted at Franklin Park, Folger Frost Fair, Snowglow (no dates), Upper Marlboro tree lighting and Laurel Monsignor Farrell and Pallotti tree lightings (Facebook only), Holiday Hop (13+), Holiday Marketplace Fort Washington (shopping), Strathmore concerts, Stafford and Spotsylvania Santa breakfasts (Eventbrite only), Franklin Park Santa Saturdays (registration system), Dale City and South Riding (nothing host-verified). Strays outside scope: Spotsylvania Concert in Lights and parade, Illuminate Light Show (Caroline County), Frederick cards on Germantown.

## Thin pages and method notes
Thin: Sterling 1, Herndon 4, Silver Spring 4. Wheaton, College Park, Laurel, Upper Marlboro, Dale City, South Riding, Front Royal got only county calendar searches. County parks calendars and county press releases gave the most events per search; tourism bureau monthly guide best for DC. Always scrape neighbor and hub pages (washington-dc, occoquan-va) for stray and anchor-only cards before building.
