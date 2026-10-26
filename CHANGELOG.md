# Changelog

All notable changes to Artist Page are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Date Versioning](https://datevers.ing) since v26.10.23 (`YY.MM.DD`, the UTC release date, with `-1`, `-2`… for later releases the same day); earlier releases used [Semantic Versioning](https://semver.org/).

## v26.10.26

### Security

- The CI workflow runs on Node.js 24 instead of the end-of-life Node.js 20, which has no fix for the Brotli decoder vulnerability CVE-2026-111497

## v26.10.23-1

### Added

- A Discord link preview for every page except the 404 page: a `discord:component-embed` in each `<head>` with the page's name and description, Stux.Music's colour and icon, and a link back to Stux.Music. The Open Graph and other tags are unchanged. `python scripts/build-embeds.py` writes them from each page's `<title>` and meta description, and `scripts/build-sitemap.py` does the same for the sitemap page
- A full favicon set at the web root: `favicon.ico` (16, 32 and 48), `apple-touch-icon.png` (180) and `site.webmanifest`, with 192, 512 and maskable 512 icons in `assets/img/`, all made from the Stux.Music icon. The same four tags are in every page's `<head>`
- `tests/site.sh`, which checks that every Discord embed is valid JSON under 3,000 bytes, that the 404 page has none, that the favicon files have the right sizes, and that every `<head>` has the favicon tags

### Changed

- The favicon is now served from this site instead of following the browser's light or dark theme from the media host, so it is the same everywhere (browser tab, home screen, bookmarks)

## v26.10.23

### Added

- `tests/version.sh`, which checks that `VERSION.md` is a valid Date Version, a real calendar date not in the future, and the same as the newest entry in this changelog

### Changed

- Switched from Semantic Versioning to [Date Versioning](https://datevers.ing): releases are numbered by their UTC release date as `YY.MM.DD`, with `-1`, `-2`… for later releases the same day. This release follows v1.0.8
- `commit.sh` and `commit.bat` refuse a `VERSION.md` that isn't a valid Date Version or is dated in the future (UTC), and warn when it's dated before today
- `README.md` and `CONTRIBUTING.md` describe Date Versioning and the release steps

## v1.0.8

### Changed

- The favicon follows the browser's light or dark theme: the deep icon (`icon-dark.png`) on light and the bright one (`icon-light.png`) on dark, straight from the brand's media host, so a brand colour change is just a new file there
- The logos and icons in the Markdown docs (README and the like) follow GitHub's light or dark theme, using each brand's `logo-light`/`logo-dark` and `icon-light`/`icon-dark` files

## v1.0.7

### Changed

- README footer now matches the Stux.Music `.github` footer ("Built & Maintained by Stux.Music…" and "Stux.Music is a part of the Stux.Group brand of businesses"), like every other Stux.Music repository

## v1.0.6

### Changed

- The footer's copyright year is worked out automatically: the start year alone in the first year, then START–CURRENT

## v1.0.5

### Changed

- The copyright line reads Stux.Group instead of Stux Group Ltd

## v1.0.4

### Added
- `.gitignore` for OS/editor cruft, local `.env` overrides, and `node_modules/`

### Changed
- Changelog badges now use the fixed shared palette — Added green, Changed blue, Fixed orange, Removed red, Security purple, Deprecated grey — as tinted pills, with darker variants in light mode
- `###` sections within each release are sorted into that same fixed order (Added, Changed, Fixed, Removed, Security, Deprecated) at render time, whatever order `CHANGELOG.md` lists them in; unknown types go last

## v1.0.3

### Fixed
- The footer's changelog/version link (and other footer links) turned accent-purple once visited — `a:visited` carries a pseudo-class, giving it higher CSS specificity than the plain `footer a` selector meant to keep footer links muted, so it kept winning regardless of source order. Every affected footer link now also styles `footer a:visited` explicitly.

## v1.0.2

### Fixed
- GitHub Pages was never actually enabled for this repo — `CNAME` already pointed `artistpage.stux.music` at GitHub's Pages IPs, so the domain resolved but served nothing real (no HTTP, and a TLS certificate mismatch over HTTPS). Enabled Pages using Actions-based deployment (`.github/workflows/pages.yml`), matching every other page repo in the org, and re-set the custom domain.

## v1.0.1

### Added
- GitHub Actions CI (`.github/workflows/ci.yml`): validates `index.html` and lints all Markdown on every push and pull request against `main`. Added `.markdownlint.json` (matching this org's established doc style — centered `<img>` logo headers, long changelog lines, repeated `### Fixed`/`### Added`/`### Changed` headings per version entry) and `.htmlvalidate.json` (allowing the inline styles, unquoted button types, etc. already used throughout this page's markup).

## v1.0.0

### Added

- Initial release: a placeholder page shown when a Stux.Music artist hasn't
  set up their page yet, with self-hosted Font Awesome (matching Stux.Music's
  actual design), a "Boring Legal Stuff" legal hub (`legal.html` + `legal/`),
  `changelog.html` that fetches and renders `CHANGELOG.md` at runtime, a
  version indicator fetched live from `VERSION.md`, cross-origin
  `postMessage` title sync, `dev-server.sh` / `dev-server.bat`, and a custom
  `404.html` error page
