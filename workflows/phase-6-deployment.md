# Phase 6: Deployment

## Purpose
Build, package, and deploy the application to its target environment. Verify it works
in the deployed environment. Document the deployment process.

## Primary Agent
**DevOps**

## Inputs
- Tested, integrated codebase in `src/`
- `docs/TECH_SPEC.md` — deployment requirements
- `config/project.yaml` — environment configuration
- `.cascade/integration-report.md` — confirmation of readiness

## Process

### Step 1: Production Build
1. Run production build command
2. Verify build output is clean (no warnings that indicate problems)
3. Verify build artifacts exist and are complete
4. Check bundle size / binary size is reasonable

### Step 2: Environment Setup
1. Ensure all required environment variables are configured
2. Verify database connection (if applicable)
3. Verify external service connections (if applicable)
4. No development-only settings in production config

### Step 3: Deploy
Based on project type:

#### Web App
- Deploy to hosting platform (Vercel, Netlify, AWS, etc.)
- Configure domain/DNS (if applicable)
- Set up SSL/TLS (if applicable)
- Configure CDN (if applicable)

#### Desktop App
- Build installer/package for target platforms
- Code sign the application (if applicable)
- Test installation on clean system
- Prepare distribution (store, direct download, etc.)

#### API / Backend
- Deploy to server/container/serverless
- Run database migrations
- Verify health check endpoint
- Configure monitoring (if applicable)

### Step 4: Smoke Test
In the deployed environment:
1. Application starts and responds
2. Core user workflow works end-to-end
3. Authentication functions correctly
4. Data persistence works
5. External integrations connect

### Step 5: Documentation
Create `docs/DEPLOYMENT.md`:
- Prerequisites
- Build commands
- Deployment steps
- Environment variables reference
- Rollback procedure
- Troubleshooting guide

## Quality Gate
See `quality-gates/06-deployment.md`

## Transition
→ Project enters **Maintenance** phase
