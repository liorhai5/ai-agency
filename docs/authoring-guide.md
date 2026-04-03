# Agent Authoring Guide

How to create and maintain agent persona files for the ai-agency system.

## File Location

Agents live in `agents/` (flat directory). The category is encoded in the filename prefix.

File naming convention: `<category>-<role>.md` (e.g., `engineering-software-architect.md`).

## Frontmatter (Required)

Every agent file starts with YAML frontmatter:

```yaml
---
name: Human-readable Name
description: One-line summary of the agent's expertise and focus area.
color: indigo          # optional — for UI display
emoji: 🏛️             # optional — for UI display
vibe: Short personality tagline  # optional — sets the tone
---
```

**Required fields:**
- `name` — displayed in the registry and skill output
- `description` — used for agent discovery and matching

## Sections

After the frontmatter, structure the agent markdown with these sections:

### 1. Identity

Opening paragraph establishing who this agent is. Include:
- **Role** — what they specialize in
- **Personality** — how they communicate (e.g., pragmatic, detail-oriented, provocative)
- **Experience** — what shapes their perspective

### 2. Core Mission

What this agent does — their primary responsibilities and focus areas. Use a numbered list of 3-5 key areas.

### 3. Rules

Non-negotiable behavioral constraints. These shape how the agent approaches every task. Keep to 5-7 rules maximum.

### 4. Workflow

Step-by-step process the agent follows when given a task. This gives the LLM a structured approach to adopt.

### 5. Communication Style

How the agent communicates — tone, format preferences, how they structure feedback. This section is optional but recommended for agents with a distinct voice.

## Prerequisites Pattern

Agents may assume specific tools, frameworks, or environments. When an agent is specialized for a particular stack:

1. **Declare assumptions** — state the expected tools/frameworks in the Identity or Rules section (e.g., "You work primarily with Laravel/Livewire projects").

2. **Include a graceful-exit instruction** — add a rule like:

   > If the project doesn't use [assumed tools/frameworks], state that upfront and ask the user how to proceed rather than forcing the stack.

This ensures the agent is helpful even when invoked in an unexpected context, without silently pushing irrelevant technology choices.

## Example Skeleton

```markdown
---
name: Example Agent
description: Brief description of expertise
---

# Example Agent

You are **Example Agent**, a specialist in [domain]. You [personality traits].

## Your Identity
- **Role**: [what you do]
- **Personality**: [how you communicate]
- **Experience**: [what shapes your perspective]

## Core Mission

1. **Area one** — description
2. **Area two** — description
3. **Area three** — description

## Rules

1. **Rule name** — explanation
2. **Rule name** — explanation

## Workflow

1. Step one
2. Step two
3. Step three

## Communication Style

- [How you structure responses]
- [Tone and voice]
```

## Quality Checklist

Before adding an agent:

- [ ] `name` and `description` frontmatter are filled
- [ ] Identity section clearly establishes the persona
- [ ] Rules are specific and actionable (not generic advice)
- [ ] If stack-specific, prerequisites pattern is followed (declare + graceful exit)
- [ ] File is placed in `agents/` (flat)
- [ ] File name follows `<category>-<role>.md` convention
