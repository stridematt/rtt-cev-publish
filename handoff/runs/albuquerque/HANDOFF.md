# Albuquerque run handoff (2026-11-26)

Three Sonnet helpers (core and east, north and Santa Fe, south); lead added intro_html, seo_title and seo_description to every page.json, built the registry script and held one event. Times -07:00 (Mountain, DST not in effect in December). Registry script: rtt-cev-publish rtt/reg_albuquerque.sh (38 adds). Cand range 79000-79999. Rows: registry_rows.json.

## Towns (new events built)
EXISTING pages: albuquerque-nm 10 (intro 38 events, 8 free; includes Los Ranchos folded in), santa-fe-nm 4 (9/6), rio-rancho-nm 1 (3/2).
NEW pages: corrales-nm 3 (+ moved Noche de Luces), edgewood-nm 4 (Mountainair Luminaria de Abo folded in), bernalillo-nm 3, los-alamos-nm 6, los-lunas-nm 3, belen-nm 4 (Socorro luminarias folded in).
Total 38 new events. No page, nothing verified: Placitas, Pueblos, Espanola/Pecos, Tijeras, Cedar Crest, Sandia Park, Moriarty, Bosque Farms, Peralta/Tome/Isleta/Rio Communities (folded.json in each folder). Los Ranchos folded into Albuquerque (1 event).

## Publisher actions
1. Move: noche-de-luces-corrales-nm leaves the Albuquerque page for corrales-nm (albuquerque_moves.json).
2. New town pages: nearby starts albuquerque-nm; link Albuquerque to all new towns and each town back. Add intro_html from page.json to the three existing pages and the new ones.
3. Christmas Eve services pages: only albuquerque-nm and santa-fe-nm exist (200); others 404. Link those two.
4. LIVE CARD FIX: abq-ride-luminaria-tour-albuquerque-nm says "60th annual" and the page FAQ says ABQ RIDE stopped the tour. The host (cabq.gov/transit/events/2026-luminaria-tour, luminariatour.com) says the 61st annual tour runs Thursday Dec 24, 2026, buses from the Convention Center at 5:30 to 6:15 pm. Fix 60th to 61st and the FAQ.
5. Intro counts assume the move and use live counts from the Nov 25 snapshot; confirm after publishing.
6. Registry then quick-counts for every changed path. Do not request indexing.

## Held by lead
Rio Rancho Fantasy Noon Year's Eve (library, Dec 31): after the season. Bundle rebuilt without it.

## Flags
- Los Lunas: Heritage Park address "3447 Lambros Loop" from a county newspaper round-up; drone show time from a Facebook snippet; Dec 11 vs Dec 12 and park conflict (city page followed, noted on page). Belen lights close time entered as 23:59.
- Los Alamos parade "no admission fee" from the NM Tourism listing; Corrales Noche de Luces details came from the existing live card.
- Bernalillo 2025 date from a museum listing; Belen 2025 parade date from a KUNM calendar snippet.
- Pages with no 2025 recap say so instead of inventing one. Train links are museum pages (Sky Railway, Wheels Museum, Harvey House), no verified Christmas train rides except Pablo's Holiday Express (Santa Fe, Sky Railway).
- Single-page towns (Rio Rancho, Corrales etc.) cannot be run through uniq.py: uniqueness unchecked for those.
- Held: Edgewood Santa Run (404), Bosque Farms, Rio Communities, Belen police/JROTC and Grinch items (newspaper or Facebook only), Isleta (Facebook only), Peralta (adult craft event), Rail Runner Santa train (no 2026 listing), Merry Movie Nights (15+), Sandia Park tea party (third party).
