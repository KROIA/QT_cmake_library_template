# Issues

## Hotfix
_(none)_

## Open

> Source for ISSUE-0001..0005: customer report `tasks/SuggestionForTemplateImprovement.md` (SwOptionEditor maintenance session, 2026-05-01, CMake 4.3.2 + VS17 2022).

## ISSUE-0001 — FetchContent subbuild caches Ninja generator → mismatch on regenerate
- Priority: high
- Description: After a successful initial configure+build, any source/header change triggers an outer regenerate that revisits FetchContent populators. Their subbuild caches under `build/dependencies/cache/<dep>-subbuild/` were configured with `CMAKE_GENERATOR:INTERNAL=Ninja`, while the outer project requests `Visual Studio 17 2022`. CMake then errors `Does not match the generator used previously: Ninja` for every dependency (easy_profiler, Logger, CrashReport, DDD, RibbonWidget, SQLiteWrapper, VariantTable, UnitTest). Recurs on every header edit until the subbuilds are wiped.
- Possible solution: In the FetchContent helper macros (`cmake/utility.cmake` / `cmake/dependencies.cmake`), pass `-G "${CMAKE_GENERATOR}"` (and where applicable `-A "${CMAKE_GENERATOR_PLATFORM}"`, `-T "${CMAKE_GENERATOR_TOOLSET}"`) explicitly to the subbuild populator so subbuilds match the outer project. Subbuilds are fast enough that losing Ninja doesn't matter.
- Linked task: TASK-0002

## ISSUE-0002 — easy_profiler v2.1.0 fails configure under CMake 4.x (policy < 3.5 removed)
- Priority: high
- Description: easy_profiler's pinned tag carries `cmake_minimum_required(VERSION 2.x)`. CMake 4.x has removed compatibility with policies older than 3.5, so initial configure fails with `Compatibility with CMake < 3.5 has been removed from CMake. ...add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.` Blocks any first-time build on a CMake-4 host.
- Possible solution: Pass `"-DCMAKE_POLICY_VERSION_MINIMUM=3.5"` (quoted!) from `build.bat` by default. No-op on older CMake, unblocks 4.x. Alternative: bump easy_profiler to a tag whose own `cmake_minimum_required` is ≥ 3.5. Document the PowerShell quoting trap (`-D...=3.5` unquoted parses as `(3).5`).
- Linked task: TASK-0003

## ISSUE-0003 — `build.bat` lacks clean targets
- Priority: medium
- Description: No quick recovery path from stale build state. Developers fall back to `rm -rf build installation`, which forces a 5–10 minute full re-fetch + reconfigure even when dependency *sources* are intact. Especially painful when ISSUE-0001 strikes.
- Possible solution: Add three batch targets to `build.bat`:
  - `clean` → wipe `build/Debug`, `build/Release`, `installation/` (keep dep cache)
  - `clean-deps` → wipe `build/dependencies/cache/*-build` and `*-subbuild` (keep `*-src` downloads)
  - `clean-all` → everything under `build/` and `installation/`
- Linked task: TASK-0004

## ISSUE-0004 — Post-install deploy prints misleading "does not exist" for executables
- Priority: low
- Description: Successful `--target install` runs end with messages like `"C:\<project>\build\SwOptionEditorTest.exe" does not exist.` for each executable, despite the build returning 0 and the binaries being correctly deployed to `installation/bin/`. The deploy helper checks `${RELATIVE_BUILD_FOLDER}/${exe}` instead of `${RELATIVE_BUILD_FOLDER}/${CMAKE_BUILD_TYPE}/${exe}`. Cosmetic but successful builds *look* like they failed.
- Possible solution: In the helper macro orchestrating Qt post-install deploy, include the configuration subdirectory in the existence check (`build/<Config>/<exe>`), or suppress the message when the deploy itself already succeeded.
- Linked task: TASK-0005

## ISSUE-0005 — README missing Git-Bash / MSYS slash-flag warning
- Priority: low
- Description: When users invoke `cmake -DCMAKE_CXX_FLAGS="/EHsc /MP"` from Git Bash (MSYS), MSYS rewrites `/EHsc` to `C:/Program Files/Git/EHsc`, producing `error C1083: source file not opened: "Files/Git/EHsc"`. `build.bat` itself is unaffected (cmd-only), but manual cmake invocations from Bash are.
- Possible solution: One-paragraph note in template README: *"Windows note: When invoking CMake manually from Git Bash, prefix with `MSYS_NO_PATHCONV=1` or use cmd / PowerShell — MSYS otherwise mangles MSVC slash-flags such as `/EHsc /MP`."*
- Linked task: TASK-0006

---

### Issue entry template

```
## ISSUE-NNNN — <title>
- Priority: critical | high | medium | low
- Description: <what is wrong>
- Possible solution: <approach>
- Linked task: TASK-NNNN | none
```

### Priority rubric
- **critical** — data loss, security vulnerability, production-down
- **high** — blocks release / blocks dependent work
- **medium** — meaningful defect, no blocker
- **low** — polish, nice-to-have
