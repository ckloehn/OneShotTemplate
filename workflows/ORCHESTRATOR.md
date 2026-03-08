# Orchestrator — Workflow Engine

## Purpose
The Orchestrator is the central coordinator of the multi-agent development framework.
It manages workflow state, routes tasks to agents, enforces quality gates, and handles
the human-in-the-loop approval process.

---

## How to Start

### Option 1: Full MVP Build (Start from Phase 1)
```
Start the Orchestrator. Mode: [autonomous|hybrid|human-in-the-loop].
Project config is in config/project.yaml.
PRD is in docs/PRD.md.
Begin at Phase 1: Discovery.
```

### Option 2: Add a Feature (Start from Phase 4)
```
Start the Orchestrator. Mode: [mode].
Feature request: [describe the feature].
Tech spec is in docs/TECH_SPEC.md.
Begin at Phase 4: Implementation.
```

### Option 3: Fix a Bug (Start from Phase 7)
```
Start the Orchestrator. Mode: [mode].
Bug report: [describe the bug, steps to reproduce].
Begin at Phase 7: Maintenance — Bug Fix workflow.
```

---

## Workflow State Machine

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐
│  1.DISCOVERY │────▶│ 2.ARCHITECTURE│────▶│ 3.SCAFFOLDING│
└─────────────┘     └──────────────┘     └──────────────┘
                                                │
                    ┌──────────────┐            │
                    │ 5.INTEGRATION│◀───────────┘
                    └──────┬───────┘     ┌──────────────┐
                           │             │4.IMPLEMENTATION│
                           │             └───────┬───────┘
                    ┌──────▼───────┐             │
                    │ 6.DEPLOYMENT │             │
                    └──────┬───────┘     ┌───────▼───────┐
                           │             │  (iterates)   │
                    ┌──────▼───────┐     └───────────────┘
                    │7.MAINTENANCE │──── re-enter at Phase 4 or 7
                    └──────────────┘
```

### State Transitions

Each transition between phases follows this protocol:

1. **Current agent** completes its work and writes output artifacts
2. **Quality gate** is evaluated (see `quality-gates/` for checklists)
3. **Mode check**:
   - `autonomous` → proceed immediately
   - `hybrid` → prompt human for approval at phase boundaries
   - `human-in-the-loop` → prompt human at every quality gate
4. **Handoff** is logged in `.cascade/handoffs.md`
5. **Next agent** is activated with relevant context

---

## Phase Details

### Phase 1: Discovery
**Agent**: Orchestrator + Human
**Input**: `docs/PRD.md`, `config/project.yaml`
**Activities**:
- Parse and validate the PRD
- Identify ambiguities and generate clarifying questions
- Extract user stories, features, and acceptance criteria
- Identify technical risks and unknowns
- Prioritize features for MVP scope

**Output**: `.cascade/discovery-output.md`
**Quality Gate**: `quality-gates/01-discovery.md`

---

### Phase 2: Architecture
**Agent**: Architect
**Input**: Discovery output, PRD, project config
**Activities**:
- Select tech stack (if not specified in config)
- Design system architecture
- Define data model
- Design API / component interfaces
- Document key design decisions with rationale
- Identify technical risks and mitigations

**Output**: `docs/TECH_SPEC.md`
**Quality Gate**: `quality-gates/02-architecture.md`

---

### Phase 3: Scaffolding
**Agent**: Architect + DevOps
**Input**: Tech spec, project config
**Activities**:
- Generate project directory structure
- Configure build tools, linters, formatters
- Set up dependency management
- Create initial configuration files
- Set up test framework
- Initialize CI/CD pipeline (if applicable)

**Output**: `src/` directory with scaffolded project
**Quality Gate**: `quality-gates/03-scaffolding.md`

---

### Phase 4: Implementation
**Agent**: Implementer (primary), Tester, Reviewer
**Input**: Tech spec, scaffolded project
**Activities** (iterates per feature):
1. **Plan**: Implementer breaks feature into tasks
2. **Code**: Implementer writes production code
3. **Test**: Tester writes and runs tests
4. **Review**: Reviewer inspects code quality, security, standards
5. **Iterate**: Fix review findings, re-test

**Output**: Working, tested, reviewed feature code
**Quality Gate**: `quality-gates/04-implementation.md` (per feature)

---

### Phase 5: Integration
**Agent**: Tester + Reviewer
**Input**: All implemented features
**Activities**:
- End-to-end testing of complete system
- Performance testing
- Security audit
- Cross-feature integration validation
- UI/UX review against PRD requirements

**Output**: `.cascade/integration-report.md`
**Quality Gate**: `quality-gates/05-integration.md`

---

### Phase 6: Deployment
**Agent**: DevOps
**Input**: Tested, integrated codebase
**Activities**:
- Final build and packaging
- Environment configuration
- Deployment execution
- Smoke testing in target environment
- Documentation of deployment process

**Output**: Deployed application + `docs/DEPLOYMENT.md`
**Quality Gate**: `quality-gates/06-deployment.md`

---

### Phase 7: Maintenance
**Agent**: Orchestrator → routes to appropriate agent
**Input**: Bug report or feature request
**Activities**:
- **Bug Fix**: Debugger → Implementer → Tester → Reviewer
- **New Feature**: Re-enter Phase 4 (Implementation)
- **Refactor**: Architect → Implementer → Tester → Reviewer

**Output**: Updated codebase
**Quality Gate**: Same as Phase 4

---

## Task Routing Logic

The Orchestrator routes tasks based on type:

| Task Type | Primary Agent | Supporting Agents |
|-----------|--------------|-------------------|
| Requirement analysis | Orchestrator | — |
| Architecture decision | Architect | — |
| Code implementation | Implementer | Tester |
| Test creation | Tester | Implementer |
| Code review | Reviewer | — |
| Bug investigation | Debugger | Implementer |
| Build/deploy | DevOps | — |
| Security audit | Reviewer | — |

---

## Context Passing Between Agents

When the Orchestrator hands off to an agent, it provides:

```
## Agent Activation Context
- **Phase**: [current phase]
- **Task**: [specific task description]
- **Input Files**: [list of files to read]
- **Previous Agent Output**: [summary or file reference]
- **Constraints**: [any relevant constraints from config]
- **Mode**: [autonomous|hybrid|human-in-the-loop]
```

Each agent writes its output to a known location and updates `.cascade/handoffs.md`.
