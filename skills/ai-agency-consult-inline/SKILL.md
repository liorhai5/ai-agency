---
name: ai-agency-consult
description: Get expert perspectives from one or more agents on a task. Agents respond sequentially inline (for IDEs without subagent support).
argument-hint: "@agent-name [@agent2 ...] [task description]"
---

# Expert Consultation (Inline)

## Input

Parse `$ARGUMENTS` as follows:
- Tokens starting with `@` → agent names (strip the `@` prefix). These are filename stems matching the `stem` field in the registry.
- Everything else → task description.
- If no `@` tokens found → error: "Specify at least one agent using @name syntax. Run `/ai-agency-list` to see available agents."
- If no task text → infer the task from the current conversation context.

## Agent Resolution

1. Read `~/.ai-agency/agents/registry.yaml`.
2. For each `@name`, find the entry where `stem` matches the name.
3. If no match → error: "Agent '@name' not found. Run `/ai-agency-list` to see available agents."
4. Read each matched agent's markdown file from `~/.ai-agency/agents/[file]`.

## Execution — Single Agent

When exactly one agent is specified:

1. Read the agent's full markdown file content.
2. Adopt the agent's persona. Respond to the task **in character** as this expert.
3. Ground your response in the current conversation context.
4. Keep the response focused on the task — do not recite the agent's bio.

## Execution — Multiple Agents (Sequential Inline)

When two or more agents are specified:

1. Read all agent files.
2. For each agent **in order**, respond from that agent's perspective:

```
## Expert Perspectives

### [Agent 1 Name] (@stem)

[Adopt Agent 1's persona fully. Respond to the task from their perspective. ~500 words.]

### [Agent 2 Name] (@stem)

[Adopt Agent 2's persona fully. Respond to the task from their perspective. ~500 words.]

[...repeat for all agents...]

---

## Shared Insights
[Synthesize themes, agreements, and tensions across all perspectives.]
```

3. When writing each agent's perspective, stay fully in that persona's mindset. Do not blend perspectives until the Shared Insights section.
