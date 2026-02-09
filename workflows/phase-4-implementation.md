# Phase 4: Implementation

## Purpose
Build all MVP features iteratively. Each feature goes through a plan → code → test →
review cycle. This phase involves the most agent collaboration.

## Primary Agents
- **Implementer** — writes code
- **Tester** — writes and runs tests
- **Reviewer** — reviews code quality and security

## Inputs
- `docs/TECH_SPEC.md` — Architecture and design
- `docs/PRD.md` — User stories and acceptance criteria
- `.cascade/discovery-output.md` — Prioritized feature list
- Scaffolded project in `src/`

## Process (Per Feature)

### Step 1: Feature Planning (Implementer)
1. Read the user story and acceptance criteria
2. Read relevant sections of the tech spec
3. Break the feature into implementation tasks
4. Identify files to create/modify
5. Identify dependencies on other features
6. Write plan to `.cascade/implementation-plan.md`

### Step 2: Implementation (Implementer)
1. Create/modify files according to the plan
2. Follow the architecture patterns from the tech spec
3. Write clean, maintainable code
4. Add inline documentation where logic is non-obvious
5. Run the build to verify no compile errors

### Step 3: Unit Testing (Tester)
1. Read the implementation and acceptance criteria
2. Write unit tests covering:
   - Happy path (AC met)
   - Edge cases (boundary values, empty inputs)
   - Error cases (invalid input, failure conditions)
3. Run tests and report results
4. Report coverage metrics

### Step 4: Code Review (Reviewer)
1. Review implementation against tech spec
2. Check security (OWASP top 10)
3. Check code quality and maintainability
4. Check test coverage and quality
5. Produce review with findings:
   - **Critical**: Must fix before proceeding
   - **Important**: Should fix
   - **Suggestion**: Nice to have

### Step 5: Iteration (Implementer)
1. Address all critical findings
2. Address important findings
3. Re-run tests
4. Request re-review if critical findings existed

### Step 6: Feature Complete
Mark feature as done when:
- All acceptance criteria met
- All critical/important review findings addressed
- All tests pass
- Coverage meets threshold

## Feature Prioritization
Process features in this order:
1. **P0 features** — MVP must-haves (implement all)
2. **P1 features** — Important (implement if time allows)
3. **P2 features** — Nice-to-have (defer to post-MVP)

## Parallel Implementation
When features are independent (no shared dependencies), multiple features can be
implemented in parallel by separate Implementer instances.

## Quality Gate
See `quality-gates/04-implementation.md`

## Transition
→ After all MVP features complete, hand off to **Tester + Reviewer** for Integration phase
