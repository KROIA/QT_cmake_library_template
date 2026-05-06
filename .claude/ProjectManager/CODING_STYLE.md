# Coding Style

All subagents must follow these rules. The PM enforces them on review.

## C++

- **Standard:** C++23. Use modern features when they make code clearer (concepts, `std::span`, `if constexpr`, ranges) — not for their own sake.
- **Headers:** `.h` for public, `.cpp` for impl. Keep public headers minimal; do not leak internal `USER_SPECIFIC_DEFINES` into them.
- **Naming:**
  - Types: `PascalCase`
  - Functions / methods / variables: `camelCase`
  - Macros / preprocessor defines: `UPPER_SNAKE_CASE`
  - Members: no Hungarian; prefer `m_` prefix only if the existing file already uses it (match local style first).
- **Includes:** project headers in `""`, system/Qt in `<>`. Group: own header → project → Qt → std → third-party.
- **Qt:** prefer Qt containers/strings only at Qt boundaries; std elsewhere unless the file is already Qt-flavored.
- **No exceptions in hot paths** unless the surrounding file already uses them. Match local style.

## Comments — strict

- **Default to no comments.** Names should explain *what*. Comments explain *why* when non-obvious.
- **`//`** — all normal comments.
- **`///`** — RESERVED. Only use `///` for `USER_SECTION` markers and codegen-related markers. Never for documentation or normal comments. (See memory: feedback_comment_style.)
- No multi-paragraph block comments. One short line max for any inline note.
- Do not write comments that reference the current task ("added for X", "fixes #123") — that belongs in commit messages / changelog.

## CMake

- Respect `## USER_SECTION_START N` / `## USER_SECTION_END` markers. All edits inside user sections only, unless the user explicitly authorizes touching auto-replaced regions.
- **Never rename** any variable marked `# <AUTO_REPLACED>` — Cmake Lib Creator depends on the exact names.
- Prefer `set_if_not_defined` (already provided in `cmake/utility.cmake`) over raw `set` for overridable defaults.

## File hygiene

- No trailing whitespace.
- LF or CRLF — match the existing file (Windows project; most files are CRLF).
- UTF-8. Watch out for umlauts in `build.bat` (recent commit `a66e87f` fixed encoding there).

## Secrets

- Never write to `.env`, `credentials.*`, `*.key`, `*.pem`, `*.pfx`, token/secret files.
- Never embed API keys, passwords, or tokens in source. PM emits a loud warning if detected.

## Commit messages (PM only)

- `+` feature
- `~` change
- `-` deletion
- Short. Detail goes into the changelog.
