# Tasks

> Execution order: TASK-0002 → TASK-0003 → TASK-0004 → TASK-0005 → TASK-0006.
> All five tasks land in the same release window. Bump template version on rollout (TASK-0002 changes dependency-fetch behavior — incompatible with downstream caches → minor bump).

## Hotfix
_(none)_

## Backlog

## TASK-0002 — Force outer generator on FetchContent subbuilds
- Linked issue: ISSUE-0001
- Owner agent: migration
- Estimate: S
- Priority: high
- Status: review (PM-tested OK — pending user review)
- Stage checklist (DoD):
  - [x] implemented (`cmake/utility.cmake` forwards generator/platform/toolset/make-program as CACHE INTERNAL when top-level)
  - [x] tested (PM ran: clean build with VS17 generator on CMake 4.1.0-rc1 → success; touched `core/inc/LibraryName.h` → re-ran `cmake --build build/Debug --target install` → no `generator mismatch` errors. Reproduced original failure mode would have triggered on the touch — it did not.)
  - [x] documented (`documentation/Dependencies.md`; `changelogs/1.7.0.md`)
  - [ ] reviewed (manual — user verifies)

## TASK-0003 — Default `CMAKE_POLICY_VERSION_MINIMUM=3.5` in `build.bat`
- Linked issue: ISSUE-0002
- Owner agent: migration
- Estimate: XS
- Priority: high
- Status: review (PM-tested OK — pending user review)
- Stage checklist (DoD):
  - [x] implemented (build.bat: quoted flag added; ASCII REM comments only)
  - [x] tested (PM ran on CMake 4.1.0-rc1 → fresh build.bat configure succeeded; no `cmake_minimum_required` policy errors against easy_profiler or any other dep)
  - [x] documented (`documentation/CommonProblems.md` + `changelogs/1.7.0.md`)
  - [ ] reviewed (manual — user verifies)

## TASK-0004 — Add `clean` / `clean-deps` / `clean-all` targets to `build.bat`
- Linked issue: ISSUE-0003
- Owner agent: migration
- Estimate: S
- Priority: medium
- Status: review (PM-tested OK — pending user review)
- Stage checklist (DoD):
  - [x] implemented
  - [x] tested (PM ran `build.bat help`, `clean`, `clean-deps`, `clean-all` — all printed expected output, idempotent on empty state, wiped what was promised, kept what was promised; case-insensitive `if /i` works)
  - [x] documented (`documentation/HowToUse.md` + `changelogs/1.7.0.md`)
  - [ ] reviewed (manual — user verifies)
- Acceptance criteria:
  - `build.bat clean` wipes `build/Debug`, `build/Release`, `installation/` (preserves dep cache).
  - `build.bat clean-deps` wipes `build/dependencies/cache/*-build` and `*-subbuild` (preserves `*-src` downloads).
  - `build.bat clean-all` wipes everything under `build/` and `installation/`.
  - Targets are idempotent and safe to run when nothing exists.
  - Help text (`build.bat help` or top-of-file comment) lists the new targets.
- Stage checklist (DoD):
  - [ ] implemented
  - [ ] tested (manual — user runs each target from a known state)
  - [ ] documented (`documentation/HowToUse.md` + changelog)
  - [ ] reviewed (manual — user verifies)

## TASK-0005 — Fix post-install deploy "does not exist" cosmetic message
- Linked issue: ISSUE-0004
- Owner agent: migration
- Estimate: XS → M (rescoped — required CMakeLists.txt change after first-pass diagnosis)
- Priority: low
- Status: review (PM-tested OK — pending user review)
- Stage checklist (DoD):
  - [x] implemented (two-part fix: ExampleMaster.cmake removed redundant call; CMakeLists.txt now embeds `$<CONFIG>` in CMAKE_{ARCHIVE,LIBRARY,RUNTIME}_OUTPUT_DIRECTORY so any captured value points to a real per-config path at install time)
  - [x] tested (PM ran clean `build.bat`: zero "does not exist" lines in Debug + Release; touched `core/inc/LibraryName.h` and ran incremental `cmake --build` → still zero. FETCHCONTENT_BASE_DIR kept config-independent so deps aren't re-fetched per config.)
  - [x] documented (`changelogs/1.7.0.md` Bugfix entry needs revision to mention $<CONFIG> approach)
  - [ ] reviewed (manual — user verifies)
- What was actually done:
  - First pass (agent): removed the redundant `windeployqt(... CMAKE_RUNTIME_OUTPUT_DIRECTORY)` from `cmake/ExampleMaster.cmake`. This fixes our own caller but doesn't fix template-derived dependencies that redefine `exampleMaster()` with the old code.
  - Second pass (PM, on user direction): edited top-level `CMakeLists.txt` so `CMAKE_RUNTIME_OUTPUT_DIRECTORY` (and ARCHIVE/LIBRARY) is `${CMAKE_SOURCE_DIR}/${RELATIVE_BUILD_FOLDER}/$<CONFIG>`. install(CODE) since CMake 3.14 evaluates `$<CONFIG>` at install time, so any old code that captured this variable into an install command now resolves to the actual per-config binary directory.
  - `FETCHCONTENT_BASE_DIR` decoupled from `CMAKE_RUNTIME_OUTPUT_DIRECTORY` to keep dep cache config-independent.
- Root cause history (kept for context):
  - Template-derived deps (AppSettings, Logger, UnitTest) carry old `cmake/ExampleMaster.cmake` that redefines our `exampleMaster()` function with the broken `windeployqt(... CMAKE_RUNTIME_OUTPUT_DIRECTORY)` call. The path `build/` (no Config subdir) never contained the binary on a multi-config generator. The $<CONFIG> change in CMAKE_RUNTIME_OUTPUT_DIRECTORY makes that broken call resolve to a real path → no spurious message.
- Acceptance criteria:
  - Helper macro driving Qt post-install deploy checks `build/<Config>/<exe>` (or otherwise stops misreporting on success).
  - Successful `build.bat` runs no longer print spurious `... does not exist.` lines.
  - Failure detection still works (deliberate failure still surfaces).
- Stage checklist (DoD):
  - [ ] implemented
  - [ ] tested (manual — user runs build.bat, observes no spurious message; optionally forces a failure to confirm errors still surface)
  - [ ] documented (changelog)
  - [ ] reviewed (manual — user verifies)

## TASK-0006 — README note on Git-Bash MSYS path translation
- Linked issue: ISSUE-0005
- Owner agent: user-docs
- Estimate: XS
- Priority: low
- Status: review (docs-only — pending user readthrough)
- Stage checklist (DoD):
  - [x] implemented (section added under CMake in `documentation/CommonProblems.md`)
  - [x] tested (N/A — docs only; section was reviewed in agent's verbatim quote)
  - [x] documented (this IS the doc change; changelog entry added)
  - [ ] reviewed (manual — user reads and confirms tone/clarity)
- Acceptance criteria:
  - One-paragraph note in `README.md` (or `documentation/CommonProblems.md`) explaining `MSYS_NO_PATHCONV=1` workaround for MSVC slash-flags from Git Bash.
- Stage checklist (DoD):
  - [ ] implemented
  - [ ] tested (manual — N/A; docs only)
  - [ ] documented (this IS the doc change)
  - [ ] reviewed (manual — user verifies)

---

### Task entry template

```
## TASK-NNNN — <title>
- Linked issue: ISSUE-NNNN | none
- Owner agent: <agent-name>
- Estimate: <S | M | L>
- Priority: <critical | high | medium | low>
- Status: pending | in-progress | blocked | review | done
- Acceptance criteria:
  - …
- Stage checklist (DoD):
  - [ ] implemented
  - [ ] tested (manual — user verifies)
  - [ ] documented (N/A if not feature/API change)
  - [ ] reviewed (manual — user verifies)
```
