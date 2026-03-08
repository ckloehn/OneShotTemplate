# Quality Gate: Deployment Phase

## Gate ID: QG-06
## Phase: Deployment → Maintenance

Before declaring the project deployed, ALL of the following must be true:

---

## Checklist

### Build
- [ ] Production build completes successfully
- [ ] Build artifacts are valid and complete
- [ ] No development-only code in production build
- [ ] Environment variables are configured
- [ ] No secrets in version control

### Deployment
- [ ] Application deploys without errors
- [ ] Application starts and responds to requests
- [ ] Health check endpoint works (if applicable)
- [ ] All environment-specific configuration is correct

### Smoke Testing
- [ ] Core user workflow works in deployed environment
- [ ] Authentication works
- [ ] Data persistence works
- [ ] External integrations connect successfully

### Documentation
- [ ] `docs/DEPLOYMENT.md` documents the deployment process
- [ ] `docs/DEPLOYMENT.md` documents the rollback process
- [ ] Environment variables are documented (without values)
- [ ] Setup instructions are complete and accurate
- [ ] README.md is present and useful

### Rollback
- [ ] Rollback procedure is documented
- [ ] Rollback has been tested (or can be executed)
- [ ] Previous version is still available

---

## Approval

### Autonomous Mode
Auto-approve if:
- Build succeeds
- Deployment completes
- Smoke tests pass

### Hybrid / HITL Mode
Present to human:
```
Deployment complete.
- Build: PASS
- Deploy: SUCCESS
- Smoke tests: PASS
- Documentation: COMPLETE

Application is live at: [URL or path]
Proceed to Maintenance phase? (yes/no/feedback)
```
