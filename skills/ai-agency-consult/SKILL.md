---
name: ai-agency-consult
description: Get expert perspectives from one or more agents on a task. Single agent runs inline with full context; multiple agents run as parallel subagents.
argument-hint: "@agent-name [@agent2 ...] [task description]"
---

# Expert Consultation

## Input

Parse `$ARGUMENTS` as follows:
- Tokens starting with `@` → agent names (strip the `@` prefix). These are filename stems matching the `stem` field in the registry.
- Everything else → task description.
- If no `@` tokens found → error: "Specify at least one agent using @name syntax. Run `/ai-agency-list` to see available agents."
- If no task text → infer the task from the current conversation context.

## Agent Resolution

1. Read `~/.ai-agency/agents/registry.yaml`.
2. For each `@name`, find the entry where `stem` matches the name.
3. If no match → search all `stem` values for substring matches of the given name. If matches are found, suggest them: "Agent '@name' not found. Did you mean: @match1, @match2?" If no substring matches either, error: "Agent '@name' not found. Run `/ai-agency-list` to see available agents."
4. Read the matched agent's markdown file from `~/.ai-agency/agents/[file]`.

## Execution — Single Agent

When exactly one agent is specified:

1. Read the agent's full markdown file content.
2. Adopt the agent's persona as described in the file. Respond to the user's task **in character** as this expert, drawing on the persona's identity, rules, workflow, and communication style.
3. Ground your response in the current conversation context and any files/code the user has been working with.
4. Keep the response focused on the task — do not recite the agent's bio or rules back to the user.

## Execution — Multiple Agents

When two or more agents are specified:

1. For each agent, spawn a **parallel subagent** using the Agent tool with this prompt template:

```
You are adopting the following expert persona:

---
[Full content of the agent's markdown file]
---

Task: [the task description from the user's arguments]

Respond from this expert's perspective. Focus on insights, recommendations, risks, or opportunities specific to your domain expertise. Keep your response concise (~500 words). Do not recite your bio — jump straight into your expert perspective on the task.
```

2. Set `subagent_type` to `general-purpose` for each.
3. After all subagents complete, present results as:

```
## Expert Perspectives

### [Agent 1 Name] (@stem)
[Agent 1's response]

### [Agent 2 Name] (@stem)
[Agent 2's response]

---

## Shared Insights
[Synthesize themes, agreements, and tensions across all perspectives. Highlight where experts agree and where they diverge.]
```
