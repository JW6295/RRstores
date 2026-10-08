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

Entries, the stores list and stock counts are saved in the browser on each phone. They are not shared between phones. When the page is opened as a Claude artifact instead, it uses Claude's shared storage so everyone sees the same log.

## Publish on GitHub Pages

1. Repository Settings, Pages.
2. Source: deploy from branch `main`, folder `/ (root)`.
3. The site appears at `https://jw6295.github.io/RRstores/`.
