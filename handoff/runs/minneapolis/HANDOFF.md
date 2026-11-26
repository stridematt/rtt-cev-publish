# Minneapolis-Saint Paul run handoff (2026-11-26)

Built by Sonnet helpers (core and Saint Paul; west/southwest; east/south/north in three passes) with two second passes; lead checked JSON validity, duplicate cands and slugs (none), collisions with the 41 live Minneapolis cards (none), -06:00 on all JSON-LD, no dashes or exclamation marks, generated intro_html, seo_title and seo_description from intro.json into every page.json (existing pages get a page.json holding only those three fields). Cand range 70000-70999, 100 new events. Central time.

Registry: rtt-cev-publish branch claude/project-thread-2r10jo, minneapolis/reg_minneapolis1..10.sh (10 adds each, no set -e, `|| true` on every add, prints "added N, refused M" and refused slugs), commit 41d9d29a74facce55507b4d867d832cd15a43e17 (all 10 verified byte for byte against the raw files at that commit). Rows: registry_rows.json.

Registry command (Rally, in Terminal, source ./.env first, run once; re-runs add duplicates):
cd /Users/matt/Downloads/sa/registry && source ./.env && for i in 1 2 3 4 5 6 7 8 9 10; do curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/41d9d29a74facce55507b4d867d832cd15a43e17/minneapolis/reg_minneapolis$i.sh -o reg_minneapolis$i.sh && bash reg_minneapolis$i.sh; done

## Towns (folder, bundle.json.gz, page.json with intro_html, seo_title, seo_description)
NEW pages (28): andover, anoka, apple-valley, chanhassen, crystal, eden-prairie, elk-river, faribault, farmington, hastings, hudson-wi, lino-lakes, minnetonka, new-brighton, new-hope, northfield, plymouth, prior-lake, ramsey, rogers, rosemount, roseville, saint-louis-park, savage, shakopee, south-saint-paul, stillwater, woodbury. Use full page.json (nearby starts minneapolis-mn, verified train links).
EXISTING pages with new events (bundle): minneapolis-mn +8, saint-paul-mn +8, bloomington +1, maple-grove +1, chaska +2, golden-valley +1, delano +1, eagan +2, burnsville +2, lakeville +2, white-bear-lake +1, coon-rapids +1, taylors-falls +2, cottage-grove +1 (page was already live, 2 cards).
EXISTING, intro/seo only (no bundle): blaine, champlin, shoreview, edina, oakdale, brooklyn-park, big-lake, inver-grove-heights, west-saint-paul (no new events, helpers wrote intro.json for some).
Folded, no page: Excelsior and Wayzata into Minnetonka; Victoria into Chanhassen; Watertown into Delano; Hopkins into St. Louis Park; Robbinsdale into Crystal; Richfield into Bloomington; Waconia into Chaska; Lake Elmo into Woodbury; Hugo into Lino Lakes; Mounds View into New Brighton; Otsego into Elk River; Falcon Heights, Mendota Heights, Maplewood into Saint Paul; Lauderdale, North St. Paul, Arden Hills, Columbia Heights, Fridley, Forest Lake, Oakdale (0 verified).

## Publisher actions
1. Moves: minneapolis_moves.json (final). Drop duplicate north-pole-express-at-union-depot-saint-paul-mn from minneapolis-mn (live saint-paul-mn card is the same event). Eagan's two cards are already live on eagan-mn, so just remove them from minneapolis-mn. Check live white-bear-lake-mn already has the Fillebrown card. Goldfish card moves edina-mn to minnetonka-mn. Anoka and Ramsey take one card each from coon-rapids-mn.
2. minneapolis-mn after moves: 26 cards, 4 free (intro already written for that). saint-paul-mn: 22 cards, 9 free. Link minneapolis-mn to every town page of this run; link each new town back to minneapolis-mn.
3. Existing pages: replace the live intro with intro_html from page.json. New pages: full page.json.
4. Christmas Eve services: minneapolis-mn exists (link it), lakeville-mn yes; others unconfirmed (checked by search only), assume no.
5. Times -06:00. Page date = publish day. Wisconsin (Hudson) is also Central. Multi-date runs emit start time plus endDate (kit behavior).
6. Registry, then quick-counts for every changed path (all folders above with a bundle or intro). Do not request indexing.
7. Run the live date audit and drop events already ended on publish day.

## Flags (facts not fully from a host page)
Santa's Train Shop (Saint Paul): host says weekends in December, 10 to 4, from $10.70; the weekend dates Dec 5/6, 12/13, 19/20 come from event listings. Roseville New Year's Eve (year and price not printed; Visit Roseville guide) and Holiday Light Map window (Visit Roseville guide). Rosedale Santa photos: reservation only, no hours printed. Como Flower Show hours and suggested donation. Several addresses inferred or from a round-up (Arbor Lakes, Chanhassen City Center Park, New Hope Ice Arena, Robbinsdale City Hall, Hugo, Faribault Viaduct Park). Times from community calendars: Andover 6 to 8 pm, New Brighton 5:30 to 7:30. Free for CPKC Holiday Train stops at Golden Valley and Loretto rests on the program generally. Black Family Light Show source is the show's own Facebook post. Magic of Lights (Eagan) from Explore Minnesota. Tri-City Santa Parade host not named. Thin page.json "lastyear" paragraphs where no 2025 recap exists. Uniqueness margins thin (Faribault 61%, Northfield 64%).

## Held
Eden Prairie Santa's North Pole Experience (host site shows no 2026 dates), Southdale Santa, Hopkins Christmas House, Long Lake tree lighting (conflicting times), Luce Line Santa photos, Brooklyn Park Winter Wonderland, Birch's Breakfast with Santa, Johnny Mac's, 6Smith Santa dinners, Brooklyn Center Snow Many Traditions, Downtown Get-Down, Tomte Tales, Maplewood Mall Santa, Children's Museum NYE party, Saint Paul rec center events (no addresses), Burnsville Center Santa, Lakeshore Players White Christmas, Oakdale Holiday Hang Out and Santa breakfast, Lights on Iteri, Rosemount Breakfast with Santa (aggregator date), Farmington VFW photos, NAGCracker, Forest Lake Hometown Holiday and Masons photos (city site down; worth a re-check), Fridley Forgotten Star Santa, Furball Winter Wonderland.
Not found: Osceola and St. Croix Valley Railway 2026 Santa/Polar Express dates (worth a manual check), Valleyfair, Murphy's Landing, Hennepin County Library programs.
