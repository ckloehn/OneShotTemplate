# Phase 3: Scaffolding

## Purpose
Generate the initial project structure, install dependencies, configure tooling, and
verify that the empty project builds and runs before any features are implemented.

## Primary Agent
**DevOps** (with guidance from **Architect**)

## Inputs
- `docs/TECH_SPEC.md` — Architecture and project structure
- `config/project.yaml` — Tech stack configuration
- `templates/scaffolding/` — Scaffolding guides for project type

## Process

### Step 1: Create Directory Structure
Based on `docs/TECH_SPEC.md` Section 3 (Project Structure):
- Create all directories as specified
- Create placeholder files where needed (index files, etc.)

### Step 2: Initialize Project
Based on the tech stack:
- Initialize package manager (`npm init`, `cargo init`, `poetry init`, etc.)
- Create primary config files (tsconfig.json, pyproject.toml, etc.)
- Create .gitignore for the tech stack

### Step 3: Install Dependencies
- Install production dependencies listed in tech spec
- Install dev dependencies (test runner, linter, formatter)
- Lock dependency versions
- Generate lockfile

### Step 4: Configure Tooling
- Set up linter with project rules
- Set up formatter with project rules
- Set up test runner with project conventions
- Create useful scripts (dev, build, test, lint, format)

### Step 5: Create Entry Points
- Create the main application entry point
- Create a basic "hello world" or health check endpoint
- Ensure the app starts without errors

### Step 6: Create Environment Template
- Create `.env.example` with all required environment variables
- Document each variable's purpose
- NO real secrets, only placeholder values

### Step 7: Verify Everything Works
Run these commands and ensure they all pass:
```
[build command]   → must succeed
[test command]    → must run (even with 0 tests)
[lint command]    → must pass
[dev command]     → must start the app
```

## Quality Gate
See `quality-gates/03-scaffolding.md`

## Transition
→ Hand off to **Implementer Agent** with scaffolded project ready for features
