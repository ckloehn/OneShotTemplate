# Multi-Agent AI Development Framework (Local LLM Edition)

A tech-agnostic template and workflow for building software using coordinated AI agents,
**optimized for local LLMs** (Llama, DeepSeek, Mistral, CodeQwen, Phi, etc.).

Supports MVP delivery, feature additions, bug fixes, and maintenance for **any** project
type — web apps, desktop apps, APIs, CLIs, or libraries.

---

## What Makes This Different from the Standard Branch

This branch is specifically optimized for local LLMs with limited context windows:

| Standard Branch | This Branch (Local LLM) |
|----------------|------------------------|
| Narrative agent prompts | Terse, imperative directives |
| Agents read many files | Agents read only listed files |
| Implicit output expectations | Exact output format specifications |
| Multi-step sessions assumed | One agent, one task per session |
| Context carried in model memory | Context carried in `.cascade/` files |
| Autonomous mode works well | Human-in-the-loop recommended |

---

## Quick Start

### 1. Write your PRD
```bash
cp templates/prd/PRD_TEMPLATE.md docs/PRD.md
# Edit docs/PRD.md with your product requirements
```

### 2. Configure the project
Edit `config/project.yaml`:
- Set project name, type, description
- Set `mode: "human-in-the-loop"` (recommended)
- Set `local_llm.context_window` to your model's context size
- Set `local_llm.model_name` to your model

### 3. Follow the Local LLM Guide
Read **[LOCAL_LLM_GUIDE.md](LOCAL_LLM_GUIDE.md)** for step-by-step session instructions,
including exactly what to paste into your LLM for each phase.

---

## How It Works

7 specialized agent roles work through 7 phases. With local LLMs, **you are the
orchestrator** — you run each agent as a separate LLM session and carry context
between sessions using the `.cascade/` directory.

### The Agents

| Agent | File | What It Does |
|-------|------|-------------|
| Orchestrator | `agents/00-orchestrator.md` | Extracts requirements, manages phase transitions |
| Architect | `agents/01-architect.md` | Chooses tech stack, designs system architecture |
| Implementer | `agents/02-implementer.md` | Writes production code for ONE feature per session |
| Tester | `agents/03-tester.md` | Writes tests for ONE feature per session |
| Reviewer | `agents/04-reviewer.md` | Reviews code against security/quality checklists |
| DevOps | `agents/05-devops.md` | Scaffolds project structure, handles deployment |
| Debugger | `agents/06-debugger.md` | Finds root causes and writes minimal fixes |

### The Phases

```
Phase 1: Discovery    → Extract requirements from PRD (1 session)
Phase 2: Architecture → Design system and write tech spec (1 session)
Phase 3: Scaffolding  → Generate project structure (1 session)
Phase 4: Implementation → Build features (3-4 sessions PER FEATURE)
Phase 5: Integration  → E2E testing and security audit (1-2 sessions)
Phase 6: Deployment   → Build, deploy, document (1 session)
Phase 7: Maintenance  → Bug fixes and new features (re-enter at appropriate phase)
```

### Session Flow for Each Feature

```
┌──────────────┐     ┌──────────┐     ┌──────────┐     ┌──────────┐
│ Implementer  │────▶│  Tester  │────▶│ Reviewer │────▶│   Done   │
│ (write code) │     │ (tests)  │     │ (review) │     │ or fix   │
└──────────────┘     └──────────┘     └──────────┘     └──────────┘
       ▲                                    │
       └────────────────────────────────────┘
                  (if changes requested)
```

---

## Project Structure

```
├── CLAUDE.md                          # Framework entry point
├── LOCAL_LLM_GUIDE.md                 # Step-by-step local LLM instructions
├── README.md                          # This file
├── config/
│   └── project.yaml                   # Project config + local LLM settings
├── docs/
│   ├── PRD.md                         # Your Product Requirements Document
│   └── TECH_SPEC.md                   # Technical spec (Architect creates)
├── templates/
│   ├── prd/PRD_TEMPLATE.md
│   ├── specs/TECH_SPEC_TEMPLATE.md
│   └── scaffolding/
│       ├── web-app/SCAFFOLD_GUIDE.md
│       └── desktop-app/SCAFFOLD_GUIDE.md
├── agents/                            # Agent definitions (load ONE per session)
│   ├── 00-orchestrator.md
│   ├── 01-architect.md
│   ├── 02-implementer.md
│   ├── 03-tester.md
│   ├── 04-reviewer.md
│   ├── 05-devops.md
│   └── 06-debugger.md
├── workflows/
│   ├── ORCHESTRATOR.md
│   └── phase-[1-7]-*.md
├── quality-gates/
│   └── [01-06]-*.md
├── scripts/
│   └── start-workflow.sh
├── .cascade/                          # Shared state between LLM sessions
│   ├── state.md
│   ├── decisions.md
│   ├── handoffs.md
│   ├── discovery-output.md
│   ├── implementation-plan.md
│   ├── reviews/                       # Code review outputs
│   └── maintenance-log.md
└── src/                               # Your source code
```

---

## Model Recommendations

| Task | Minimum | Recommended |
|------|---------|-------------|
| Requirements & Architecture | 13B general | 33B+ general |
| Code Implementation | 7B code-specialized | 33B+ code model |
| Testing | 7B code-specialized | 13B+ code model |
| Code Review | 13B general | 33B+ general |

Code-specialized models (DeepSeek Coder, CodeQwen, Codestral) significantly
outperform general models for implementation and testing.

---

## License

See [LICENSE](LICENSE) for details.
