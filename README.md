# Spares Log

Stores and spares logging for the workshop. Log parts taken from machines or the stores, keep a stores list with specs and stock by location, and prompt stock checks.

## Files

- `index.html`: the whole app, one self-contained page.

## Scanning labels

The Scan label button opens the phone camera inside the page. Tap Capture and the label is read on the phone itself (Tesseract.js), then manufacturer, part number, order number, serial and ratings are filled in for checking. "Use the phone's camera app" and "Choose a photo" are there if the in-page camera is blocked.

- The reader downloads about 7 MB the first time it is used, then runs from the browser cache.
- The camera needs the page to be served over HTTPS, which GitHub Pages and Vercel both do.
- OCR can misread characters. Always check the fields against the label. "What the camera read" shows the raw text.

## Where data is kept

- **Shared team log (Supabase):** once set up below, everyone using the page sees the same log, stores list, stock counts, machines and locations. Phones refresh every few seconds. With no signal, entries are kept on the phone and upload when it reconnects.
- **Without Supabase:** entries stay on each phone only.
- **As a Claude artifact:** uses Claude's own shared storage instead.

## Set up the shared log (about 10 minutes, free)

1. Create a free project at supabase.com.
2. Open `schema.sql` from this repo, change `CHANGE-ME-PASSCODE` (it appears twice) to a team passcode, then paste the whole file into Supabase, SQL Editor, New query, and press Run.
3. In Supabase go to Project Settings, API. Copy the Project URL and the `anon` public key.
4. In `index.html`, find `const SUPABASE = {url:'', key:''};` and put those two values in the quotes. Commit.
5. Open the page on each phone. It asks for the passcode and the person's name once, then remembers them.

The passcode stops anyone without it reading or writing the data. It is not strong security, so don't keep anything sensitive in the log. Supabase pauses free projects after a week with no use, so open it now and then or upgrade if it matters.

## Publish on GitHub Pages

1. Repository Settings, Pages.
2. Source: deploy from branch `main`, folder `/ (root)`.
3. The site appears at `https://jw6295.github.io/RRstores/`.
