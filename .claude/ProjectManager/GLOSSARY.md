# Glossary

Domain terms used in this project.

- **Cmake Lib Creator** — external tool ([repo](https://github.com/KROIA/CmakeLibCreator)) that instantiates a real library from this template by replacing `# <AUTO_REPLACED>` variables.
- **`<AUTO_REPLACED>`** — marker comment on CMake variables that Cmake Lib Creator overwrites. Variable names must not be renamed.
- **`USER_SECTION_START N` / `USER_SECTION_END`** — markers around user-editable regions in template files. Code outside is overwritten by the library manager. Sections are numbered (1, 2, ...) and unique per file.
- **`LIB_DEFINE`** — preprocessor define active only when the library itself is being built (e.g. `LIBRARY_NAME_LIB`).
- **`LIB_PROFILE_DEFINE`** — macro toggling easy_profiler instrumentation for the library.
- **`USER_SPECIFIC_DEFINES`** — defines visible only inside the library (not in public headers).
- **`USER_SPECIFIC_GLOBAL_DEFINES`** — defines visible to library + dependencies.
- **easy_profiler** — third-party profiling lib ([yse/easy_profiler](https://github.com/yse/easy_profiler)).
- **Logger** — internal logging dependency (see `dependencies/Logger.cmake`).
- **dependencies branch** — git branch holding shared dependency files; PM never switches to it without user instruction.
