# Project Status

**Version:** see `CMakeLists.txt` line 8 (single source of truth — `## Template version: X.Y.Z`).
**Branch:** main
**Last updated:** 2026-05-06

## Current state
- PM harness committed.
- In progress: removal of legacy `CMakeSettings.json` (replaced by `CMakePresets.json`) — staged, awaiting user manual test before commit.

## Next likely actions
- User confirms build via CMakePresets, then PM commits the cleanup + changelog/finished-task entries.
- Optional: run code-review agent to populate `ISSUES.md`.
