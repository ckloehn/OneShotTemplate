# Multi-Agent AI Development Framework

## Overview
This is a tech-agnostic, multi-agent framework for AI-assisted software development.
It supports full MVP delivery, feature additions, bug fixes, and maintenance — for
web apps, desktop apps, or any software project.

## How to Use This Framework

### 1. Load Your Project Requirements
1. Copy your PRD into `docs/PRD.md` (use `templates/prd/PRD_TEMPLATE.md` as a guide)
2. Copy your technical spec into `docs/TECH_SPEC.md` (use `templates/specs/TECH_SPEC_TEMPLATE.md`)
3. Fill out `config/project.yaml` with your project configuration

### 2. Choose Your Mode
- **Autonomous Mode**: Set `mode: autonomous` in `config/project.yaml` — agents proceed through all phases with minimal human input
- **Human-in-the-Loop Mode**: Set `mode: human-in-the-loop` — agents pause at quality gates and await human approval before proceeding
- **Hybrid Mode**: Set `mode: hybrid` — autonomous within phases, human approval required between phases

### 3. Start the Workflow
Run the orchestrator by following the instructions in `workflows/ORCHESTRATOR.md`.
The orchestrator coordinates all agents through the workflow phases.

## Project Structure
```
├── CLAUDE.md                  # This file — framework entry point
├── docs/                      # YOUR project documents (PRD, specs, decisions)
├── templates/                 # Reusable templates for PRDs, specs, scaffolding
├── agents/                    # Agent role definitions and prompts
├── workflows/                 # Workflow phase definitions and orchestration
├── quality-gates/             # Checklists and approval criteria per phase
├── config/                    # Project and agent configuration
├── scripts/                   # Utility scripts for scaffolding and automation
├── .cascade/                  # Runtime state (agent logs, decisions, handoffs)
└── src/                       # YOUR application source code (created during scaffold)
```

## Agent Roles (Summary)
| Agent | Role | Expertise |
|-------|------|-----------|
| Orchestrator | Coordinates workflow, routes tasks, manages state | Project management, workflow |
| Architect | Designs system architecture and tech stack | System design, patterns, trade-offs |
| Implementer | Writes production code | Full-stack development |
| Tester | Writes and runs tests, validates quality | Testing, QA, edge cases |
| Reviewer | Code review, security audit, standards | Best practices, security |
| DevOps | CI/CD, deployment, infrastructure | Build systems, deployment |
| Debugger | Root cause analysis, bug fixes | Debugging, diagnostics |

## Workflow Phases
1. **Discovery** — Parse PRD, clarify requirements, identify risks
2. **Architecture** — Design system, choose tech stack, define interfaces
3. **Scaffolding** — Generate project structure, configure tooling
4. **Implementation** — Build features iteratively (plan → code → test → review)
5. **Integration** — End-to-end testing, performance, security audit
6. **Deployment** — Build, package, deploy, verify
7. **Maintenance** — Bug fixes, new features (re-enters at appropriate phase)

## Rules for All Agents
- Read `docs/PRD.md` and `docs/TECH_SPEC.md` before starting any work
- Log all decisions in `.cascade/decisions.md`
- Log all handoffs in `.cascade/handoffs.md`
- Follow the quality gate checklist before transitioning between phases
- Never skip tests — every implementation must have corresponding test coverage
- Respect the configured mode (autonomous / human-in-the-loop / hybrid)
