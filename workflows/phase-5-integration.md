# Phase 5: Integration

## Purpose
Verify the complete system works as a whole. Test cross-feature interactions, perform
security audit, check performance, and validate against PRD requirements.

## Primary Agents
- **Tester** — E2E testing, performance testing
- **Reviewer** — Security audit, PRD compliance

## Inputs
- All implemented features in `src/`
- All tests in `tests/`
- `docs/PRD.md` — for requirement validation
- `docs/TECH_SPEC.md` — for architecture validation

## Process

### Step 1: End-to-End Testing (Tester)
1. Identify all critical user workflows from the PRD
2. Write E2E tests that exercise the complete flow:
   - User action → API call → business logic → database → response → UI update
3. Test cross-feature interactions:
   - Feature A's output is Feature B's input
   - Shared state between features
4. Run E2E suite and report results

### Step 2: Performance Testing (Tester)
1. Identify performance-sensitive operations (from PRD NFRs)
2. Measure response times for key operations
3. Check for memory leaks (long-running operations)
4. Check for N+1 query problems
5. Validate against performance targets

### Step 3: Security Audit (Reviewer)
1. Run through OWASP Top 10 checklist
2. Check authentication flows
3. Check authorization enforcement
4. Verify input validation at all boundaries
5. Check for exposed secrets or sensitive data
6. Review dependency vulnerabilities

### Step 4: PRD Compliance Review (Reviewer)
1. Walk through every P0 user story
2. Verify each acceptance criterion is met
3. Check non-functional requirements
4. Note any gaps or deviations

### Step 5: Integration Report
Write comprehensive report to `.cascade/integration-report.md`:
```markdown
# Integration Report

## E2E Test Results
- Total scenarios: [N]
- Passed: [N]
- Failed: [N]
- Skipped: [N]

## Performance Results
| Operation | Target | Actual | Status |
|-----------|--------|--------|--------|

## Security Findings
| Finding | Severity | Status |
|---------|----------|--------|

## PRD Compliance
| User Story | Status | Notes |
|------------|--------|-------|

## Known Issues
| Issue | Severity | Workaround |
|-------|----------|------------|

## Recommendation
[READY FOR DEPLOYMENT | NEEDS FIXES | BLOCKED]
```

## Quality Gate
See `quality-gates/05-integration.md`

## Transition
→ If READY, hand off to **DevOps Agent** for Deployment
→ If NEEDS FIXES, route back to **Implementer** for specific fixes
