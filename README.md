# ai-agency

An on-demand expert consultation system for AI coding assistants.

You curate expert personas here. Running `ais install` deploys them to `~/.ai-stack/` and installs skills into your IDE. Agents activate only when you explicitly invoke them — never auto-delegated.

## Quick Start

```bash
# Clone the repo
git clone <repo-url> ~/Projects/ai-agency
cd ~/Projects/ai-agency

# Deploy to all supported IDEs via ai-stack
ais install
```

After install, use `/agency:list` to browse agents or `/agency:consult @agent-name` to get expert perspectives.

## How It Works

1. **Agent files** live in `agents/` — YAML frontmatter + markdown body defining an expert persona.
2. **`ais install`** deploys agents to `~/.ai-stack/agents/agency/`, generates a registry, and installs skills.
3. **Skills** read the registry and agent files on demand when you invoke them.
4. Agents are **never** deployed to `~/.claude/agents/` — this prevents auto-delegation.

## Skills (Slash Commands)

| Skill | Command | Purpose |
|-------|---------|---------|
| `agency:list` | `/agency:list [category]` | Browse available agents by category |
| `agency:consult` | `/agency:consult @agent [...] task` | Get expert perspectives (single=inline, multi=parallel subagents) |
| `agency:deliberate` | `/agency:deliberate @a1 @a2 [...] task` | Structured 4-phase deliberation toward consensus |

### Consult vs. Deliberate

- **Consult** = parallel, independent opinions → you decide
- **Deliberate** = iterative 4-phase protocol → experts converge on a recommendation

Deliberation phases: Independent Positions → Cross-Review → Convergence (max 2 rounds) → Synthesis

### `@` Syntax

Agent names use the filename stem (no category prefix):

```
/agency:consult @security-engineer @readiness-advisor review the auth flow
/agency:deliberate @software-architect @backend-architect how should we structure the new API?
```

If you mistype a name, the skill suggests close matches ("Did you mean?"). Run `/agency:list` to see all available `@` names — you can also pass a substring to filter (e.g., `/agency:list architect`).

## Agent Library

19 curated expert personas. Current inventory:

| Group | Agents |
|-------|--------|
| engineering | Software Architect, Backend Architect, Frontend Developer, Code Reviewer, Security Engineer, Reliability Engineer, DevOps Automator, Technical Writer, AI Engineer |
| game-development | Game Designer, Level Designer, Narrative Designer |
| product | Product Manager, Product Analyst |
| ux | UX Strategist |
| testing | Accessibility Expert, API Tester |
| cross-cutting | Planner, Readiness Advisor |

### Adding Agents

See [`docs/authoring-guide.md`](docs/authoring-guide.md) for the full agent file structure, frontmatter requirements, and quality checklist.

Quick version:

1. Create a `.md` file in `agents/` named `{role}.md` (no category prefix) with `name` and `description` frontmatter.
2. Redeploy: `ais install`

## Repository Layout

```
ai-agency/
  ai-stack.plugin.json   # ai-stack plugin manifest
  agents/                  # 19 agent persona files (flat, named {role}.md)
  scripts/
    post-install.sh       # generates registry after ais install
    pre-uninstall.sh      # removes registry before ais remove
  docs/
    authoring-guide.md    # how to create and maintain agent files
  skills/
    list/                 # /agency:list
    consult/              # /agency:consult
    deliberate/           # /agency:deliberate
```

## Machine Layout After Install

```
~/.ai-stack/
  agency/
    registry.yaml              # auto-generated agent index (name, description, file, stem)
  agents/
    agency/                    # deployed agent files (flat, one file per agent)

~/.claude/skills/agency_{list,consult,deliberate}/SKILL.md   # Claude Code skills
~/.cursor/skills/agency_{list,consult,deliberate}/SKILL.md   # Cursor skills
~/.agents/skills/agency_{list,consult,deliberate}/SKILL.md   # Codex skills
```

## Managed by ai-stack

ai-agency is deployed via [ai-stack](../ai-stack). To install or remove:

```bash
ais install           # deploy all plugins including agency
ais remove agency     # remove agency only
ais list              # show installed plugins and resources
```
