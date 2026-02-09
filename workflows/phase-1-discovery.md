# Phase 1: Discovery

## Purpose
Extract, validate, and prioritize all requirements from the PRD. Identify ambiguities,
risks, and assumptions before any technical decisions are made.

## Primary Agent
**Orchestrator** (acts as Discovery analyst in this phase)

## Inputs
- `docs/PRD.md` — Product Requirements Document
- `config/project.yaml` — Project configuration

## Process

### Step 1: PRD Validation
Read the PRD and check for completeness:
- Does it have a clear problem statement?
- Are target users defined?
- Are features listed with priorities?
- Are user stories present with acceptance criteria?
- Are non-functional requirements specified?

### Step 2: Requirement Extraction
For each feature/user story, create a structured requirement:
```
REQ-001: [Feature name]
  Priority: P0 | P1 | P2
  Source: PRD Section [X]
  User Story: As a [user], I want [action] so that [benefit]
  Acceptance Criteria:
    - AC1: ...
    - AC2: ...
  Dependencies: [REQ-XXX, ...]
  Risks: [RISK-XXX, ...]
```

### Step 3: Ambiguity Detection
Scan for:
- Vague language ("fast", "easy to use", "intuitive", "etc.")
- Missing details (authentication method? data model?)
- Contradictions between sections
- Unstated assumptions

Create clarifying questions:
```
QUESTION-001: [The question]
  Source: PRD Section [X]
  Impact: [What depends on the answer]
  Suggested Default: [If human doesn't answer, what should we assume]
```

### Step 4: Risk Identification
```
RISK-001: [Risk description]
  Severity: Critical | High | Medium | Low
  Likelihood: High | Medium | Low
  Impact: [What happens if this risk materializes]
  Mitigation: [Proposed mitigation strategy]
```

### Step 5: MVP Scope Definition
- List all P0 features — this is the MVP
- Estimate relative complexity (S/M/L/XL) for each
- Identify the critical path (feature dependencies)
- Flag any P0 feature that might need to be descoped

### Step 6: Output
Write everything to `.cascade/discovery-output.md`

## Quality Gate
See `quality-gates/01-discovery.md`

## Transition
→ Hand off to **Architect Agent** with discovery output and approved scope
