# Salem OR (Willamette Valley) run handoff (2026-11-26)

REGISTRY COMMAND (Rally, Terminal, run once; paste back the "added N, refused M" lines):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/396c15c5ffae30fd58b90474cbb0ac99ae706e63/salem/reg_salem.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

(branch claude/project-thread-nwzar1, commit 396c15c5ffae30fd58b90474cbb0ac99ae706e63, file verified the same size as the local copy; 44 adds, no set -e, --confirm-new on each.)

Built by three Sonnet helpers (A: Salem, Keizer, Silverton, small towns; B: Albany and Linn County; C: Corvallis and Polk County). Cand range 54000-54999 (used 54000-54003, 54100-54105, 54200-54202, 54300-54324, 54600-54630). Pacific, -08:00 verified on every timed JSON-LD; no dashes or exclamation marks; Paid pill stripped on Price not listed pages; uniqueness 60%+ on all 44 pages; 44 new events. Bundles are in each town folder (under 1 MB). registry_rows.json lists the 44 rows.

## Towns
NEW pages (page.json with intro_html, seo_title, seo_description; counts are events, free):
- albany-or 13, 8 free (Harrisburg and Millersburg light parades carded here; Scio, Tangent folded)
- keizer-or 6, 2 free
- silverton-or 4, 0 free (3 new: Silver Falls Winter Festival, Once Upon a Yule at The Oregon Garden, Mt. Angel Christkindlmarkt; plus the live Silverton Christmas Market card moved from salem-or)
- corvallis-or 6, 4 free (Monroe folded)
- lebanon-or 5, 2 free (Sweet Home events carded here)
- philomath-or 3, 2 free
- dallas-or 4, 1 free (Monmouth WOU tree lighting, Independence, Falls City, Amity folded here)
EXISTING:
- salem-or: 4 new (Elsinore Tuba Holiday and Home Alone 2 with Santa, Stayton Holiday Fest, Aumsville Christmas in the Park). After the Silverton move: 21 events, 8 free. Use intro_html and seo_description from salem-or/page.json (the Salem lede says "late November"; recompute the season start at publish time).
- woodburn-or: nothing new built (no bundle). Leave the live page and intro alone. Held: wreath party (flyer only), second CivicPlus event (would not load).
Folded, no page (folded.json each): Mt. Angel (to Silverton), Stayton, Aumsville, Turner (to Salem; Enchanted Forest closed until Mar 20 2027), Sweet Home (to Lebanon), Harrisburg, Millersburg, Scio, Tangent, Jefferson (to Albany/Salem if verified), Monroe (to Corvallis), Independence, Monmouth, Falls City, Amity (to Dallas).

## Publisher actions
1. Move: salem_or_moves.json (silverton-christmas-market-or from salem-or to silverton-or; Silverton bundle does not include it, so move the live card).
2. Links: salem-or links every new town page (albany, keizer, silverton, corvallis, lebanon, philomath, dallas) and each new page links back to salem-or. Corvallis also links philomath, Albany links lebanon, Dallas links salem. page.json nearby starts with ["salem-or","Salem"]. Check that existing neighbors are real before linking.
3. Christmas Eve services page exists only for salem-or (200); 404 for the rest. Salem already links it; check it.
4. Intros: use intro_html and seo_description from page.json (existing salem-or replaces its intro).
5. Page date = publish day, offset -08:00. Registry, then quick-counts for every changed path (all pages above except woodburn-or). Do not request indexing. Drop events ended on publish day and recheck counts against the live page.
6. train_links: only /museums/oregon-electric-railway-museum-brooks, /museums/powerland-heritage-park-brooks-oregon, /museums/historic-carousel-and-museum-of-albany-oregon (all returned 200 in the live Salem page's links). Keizer's page.json uses the two Brooks pages.

## Flags (facts not from a host page, or weak)
- Rotary Children's Holiday Craft Fair (Corvallis, 54602) has only an Eventbrite page, no host site; registry URL is the Eventbrite link. Same status as Kyle's Christmas on the Farm. Drop it if Rally prefers no ticket-site-only events.
- Candy Cane Express (Lebanon) dates come from Rally's own Oregon train blog (Santiam booking widget did not render); Grouchy ride from santiamexcursions.com.
- Stayton time and price come from Travel Salem's calendar; Glow Oregon Keizer dates from news; Keizer chamber says "Monday, December 1" (it is a Tuesday; card uses Dec 1).
- Downtown Holiday Festival (Lebanon) only on the City of Lebanon calendar; Monteith party and Nighttime Magic contest from the Albany Visitors Association calendar; Santa train time 10:45 (carousel) vs 10:30 (visitors association); Sweet Home tree lighting via the chamber's page carrying the city announcement.
- Silver Falls Winter Festival counted not free (parking permit); Silverton Christmas Market price from the live card, not rechecked; Powerland Holiday Sparkles (live card) dates conflict with a Powerland PDF.
- Some pages carry extra general planning paragraphs (written to pass 60% uniqueness) and general knowledge facts (Dallas as county seat, Philomath Frolic and Rodeo, A Christmas Story trivia); trim if desired.
- Same-host Albany carousel and Keizer Fire pages are near the 60% floor (lowest 60.05%).

## Held
Salem Riverfront tree lighting (no 2026 host page, dates conflict Dec 4 vs 5), Jefferson parade (conflicting dates, no host page), Sweet Home Holidays in the Park (Facebook only), Julegard Christmas Farm (no host site), Millersburg Holiday Magic and Santa's Book Express (social only), shopping markets, Dallas library programs (Facebook only), Monroe goat yoga (not Christmas), Turner tree lighting (social post only), Woodburn items above.
Eugene is a separate queued city and was not built. Gresham, Hillsboro, Newberg, McMinnville and Wilsonville are covered by the Portland run.

## Method notes for the next run
Round-up sites and Travel Salem find events, then confirm on host pages. Downtown association schedule pages can hold several events from different hosts. Never load CivicPlus calendar list pages (85k+ characters). Disambiguate Dallas OR from Dallas TX. Re-running tweak_pages.py appends, so rebuild first. Same-host sibling pages need 3+ distinct paragraphs to pass uniq.py.
