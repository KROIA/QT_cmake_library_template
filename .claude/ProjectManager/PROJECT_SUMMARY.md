# Project Summary

## What this is
A **CMake project template** for creating C++ libraries targeting Qt applications. It is a *template repo*, not a single library — downstream projects copy this and use [Cmake Lib Creator](https://github.com/KROIA/CmakeLibCreator) to instantiate a real library from it.

**Source of truth for the version:** `CMakeLists.txt` line 8 — `## Template version: X.Y.Z`. Do not duplicate the version literal in any markdown file; reference this line instead.

## Goals
- Modular, easy-to-integrate library structure.
- Builds both **dynamic** and **static** variants.
- Out-of-the-box integration of profiling (easy_profiler), logging (Logger), and a unit-test harness.
- Auto-replaceable CMake parameters (marked `# <AUTO_REPLACED>`) used by Cmake Lib Creator.

## Languages / toolchain
- **C++23** (`CMAKE_CXX_STANDARD 23`)
- **CMake** ≥ 3.20
- **Qt** (modules configurable, default Core + Widgets; QT6 compatibility branch exists)
- **Visual Studio 2022** primary IDE, Windows-first
- Build entry point: `build.bat` + `CMakePresets.json`

## Repository structure
- `CMakeLists.txt` — top-level template config with `USER_SECTION_START/END` markers and `<AUTO_REPLACED>` tokens
- `cmake/` — utility cmake includes
- `core/` — library skeleton (`inc/`, `src/`, `resources/`)
- `Examples/LibraryExample/` — example app consuming the library
- `unitTests/` — unit-test scaffold (using a separate UnitTest library)
- `dependencies/` — dependency `.cmake` files; the `dependencies` git branch holds a folder of dependency files
- `documentation/` — usage docs (HowToUse, Dependencies, Profiling, Logger, etc.)
- `installation/` — install output target
- `build/` — build output (gitignored)
- `tasks/` — improvement suggestions (gitignored)
- `AI_Knowledge.md` — long-form AI context
- `README.md`, `LICENSE`

## Branch model (special — do not switch without user command)
- `main` — the template
- `dependencies` — folder of dependency files
- `QT6_compatibility`, `qtModules` — variants
- PM **never switches branches** without explicit user instruction.

## Reserved markers / conventions
- `## USER_SECTION_START N` / `## USER_SECTION_END` — user-editable regions in template files; everything outside is overwritten by the library manager.
- `# <AUTO_REPLACED>` — CMake variables overwritten by Cmake Lib Creator. Names of these variables MUST NOT be changed.
- `///` C++ comments are reserved for codegen / `USER_SECTION` markers — all other comments use `//`.

## Required subagent roster
- API documentation
- User usage documentation
- Code review (Opus)
- Dependency / security audit
- Migration
- Performance

(No unit-test agent — manual testing only.)

## What this project is NOT
- Not a runnable application — it is scaffolding.
- Not Linux/macOS-first (works there, but tooling assumes Windows + VS).
