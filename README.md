# Spares Log

Stores and spares logging for the workshop. Log parts taken from machines or the stores, keep a stores list with specs and stock by location, and prompt stock checks.

## Files

- `Index.html`: the whole app, one self-contained page.

## Where it runs

Built to run as a Claude artifact, which provides the shared log, label reading from photos and CSV export. Opened anywhere else (for example GitHub Pages), it falls back to saving on the device only: no shared log, no label reading, no CSV export.

## Publish on GitHub Pages (device-only mode)

1. Repository Settings, Pages.
2. Source: deploy from branch `main`, folder `/ (root)`.
3. The site appears at `https://rrspares.github.io/spares-log/`.
