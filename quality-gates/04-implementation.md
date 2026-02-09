# Quality Gate: Implementation Phase (Per Feature)

## Gate ID: QG-04
## Phase: Implementation (iterates per feature)

Before marking a feature as complete, ALL of the following must be true:

---

## Checklist

### Code Quality
- [ ] Implementation matches the tech spec design
- [ ] Code follows project conventions and patterns
- [ ] No hardcoded secrets or credentials
- [ ] No commented-out code or debug statements
- [ ] Functions are focused and reasonably sized
- [ ] Error handling is appropriate (not excessive, not missing)

### Testing
- [ ] Unit tests exist for all new functions/methods
- [ ] Tests cover happy path, edge cases, and error scenarios
- [ ] All tests pass
- [ ] Test coverage meets threshold (from config: min_coverage)
- [ ] No existing tests broken by new code

### Review
- [ ] Code has been reviewed by the Reviewer agent
- [ ] All critical and important findings have been addressed
- [ ] No open security issues

### Integration
- [ ] Feature works correctly when run in the full application
- [ ] No regressions in existing features
- [ ] Build still passes

---

## Feature Completion Summary
```
Feature: [name]
User Story: [reference]
Files Changed: [count]
Tests Added: [count]
Test Coverage: [percentage]
Review Status: [APPROVED / CHANGES_REQUESTED]
```

---

## Phase Completion (All Features Done)

Before transitioning to Integration phase:
- [ ] All P0 features are implemented and reviewed
- [ ] All P1 features are implemented and reviewed (if time allows)
- [ ] Full test suite passes
- [ ] Build succeeds
- [ ] No open critical review findings

### Approval

#### Autonomous Mode
Auto-approve if all features pass individual quality gates and full suite passes.

#### Hybrid / HITL Mode
Present to human:
```
Implementation phase complete.
- [X/Y] features implemented
- [Z] tests, [C]% coverage
- All reviews approved

Proceed to Integration phase? (yes/no/feedback)
```
