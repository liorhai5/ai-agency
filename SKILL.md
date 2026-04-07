---
name: agency
description: Expert consultation system — get perspectives from specialized AI personas. Use /agency list to browse, /agency find to get recommendations, /agency consult @name for advice, /agency deliberate @name @name for structured debate.
argument-hint: "list | find task | consult @agent [...] task | deliberate @agent @agent [...] task"
---

# Agency

On-demand expert consultation. 19 specialized AI personas you invoke explicitly — never auto-delegated.

## Dispatch

Parse `$ARGUMENTS` as follows:

- If the first word is `list` → Read `commands/list.md` and follow its instructions.
- If the first word is `find` → Read `commands/find.md` and follow its instructions. The remaining text after `find` is the task description.
- If the first word is `consult` → Read `commands/consult.md` and follow its instructions. The remaining text after `consult` contains `@agent` names and a task description.
- If the first word is `deliberate` → Read `commands/deliberate.md` and follow its instructions. The remaining text after `deliberate` contains `@agent` names and a task description.
- Otherwise → show usage:

```
Usage:
  /agency list                                 — browse all agents
  /agency find [task description]              — get agent recommendations for a task
  /agency consult @agent [@agent ...] task             — get expert perspectives (1+ agents)
  /agency deliberate @agent @agent [@agent ...] task  — structured multi-expert debate (2+ agents)
```

## Conventions

- Agent names use `@` prefix: `@software-architect`, `@planner`, `@readiness-advisor`
- The `@name` is the filename stem — the agent file is at `agents/{name}.md`
- If an `@name` doesn't match a file, suggest close matches from the `agents/` directory
