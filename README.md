# ai-agency

An on-demand expert consultation system for AI coding assistants.

You curate expert personas here. Running `init.sh` deploys them to `~/.ai-agency/` and installs skills into your IDE. Agents activate only when you explicitly invoke them — never auto-delegated.

## Quick Start

```bash
# Clone the repo
git clone <repo-url> ~/Projects/ai-agency
cd ~/Projects/ai-agency

# Deploy to all supported IDEs at once
./init.sh --ide all

# Or deploy to a specific IDE
./init.sh --ide claude   # deploys skills to ~/.claude/skills/
./init.sh --ide cursor   # deploys skills to ~/.cursor/skills/
./init.sh --ide codex    # deploys skills to ~/.agents/skills/
```

After init, use `/ai-agency-list` to browse agents or `/ai-agency-consult @agent-name` to get expert perspectives.

## How It Works

1. **Agent files** live in `agents/` — YAML frontmatter + markdown body defining an expert persona.
2. **`init.sh`** copies agents to `~/.ai-agency/agents/`, generates a registry, and deploys skills.
3. **Skills** read the registry and agent files on demand when you invoke them.
4. Agents are **never** deployed to `~/.claude/agents/` — this prevents auto-delegation.

## Skills (Slash Commands)

| Skill | Command | Purpose |
|-------|---------|---------|
| `ai-agency-list` | `/ai-agency-list [category]` | Browse available agents by category |
| `ai-agency-consult` | `/ai-agency-consult @agent [...] task` | Get expert perspectives (single=inline, multi=parallel subagents) |
| `ai-agency-deliberate` | `/ai-agency-deliberate @a1 @a2 [...] task` | Structured 4-phase deliberation toward consensus |

### Consult vs. Deliberate

- **Consult** = parallel, independent opinions → you decide
- **Deliberate** = iterative 4-phase protocol → experts converge on a recommendation

Deliberation phases: Independent Positions → Cross-Review → Convergence (max 2 rounds) → Synthesis

### `@` Syntax

Agent names use the full filename stem:

```
/ai-agency-consult @engineering-security-engineer @design-ux-architect review the auth flow
/ai-agency-deliberate @engineering-software-architect @engineering-backend-architect how should we structure the new API?
```

If you mistype a name, the skill suggests close matches ("Did you mean?"). Run `/ai-agency-list` to see all available `@` names — you can also pass a substring to filter (e.g., `/ai-agency-list architect`).

## Agent Library

Agents are curated from [msitarzewski/agency-agents](https://github.com/msitarzewski/agency-agents) and custom additions. Current inventory:

| Category | Agents |
|----------|--------|
| engineering | Software Architect, Backend Architect, Frontend Developer, Senior Developer, Code Reviewer, Security Engineer, DevOps Automator, SRE, Technical Writer, AI Engineer |
| game-development | Game Designer, Level Designer, Narrative Designer |
| product | Product Manager, Sprint Prioritizer, Feedback Synthesizer |
| design | UX Architect, UX Researcher |
| testing | Accessibility Auditor, API Tester, Reality Checker |
| project-management | Senior Project Manager |
| specialized | Developer Advocate, Workflow Architect |

### Adding Agents

See [`docs/authoring-guide.md`](docs/authoring-guide.md) for the full agent file structure, frontmatter requirements, and quality checklist.

Quick version:

1. Create a `.md` file in `agents/<category>/` with `name` and `description` frontmatter.
2. Redeploy: `./init.sh --ide claude` (or `--update-registry` to just regenerate the registry).

## Repository Layout

```
ai-agency/
  init.sh                # deploys agents, generates registry, installs skills
  agents/
    engineering/          # 10 engineering agents
    game-development/     # 3 game development agents
    product/              # 3 product agents
    design/               # 2 design agents
    testing/              # 3 testing agents
    project-management/   # 1 PM agent
    specialized/          # 2 specialized agents
  docs/
    authoring-guide.md    # how to create and maintain agent files
  skills/
    ai-agency-list/       # /ai-agency-list
    ai-agency-consult/    # /ai-agency-consult
    ai-agency-deliberate/ # /ai-agency-deliberate
```

## Machine Layout After Init

```
~/.ai-agency/
  agents/
    registry.yaml          # auto-generated agent index (name, description, file, stem)
    engineering/            # deployed agent files
    product/
    design/
    ...

~/.claude/skills/ai-agency-{list,consult,deliberate}/SKILL.md   # Claude Code skills
~/.cursor/skills/ai-agency-{list,consult,deliberate}/SKILL.md   # Cursor skills
~/.agents/skills/ai-agency-{list,consult,deliberate}/SKILL.md   # Codex skills
```

## Init Options

```bash
./init.sh --ide <claude|cursor|codex|all>  # required: target IDE
./init.sh --ide claude --dry-run           # preview without writing
./init.sh --update-registry                # regenerate registry only (no redeploy)
./init.sh --uninstall                      # remove all deployed agents and skills
```

The same skills are deployed to all IDEs. After a full deploy, a summary is printed with agent/category/skill counts. If there are files in the deploy target that aren't in the repo source, they're listed as "untracked agents."

## Independence

ai-agency is a standalone tool with no external dependencies. It works alongside any workflow, pipeline, or methodology — you compose it freely with whatever tools you already use.
