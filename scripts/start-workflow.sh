#!/usr/bin/env bash
# ==============================================================================
# Multi-Agent Workflow Starter
# ==============================================================================
# This script validates the project configuration and provides the correct
# prompt to start the Orchestrator agent. It does NOT run agents directly —
# the agents are AI-powered and are started by copying the generated prompt
# into your AI assistant (Claude Code, Claude, etc.)
# ==============================================================================

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="$PROJECT_ROOT/config/project.yaml"
PRD_FILE="$PROJECT_ROOT/docs/PRD.md"
SPEC_FILE="$PROJECT_ROOT/docs/TECH_SPEC.md"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}  Multi-Agent Development Framework${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check for required files
ERRORS=0

echo -e "${YELLOW}Checking prerequisites...${NC}"
echo ""

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "  ${RED}✗${NC} config/project.yaml not found"
    ERRORS=$((ERRORS + 1))
else
    echo -e "  ${GREEN}✓${NC} config/project.yaml found"
fi

if [ ! -f "$PRD_FILE" ]; then
    echo -e "  ${RED}✗${NC} docs/PRD.md not found"
    echo -e "    ${YELLOW}→ Copy templates/prd/PRD_TEMPLATE.md to docs/PRD.md and fill it out${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "  ${GREEN}✓${NC} docs/PRD.md found"
fi

if [ -f "$SPEC_FILE" ]; then
    echo -e "  ${GREEN}✓${NC} docs/TECH_SPEC.md found (Architect will update it)"
else
    echo -e "  ${YELLOW}○${NC} docs/TECH_SPEC.md not found (Architect will create it)"
fi

echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}Please fix the above errors before starting the workflow.${NC}"
    exit 1
fi

# Determine workflow mode
echo -e "${YELLOW}Select workflow mode:${NC}"
echo "  1) Full MVP Build (start from Discovery)"
echo "  2) Add a Feature (start from Implementation)"
echo "  3) Fix a Bug (start from Maintenance)"
echo ""
read -rp "Choice [1/2/3]: " CHOICE

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Copy the prompt below into your AI    ${NC}"
echo -e "${GREEN}  assistant to start the workflow:       ${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

case "$CHOICE" in
    1)
        cat <<'PROMPT'
You are the Orchestrator Agent for a multi-agent development framework.

Read the following files to understand the project:
1. CLAUDE.md — Framework overview and rules
2. config/project.yaml — Project configuration and mode
3. docs/PRD.md — Product Requirements Document
4. agents/00-orchestrator.md — Your role definition
5. workflows/ORCHESTRATOR.md — Workflow engine documentation

Begin Phase 1: Discovery.
Follow the process in workflows/phase-1-discovery.md.
Respect the configured mode in config/project.yaml.
Log all decisions to .cascade/decisions.md.
Update .cascade/state.md with current progress.
PROMPT
        ;;
    2)
        read -rp "Describe the feature: " FEATURE_DESC
        echo ""
        cat <<PROMPT
You are the Orchestrator Agent for a multi-agent development framework.

Read the following files to understand the project:
1. CLAUDE.md — Framework overview and rules
2. config/project.yaml — Project configuration and mode
3. docs/TECH_SPEC.md — Technical specification
4. agents/00-orchestrator.md — Your role definition
5. workflows/ORCHESTRATOR.md — Workflow engine documentation

New feature request: $FEATURE_DESC

Begin Phase 4: Implementation for this feature.
Follow the process in workflows/phase-4-implementation.md.
Respect the configured mode in config/project.yaml.
PROMPT
        ;;
    3)
        read -rp "Describe the bug: " BUG_DESC
        echo ""
        cat <<PROMPT
You are the Orchestrator Agent for a multi-agent development framework.

Read the following files to understand the project:
1. CLAUDE.md — Framework overview and rules
2. config/project.yaml — Project configuration and mode
3. docs/TECH_SPEC.md — Technical specification
4. agents/00-orchestrator.md — Your role definition
5. agents/06-debugger.md — Debugger agent role
6. workflows/phase-7-maintenance.md — Maintenance workflow

Bug report: $BUG_DESC

Begin Phase 7: Maintenance — Bug Fix workflow.
Follow the process in workflows/phase-7-maintenance.md.
PROMPT
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo -e "${BLUE}========================================${NC}"
