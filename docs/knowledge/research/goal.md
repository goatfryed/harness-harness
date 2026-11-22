# Research: Agentic workflows, orchestration, and role separation

## Purpose

Research established practices, emerging patterns, and practical experience in designing effective **agentic software development workflows**, with particular attention to planning, execution, verification, delegation, and iterative feedback.

The goal is to build an evidence-oriented knowledge base that informs the architecture of a customizable agent harness for software development and related knowledge work.

**This is exploratory research, not validation of a predetermined architecture.**

## Context

Our harness aims to support work ranging from small, well-defined maintenance tasks to ambiguous, evolving objectives involving multiple disciplines.

We are exploring two complementary dimensions of agent responsibility.

### Orchestration and work ownership

- **Objective Driver** — pursues an evolving objective, potentially spanning multiple independent work units, through refinement, decomposition, delegation, integration, and feedback.
- **Tasker** — coordinates completion of a bounded assignment, potentially through repeated planning, execution, and verification.
- **Specialized orchestrators** — such as Spiker or Changer, which may own distinct workflows for particular kinds of bounded work.

Orchestrators primarily coordinate subordinate agents rather than perform the work themselves.

Bounded work may be invoked independently or delegated by a driver. It should not require an artificial parent objective. Work may also be escalated or reorganized when unexpected complexity emerges.

These distinctions describe working architectural hypotheses, not settled requirements.

### Functional roles

A separate, provisional taxonomy describes the responsibilities of agents performing work:

- **Probe** — investigates, researches, analyzes, and reduces uncertainty.
- **Designer** — conceptualizes solutions, evaluates alternatives, and develops actionable plans or designs.
- **Maker** — creates or modifies artifacts such as code, tests, configurations, documentation, and graphics.

These roles may overlap. They should not be assumed to correspond to distinct agents, model calls, or mandatory workflow stages.

For example, a Maker may perform local planning, and a Designer may produce drafts or prototypes. Investigate when specialization is beneficial and when it creates unnecessary boundaries.

## Research objectives

### 1. Existing architectures and workflows

Investigate approaches from Anthropic, OpenAI, Google, Cursor, OpenCode, and relevant open-source projects and academic research.

Examine patterns including:

- Plan → Build → Verify and Plan → Act → Reflect
- Planner–Executor and Builder–Reviewer/Verifier
- Single-agent iterative loops
- Orchestrator–Worker and hierarchical delegation
- Parallel agents, independent investigations, and synthesis
- Dynamic workflows that adapt to complexity or uncertainty

Identify actual implementations and operational practices, not merely conceptual diagrams.

### 2. Responsibility and role separation

Investigate whether separating investigation, solution design, implementation, and verification improves effectiveness.

Consider:

- Role specialization versus general-purpose agents
- Separation by responsibility, domain, capability, or context
- Dedicated agents versus reusable skills and tools
- Boundaries between planning and implementation
- Independent verification versus self-review
- Overlapping responsibilities and transitions between roles

Challenge the Probe / Designer / Maker taxonomy and identify credible alternatives.

### 3. Orchestration and work decomposition

Study how agent systems manage both ambiguous objectives and bounded assignments.

Examine:

- Centralized orchestration versus decentralized coordination
- Delegation to specialized versus general-purpose workers
- Dynamic decomposition and dependency management
- Standalone work versus delegated work
- Escalation when scope or complexity grows
- Coordination of heterogeneous outcomes, including research, designs, code, and tests
- When orchestration adds value versus unnecessary overhead

Investigate whether objective-level and task-level coordination genuinely benefit from different workflows.

### 4. Feedback loops and control flow

Compare fixed pipelines, iterative loops, and dynamically selected workflows.

Explore:

- When explicit planning is necessary
- When investigation should precede implementation
- Planning → execution → verification → replanning
- Local correction versus broader replanning
- Verification failures and recovery strategies
- Stopping criteria, acceptance criteria, and completion assessment
- Human steering, approval gates, and escalation
- Balancing autonomy with predictable control

Pay particular attention to **who owns decisions about the next step**, and how those decisions are informed.

### 5. Delegation, context, and handoff contracts

Investigate mechanisms for transferring work between agents without losing essential information or introducing excessive coupling.

Include:

- Task contracts, goals, constraints, and acceptance criteria
- Structured handoffs versus conversational delegation
- Shared context versus isolated agent sessions
- Independent sibling sessions and explicit report-back
- Artifact-based communication and persistent state
- Filesystem, Git branch, and worktree isolation
- Context compression, summarization, and provenance
- Integration of independently produced results

Assess the costs and benefits of isolation, especially for parallel work and independent verification.

### 6. Verification and quality assurance

Study how agentic systems establish confidence in their outputs.

Distinguish:

- Automated tests and deterministic validation
- Static analysis and other tool-based checks
- Agent reviews and independent critique
- Acceptance testing against requirements
- Exploratory testing and adversarial evaluation
- Human review and approval

Investigate verification bias, correlated errors between agents, and whether independent reviewers provide measurable improvements.

Also examine when verification should remain within an implementation workflow versus becoming an independently orchestrated work unit.

### 7. Failure modes and tradeoffs

Identify documented problems, including:

- Excessive planning or premature decomposition
- Unnecessary delegation and coordination overhead
- Context loss and handoff degradation
- Conflicting plans or agent disagreement
- Circular review and unproductive retry loops
- Verification bias and false confidence
- Over-specialization and duplicated responsibilities
- Uncontrolled scope expansion
- Cost, latency, and token inefficiency

Look for mitigations and conditions under which simpler architectures perform better.

### 8. Empirical evidence and practical experience

Prioritize benchmarks, controlled experiments, engineering reports, implementation details, and documented production experience.

Evaluate evidence critically:

- What was actually measured?
- What baseline was used?
- Were models, tools, budgets, and context comparable?
- Are improvements attributable to orchestration or other factors?
- Do results generalize beyond the evaluated tasks?
- What costs or failure rates were omitted?

Distinguish reproducible evidence from anecdotal success and vendor claims.

## Research approach

Prioritize primary sources, technical documentation, engineering writeups, research papers, and concrete open-source implementations.

Use community experience to identify practical problems and emerging patterns, but distinguish it from stronger evidence.

Research both successful and unsuccessful approaches. Actively seek counterexamples to the proposed role and orchestration models.

For significant findings, provide citations close to the claims they support. Record source dates and relevant versions, especially for rapidly evolving agent frameworks.

**Do not assume that multi-agent orchestration, explicit planning, or role specialization is inherently superior to simpler alternatives.**

## Deliverable

Create an initial **structured Markdown knowledge base** suitable for incremental expansion and later architectural decisions.

Organize findings by topic rather than by vendor or source.

Include:

1. **Executive summary** — major findings, confidence levels, and meaningful disagreements.
2. **Workflow pattern catalog** — documented patterns, mechanisms, applicability, and tradeoffs.
3. **Roles and responsibilities** — boundaries, specialization strategies, and alternatives.
4. **Orchestration and delegation** — coordination models, context management, and handoff mechanisms.
5. **Verification and feedback** — quality controls, iteration, recovery, and escalation.
6. **Failure modes** — observed problems, contributing factors, and mitigations.
7. **Evidence assessment** — comparative findings, limitations, and strength of evidence.
8. **Open questions** — unresolved issues and promising directions for further investigation.
9. **Annotated source index** — URLs, publication dates, source types, and relevance notes.

Clearly distinguish:

- **Documented facts** — directly supported by sources.
- **Empirical findings** — supported by experiments or measurements.
- **Interpretations** — reasoned conclusions drawn from available evidence.
- **Recommendations** — potential implications for our harness, explicitly provisional.

Avoid repeating the same findings across multiple sections. Prefer cross-references and concise comparisons.

The initial research should provide useful breadth without attempting to exhaust every topic. Identify areas warranting deeper follow-up.

## Scope boundary

**Do not design or implement the final harness architecture yet.**

In particular, do not treat Objective Driver, Tasker, Probe, Designer, Maker, or Plan → Build → Verify as established best practices.

The research should inform subsequent decisions about agent responsibilities, orchestration, workflow composition, and delegation—not make those decisions prematurely.