---
name: agency:list
description: Browse available expert agents. Shows names, descriptions, and @-invocation names from the agent registry.
argument-hint: "[substring to filter, or leave empty for all]"
---

# Agent List

## Input

- `$ARGUMENTS` may contain a substring to filter (e.g., `engineer`, `architect`, `testing`).
- If empty, list all agents.

## Instructions

1. Read the agent registry file at `~/.ai-stack/agency/registry.yaml`.
2. If the file doesn't exist or is empty, tell the user: "No agents found. Run `ais install` to deploy agents."
3. If `$ARGUMENTS` is provided, filter to agents whose `stem`, `name`, or `description` contains the argument (case-insensitive). If no agents match, tell the user and show all agents.
4. Display agents in a table:

```
| Agent | @-name | Description |
|-------|--------|-------------|
| [name] | @[stem] | [description] |
```

5. After the table, remind the user how to invoke agents:
   - `/agency:consult @agent-name [task description]`
   - `/agency:deliberate @agent1 @agent2 [task description]`
