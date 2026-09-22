<p align="center">
  <img src="https://global.media.stux.music/logo.png" height="80" alt="Stux.Music Logo">
</p>

# Contributing to Artist Page

This is a single-file HTML template, open for use and modification per the
[License](README.md#license) section. This document is for anyone working on
the template itself (not a downstream deployment).

## Local setup

There's no build step or dependencies — just clone the repo and run
`./dev-server.sh [port]` (or `dev-server.bat [port]` on Windows), which starts
a local static server pointed at the directory. Then open
`http://127.0.0.1:8000`.

## Project conventions

- Static HTML pages (`index.html`, `legal.html` + `legal/`, `changelog.html`, `404.html`) — no framework, no build step, no backend.
- Keep it lightweight and dependency-free; Font Awesome (solid icons) is self-hosted under `assets/fontawesome/`, matching Stux.Music's actual design system, not pulled from a third-party CDN.
- `changelog.html` fetches and renders `CHANGELOG.md` at runtime — don't hand-duplicate changelog content into it.
- General contact uses `hello@stux.music`; legal-page contact uses `legal@stux.music`.
- This is a single page, not a soonpage/maintenancepage pair — an artist's page either exists or it doesn't; there's no separate "under maintenance" state to design for.
- The brand icon swaps between `icon-dark.png` (light theme) and `icon-light.png` (dark theme) to match the site's per-theme accent color where used — the favicon itself just uses the plain `icon.png`.
- Match the existing code style: no comments explaining *what* the markup does, only *why* when something is genuinely non-obvious.

## Versioning and changelog

- The version lives in `VERSION.md` (a bare version string) — bump it on every release, following [Semantic Versioning](https://semver.org/)
- Every release gets a `CHANGELOG.md` entry using `### Added` / `### Changed` / `### Fixed` subsections
- `commit.sh` (bash) and `commit.bat` (Windows) read `VERSION.md` to commit and tag a release — no need to edit them per release

## Before committing

- Open `index.html` in a browser and check it renders correctly
- Check the page at common viewport widths (mobile/tablet/desktop) since it's meant to be responsive
