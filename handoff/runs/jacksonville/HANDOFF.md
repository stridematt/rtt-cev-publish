# Jacksonville run handoff (2026-11-26)

Built by three Sonnet helpers; lead converted each intro.json into page.json intro_html, seo_title and seo_description (Jacksonville gets page.json too, to ADD the intro block to the live page). Times are -05:00 (Eastern). Registry script: reg_jacksonville.sh (48 adds) in this folder and in rtt-cev-publish.

## Towns (new events built)
- jacksonville-fl (existing, 34 cards live): 9 new (cand 86000-86008). After moves: 35 events, 15 free (confirm against live counts)
- jacksonville-beach-fl (NEW): 4 new (86300, 86301, 86400 Atlantic Beach tree lighting, 86401 Neptune Beach) + 2 moved. 6 events, 2 free. Atlantic Beach and Neptune Beach folded in.
- st-augustine-fl (NEW): 11 new (86500-86510, Hastings and St. Augustine Beach folded in) + 2 moved. 13 events, 7 free.
- ponte-vedra-fl (NEW): 3 new (86600, 86601, 86700 Fruit Cove) + 3 moved. 6 events, 3 free. St. Johns folded in.
- fernandina-beach-fl (NEW): 5 new (86800-86804) + 1 moved. 6 events.
- orange-park-fl (NEW): 5 new (86850-86854)
- fleming-island-fl (NEW): 3 new (86900-86902)
- green-cove-springs-fl (NEW): 5 new (86930-86934). Christmas Eve page exists.
- palatka-fl (NEW): 3 new (86950-86952)
Total 48 new events. No page for Atlantic Beach, Neptune Beach, St. Johns, Middleburg, Keystone Heights.

## Publisher actions
1. Event pages from every bundle first (no slug collisions), then new city pages from page.json, then addCards per town.
2. Moves (jacksonville_moves.json): 8 cards leave jacksonville-fl for jacksonville-beach, st-augustine, ponte-vedra, fernandina-beach.
3. Jacksonville page: add intro_html from jacksonville-fl/page.json, link every new town (jacksonville_links.json), publish date today. Its intro counts assume the moves.
4. Date audit, quick-counts for every changed path, then registry. Do not request indexing.

## Flags
- jacksonville-fl 86000 Light Boat Parade overlaps the live River Fest card (both Nov 28); built separately because it is a searched name. Drop if you want no overlap.
- Several facts come from tourism calendars, not the host page (St. Augustine: Floridas Historic Coast calendar for Luminary Night, Lighthouse Illuminations, Christmas Market, Magical Ride, Cops and Claus, Holiday Market at the Beach, Hastings). Magical Ride with Santa dates conflict (Nov 21 to Dec 24 vs Dec 24 only). Ripley's Red Train price from Ripley's, dates from the calendar.
- Twice Upon A Christmas (Fruit Cove) links to the organizer's Eventbrite page (no host site).
- Some addresses from non-host pages: VyStar Ballpark, Cummer, Sesquicentennial Park, Fleming Island Library, Putnam courthouse (memory).
- Springfield and Mandarin tree lighting times come from Facebook/Instagram posts; free from the host's own post.
- Eagle Harbor Whoville times from Eagle Harbor's own Facebook post.
- Several page.json source URLs came from search results and were not all re-fetched (St. Augustine page.json: citystaug.com Light-Up Night, Action News Jax piece, Nocatee Living post).
- Unbuilt but found: Middleburg (Christmas Parade and Omega Park festival Dec 12, Santa at library) and Keystone Heights (Christmas Market and Kiwanis Parade Dec 12) plus Oakleaf Christmas Parade Dec 5 (Jacksonville line): about 4 to 5 events, enough for a Middleburg/Keystone page if Rally wants one (cand 86970-86999).
- uniq.py "Price not" flags are generator boilerplate, not real issues.
- Held (no host date/price details, Facebook-only, resident-only or shopping markets): see helper notes in thread.

## Addendum (Rally approved Middleburg page)
- middleburg-fl (NEW, combined Middleburg and Keystone Heights, plus Oakleaf parade): 5 events (86970-86974), 3 free. Registry: reg_jacksonville2.sh (5 adds; separate from reg_jacksonville.sh, run once). Jacksonville links it. Oakleaf parade slug ends -orange-park-fl (town taken from the mailing address). Sniktaw Farms Christmas Market (Nov 28, Green Cove Springs) found, belongs to green-cove-springs-fl, not built. Starke parade held (dates conflict). Omega Park address and Middleburg parade time (6:30 pm vs 6 pm) from organizer snippets: check.

## Addendum 2
- green-cove-springs-fl now has 6 events (added Sniktaw Farms 1st Annual Christmas Market, cand 86935, Nov 28, Price not listed; link is Explore Clay, no host page states it). Use the rebuilt bundle.json.gz (6 events). Registry: reg_jacksonville3.sh (1 add; the 5 other Green Cove adds are in reg_jacksonville.sh).
