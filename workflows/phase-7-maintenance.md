# Phase 7: Maintenance

## Purpose
Handle ongoing bug fixes, new feature requests, and refactoring after the initial
MVP is deployed. This phase re-uses the earlier agents and phases.

## Primary Agent
**Orchestrator** (routes to appropriate agent)

## Entry Points

### Bug Fix
```
Input: Bug report (description, reproduction steps, expected vs actual behavior)
```

**Workflow**:
1. **Orchestrator** receives bug report and creates a task
2. **Debugger** investigates root cause
3. **Implementer** writes the fix (or Debugger writes minimal fix)
4. **Tester** writes regression test + runs full suite
5. **Reviewer** reviews fix
6. **DevOps** deploys fix

### New Feature
```
Input: Feature request (description, user story, acceptance criteria)
```

**Workflow**:
1. **Orchestrator** evaluates scope and priority
2. If feature requires architecture changes → **Architect** (Phase 2)
3. If feature fits existing architecture → **Implementer** (Phase 4)
4. Follow the standard Phase 4 cycle: plan → code → test → review
5. **Tester** runs integration tests (Phase 5, focused scope)
6. **DevOps** deploys update

### Refactoring
```
Input: Refactoring request (what to refactor, why, scope)
```

**Workflow**:
1. **Orchestrator** evaluates scope and risk
2. **Architect** designs the refactored structure
3. **Implementer** executes the refactoring
4. **Tester** verifies no regressions (all existing tests must still pass)
5. **Reviewer** reviews the refactored code

### Dependency Update
```
Input: Dependency update request (which dependency, target version)
```

**Workflow**:
1. **DevOps** updates the dependency
2. **Tester** runs full test suite
3. **Reviewer** checks for breaking changes or security issues
4. **DevOps** deploys update

## Maintenance Quality Standards
- All changes follow the same quality gates as initial development
- Every bug fix must include a regression test
- Every new feature must include tests
- Every change must be reviewed before deployment
- Deployment follows the same process as Phase 6

## Maintenance Log
Append to `.cascade/maintenance-log.md`:
```
## [Date] - [Type: Bug Fix | Feature | Refactor | Dependency]
**Description**: [what was changed]
**Root Cause**: [for bugs: why it happened]
**Files Changed**: [list]
**Tests Added/Modified**: [list]
**Reviewed By**: [Reviewer agent]
**Deployed**: [yes/no, date]
```
