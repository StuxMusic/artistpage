# Changelog

All notable changes to Artist Page are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH).

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
