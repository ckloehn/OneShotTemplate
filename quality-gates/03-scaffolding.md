# Quality Gate: Scaffolding Phase

## Gate ID: QG-03
## Phase: Scaffolding → Implementation

Before proceeding to the Implementation phase, ALL of the following must be true:

---

## Checklist

### Project Structure
- [ ] Directory structure matches tech spec layout
- [ ] All necessary configuration files are present
- [ ] .gitignore is configured for the tech stack

### Build System
- [ ] Project builds successfully with zero errors
- [ ] Build command is documented
- [ ] Dev server / watch mode works (if applicable)

### Dependencies
- [ ] All required dependencies are installed
- [ ] Dev dependencies (test, lint, format) are installed
- [ ] Dependency versions are locked
- [ ] No known critical vulnerabilities in dependencies

### Tooling
- [ ] Linter is configured and runs clean
- [ ] Formatter is configured and runs
- [ ] Test runner is configured and executes (even with zero tests)
- [ ] Development setup steps are documented

### Verification
- [ ] `npm test` / `pytest` / equivalent runs successfully
- [ ] `npm run build` / equivalent produces output
- [ ] `npm run lint` / equivalent passes
- [ ] A "hello world" or smoke test proves the stack works end-to-end

---

## Approval

### Autonomous Mode
Auto-approve if build, test runner, and linter all pass.

### Hybrid / HITL Mode
Present to human:
```
Scaffolding complete.
- Build: PASS
- Test runner: CONFIGURED
- Linter: PASS
- Directory structure created per tech spec

Proceed to Implementation phase? (yes/no/feedback)
```
