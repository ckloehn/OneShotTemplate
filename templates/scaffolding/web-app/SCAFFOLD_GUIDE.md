# Web App Scaffolding Guide

## Overview
This guide tells the DevOps agent how to scaffold a web application based on
the tech stack selected by the Architect agent.

## Common Web App Structures

### Frontend SPA + Backend API
```
src/
├── client/                    # Frontend application
│   ├── public/                # Static assets
│   ├── src/
│   │   ├── components/        # Reusable UI components
│   │   ├── pages/             # Page/route components
│   │   ├── hooks/             # Custom hooks (React) or composables (Vue)
│   │   ├── services/          # API client / data fetching
│   │   ├── store/             # State management
│   │   ├── utils/             # Utility functions
│   │   ├── types/             # Type definitions (if TypeScript)
│   │   └── App.[ext]          # Root component
│   └── [config files]         # vite.config, tsconfig, etc.
├── server/                    # Backend API
│   ├── src/
│   │   ├── routes/            # Route/controller definitions
│   │   ├── services/          # Business logic
│   │   ├── models/            # Data models / ORM entities
│   │   ├── middleware/        # Auth, logging, error handling
│   │   ├── utils/             # Utility functions
│   │   └── index.[ext]        # Entry point
│   └── [config files]
└── shared/                    # Shared types/constants (if monorepo)
```

### Full-Stack Framework (Next.js, Nuxt, SvelteKit, etc.)
```
src/
├── app/ or pages/             # Routes (file-based routing)
│   ├── api/                   # API routes
│   └── [route dirs]           # Page routes
├── components/                # Reusable UI components
├── lib/                       # Shared utilities and logic
│   ├── db/                    # Database client and queries
│   ├── auth/                  # Authentication logic
│   └── utils/                 # Utilities
├── public/                    # Static assets
├── styles/                    # Global styles
└── types/                     # Type definitions
```

### Backend API Only (Express, FastAPI, Django, etc.)
```
src/
├── routes/ or views/          # Route/endpoint definitions
├── services/                  # Business logic layer
├── models/                    # Data models / ORM definitions
├── middleware/                # Request middleware
├── utils/                     # Utility functions
├── config/                    # App configuration
├── migrations/                # Database migrations
└── index.[ext] or main.[ext]  # Entry point
```

## Configuration Files to Generate

### For any JS/TS project
- `package.json` — dependencies, scripts
- `tsconfig.json` — TypeScript config (if using TS)
- `.eslintrc.*` — linter rules
- `.prettierrc` — formatter config
- `.gitignore` — git ignore rules

### For any Python project
- `pyproject.toml` or `setup.py` — project config
- `requirements.txt` or use poetry/pip-tools
- `.flake8` or `ruff.toml` — linter config
- `mypy.ini` — type checker config (if using)
- `.gitignore` — git ignore rules

### Common
- `README.md` — project setup instructions
- `.env.example` — environment variable template (NO real secrets)
- `docker-compose.yml` — local development services (if needed)

## Testing Structure
```
tests/
├── unit/                      # Unit tests (mirror src/ structure)
├── integration/               # Integration tests
├── e2e/                       # End-to-end tests
├── fixtures/                  # Test data and fixtures
└── helpers/                   # Test utilities
```
