# ai-agency

On-demand expert consultation for AI coding assistants. 19 specialized personas you invoke explicitly — never auto-delegated.

## Install

```bash
# Recommended — installs + symlinks to your agents automatically
npx skills add liorhai5/ai-agency
```

**Manual — canonical location + symlinks**

```bash
git clone https://github.com/liorhai5/ai-agency.git ~/.agents/skills/agency

# Symlink to agents you use
ln -s ~/.agents/skills/agency ~/.claude/skills/agency    # Claude Code
ln -s ~/.agents/skills/agency ~/.codex/skills/agency     # Codex
```

**Manual — direct to a single agent**

```bash
# Claude Code only
git clone https://github.com/liorhai5/ai-agency.git ~/.claude/skills/agency

# Codex only
git clone https://github.com/liorhai5/ai-agency.git ~/.codex/skills/agency
```

After install, use `/agency list` to browse agents or `/agency consult @agent-name task` to get expert perspectives.

## Usage

```
/agency list                                         Browse all agents
/agency find review the auth flow                    Get agent recommendations for a task
/agency consult @planner review this task             Single expert perspective
/agency consult @planner @readiness-advisor task      Parallel perspectives + synthesis
/agency deliberate @software-architect @backend-architect how to structure the API
                                                      Structured 4-phase debate
```

### Consult vs. Deliberate

- **Consult** = independent opinions (single agent inline, multiple agents parallel) → you decide
- **Deliberate** = iterative 4-phase protocol → experts converge on a recommendation

Deliberation phases: Independent Positions → Cross-Review → Convergence (max 2 rounds) → Synthesis

### `@` Syntax

Agent names use the filename stem:

```
/agency consult @security-engineer @readiness-advisor review the auth flow
/agency deliberate @software-architect @backend-architect how should we structure the new API?
```

Run `/agency list` to see all available `@` names. You can pass a filter to narrow results (e.g., `/agency list architect`).

## Agent Library

19 curated expert personas. See [docs/catalog.md](docs/catalog.md) for the full catalog with descriptions and "when to use it" guidance.

| Group | Agents |
|-------|--------|
| engineering | Software Architect, Backend Architect, Frontend Developer, Code Reviewer, Security Engineer, Reliability Engineer, DevOps Automator, Technical Writer, AI Engineer |
| game-development | Game Designer, Level Designer, Narrative Designer |
| product | Product Manager, Product Analyst |
| ux | UX Strategist |
| testing | Accessibility Expert, API Tester |
| cross-cutting | Planner, Readiness Advisor |

### Adding Agents

See [docs/authoring-guide.md](docs/authoring-guide.md) for the agent file structure and quality checklist.

Quick version:

1. Create a `.md` file in `agents/` named `{role}.md` with `name` and `description` frontmatter.
2. Update `docs/catalog.md` with the new agent.
3. If installed via git clone, changes are available immediately (or after `git pull`).

## Repository Layout

```
ai-agency/
  SKILL.md                 # AgentSkills entry point — argument dispatch
  commands/
    list.md                # /agency list — browse catalog
    find.md                # /agency find — task-based agent discovery
    consult.md             # /agency consult — expert perspectives
    deliberate.md          # /agency deliberate — structured debate
  agents/                  # 19 agent persona files (flat, named {role}.md)
  docs/
    catalog.md             # Agent catalog — browse and pick
    authoring-guide.md     # How to create and maintain agent files
```

## Update

```bash
# npx skills
npx skills check          # check for updates
npx skills update         # apply updates

# manual
cd ~/.agents/skills/agency && git pull
```

## Uninstall

```bash
# npx skills
npx skills remove agency

# manual — remove clone and any symlinks
rm -rf ~/.agents/skills/agency
rm -f ~/.claude/skills/agency ~/.codex/skills/agency
```
