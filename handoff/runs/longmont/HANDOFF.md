# Longmont run handoff (2026-11-26)

## Registry command (Rally runs once; re-runs add duplicates; 40 adds)
cd ~/Downloads/sa/registry && curl -fsSL https://raw.githubusercontent.com/stridematt/rtt-cev-publish/650def16ad2096148b6ff2e5f473f700c74af2d7/co-longmont/reg_longmont.sh -o /tmp/x.sh && set -a && . ./.env >/dev/null 2>&1; set +a; bash /tmp/x.sh

Repo: stridematt/rtt-cev-publish, branch claude/project-thread-ey8pa8, commit 650def16ad2096148b6ff2e5f473f700c74af2d7. Folder co-longmont/ holds reg_longmont.sh, every <town>-bundle.json.gz, <town>-page.json, longmont_moves.json. Cand range 55000-55999 (used 55000-55621). Mountain time, -07:00 verified in every JSON-LD time; no dashes, no exclamation marks, no Paid pill on Price not listed pages; 41 unique event slugs; uniqueness 60%+ (checked per block).

## Towns
EXISTING pages (add cards, apply intro_html from page.json):
- longmont-co: 9 own events (cands 55000-55008) plus Berthoud 2 (55010-55011) and Mead 2 (55620-55621) carded here: 13 new cards in 3 bundles (longmont, berthoud, mead; load all three). Intro says 21 events, 8 free (8 already live + 13 new).
- loveland-co: 7 new (14 events, 2 free per intro; live page showed 0 free, recheck).
- johnstown-co: 2 new (5 events, 1 free). milliken-co: 1 new (3 events, 1 free).
NEW pages:
- estes-park-co: 11 events, 6 free (nearby longmont, loveland, fort-collins, boulder).
- frederick-co: 3 events (includes the Dacono Carbon Valley Holiday Festival; Dacono folded here), 2 free.
- firestone-co: 3 events, 2 free.
Folded (no page): Berthoud and Mead into longmont-co (Lyons has no verified event); Dacono into frederick-co. Platteville and Hudson: nothing verified.
Already built by the Denver run, not touched: Lafayette, Louisville, Erie, Superior, Boulder, Niwot.

## Publisher actions
1. No moves (longmont_moves.json is empty). The Boulder-page duplicates of Longmont cards are handled by denver_moves.json.
2. New pages: estes-park-co, frederick-co, firestone-co. Link longmont-co to all three new towns (and Loveland to Estes Park); each new page links back to longmont-co. Cross-link Frederick and Firestone to each other.
3. Christmas Eve services pages: loveland yes, milliken yes; longmont, estes-park, frederick, firestone 404; johnstown not checked.
4. Price not listed events are marked; public parades Free. Publish date today. Quick-counts for every changed path, no indexing requests.
5. Recheck counts at publish time (Loveland intro 14 / 2 free).

## Flags (facts not from a host page, or thin)
- Social-post sources removed 2026-11-26: Lyons parade dropped (held, host page empty); Berthoud A Very Merry Berthoud rebuilt date-only (organizer page confirms date and activities, hours were Facebook only); Johnstown Jingle kept (organizer page confirms date, 2 to 5 pm, tree lighting 5:30 pm).
- Firestone, Frederick and Dacono town pages render empty; details from search excerpts of those pages plus local listings. Carbon Valley library address and Mead Town Park address are not from host pages. Princess Tea price is the Eventbrite figure ($32.78).
- Longmont: Cookie Crawl host page has a 2025 date typo (used 2026); Nutcracker, pageant and Scrooge end times assumed; Santa and Reindeer times conflicted (host's reindeer 3 to 6 pm used); existing Jesters Breakfast with Santa card should be checked against the two seatings.
- Loveland: 12 Days of Christmas dates from Visit Fort Collins; Rocky Mountain Train Show prints no adult price or hours; Windsor Youth Ballet Nutcracker card on Loveland (Rialto venue) left in place. Estes Park: Festival of Trees address conflicts (1700 Big Thompson Ave vs 1700 Colorado Peaks Dr); Stanley Nutcracker Dec 13 time unknown; Bond Park lights have no end date (Dec 31 shown); several Estes addresses are public listings.
- Thin "lastyear" paragraphs on Frederick, Firestone and Estes Park; about ten paragraphs run 46 to 49 words.
- breakfast-with-santa-windsor-co sits on the Greeley page (Windsor, out of scope).

## Held (not built)
Longmont: museum holiday show, markets, Ice Pavilion and Roosevelt Park lights (no hours or price), Light Up Longmont and Shaggy Cow (ended), Gaming with Santa and Hang with Santa (old-year pages), symphony Candlelight (adult) and Family Concert (Jan 16, 2027), Discovery Days. Lyons Holiday Parade of Lights (host page empty, Facebook only), Lyons market and tree lighting, Berthoud Glow and Splash (unverifiable). Mead Chamber Breakfast with Santa, Highland Lake solstice program, Sugar Mill Santa Photos (Facebook). Firestone Paswaters Meet Santa at the Farm and Hudson Town Christmas (Facebook only), Platteville Daze of Christmas (image flyer), Dacono Santa Cops Auction (fundraiser), Frederick First Friday museum (no holiday theme), Zikr Dance Nutcracker in a Nutshell (Brighton, Denver run). Loveland Ohio events (wrong town).
