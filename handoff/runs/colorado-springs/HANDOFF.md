# Colorado Springs run handoff (2026-11-26)

Built by three Sonnet helpers (core and south, Pikes Peak region, Pueblo and Canon City); lead validated JSON, bundles, dashes and exclamation marks, built intro_html for every changed page and the registry script. Cand range 73000-73999, 43 new events. Times are -07:00 (Mountain, December).

## Towns (bundle.json.gz in each folder)
EXISTING pages (add cards, add intro_html from page.json): colorado-springs-co 8 new (intro: 24 events, 9 free, after 5 cards move out), pueblo-co 11 new (intro: 14 events, 4 free; includes Pueblo West events folded in).
NEW pages (page.json has intro_html, seo_title, seo_description, nearby starting colorado-springs-co): fountain-co 1 new + 2 moved in (3 events), security-widefield-co 1 (thin), manitou-springs-co 6 + 1 moved in (7), monument-co 6 + 1 moved in (7; Palmer Lake and Black Forest folded in), woodland-park-co 4 + 1 moved in (5; Cripple Creek and Victor folded in), canon-city-co 6 (Florence folded in).
Folded, no page (folded.json only): Falcon, Peyton, Calhan, Palmer Lake, Black Forest, Cripple Creek, Pueblo West, Florence, Trinidad, Walsenburg, Salida, Buena Vista.

## Registry command (Rally runs once; re-runs add duplicates). Script has no set -e and prints "added N, refused M" plus refused slugs.
See the command in the thread message (pinned to a commit). Script: reg_colorado_springs.sh (43 adds), rows in registry_rows.json.

## Publisher actions
1. Moves (colorado-springs-co/moves.json): off the Colorado Springs page to Fountain (Magic of Lights, Nature Hikes with Santa), Manitou Springs (Cascade North Pole Santa's Workshop), Woodland Park (Santa and the Dinos), Monument (McDowall Greatest Story). Cards move only if the destination page is published; the intro counts assume all five move.
2. Orphan live card santa-and-tree-lighting-manitou-springs-co is not linked from any city page; add it to manitou-springs-co (page then has 8 events) or leave it, and confirm the Manitou count after publish. Also standalone tree-lighting-fountain-co exists and is carded nowhere (the Nov 20 event is past, leave it).
3. Link Colorado Springs to all new towns and each town back to Colorado Springs. Christmas Eve services page exists for colorado-springs-co and pueblo-co only (all others 404; Palmer Lake, Black Forest, Cripple Creek unchecked).
4. Page date today of publishing. Registry, then quick-counts for every changed path. Do not request indexing.

## Flags
- Placeholder times that render publicly: Skate in the Park (10 am to 9 pm), Santa's Wonderland at Bass Pro (10 am to 8 pm); both have when_notes. Broadmoor show and Nutcracker have start times only.
- Date-only endDate in JSON-LD is kit behavior. Elf Hunt Manitou lists from Nov 26 (host starts Nov 25).
- Addresses not from the host page: Pikes Peak Center 190 S Cascade Ave (existing live card), Broadmoor 1 Lake Ave (Visit Colorado Springs), Jingle Jam venue (listing image alt text), Widefield Parks and Rec 755 Aspen Dr (conflicts with 705 on an old article), Pueblo courthouse 215 W 10th St (state page), Canon City library 516 Macon Ave (2025 city calendar), Pueblo Parade zip (Discover Pueblo).
- Facts from non-host sources: Monument tree lighting and Palmer Lake details (Monument Independent calendar and Gazette Tribune), Florence open house "by donation" (Colorado.com), Fountain Miracle on Main Street time (Fountain UP Facebook, links the city homepage).
- Homepage or Instagram-only URLs: Colorado Kids Ranch, Forest Bend Farm, Miramont Castle, Florence Pioneer Museum, Pueblo courthouse lighting, Canon City library Santa (Instagram), Fountain, Security-Widefield (events page).
- Conflicts: Royal Gorge Santa Express host price $104 to $154 (used) vs $94 to $144 elsewhere; ride length differs between product page and FAQ. Garden of the Gods Dec 4 page lists Free plus $5.50 to $20.50 options, so Price not listed.
- Not checked by helpers: two Admission grep hits (Manitou Wheeler Town Clock, Monument Christmas in the Forest); both are Price not listed events so likely a false positive from "Price not listed". Pueblo intro season line only covers new events.
- Trains: no 2026 train events in the Pikes Peak group (Cog Railway: nothing verified; Cripple Creek Narrow Gauge closed until May 2027). Built: Pueblo Express Christmas Trains at Pueblo Railway Museum, Santa Express at Royal Gorge Route Railroad.
- Thin pages: Security-Widefield (1 event), Fountain (3, none free).

## Held (main ones)
Royal Gorge Bridge of Lights (cancelled 2026 per park), Peterson SFB breakfast (base access unclear), Charter Academy breakfast and Space Foundation holiday (conflicting dates), Cozy Coach/Trolley Jeep tours (no times or address), Bear Creek Nutcracker, Keystone sensory Santa, Santa's Cottage at Briargate, Facebook-only events (Peyton, Falcon, Florence Elks, Pueblo Mall Santa, Trinidad items), Cog Santa train (unverified), White Christmas musical (no per-date times), Festival of Trees (adult).
