# Seattle run handoff (2026-11-26)

Repo: stridematt/rtt-cev-publish, branch claude/project-thread-jkeout, commit 6ccffca44c09239dec9c2a530f1fe79029de54d9, folder rtt/seattle/ (per-town bundles `<town>-wa.json.gz` or `<town>-wa._a.json.gz` etc., `<town>-wa.page.json`, MOVES.md, SEO_CTR_PASS.md).
Raw base: https://raw.githubusercontent.com/stridematt/rtt-cev-publish/6ccffca44c09239dec9c2a530f1fe79029de54d9/rtt/seattle/

## Publish order
1. Existing towns: publish bundle pages, addCards(city), dateToday. 2. NEW towns: publish bundle pages, create city page from page.json (NEWPAGE_SPEC) incl. intro_html, seo_title, seo_description, then addCards. 3. Seattle (bundle_a/b/c), then apply MOVES.md (remove suburb cards from seattle-wa, add the listed existing event pages as cards on town pages), add a suburbs block on Seattle linking every town page. 4. Apply SEO_CTR_PASS.md titles. 5. Re-run intro counts from live ?format=json (intro_counts in page.json are approximations), then quick-counts workflow.
Also existing towns' page.json hold only intro_html/seo fields: refresh the intro on those pages.

## Registry (Rally, Terminal, 189 adds)
`cd ~/Downloads/sa/registry && for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/6ccffca44c09239dec9c2a530f1fe79029de54d9/rtt/reg_seattle$i.sh -o reg_seattle$i.sh && bash reg_seattle$i.sh; done`

## Pages (189)
- arlington-wa: 5 (NEW)
- auburn-wa: 7 (existing)
- bellevue-wa: 10 (existing)
- bothell-wa: 5 (NEW)
- burien-wa: 5 (NEW)
- covington-wa: 3 (NEW)
- des-moines-wa: 3 (NEW)
- edmonds-wa: 10 (existing)
- everett-wa: 9 (existing)
- federal-way-wa: 6 (NEW)
- issaquah-wa: 4 (existing)
- kenmore-wa: 2 (NEW)
- kent-wa: 4 (existing)
- kirkland-wa: 8 (NEW)
- lake-stevens-wa: 3 (NEW)
- lynnwood-wa: 5 (existing)
- maple-valley-wa: 1 (existing)
- marysville-wa: 3 (existing)
- mercer-island-wa: 3 (existing)
- mill-creek-wa: 4 (NEW)
- monroe-wa: 3 (existing)
- mountlake-terrace-wa: 1 (NEW)
- mukilteo-wa: 3 (NEW)
- north-bend-wa: 4 (NEW)
- redmond-wa: 4 (existing)
- renton-wa: 5 (NEW)
- sammamish-wa: 2 (NEW)
- seatac-wa: 1 (NEW)
- seattle-wa: 41 (existing)
- shoreline-wa: 7 (NEW)
- snohomish-wa: 7 (NEW)
- snoqualmie-wa: 5 (NEW)
- tukwila-wa: 2 (NEW)
- woodinville-wa: 4 (NEW)

## URLs to index (do not request indexing automatically)
New city pages: /christmas-events/arlington-wa, /christmas-events/bothell-wa, /christmas-events/burien-wa, /christmas-events/covington-wa, /christmas-events/des-moines-wa, /christmas-events/federal-way-wa, /christmas-events/kenmore-wa, /christmas-events/kirkland-wa, /christmas-events/lake-stevens-wa, /christmas-events/mill-creek-wa, /christmas-events/mountlake-terrace-wa, /christmas-events/mukilteo-wa, /christmas-events/sammamish-wa, /christmas-events/seatac-wa, /christmas-events/shoreline-wa, /christmas-events/snohomish-wa, /christmas-events/snoqualmie-wa, /christmas-events/tukwila-wa, /christmas-events/woodinville-wa, /christmas-events/north-bend-wa, /christmas-events/renton-wa
Changed existing city pages: seattle, bellevue, redmond, issaquah, mercer-island, kent, auburn, maple-valley, edmonds, lynnwood, everett, marysville, monroe (all -wa).
New event pages: every slug in the bundles (list: seattle-run/all_event_slugs.txt).

## Duplicate pages, recommended 301s
snowflake-lane-bellevue-wa -> snowflake-lane-nightly-holiday-parade-bellevue-wa; redmond-lights-wa -> redmond-lights-art-light-installations-wa; check victorian-christmas-festival-puyallup-wa vs victorian-country-christmas-puyallup-wa.

## Flags
Arlington (19,868 in 2020 census, built); Tukwila, SeaTac, Mountlake Terrace, Kenmore, Sammamish have 1 to 2 events; Carnation not built (2 events), Duvall not built; Aurora Community Church Santa Claus Lane "free pictures" wording; Old Country Christmas at Legacy Farm zip (98298 vs 98272); Magical Strings end time estimated; Imagine Santa's Sock Hop 5 vs 6 pm; Alderwood Santa has two event IDs; Rainbow Lodge and Holiday Express use Eventbrite as url; slug collisions against live pages not checkable from cloud, re-check at publish; Hidden Meadows train only Nov 27 to 29. More in REVIEW_NOTES.md.
