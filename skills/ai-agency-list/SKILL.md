---
name: ai-agency-list
description: Browse available expert agents by category. Shows names, descriptions, and @-invocation names from the agent registry.
argument-hint: "[category name to filter, or leave empty for all]"
---

# Agent List

## Input

- `$ARGUMENTS` may contain a category name to filter (e.g., `engineering`, `product`).
- If empty, list all agents across all categories.

## Instructions

1. Read the agent registry file at `~/.ai-agency/agents/registry.yaml`.
2. If the file doesn't exist or is empty, tell the user: "No agents found. Run `./init.sh --ide <claude|cursor|codex|all>` from the ai-agency repo to deploy agents."
3. If `$ARGUMENTS` specifies a category, filter to that category only. If the category doesn't exist, list available categories and ask the user to pick one.
4. Display agents in a table grouped by category:

```
## [Category]

| Agent | @-name | Description |
|-------|--------|-------------|
| [name] | @[stem] | [description] |
```

5. After the table, remind the user how to invoke agents:
   - `/ai-agency-consult @agent-name [task description]`
   - `/ai-agency-deliberate @agent1 @agent2 [task description]`
