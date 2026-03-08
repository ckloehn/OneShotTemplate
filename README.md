# Multi-Agent AI Development Framework

A tech-agnostic template and workflow for building software using coordinated AI agents.
Supports MVP delivery, feature additions, bug fixes, and maintenance for **any** project
type — web apps, desktop apps, APIs, CLIs, or libraries.

---

## Quick Start

### 1. Clone this template
```bash
git clone <this-repo> my-project
cd my-project
```

### 2. Write your PRD
```bash
cp templates/prd/PRD_TEMPLATE.md docs/PRD.md
# Edit docs/PRD.md with your product requirements
```

### 3. Configure the project
```bash
# Edit config/project.yaml:
#   - Set project name, type, and description
#   - Choose mode: autonomous | hybrid | human-in-the-loop
#   - Optionally pre-select tech stack (or let the Architect choose)
```

### 4. Start the workflow
```bash
chmod +x scripts/start-workflow.sh
./scripts/start-workflow.sh
```
This generates a prompt you copy into your AI assistant (Claude Code, Claude, etc.)
to start the Orchestrator agent.

---

## How It Works

This framework defines **7 specialized AI agents** that collaborate through **7 workflow
phases** to build your software. A quality gate checklist guards each phase transition.

### The Agents

| Agent | What It Does |
|-------|-------------|
| **Orchestrator** | Central coordinator. Routes tasks, manages state, enforces quality gates, handles human approval. |
| **Architect** | Chooses tech stack, designs system architecture, data models, APIs. Produces the technical specification. |
| **Implementer** | Writes production code. Follows the tech spec, writes clean code, creates unit tests alongside implementation. |
| **Tester** | Writes and runs tests (unit, integration, E2E). Identifies edge cases. Reports coverage metrics. |
| **Reviewer** | Code review and security audit. Checks correctness, OWASP compliance, maintainability, architecture adherence. |
| **DevOps** | Project scaffolding, build configuration, CI/CD pipeline, deployment execution. |
| **Debugger** | Root cause analysis for bugs. Systematic investigation, minimal targeted fixes, regression tests. |

### The Phases

```
Phase 1: Discovery    → Parse PRD, extract requirements, identify risks
Phase 2: Architecture → Choose tech stack, design system, write tech spec
Phase 3: Scaffolding  → Generate project structure, configure tooling
Phase 4: Implementation → Build features (plan → code → test → review loop)
Phase 5: Integration  → E2E testing, performance, security audit
Phase 6: Deployment   → Build, deploy, smoke test, document
Phase 7: Maintenance  → Bug fixes, new features, refactoring
```

### Human-in-the-Loop Modes

| Mode | Behavior |
|------|----------|
| `autonomous` | Agents proceed through all phases without pausing. All decisions logged for review. |
| `hybrid` | Agents work autonomously within each phase, but pause between phases for human approval. |
| `human-in-the-loop` | Agents pause at every quality gate for human review and direction. |

---

## Project Structure

```
├── CLAUDE.md                          # Framework entry point — read this first
├── README.md                          # This file
├── config/
│   └── project.yaml                   # Project configuration (mode, tech stack, etc.)
├── docs/                              # YOUR project documents
│   ├── PRD.md                         # Your Product Requirements Document
│   ├── TECH_SPEC.md                   # Technical spec (Architect creates this)
│   └── DEPLOYMENT.md                  # Deployment docs (DevOps creates this)
├── templates/
│   ├── prd/
│   │   └── PRD_TEMPLATE.md            # PRD template with guided sections
│   ├── specs/
│   │   └── TECH_SPEC_TEMPLATE.md      # Tech spec template
│   └── scaffolding/
│       ├── web-app/SCAFFOLD_GUIDE.md  # Web app structure patterns
│       └── desktop-app/SCAFFOLD_GUIDE.md # Desktop app structure patterns
├── agents/                            # Agent role definitions
│   ├── 00-orchestrator.md
│   ├── 01-architect.md
│   ├── 02-implementer.md
│   ├── 03-tester.md
│   ├── 04-reviewer.md
│   ├── 05-devops.md
│   └── 06-debugger.md
├── workflows/                         # Workflow phase definitions
│   ├── ORCHESTRATOR.md                # Master workflow engine
│   ├── phase-1-discovery.md
│   ├── phase-2-architecture.md
│   ├── phase-3-scaffolding.md
│   ├── phase-4-implementation.md
│   ├── phase-5-integration.md
│   ├── phase-6-deployment.md
│   └── phase-7-maintenance.md
├── quality-gates/                     # Phase transition checklists
│   ├── 01-discovery.md
│   ├── 02-architecture.md
│   ├── 03-scaffolding.md
│   ├── 04-implementation.md
│   ├── 05-integration.md
│   └── 06-deployment.md
├── scripts/
│   └── start-workflow.sh              # Workflow starter script
├── .cascade/                          # Runtime state (agent logs, decisions)
│   ├── state.md                       # Current workflow phase and status
│   ├── decisions.md                   # All decisions with rationale
│   ├── handoffs.md                    # Agent-to-agent transition log
│   └── maintenance-log.md            # Post-deployment change log
└── src/                               # YOUR source code (created during scaffolding)
```

---

## Entering the Workflow at Different Points

### Full MVP (Phase 1)
Start from Discovery when building a new product from a PRD.

### New Feature (Phase 4)
Skip directly to Implementation when adding a feature to an existing codebase.
Requires an existing tech spec.

### Bug Fix (Phase 7)
Enter Maintenance mode with a bug report. The Debugger agent investigates root cause,
then the fix flows through implementation → test → review → deploy.

### Refactoring (Phase 7)
Enter Maintenance mode with a refactoring request. The Architect re-designs, the
Implementer executes, all existing tests must continue to pass.

---

## Customization

### Pre-selecting a Tech Stack
Fill in the `tech_stack` section of `config/project.yaml` to constrain the Architect's
choices. Leave fields blank to let the Architect decide.

### Adjusting Quality Standards
Modify thresholds in `config/project.yaml`:
- `coverage_threshold` — minimum test coverage
- `max_complexity` — maximum cyclomatic complexity
- `require_security_scan` — enable/disable security audit

### Adding Custom Agents
Create a new file in `agents/` following the existing pattern. Update `CLAUDE.md` and
`config/project.yaml` to include the new agent.

### Modifying Workflow
Edit phase files in `workflows/` and corresponding quality gates in `quality-gates/`.

---

## License

See [LICENSE](LICENSE) for details.
