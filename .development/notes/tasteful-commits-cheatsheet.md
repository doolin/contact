# Tasteful Commits Cheat Sheet

Source:
https://gist.github.com/doolin/32d0430388405765e508c150831c4ac8

## Commit workflow

1) Pre-stage checks: run tests and lint.
2) Gather context in parallel:
   - `git diff --staged`
   - `git diff --staged --stat`
   - `git log --oneline -10`
3) Draft commit message and ask for confirmation.
4) Commit with HEREDOC and verify with `git log -1`.

## Summary line rules

- Target 52-57 chars (hard max 72)
- Imperative mood: "Add", "Fix", "Refactor"
- No trailing period
- Be specific about what changed

## Body rules

- Wrap lines around 52-57 chars
- One blank line after summary
- Explain why, not what
- Use bullets when changes span multiple areas

## Templates to prefer

- Bug fix
- New feature/addition
- Refactor/cleanup
- Chore/config/deps
- Docs

## Collaboration footer

End with:
`Co-Authored-By: <model> (<tool>) <email>`
