# Find Agents

Recommend agents relevant to a task.

## Input

The remaining text after `find` is the task description. If empty, ask the user to describe their task.

## Instructions

1. Read `docs/catalog.md`.
2. Based on the task description, identify which agents are most relevant. Consider:
   - The agent's "What it does" — does their expertise apply to this task?
   - The agent's "When to use it" — does this situation match?
   - Whether multiple agents would provide complementary perspectives
3. Present recommended agents, ordered by relevance:

```
Recommended for this task:
  @agent-name — [brief reason this agent is relevant]
  @agent-name — [brief reason]
  ...

Quick start:
  /agency consult @agent1 @agent2 [task]
```

4. If a deliberation would be valuable (e.g., the task involves trade-offs where experts might disagree), suggest that too:

```
Consider deliberation:
  /agency deliberate @agent1 @agent2 [task]
```

5. Keep recommendations to 2–4 agents. More than that dilutes the value.
