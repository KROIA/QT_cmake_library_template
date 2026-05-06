# Finished Tasks

Tasks completed in the current version. Rotated into the per-version changelog file at release time, then emptied.

Current version: see `CMakeLists.txt` line 8 (single source of truth).

## TASK-0001 — Remove legacy CMakeSettings.json
- Linked issue: none
- Owner agent: PM (trivial deletion)
- Priority: low
- Acceptance: file removed, build still works via CMakePresets.json.
- Stage checklist:
  - [x] implemented
  - [x] tested (user confirmed CMakePresets.json is the active build path)
  - [x] documented (changelog entry)
  - [x] reviewed (user-initiated change)
- Notes: VS legacy CMake integration replaced by CMakePresets.json.
