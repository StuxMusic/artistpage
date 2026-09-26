# Changelog

All notable changes to Artist Page are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH).

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
