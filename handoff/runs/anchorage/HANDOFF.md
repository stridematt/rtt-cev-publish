# Anchorage / Alaska run handoff (2026-11-26)

Built by three Sonnet helpers; lead checked JSON validity, unique cands (41) and slugs, -09:00 on timed JSON-LD (no -08:00), no dashes or exclamation marks in page text, no empty prices, uniqueness 60%+ on every event page, intro_html, seo_title and seo_description in every page.json. Cand range 59000-59999 (used 59000-59982). 41 new events. Alaska time, -09:00.

Registry script: reg_anchorage.sh, rtt-cev-publish branch claude/project-thread-ttbpfh, anchorage/reg_anchorage.sh, commit 588c2f9e8b423acddde6f107ef7ef3e44617dc02 (41 adds, verified identical to the raw file at that commit).
Command (Rally, Terminal):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/588c2f9e8b423acddde6f107ef7ef3e44617dc02/anchorage/reg_anchorage.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Bundles are in project files (<town>-ak/bundle.json.gz), not in the repo.

## Towns (events, free)
NEW pages: eagle-river-ak 3, 2 free (1 own + 2 moved from anchorage); girdwood-ak 12, 10 (9 own + 3 moved); palmer-ak 5, 1; kenai-ak 5, 4 (Soldotna and Homer events carded here, those towns folded); juneau-ak 4, 0; kodiak-ak 3, 1.
EXISTING with new events: anchorage-ak 21, 8 (15 stay + 6 new, 5 cards move off); wasilla-ak 11 (9 live + 2 new); fairbanks-ak 7 (2 live + 5 new, includes Santa Claus House carded as North Pole); seward-ak 3, 2 (2 live + 1 new).
Folded, no page: North Pole (into fairbanks, 1 event), Big Lake, Houston, Willow, Talkeetna (into wasilla, 0 events), Soldotna and Homer (into kenai), Ketchikan (1 event), Sitka (1), other-ak-towns (Valdez, Skagway, Haines etc). See folded.json in each.

## Publisher actions
1. Moves: anchorage_moves.json (5 cards: 3 to girdwood-ak, 2 to eagle-river-ak). Moved cards are not in the target bundle, so add them to the target at publish.
2. Palmer Grinch musical card (Nov 6 to 8, ended): now an explicit "drop" move in anchorage_moves.json. It is not in any bundle, counts exclude it.
3. Links: anchorage-ak links eagle-river-ak, girdwood-ak, palmer-ak, kenai-ak (and Alaska hub); each new page links back. Juneau and Kodiak hub lines say Alaska families. Kenai links seward-ak and /museums/seward-depot-alaska. Verify each nearby slug is live (wasilla-ak, seward-ak, fairbanks-ak, anchorage-ak exist).
4. Christmas Eve pages: yes for anchorage-ak, wasilla-ak, seward-ak; 404 for eagle-river, girdwood, palmer, fairbanks, kenai, juneau, kodiak (not checked: soldotna, ketchikan, sitka).
5. Existing pages: use intro_html and seo from page.json. New pages: full page.json. Date = publish day, -09:00.
6. Registry first, then quick-counts for every changed path. Drop events that ended on publish day.
7. Seward live SeaLife Community Holiday Party card: SETTLED. Host page alaskasealife.org/calendar_detail/204 says Thursday Dec 3, 2026, 6 to 8 pm, free. Live card says Dec 2: change it to Dec 3 (listed under "fixes" in anchorage_moves.json). Not in the bundle because the card is already live.

## Flags (facts not from a host page)
Williams Reindeer Farm dates from the farm's own social posts. Fairbanks Winter Solstice Festival address from general knowledge. Addresses from memory: Homer Mariner Theatre (600 E Fairview Ave), Juneau-Douglas HS (1639 Glacier Ave), Valley Library (3025 Dimond Park Loop). Kodiak Nutcracker address conflicts (722 Mill Bay Rd vs 821 E Rezanof Dr; page says confirm). Kodiak tree lighting window 4:30 to 6 pm is rough. Christmas Comes to Kenai has no printed price, listed Free under the parade rule. Colony Christmas has no price and no parade address. Calendar-sourced events (Wasilla, Jingle Jamboree, Girdwood library, Eagle River lantern, Anchorage NYE, Seward tree lighting) use "source" wording. Eagle River and Girdwood page.json follow the Marana format (no celebrates, lastyear, faq, sources blocks). Free counts on Anchorage need a recheck against the live page (4 of 5 moved cards are free). Not checked: neighbor pages for stray cards.

## Held
Santa Claus House Christmas in Ice (no 2026 host page), Juneau Santa Skate (conflicting date), Juneau Candy Cane Hunt (2025), Coastal Helicopters lights (concluded), Mendenhall Mall Santa (no dates), markets and bazaars, Facebook-only events (Forever Christmas, Kendall Ford and Bishop's Attic Santa), Soldotna Christmas in the Park and Skate with Santa (no 2026 host page), Kenai Peninsula Orchestra Evening of Christmas (no 2026 venue; lead), Ketchikan Singing Christmas Tree (no host page).
