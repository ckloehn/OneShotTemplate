# Quality Gate: Discovery Phase

## Gate ID: QG-01
## Phase: Discovery → Architecture

Before proceeding to the Architecture phase, ALL of the following must be true:

---

## Checklist

### Requirements Extraction
- [ ] All PRD sections have been parsed and analyzed
- [ ] Every feature has been tagged (REQ-XXX) and prioritized (P0/P1/P2)
- [ ] MVP scope is clearly defined (P0 features only)
- [ ] User stories have acceptance criteria

### Ambiguity Resolution
- [ ] All identified ambiguities have been resolved (or explicitly deferred)
- [ ] Clarifying questions have been asked and answered
- [ ] Assumptions are documented and acknowledged

### Risk Assessment
- [ ] Technical risks identified with severity ratings
- [ ] Mitigation strategies proposed for high-severity risks
- [ ] No unmitigated critical risks remain

### Artifacts Produced
- [ ] `.cascade/discovery-output.md` exists and is complete
- [ ] Feature list with priorities is documented
- [ ] Questions and answers are documented
- [ ] Risks and mitigations are documented

---

## Approval

### Autonomous Mode
Auto-approve if all checklist items are satisfied.

### Hybrid / HITL Mode
Present to human:
```
Discovery phase complete.
- [X] features extracted, [Y] P0 features for MVP
- [Z] risks identified, all mitigated
- [N] assumptions documented

Proceed to Architecture phase? (yes/no/feedback)
```
