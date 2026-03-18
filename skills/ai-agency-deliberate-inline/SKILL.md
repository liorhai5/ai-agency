---
name: ai-agency-deliberate
description: Structured multi-agent deliberation — experts debate, challenge, and converge. Sequential inline mode for IDEs without subagent support.
argument-hint: "@agent1 @agent2 [@agent3 ...] [task description]"
---

# Expert Deliberation (Inline)

## Input

Parse `$ARGUMENTS` as follows:
- Tokens starting with `@` → agent names (strip the `@` prefix). These are filename stems matching the `stem` field in the registry.
- Everything else → task description.
- If fewer than 2 `@` tokens → error: "Deliberation requires at least 2 agents. Use `/ai-agency-consult` for single-agent perspectives."
- If no task text → infer the task from the current conversation context.

## Agent Resolution

1. Read `~/.ai-agency/agents/registry.yaml`.
2. For each `@name`, find the entry where `stem` matches the name.
3. If no match → error: "Agent '@name' not found. Run `/ai-agency-list` to see available agents."
4. Read each matched agent's markdown file from `~/.ai-agency/agents/[file]`.

## Deliberation Protocol (Sequential Inline)

Execute four phases sequentially. Fully adopt each persona when writing their response.

### Phase 1 — Independent Positions

For each agent, adopt their persona and provide their independent position:

```
## Phase 1 — Independent Positions

### [Agent 1 Name] (@stem)
**Position**: [recommendation or stance]
**Reasoning**: [key arguments]
**Risks**: [what could go wrong]
**Trade-offs**: [what you're giving up]

### [Agent 2 Name] (@stem)
[...same structure...]
```

Keep each response to ~500 words. Do not let earlier agents' positions influence later ones — write each independently.

### Phase 2 — Cross-Review

For each agent, adopt their persona and respond to all Phase 1 positions:

```
## Phase 2 — Cross-Review

### [Agent 1 Name] (@stem)
**Agreements**: [which positions they support and why]
**Challenges**: [which positions they disagree with and why]
**Revised Position**: [how their stance changed, if at all]

### [Agent 2 Name] (@stem)
[...same structure...]
```

Keep each response to ~500 words.

### Phase 3 — Convergence (max 2 rounds)

Analyze all cross-reviews. Identify remaining disagreements.

**If all agents have converged** → skip to Phase 4.

**If disagreements remain**, run up to 2 convergence rounds:

```
## Phase 3 — Convergence Round [N]

**Unresolved points**: [list sticking points]

### [Agent 1 Name] (@stem)
[Address only the sticking points. ~300 words.]

### [Agent 2 Name] (@stem)
[...same...]
```

After each round, check for convergence. Proceed to Phase 4 after convergence or 2 rounds.

### Phase 4 — Synthesis

Write the synthesis as the orchestrator (not as any agent):

```
## Deliberation Summary

**Task**: [task description]
**Participants**: [list agents with @stems]

### Shared Recommendation
[What the group converged on.]

### Key Agreements
[Bullet points of shared positions]

### Noted Trade-offs
[Trade-offs identified and accepted]

### Unresolved Disagreements
[Points where experts could not converge. Present both sides fairly. Or "None — full convergence reached."]

### Open Questions
[Questions that need further investigation]
```
