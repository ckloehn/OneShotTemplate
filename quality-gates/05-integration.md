# Quality Gate: Integration Phase

## Gate ID: QG-05
## Phase: Integration → Deployment

Before proceeding to Deployment, ALL of the following must be true:

---

## Checklist

### End-to-End Testing
- [ ] All critical user workflows pass E2E testing
- [ ] Cross-feature interactions verified
- [ ] Data flow validated end-to-end (input → processing → output → storage)

### Performance
- [ ] Response times are within acceptable limits (per PRD NFRs)
- [ ] No obvious memory leaks
- [ ] No N+1 query problems (if applicable)
- [ ] Application handles expected load

### Security
- [ ] No SQL injection vulnerabilities
- [ ] No XSS vulnerabilities
- [ ] No command injection vulnerabilities
- [ ] Authentication works correctly
- [ ] Authorization enforced correctly
- [ ] Sensitive data properly protected
- [ ] Dependencies scanned for known vulnerabilities

### UI/UX (if applicable)
- [ ] All screens/views match PRD requirements
- [ ] Navigation works as specified
- [ ] Responsive design works across specified platforms/sizes
- [ ] Error states are user-friendly
- [ ] Loading states are present where needed

### Data Integrity
- [ ] Data persistence works correctly
- [ ] Data validation prevents invalid entries
- [ ] Concurrent access handled correctly (if applicable)

### Artifacts Produced
- [ ] `.cascade/integration-report.md` is complete
- [ ] All test results documented
- [ ] Known issues documented with severity

---

## Approval

### Autonomous Mode
Auto-approve if:
- All E2E tests pass
- No critical security findings
- No critical performance issues

### Hybrid / HITL Mode
Present to human:
```
Integration testing complete.
- E2E tests: [PASS/FAIL] ([X] scenarios)
- Performance: [PASS/FAIL]
- Security audit: [PASS/FAIL] ([N] findings)
- Known issues: [list]

Review full report at .cascade/integration-report.md
Proceed to Deployment phase? (yes/no/feedback)
```
