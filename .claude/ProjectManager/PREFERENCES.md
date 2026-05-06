# User Preferences

Re-read on every bootstrap. User can change any of these anytime — honor the latest.

## Layout
- Default `.claude/` layout accepted as proposed.

## Changelog
- **Enabled.** Lives in **project root**: `CHANGELOG.md` + `changelogs/` folder.
- One file per released version. Sections: Features / Bugfixes / Deprecations.
- Customer-friendly language preferred for finished-task entries.

## Version source of truth
- **Single source of truth:** `CMakeLists.txt` line 8 — `## Template version: X.Y.Z`.
- Do **NOT** hardcode the version literal in any markdown file (CHANGELOG, PROJECT_STATUS, PROJECT_SUMMARY, FINISHED_TASKS, etc.). Reference the CMakeLists line instead.
- Per-version changelog filenames (`changelogs/X.Y.Z.md`) are derived from that value — these filenames are the only allowed places where the literal appears.
- The pre-commit hook reads this line to detect version bumps.

## Definition of Done gates
- **Manual user code review:** REQUIRED before tasks marked `done`.
- **Manual user testing:** REQUIRED before tasks marked `done` (no automated test suite).
- **Documentation:** required when feature/API changes.
- No unit-test agent. No `UNIT_TEST_TASKS.md`.

## Version control
- Git is in use. PM takes VCS into account.
- **Commit permission:** EXPLICIT-ONLY. PM commits only on direct user command.
- **Push permission:** DENIED. PM never pushes.
- **Branch policy:** SPECIAL — `main` holds the template, `dependencies` branch holds dependency files. PM **never switches branches** unless the user explicitly says so.
- **No automatic feature branches.** Work on the current branch the user is on.
- **Repo artifacts:** `CLAUDE.md` and `.claude/` ARE committed to the repo (remove from `.gitignore`).

## Subagents
- Default roster: api-docs, user-docs, code-review, dependency/security audit, migration, performance.
- No unit-test agent.

## Sprint visualization
- Disabled.

## Tone
- No filler. Concise.
