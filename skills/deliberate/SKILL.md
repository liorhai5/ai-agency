---
name: agency:deliberate
description: Structured multi-agent deliberation — experts debate, challenge, and converge on a shared recommendation through a 4-phase protocol.
argument-hint: "@agent1 @agent2 [@agent3 ...] [task description]"
---

# Expert Deliberation

## Input

Parse `$ARGUMENTS` as follows:
- Tokens starting with `@` → agent names (strip the `@` prefix). These are filename stems matching the `stem` field in the registry.
- Everything else → task description.
- If fewer than 2 `@` tokens → error: "Deliberation requires at least 2 agents. Use `/agency:consult` for single-agent perspectives."
- If no task text → infer the task from the current conversation context.

## Agent Resolution

1. Read `~/.ai-stack/agency/registry.yaml`.
2. For each `@name`, find the entry where `stem` matches the name.
3. If no match → search all `stem` values for substring matches of the given name. If matches are found, suggest them: "Agent '@name' not found. Did you mean: @match1, @match2?" If no substring matches either, error: "Agent '@name' not found. Run `/agency:list` to see available agents."
4. Read each matched agent's markdown file from `~/.ai-stack/agents/agency/[file]`.

## Deliberation Protocol

Execute four phases. The skill orchestrates — no facilitator persona.

### Phase 1 — Independent Positions (parallel)

Spawn a parallel subagent for each agent:

```
You are adopting the following expert persona:

---
[Full content of the agent's markdown file]
---

Task: [task description]

Provide your independent expert position on this task. Structure your response as:

**Position**: Your recommendation or stance (2-3 sentences)
**Reasoning**: Key arguments supporting your position (bullet points)
**Risks**: What could go wrong with your approach
**Trade-offs**: What you're consciously giving up

Keep your response concise (~500 words). Do not recite your bio — go straight to your position.
```

### Phase 2 — Cross-Review (parallel)

After Phase 1 completes, spawn a parallel subagent for each agent:

```
You are adopting the following expert persona:

---
[Full content of the agent's markdown file]
---

Task: [task description]

Here are the independent positions from all experts:

[Insert all Phase 1 outputs, labeled by agent name]

Review all positions from your expert perspective. Respond with:

**Agreements**: Which positions or points do you support? Why?
**Challenges**: Which positions or points do you disagree with? What's wrong or missing?
**Revised Position**: Given what you've read, do you revise your original stance? How?

Keep your response concise (~500 words).
```

### Phase 3 — Convergence (max 2 rounds)

After Phase 2, analyze all cross-reviews to identify remaining disagreements.

**If all agents have converged** (no material disagreements remain) → skip to Phase 4.

**If disagreements remain**, run up to 2 convergence rounds. For each round, spawn parallel subagents:

```
You are adopting the following expert persona:

---
[Full content of the agent's markdown file]
---

The group has not yet converged on: [list specific sticking points]

Here are the cross-reviews from the previous round:

[Insert all Phase 2 or previous convergence round outputs]

Focus specifically on the unresolved points above. Can you find common ground? If not, clearly state why your position should prevail and what evidence supports it.

Keep your response concise (~300 words). Focus only on the sticking points.
```

After each round, check for convergence. If agents converge or 2 rounds are exhausted, proceed to Phase 4.

**Failure handling**: If a subagent fails in any phase, skip that agent for the remainder of the deliberation. Note the gap in the synthesis.

### Phase 4 — Synthesis

The orchestrator (you, the skill) writes the final output — not any single agent. Structure:

```
## Deliberation Summary

**Task**: [task description]
**Participants**: [list agents with @stems]

### Shared Recommendation
[What the group converged on. Write this as a clear, actionable recommendation.]

### Key Agreements
[Bullet points of positions all experts agreed on]

### Noted Trade-offs
[Trade-offs the group identified and accepted]

### Unresolved Disagreements
[Any points where experts could not converge after 2 rounds. Present both sides fairly.]

### Open Questions
[Questions that emerged during deliberation that need further investigation]
```

If all agents converged fully, the "Unresolved Disagreements" section can state "None — full convergence reached."
