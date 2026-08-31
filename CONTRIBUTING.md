# Contributing

This repo is a library of expert personas invoked through `/agency`. Most
contributions are a new agent or a sharper existing one.

## Adding an agent

`docs/authoring-guide.md` has the full structure and quality checklist. The
short version:

1. Create `agents/{role}.md`. **The filename stem is the `@` handle** —
   `agents/security-engineer.md` is invoked as `@security-engineer`. Frontmatter
   `name` is the human-readable display name and is allowed to read differently,
   but it must match how `docs/catalog.md` and the README refer to the agent.
2. Add it to `docs/catalog.md` with a description and explicit "when to use it"
   guidance. An agent missing from the catalog is invisible to `/agency list`
   and `/agency find`.
3. If it belongs to a group, add it to the group table in the README.

## What makes a good agent

- **A point of view, not a summary.** A persona that agrees with everything is
  worse than no persona — the value is in disagreeing with the other experts
  during `/agency deliberate`.
- **Scoped.** State what the agent does *not* cover. Overlap between agents
  makes `/agency find` unhelpful.
- **Concrete.** Prefer specific heuristics and failure modes to generic advice.

## Verifying

There is no build step. Before opening a pull request, check by hand that:

- Frontmatter parses, and `name` matches the catalog and README.
- The agent appears in `docs/catalog.md`.
- Group tables in the README still total the number the intro claims.
- `/agency list` shows the agent, and `/agency consult @{handle}` reaches it.

## Pull requests

One agent, or one concern, per pull request. Say what perspective the agent
adds that the existing 19 do not.
