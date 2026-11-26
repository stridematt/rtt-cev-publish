# Voice and uniqueness rules (added Nov 26, 2026, per Matt)
Goal: every page reads like a local parent wrote it, and passes Google's scaled-content checks.
1. Write each event's two paragraphs and tip by hand from the host's own page. Vary the opening: do not start two events in a row with the host name or "The".
2. Use contractions sparingly and plain verbs (head to, kicks off, wander in, bring). No "joyful celebration of" or "creating community" language copied from the host; paraphrase it.
3. One concrete detail per paragraph that only this event has (street, room, parking, what the kids actually do). Never invent details.
4. Vary sentence length. Mix a short sentence with a longer one. No lists of three adjectives.
5. Tip: one practical, sourced line, phrased differently each time (not always "Arrive early").
6. City intro (lede) is hand written per city: different first sentence structure, name 2 or 3 real events, say what is free in the city's own terms. Do not reuse the Hayward wording.
7. No dashes, no exclamation marks, no "own website" phrasing, no "not stated" filler.
8. uniq.py target is 70 percent or higher (hard floor 60). Rewrite, do not pad.
9. Never copy host sentences; paraphrase every sentence.

## Per-city schema check (added Nov 26, 2026, per Matt)
After publishing a city, run Google's Rich Results Test on the city page and each new event page:
`https://search.google.com/test/rich-results?url=<urlencoded page URL>` in a second Chrome tab (the publisher tab must not navigate). It runs from the URL with no extra clicks and takes about 30 seconds. Expect Articles, Breadcrumbs, Events, Organization, Videos valid. The only accepted note is the optional offers.validFrom on Event. Any error or any other warning: fix the page and retest. Close the extra tab afterwards.
Note: Bright Nights style season events need an endDate with time and offset (patched by hand on Springfield); check long-running events.
