# Phase 2: Architecture

## Purpose
Translate product requirements into a concrete technical design. Choose the tech stack,
define the system architecture, design the data model and APIs, and document everything
in the technical specification.

## Primary Agent
**Architect**

## Inputs
- `docs/PRD.md` — Product Requirements Document
- `.cascade/discovery-output.md` — Extracted requirements, risks, scope
- `config/project.yaml` — Project configuration (may have pre-set tech choices)

## Process

### Step 1: Analyze Requirements for Technical Implications
- What type of application? (web, desktop, api, cli)
- Real-time requirements? (WebSockets, SSE)
- Offline support needed?
- Cross-platform?
- Data volume and complexity?
- Authentication complexity?
- Third-party integrations?

### Step 2: Select Tech Stack
For each layer, choose and justify:
1. **Language** — Match to project type and team (if specified)
2. **Framework** — Match to requirements (SSR? SPA? Desktop?)
3. **Database** — Match to data model (relational? document? in-memory?)
4. **UI Framework** — Match to platform and UX requirements
5. **Testing** — Standard for the chosen language/framework
6. **Build Tool** — Standard for the ecosystem
7. **CI/CD** — Match to hosting/deployment strategy

### Step 3: Design Architecture
1. Choose architecture pattern (monolith, modular, etc.)
2. Define component boundaries and responsibilities
3. Design data flow between components
4. Define interfaces/contracts between components
5. Draw architecture diagram

### Step 4: Design Data Model
1. Identify entities from requirements
2. Define attributes and types
3. Define relationships (1:1, 1:N, N:M)
4. Define constraints and validations
5. Plan for data migration/seeding

### Step 5: Design APIs / Interfaces
1. Choose API style (REST, GraphQL, gRPC, etc.)
2. Define endpoints/operations
3. Define request/response schemas
4. Define authentication/authorization
5. Define error handling format

### Step 6: Security Design
1. Authentication mechanism
2. Authorization model
3. Data protection strategy
4. Input validation approach
5. Secrets management

### Step 7: Testing Strategy
1. Test levels and tools
2. Coverage targets
3. Test data approach

### Step 8: Write Tech Spec
Produce `docs/TECH_SPEC.md` following `templates/specs/TECH_SPEC_TEMPLATE.md`

### Step 9: Update Configuration
Fill in any blank fields in `config/project.yaml`

## Quality Gate
See `quality-gates/02-architecture.md`

## Transition
→ Hand off to **DevOps Agent** (scaffolding) and **Architect** (assists scaffolding)
