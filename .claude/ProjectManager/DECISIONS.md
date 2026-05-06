# Architectural Decisions Log

Append-only ADR log. New entries at the bottom. Format:

```
## ADR-NNNN — <title>
Date: YYYY-MM-DD
Status: proposed | accepted | superseded by ADR-XXXX
Context: <why this decision came up>
Decision: <what was decided>
Consequences: <tradeoffs, follow-ups>
```

---

## ADR-0001 — Adopt Project Manager harness
Date: 2026-05-06
Status: accepted
Context: Need consistent planning, delegation, and review across template work. User wants subagent-driven workflow with strict review gates.
Decision: Install `.claude/` PM scaffold per setup spec. PM model = Opus. Manual review + manual testing gates required for DoD.
Consequences: All implementation goes through subagents. PM never commits without explicit user command, never pushes, never switches branches.

---

## ADR-0002 — Single source of truth for project version
Date: 2026-05-06
Status: accepted
Context: Multiple files were starting to carry the version literal (CHANGELOG, PROJECT_STATUS, PROJECT_SUMMARY, FINISHED_TASKS). This drifts. User wants exactly one canonical location.
Decision: `CMakeLists.txt` line 8 (`## Template version: X.Y.Z`) is the only place the version literal lives. All markdown documents reference this line rather than duplicating the value. Per-version changelog filenames (`changelogs/X.Y.Z.md`) are the only filenames allowed to embed the literal.
Consequences: Pre-commit version check reads CMakeLists.txt:8. Markdown files cannot drift. When the user bumps the version on that line, PM detects it and triggers the release workflow per §7 of the original setup spec.
