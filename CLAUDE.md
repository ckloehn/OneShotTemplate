# Multi-Agent AI Development Framework (Local LLM Optimized)

## Overview
Tech-agnostic multi-agent framework for AI-assisted software development,
optimized for local LLMs with limited context windows (4K-128K tokens).

## Key Design Principles for Local LLMs
- **One agent per session**: Load only ONE agent definition file per LLM session
- **Minimal context**: Each agent reads only the files it needs, not everything
- **External memory**: `.cascade/` files are the shared memory between sessions
- **Explicit formats**: Every agent has exact input/output file lists and formats
- **One feature per session**: Implementation works on ONE feature at a time

## Quick Start
1. Fill out `docs/PRD.md` (use `templates/prd/PRD_TEMPLATE.md`)
2. Set `config/project.yaml` with project config and mode
3. See `LOCAL_LLM_GUIDE.md` for step-by-step session instructions

## Project Structure
```
├── CLAUDE.md                  # This file
├── LOCAL_LLM_GUIDE.md         # How to run this with local LLMs
├── docs/                      # YOUR project documents (PRD, specs)
├── templates/                 # Templates for PRDs, specs, scaffolding
├── agents/                    # Agent definitions (load ONE per session)
├── workflows/                 # Workflow phase definitions
├── quality-gates/             # Phase transition checklists
├── config/                    # Project configuration
├── scripts/                   # Utility scripts
├── .cascade/                  # Shared state between sessions
│   ├── state.md               # Current phase
│   ├── decisions.md           # Decision log
│   ├── handoffs.md            # What each agent should do next
│   ├── discovery-output.md    # Requirements extraction
│   └── reviews/               # Code review output
└── src/                       # YOUR source code
```

## Agent Roles
| Agent | File | When to Load |
|-------|------|-------------|
| Orchestrator | `agents/00-orchestrator.md` | Start of workflow, between phases |
| Architect | `agents/01-architect.md` | Architecture phase |
| Implementer | `agents/02-implementer.md` | Building a feature |
| Tester | `agents/03-tester.md` | Writing tests for a feature |
| Reviewer | `agents/04-reviewer.md` | Reviewing implemented code |
| DevOps | `agents/05-devops.md` | Scaffolding or deployment |
| Debugger | `agents/06-debugger.md` | Investigating a bug |

## Rules for All Agents
- Read ONLY the files listed in your agent definition
- Write ONLY to the files listed in your agent definition
- Always update `.cascade/handoffs.md` when done
- Always check `.cascade/state.md` for current phase
- Follow the quality gate checklist before marking phase complete
