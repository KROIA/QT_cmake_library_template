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
