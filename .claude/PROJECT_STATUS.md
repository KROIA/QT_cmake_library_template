# Project Status

**Version:** see `CMakeLists.txt` line 8.
**Branch:** main
**Last updated:** 2026-05-06

## Current state — all 5 tasks PM-tested PASS

| Task | Result |
|---|---|
| TASK-0002 (FetchContent generator) | ✅ Verified clean configure + edit-header regenerate cycle on cmake 4.1.0-rc1 + VS17. |
| TASK-0003 (CMake 4.x policy flag) | ✅ Verified fresh configure on cmake 4.1.0-rc1 succeeds. |
| TASK-0004 (clean targets) | ✅ Verified `help`, `clean`, `clean-deps`, `clean-all`. |
| TASK-0005 (deploy "does not exist") | ✅ Verified after second-pass fix (`$<CONFIG>` in output dirs). Zero spurious lines on full + incremental builds. |
| TASK-0006 (MSYS docs) | ✅ Verified by review (docs only). |

## TASK-0005 final fix — `$<CONFIG>` in output directories

User direction: instead of trying to defensively patch `windeployqt()` (which is also redefined by deps), embed `$<CONFIG>` in the output-directory paths so any code that captures `${CMAKE_RUNTIME_OUTPUT_DIRECTORY}` into an `install(CODE)` block resolves to the real per-config binary directory at install time. CMake 3.14+ evaluates generator expressions inside `install(CODE)`. `FETCHCONTENT_BASE_DIR` was kept config-independent (hard-coded path, not derived from RUNTIME_OUTPUT_DIRECTORY) so dep cache is shared across configs.

## Files changed (uncommitted)
- `CMakeLists.txt` — output dirs now use `$<CONFIG>`; FETCHCONTENT_BASE_DIR decoupled.
- `cmake/utility.cmake` — generator forwarding to FetchContent subbuilds (TASK-0002).
- `cmake/ExampleMaster.cmake` — removed duplicate windeployqt call (TASK-0005 first pass).
- `build.bat` — CMAKE_POLICY_VERSION_MINIMUM flag + clean targets (TASK-0003, 0004).
- `documentation/Dependencies.md`, `CommonProblems.md`, `HowToUse.md`.
- `changelogs/1.7.0.md` — 5 entries (TASK-0005's revised to mention `$<CONFIG>`).
- `.claude/ISSUES.md`, `TASKS.md`, `PROJECT_STATUS.md`.

## Next likely actions
- User confirms or skims; PM marks all 5 tasks `done` and rotates to FINISHED_TASKS.
- Bundled commit. Probably worth a version bump (touches FetchContent and output-layout — incompatible-leaning).
