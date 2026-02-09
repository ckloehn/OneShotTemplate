# Quality Gate: Architecture Phase

## Gate ID: QG-02
## Phase: Architecture → Scaffolding

Before proceeding to the Scaffolding phase, ALL of the following must be true:

---

## Checklist

### Tech Stack
- [ ] All tech stack choices are documented with rationale
- [ ] Alternatives were considered and documented
- [ ] Stack is appropriate for the project type and requirements
- [ ] No conflicting technology choices

### System Design
- [ ] Architecture pattern is defined and justified
- [ ] High-level architecture diagram exists
- [ ] Component responsibilities are clearly defined
- [ ] Data flow is documented

### Data Model
- [ ] All entities from the PRD are modeled
- [ ] Relationships between entities are defined
- [ ] Data types and constraints are specified
- [ ] Storage strategy is defined

### API / Interface Design
- [ ] All required endpoints/operations are defined
- [ ] Request/response formats are specified
- [ ] Authentication/authorization approach is documented
- [ ] Error response format is defined

### Security
- [ ] Security approach is defined (auth, authz, encryption)
- [ ] No obvious security gaps in the design
- [ ] Secrets management approach is documented

### Testing Strategy
- [ ] Test levels and tools are defined
- [ ] Coverage targets are set
- [ ] Test data strategy is documented

### Artifacts Produced
- [ ] `docs/TECH_SPEC.md` is complete
- [ ] `config/project.yaml` tech stack fields are filled in
- [ ] `.cascade/decisions.md` is updated with all architecture decisions

---

## Approval

### Autonomous Mode
Auto-approve if all checklist items are satisfied.

### Hybrid / HITL Mode
Present to human:
```
Architecture phase complete.
- Stack: [language] + [framework] + [database]
- Pattern: [architecture pattern]
- [N] design decisions documented

Review tech spec at docs/TECH_SPEC.md
Proceed to Scaffolding phase? (yes/no/feedback)
```
