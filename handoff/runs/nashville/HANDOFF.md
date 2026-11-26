# Nashville run handoff (2026-11-26)

Built by three Sonnet helpers; lead generated page.json intro_html/seo fields (mkpage_lead.py), registry scripts and moves. Times are -06:00 (Central). Registry scripts in rtt-cev-publish branch claude/project-thread-vx5vsl, commit 5c366d0c15f09996b361f92703edda81816226d8: rtt/reg_nashville1..5.sh (47 adds, 10 per script). Bundles: rtt/nashville/<town>-tn.json.gz (same commit), copies in each <town>-tn folder.

## Towns (new events)
- nashville-tn (existing): 4 (87000-87003) + 2 Ashland City (87970-87971, bundle in ashland-city-tn built for nashville-tn). Intro 30 events, 9 free after moves.
- franklin-tn (existing): 4 (87200-87203, incl. Leiper's Fork parade; Leiper's Fork folded in)
- spring-hill-tn (existing): 1 (87280)
- brentwood-tn (existing): 0 new, intro only
- murfreesboro-tn (existing): 8 (87400-87407)
- lebanon-tn (existing): 3 (87580-87582); mount-juliet-tn (existing): 2 (87640-87641); hendersonville-tn (existing): 3 (87720-87722)
- NEW pages: nolensville-tn 3 (87320-87322), fairview-tn 2 (87370-87371), smyrna-tn 2 (87500-87501), la-vergne-tn 1 (87550, thin), gallatin-tn 8 (87800-87805 + White House 87930 + Portland 87950 folded in), goodlettsville-tn 2 (87860-87861), springfield-tn 2 (87900-87901)
Total 47 new events. Not built as pages: Leiper's Fork, Dickson, White House, Portland, Ashland City, Eagleville (folded or under 3 events).

## Publisher actions
1. Moves: nashville_moves.json (16 suburb cards leave nashville-tn; drop duplicates). Intro counts assume the moves.
2. Nashville page links to every new town; each new town links back (page.json nearby starts nashville-tn). Eve pages exist for nashville, franklin, murfreesboro (christmas_eve_page true); others none.
3. Existing-town page.json holds only intro_html and seo fields to ADD; NEW towns carry full NEWPAGE_SPEC content.
4. Price not listed events marked so; public parades Free. Page date = day of publishing.
5. Registry then quick-counts for all changed paths. Do not request indexing.

## Flags
- Nolensville Town Hall address, Spring Hill zip, Stones River Town Centre address, Breeden's zip, Hammer and Stain, 3:Sixteen, Sadie Ford addresses not from host pages.
- Dave and Buster's Dec 6 from Prekindle (others say Dec 5 and 6). Leiper's Fork parade date from a Visit Franklin Facebook post. Gallatin tree lighting from the city's Facebook post.
- La Vergne parade route conflict (calendar vs parade page), noted on page. Portland hours from a tourism calendar. Moved Goodlettsville, Springfield and Portland cards not re-verified at the host.
- Gallatin Polar Express vs Movie Nights uniqueness margin 60.2%. uniq.py flags "Price not listed" (not an issue).
- Not built (no usable host source): Nashville library programs, Hermitage tree lighting, Metro tree lighting (page 404), Dickson, Thompson's Station (Facebook only).
