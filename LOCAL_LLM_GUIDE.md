# Local LLM Guide

How to use this multi-agent framework with local language models (Llama, DeepSeek,
Mistral, CodeQwen, Phi, Qwen, etc.) running via Ollama, llama.cpp, vLLM, LM Studio,
or any local inference engine.

---

## Why This Framework Helps Local LLMs

Local models have limited context windows and weaker multi-task reasoning compared
to frontier models. This framework compensates by:

1. **One focused task per session** — each agent does exactly one thing
2. **Explicit file lists** — agents read only what they need (saves context)
3. **Structured output formats** — agents write to exact file paths in exact formats
4. **External memory** — `.cascade/` directory carries state between sessions
5. **Human validation** — you check each step instead of trusting autonomous execution

---

## Before You Start

### 1. Fill out your PRD
```bash
cp templates/prd/PRD_TEMPLATE.md docs/PRD.md
# Edit docs/PRD.md with your requirements
```

### 2. Configure the project
Edit `config/project.yaml`:
- Set `project.name`, `project.description`, `project.type`
- Set `mode: "human-in-the-loop"` (recommended for local LLMs)
- Set `local_llm.context_window` to your model's context size
- Set `local_llm.model_name` for documentation
- Optionally pre-fill `tech_stack` fields (reduces Architect's work)

### 3. Choose your session strategy

| Context Window | Strategy | Description |
|---------------|----------|-------------|
| < 16K tokens | `single-agent` | One agent definition + minimal input per session |
| 16K - 64K | `multi-step` | One agent + full workflow phase per session |
| 64K+ | `extended` | Multiple steps per session, closer to frontier behavior |

---

## Step-by-Step Workflow

### Session 1: Discovery (Orchestrator)

**What to paste into your LLM:**
```
<system>
[Contents of agents/00-orchestrator.md]
</system>

<user>
Read the PRD below and extract all requirements.
For each feature, write: REQ-XXX, Priority (P0/P1/P2), and Acceptance Criteria.
Write output to .cascade/discovery-output.md.

PRD:
[Contents of docs/PRD.md]
</user>
```

**After session:**
1. Save the LLM's output to `.cascade/discovery-output.md`
2. Review it — are requirements correct? Priorities right?
3. Edit if needed
4. Update `.cascade/state.md` to `DISCOVERY_DONE`

---

### Session 2: Architecture (Architect)

**What to paste into your LLM:**
```
<system>
[Contents of agents/01-architect.md]
</system>

<user>
Here are the project requirements:
[Contents of .cascade/discovery-output.md]

Here is the project configuration:
[Contents of config/project.yaml]

Design the architecture. Follow every step in your instructions.
Write the tech spec following this template:
[Contents of templates/specs/TECH_SPEC_TEMPLATE.md]
</user>
```

**After session:**
1. Save the tech spec output to `docs/TECH_SPEC.md`
2. Review the tech stack choices — do they make sense?
3. Update `config/project.yaml` with the chosen tech stack
4. Save any decisions to `.cascade/decisions.md`
5. Update `.cascade/state.md` to `ARCHITECTURE_DONE`

---

### Session 3: Scaffolding (DevOps)

**What to paste into your LLM:**
```
<system>
[Contents of agents/05-devops.md]
</system>

<user>
Scaffold the project. Here is the tech spec:
[Contents of docs/TECH_SPEC.md — Section 2 (Tech Stack) and Section 3 (Project Structure)]

Project type: [from config/project.yaml]
Tech stack: [from config/project.yaml]

Create the directory structure, config files, and verify the build works.
</user>
```

**After session:**
1. Create the directories and files the LLM specified
2. Run the build/test/lint commands yourself to verify they work
3. Update `.cascade/state.md` to `SCAFFOLDING_DONE`

---

### Sessions 4+: Implementation (Per Feature)

This is where you spend most of your time. For EACH feature:

#### Session 4a: Implement

**What to paste into your LLM:**
```
<system>
[Contents of agents/02-implementer.md]
</system>

<user>
Implement this feature:
  Name: [feature name from discovery-output.md]
  User Story: [from PRD]
  Acceptance Criteria: [from PRD]

Architecture context:
[Relevant section from docs/TECH_SPEC.md — keep it short]

Existing files you may need to modify:
[Paste contents of relevant source files, max 2-3]

Write the implementation code.
</user>
```

**After session:** Save code to files. Run the build.

#### Session 4b: Test

**What to paste into your LLM:**
```
<system>
[Contents of agents/03-tester.md]
</system>

<user>
Write tests for this feature:
  Name: [feature name]
  Acceptance Criteria: [from PRD]

Here is the code to test:
[Paste the source files from session 4a]

Write unit tests covering normal cases, edge cases, and error cases.
</user>
```

**After session:** Save test files. Run tests yourself.

#### Session 4c: Review

**What to paste into your LLM:**
```
<system>
[Contents of agents/04-reviewer.md]
</system>

<user>
Review this code for bugs, security issues, and quality:

Source file(s):
[Paste source files]

Test file(s):
[Paste test files]

Expected architecture:
[Brief relevant section from tech spec]

Check against the security, correctness, quality, and architecture checklists.
Write your review in the exact format specified in your instructions.
</user>
```

**After session:**
- If APPROVED → move to next feature
- If CHANGES_REQUESTED → do a fix session (4d)
- If BLOCKED → do a fix session, then re-review

#### Session 4d: Fix (only if needed)
```
<system>
[Contents of agents/02-implementer.md]
</system>

<user>
Fix these review findings:
[Paste the critical/important findings from the review]

Current code:
[Paste the source files]

Fix ONLY the listed findings. Do not change anything else.
</user>
```

---

### Session N-2: Integration (Tester)

After all features are implemented:

```
<system>
[Contents of agents/03-tester.md]
</system>

<user>
Write end-to-end tests for the complete application.
Test these critical user workflows:
[List the main user flows from the PRD]

The application entry point is: [path]
The API endpoints are: [list from tech spec]
</user>
```

---

### Session N-1: Security Review (Reviewer)

```
<system>
[Contents of agents/04-reviewer.md]
</system>

<user>
Perform a security audit on these files:
[Paste key files — auth, API routes, data access]

Focus on the security checklist. Check for:
- SQL injection
- XSS
- Command injection
- Hardcoded secrets
- Missing auth checks
- Input validation gaps
</user>
```

---

### Session N: Deployment (DevOps)

```
<system>
[Contents of agents/05-devops.md]
</system>

<user>
Deploy the application.
Tech stack: [from config]
Build command: [from tech spec]
Target: [where to deploy]

Write deployment documentation to docs/DEPLOYMENT.md.
</user>
```

---

## Tips for Better Results with Local LLMs

### Context Management
- **Trim aggressively.** Don't paste the full tech spec — paste only the section relevant to the current task.
- **Summarize previous work.** Instead of pasting 5 files, paste a 3-line summary + the 1 file that matters.
- **Use the handoff format.** The structured handoff blocks in `.cascade/handoffs.md` are designed to be copy-pasteable context summaries.

### Prompt Engineering
- **Be imperative.** "Write a function that..." not "Could you please consider writing..."
- **One task per prompt.** Never ask a local LLM to implement + test + review in one session.
- **Show the format.** If you want specific output, show an example in the prompt.
- **State constraints first.** "You have 3 files to modify. Do not create new files." before the task.

### Model Selection
| Task | Minimum Model Size | Recommended |
|------|-------------------|-------------|
| Discovery (requirements) | 7B | 13B+ |
| Architecture | 13B | 33B+ |
| Code implementation | 7B (code-specialized) | 33B+ code model |
| Testing | 7B (code-specialized) | 13B+ code model |
| Code review | 13B | 33B+ |
| Debugging | 13B | 33B+ |

Code-specialized models (DeepSeek Coder, CodeQwen, Codestral) perform significantly
better than general models for implementation and testing tasks.

### When Things Go Wrong
- **LLM generates garbage:** Reduce context size. You're probably exceeding the effective window.
- **LLM ignores instructions:** Put the most important instruction first. Repeat it at the end.
- **LLM drifts off-task:** Use the `YOUR ONLY JOB THIS SESSION` framing from the agent files.
- **Code doesn't compile:** Run the build yourself. Paste errors back to the LLM in a new session.
- **LLM invents APIs:** Paste the real API/interface definition in the prompt, not just a reference.

---

## Recommended Local LLM Tools

| Tool | Best For |
|------|----------|
| Ollama | Quick setup, CLI-first workflow |
| LM Studio | GUI, easy model management |
| llama.cpp | Raw performance, advanced users |
| vLLM | Serving to multiple clients, API compatibility |
| text-generation-webui | Web interface, many model formats |

All of these support the "paste context + prompt" workflow described above.
For tools with API access, you can script the session flow using the handoff files.
