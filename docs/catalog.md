# Agent Catalog

19 expert personas, invoked on demand. Use `/agency:list` to browse, `/agency:consult @name` to get a perspective, `/agency:deliberate @a @b` to run a structured debate.

---

## Engineering

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **Software Architect** | `@software-architect` | Designs the shape of systems — bounded contexts, service boundaries, architectural patterns, and the ADRs that explain why. Thinks in trade-offs, not best practices. | You're deciding whether to split a service, redesign a domain boundary, or choose between microservices and a modular monolith. You need a structured trade-off analysis, not a gut call. |
| **Backend Architect** | `@backend-architect` | Implementation-layer advisor on data access patterns, schema design, API contracts, and service communication. Sits below the system architect — owns the "how to build it" once the "what to build" is decided. | You're designing a data model and need to think through normalization vs. denormalization trade-offs. You're defining an API contract and want to stress-test its versioning strategy. You're deciding between sync and async for a cross-service call. |
| **Frontend Developer** | `@frontend-developer` | Advisor and implementer on modern web frontend — component architecture, performance strategy, accessibility compliance, and framework trade-offs. | You're building or reviewing a React/Vue/Angular component and want a perspective on architecture or performance. You need WCAG compliance strategy. You're choosing between state management approaches. |
| **Code Reviewer** | `@code-reviewer` | Provides constructive, prioritized code reviews focused on correctness, security, maintainability, and performance. Marks issues as blockers, suggestions, or nits. Never style-polices. | You've written code and want a thorough second set of eyes before it ships. You want feedback framed as teaching, not gatekeeping. You need specific, actionable comments — not vague "security issue" notes. |
| **Security Engineer** | `@security-engineer` | Threat modeling, vulnerability assessment, secure code review, and security architecture. Thinks adversarially, delivers concrete remediation, and anchors everything to OWASP/STRIDE. | You're designing an auth system and want threat modeling. You've written API endpoints handling user input and want a security review. You want to know what an attacker would look for in this codebase. |
| **Reliability Engineer** | `@reliability-engineer` | SLO/error budget advisor — defines what "reliable enough" means, builds observability strategy, drives toil reduction, and frames reliability as an engineering problem with a budget, not a heroic effort. | You need to define SLOs for a service. You're building a monitoring/alerting strategy. You're deciding whether to ship a feature or fix a reliability gap. You want to think in error budgets, not in gut feelings about uptime. |
| **DevOps Automator** | `@devops-automator` | CI/CD and infrastructure automation advisor — deployment strategy trade-offs, IaC approach, monitoring philosophy, and pipeline design. Favors blue-green vs. canary vs. rolling based on your actual failure profile, not convention. | You're designing a deployment pipeline and need to choose a strategy. You're setting up IaC and want to think through state management and module boundaries. You want a monitoring philosophy, not just a list of tools. |
| **Technical Writer** | `@technical-writer` | Developer documentation specialist — READMEs, API references, tutorials, and conceptual guides. Applies the Divio system (tutorial/how-to/reference/explanation). Treats a broken code example as a bug. | You're writing a README and want the "5-second test" applied. You're documenting an API and want a structure that actually serves developers. You're setting up a docs pipeline and want opinionated guidance on tooling. |
| **AI Engineer** | `@ai-engineer` | AI/ML production advisor — RAG vs. fine-tuning trade-offs, model selection, production integration patterns, and responsible AI deployment. Defaults to the simplest approach that meets requirements. | You're building a RAG system and want to pressure-test the architecture. You're choosing between fine-tuning and prompt engineering. You need to design for evaluation, drift detection, and bias testing. |

---

## Product

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **Product Manager** | `@product-manager` | Full product lifecycle advisor — discovery, prioritization, PRD authorship, stakeholder alignment, and outcome measurement. Owns the "why" behind every feature and protects team focus like a resource. Includes RICE, MoSCoW, Kano, and value vs. effort frameworks. | You need a problem statement written before the solution discussion. You want your roadmap item stress-tested ("is this actually worth doing?"). You need a PRD structure, a prioritization framework applied, or a go-to-market plan reviewed. |
| **Product Analyst** | `@product-analyst` | Feedback and data interpreter — synthesizes user signals across channels, spots collection bias, and translates qualitative and quantitative inputs into defensible priorities. | You've collected feedback and want to distinguish signal from noise. You want bias in your data collection named before you act on it. You need a framework for turning user requests into a prioritized backlog item with evidence. |

---

## UX

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **UX Strategist** | `@ux-strategist` | Design systems and interaction design advisor — visual language decisions, component architecture trade-offs, and design-engineering handoff. Owns systemic UX decisions, not individual screens or user research. | You're deciding whether to build a design system or when it's premature. You need color token architecture, spacing system strategy, or component naming conventions. You want interaction patterns made consistent across the product. |

---

## Testing & Quality

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **Accessibility Expert** | `@accessibility-expert` | WCAG 2.2 auditor and inclusive design advisor. Tests with real assistive technologies, not just Lighthouse. Catches the 70% of accessibility issues that automated tools miss. | You want a component or flow audited before it ships. You've got a green Lighthouse score and need to know if it's actually accessible. You want a screen reader testing protocol or keyboard navigation audit. |
| **API Tester** | `@api-tester` | API testing strategy advisor — functional coverage, contract testing, security testing (OWASP API Top 10), and quality gates. Focuses on what to test and why, not on writing the test code. | You're designing a testing strategy for a new API surface. You want to pressure-test your coverage thinking ("what are you not testing?"). You need contract testing strategy or a security testing checklist for an API. |

---

## Cross-cutting

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **Planner** | `@planner` | Pre-implementation planning advisor — decomposes work, maps dependencies, surfaces decision gates, and flags scope that will likely expand. Output is always a structured plan, never code. | Before starting any non-trivial task, you want the parts mapped and dependencies explicit. You're unsure whether work can be parallelized. You want open questions surfaced before they become mid-flight blockers. |
| **Readiness Advisor** | `@readiness-advisor` | Evidence-based production readiness skeptic. Default stance is "not ready." Requires specific, concrete proof before endorsing a release or milestone. Specifies exactly what evidence would change the verdict. | You're about to ship and want a rigorous "is this actually ready?" assessment. You want rollback readiness, evidence gaps, and unknown risks named before they become incidents. You want a structured release risk review, not a checklist. |

---

## Game Development

| Agent | @-name | What it does | When to use it |
|-------|--------|--------------|----------------|
| **Game Designer** | `@game-designer` | Gameplay systems and mechanics advisor — GDD authorship, core loop design, economy balancing, and player psychology. Designs from player motivation outward. Every number has a rationale; every mechanic has a documented failure state. | You're designing a new mechanic and want it documented to GDD standard. You need an economy balance spreadsheet structure. You want your core loop stress-tested against player motivation before it goes to production. |
| **Level Designer** | `@level-designer` | Spatial architecture advisor — layout theory, pacing arcs, encounter design, and environmental storytelling. Treats levels as authored experiences where space tells the story without text. | You're designing a level and want the pacing arc reviewed. You need a blockout specification or encounter placement strategy. You want your layout readability assessed — "can a new player navigate without a map?" |
| **Narrative Designer** | `@narrative-designer` | Story systems advisor — branching dialogue, character voice, lore architecture, and narrative-gameplay integration. Game narrative is a designed system, not a screenplay inserted between gameplay. | You're writing dialogue and want it reviewed for character voice consistency. You need a branching structure designed before any lines are written. You want your lore tiered (surface/engaged/deep) so critical path is comprehensible without optional content. |
