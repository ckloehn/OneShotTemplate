# Phase 4: Implementation (Local LLM Optimized)

## Purpose
Build features one at a time. Each feature = one LLM session per step.

## Session Breakdown

Each feature requires 3-4 separate LLM sessions:

```
Session 1: Implementer   → writes code for ONE feature
Session 2: Tester        → writes tests for that feature
Session 3: Reviewer      → reviews code + tests
Session 4: Implementer   → fixes review findings (if any)
```

## Per-Feature Session Instructions

### Session 1: Implement Feature

**Load into LLM context:**
1. `agents/02-implementer.md` (system prompt)
2. `.cascade/handoffs.md` (find the task)
3. `docs/TECH_SPEC.md` (relevant sections only — trim to save context)
4. Existing source files that will be modified (max 3 files)

**Prompt:**
```
You are the Implementer agent. Read agents/02-implementer.md for your instructions.
Your task is in .cascade/handoffs.md. Implement the feature described there.
```

**After session:** Check that the LLM wrote source files and updated handoffs.md.

---

### Session 2: Write Tests

**Load into LLM context:**
1. `agents/03-tester.md` (system prompt)
2. `.cascade/handoffs.md` (find the implementer's output)
3. The source files that were just created/modified
4. `docs/PRD.md` (only the relevant user story)

**Prompt:**
```
You are the Tester agent. Read agents/03-tester.md for your instructions.
Write tests for the feature described in .cascade/handoffs.md.
```

**After session:** Run the tests yourself. Verify they pass.

---

### Session 3: Review

**Load into LLM context:**
1. `agents/04-reviewer.md` (system prompt)
2. The source files that were created/modified
3. The test files that were created
4. `docs/TECH_SPEC.md` (relevant sections only)

**Prompt:**
```
You are the Reviewer agent. Read agents/04-reviewer.md for your instructions.
Review the files listed in .cascade/handoffs.md.
```

**After session:** Read the review. If APPROVED, move to next feature. If not, do Session 4.

---

### Session 4: Fix Findings (only if review had critical/important findings)

**Load into LLM context:**
1. `agents/02-implementer.md` (system prompt)
2. The review from `.cascade/reviews/[feature-name].md`
3. The source files that need fixing

**Prompt:**
```
You are the Implementer agent. Fix the findings in the code review.
The review is in .cascade/reviews/[feature-name].md.
Fix ONLY the critical and important findings. Do not change anything else.
```

**After session:** Re-run tests. If passing and findings addressed, move to next feature.

---

## Feature Queue

Process features from `.cascade/discovery-output.md` in this order:
1. All P0 features (MVP must-haves)
2. All P1 features (important)
3. P2 features (nice-to-have, skip if time-constrained)

## Context Budget Guide

For an 8K context window, budget roughly:
- Agent definition: ~800 tokens
- Handoff context: ~200 tokens
- Tech spec section: ~1000 tokens
- Source files: ~4000 tokens (2-3 files)
- Output space: ~2000 tokens

For a 32K context window:
- Agent definition: ~800 tokens
- Handoff + full tech spec: ~3000 tokens
- Source files: ~15000 tokens (5-8 files)
- Output space: ~13000 tokens

## Quality Gate
See `quality-gates/04-implementation.md`

## When All Features Are Done
Update `.cascade/state.md` to `IMPLEMENTATION_DONE`.
Run the Orchestrator to write the handoff for Integration phase.
