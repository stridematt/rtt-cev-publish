# Lancaster CA and Antelope Valley run handoff (2026-11-26)

REGISTRY COMMAND (Rally, Terminal, run once; commit 4760a13447e106a8cf2b540ee6205487d669349b, branch claude/project-thread-bmq6ym in stridematt/rtt-cev-publish, raw file verified identical to reg_lancaster.sh; 16 adds):
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/4760a13447e106a8cf2b540ee6205487d669349b/lancaster/reg_lancaster.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Three Sonnet helpers. Cand range 50000-50999 (used 50000-50008, 50400-50404, 50700-50701; next free for the long list is 49000 and down). Pacific, -08:00 verified on every timed JSON-LD. Lead checks passed: JSON valid, no duplicate cands or slugs, no dashes or "!" outside scripts, uniqueness 62%+ on every pair (the kit's "Price not" lint flags are the allowed "Price not listed" wording), intro_html, seo_title, seo_description present in both page.json files, no Paid pill on Price not listed pages (only the Nutcracker, $20 to $41, keeps it). Bundles and page.json also in rtt-cev-publish under lancaster/ (<town>-bundle.json.gz, <town>-page.json, reg_lancaster.sh, registry_rows.json). Folders: /mnt/project-files/lancaster-run/<town>-ca/.

## Towns
NEW page (1): lancaster-ca, 11 events, 4 free (recount live). 9 built by helper A in lancaster-ca/bundle.json.gz (BLVD Christmas, Milk and Cookies with Santa, Underwater Pictures with Santa, Antelope Valley Ballet Nutcracker, Lancaster Baptist musical and live nativity, Quartz Hill marketplace and tree lighting, Lancaster library kids programs, Lake Los Angeles library Winter Wonderland, Quartz Hill library gingerbread challenge). 2 parade cards for lancaster-ca sit in OTHER bundles: rosamond-ca/bundle.json.gz (Rosamond Parade of Lights, Dec 5, Free) and california-city-ca/bundle.json.gz (California City Christmas Parade, Dec 4, Free). Publisher must load all three bundles for lancaster-ca; lancaster-ca/page.json intro counts include them. SEO title "11 Christmas Events for Kids in Lancaster, CA 2026".
EXISTING with new events: palmdale-ca, 5 new events (Light Up the Square and Sparkle on the Square, Santa's Workshop at Palmdale Playhouse, Sounds of the Holidays concert, Antelope Valley Christmas Parade on Palmdale Blvd Dec 12 free, Santa at Antelope Valley Mall). 3 live cards untouched. palmdale-ca/page.json carries intro_html, seo_title, seo_description (count 8 events, 4 free; recount live, the craft workshop free flag came from the city's free park events page).
Folded: Quartz Hill, Lake Los Angeles, Antelope Acres, Rosamond, California City, Mojave, Edwards AFB into lancaster-ca; Littlerock, Leona Valley, Acton, Agua Dulce, Pearblossom into palmdale-ca. Each has folded.json.
No moves needed. No Antelope Valley cards on los-angeles-ca, santa-clarita-ca.

## Publisher actions
1. Registry first, then: lancaster-ca newCity + convertSoon (far template, e.g. a Texas or Florida page not in nearby links), load all three bundles, addCards. palmdale-ca: addCards from palmdale-ca/bundle.json.gz.
2. Links: lancaster-ca links palmdale-ca (hub) and back; palmdale-ca should link lancaster-ca. Set intro_html, seo_title, seo_description from page.json on both.
3. Christmas Eve services pages: none for lancaster-ca or palmdale-ca (404), so no eve line or FAQ.
4. Quick-counts for /christmas-events/lancaster-ca and /christmas-events/palmdale-ca. Page date = publish day, -08:00. Drop events ended on publish day (Santa at Antelope Valley Mall runs to Dec 24; Light Up the Square nightly to Jan 3, 2027).

## Flags (not from a host page, or weak)
Palmdale Light Up the Square details come from city calendar search excerpts and the Nov 23 city news release (cityofpalmdaleca.gov timed out); Antelope Valley Mall address from a third-party listing; Antelope Valley Christmas Parade source is the AV Chambers registration page, route only, no street address; Quartz Hill marketplace host page is the chamber calendar; Rosamond parade start time 6 pm is only on the chamber's Facebook (host page lists noon to 10 pm, card says so), and antelopevalley.com says Dec 6 while the chamber says Dec 5 (chamber used); California City route comes from the chamber home page; Lancaster intro counts 4 Santa chances.

## Held
Littlerock Christmas Parade (Dec 12, 3 pm, 82nd Street East; only Eventbrite and Facebook, so held. If Rally accepts the Littlerock Town Council's Eventbrite listing as host, build under cand 50405); Palmdale library holiday party and film festival (city calendar timed out); Prancers Farm Village and AV Mall tree lighting (Instagram only); Holiday Magic at the Square (page is the 2025 date); Palmdale Magical Christmas Parade (no 2026 date); Acton and Agua Dulce tree lighting (2025 page); Boss Kids Braiding toy giveaway and Toy Drive Car Show (unverified); Lancaster Snoopy on Ice market, Breakfast with Santa at Sgt. Steve Owen Park, LMPAF Holiday Market, AVTA Stuff-a-Bus (not built); Mojave tree lighting (no host page); California City Merry and Mingle, Season of Hope toy drive, Mistletoe Market (flyer only or vendor market); Rosamond Peanuts 5K (fun run), Johnsons Home and Garden events (Instagram only); Edwards AFB events (base personnel only).
Possible follow-ups, not checked on a host page: Antelope Valley Toy Giveaway (Dec 20, Hernandez Family Foundation, AV Fair and Event Center, Lancaster) and the Lake Los Angeles Christmas parade (Dec 19, from Antelope Valley News).

## Stray events (other runs)
Tehachapi parade, Bakersfield Christmas Town, Kern County Museum Lamplight Tours.

## Queue coverage
Covered (tell Rally): Lancaster, Palmdale. Victorville and Hesperia already have live pages (High Desert, not part of this run).
