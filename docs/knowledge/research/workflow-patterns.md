---
topic: Agentic software development workflow patterns
date: 2026-11-22
summary: |-
  A bounded comparison of single-agent loops, phase-separated workflows,
  planner–executor systems, and orchestrator–worker approaches. Delegation
  can improve outcomes on some long-horizon coding tasks, but increases
  coordination and compute costs; its benefits depend on task structure.
  Executable feedback is important, while the value of separate planning
  and verification roles remains an open empirical question.
---

# Agentic software development workflow patterns: initial research

**Date:** 2026-11-22  
**Scope:** A bounded first pass over five implementations and ten primary sources, guided by the broader goal in [goal.md](goal.md) and the supplied initial assignment. This is the first topic-oriented installment of an expandable knowledge base, not a complete survey, an architecture, or a role taxonomy. The goal file was saved after the first pass began and was then incorporated.

## Summary

Plan → Build → Verify is better understood as a **repeated feedback cycle** than a mandatory three-person assembly line. A single tool-using agent can plan, edit, run checks, and respond to failures. Separate agents can provide parallel capacity or focused context, but handoffs, duplicated context, merge conflicts, and verification consume resources.

The strongest directly relevant positive comparison here is CAID's long-horizon coding evaluation: its manager and isolated workers improved benchmark scores over its single-agent baseline, but used substantially more time and money [8]. Conversely, a controlled study of enabling native subagent concurrency across three coding agents reports mixed outcomes and often more runtime and tokens [10]. These are different systems and task distributions, not a contradiction that establishes a universal winner. Evidence favors **conditional delegation**, not a fixed number of roles.

## Pattern comparison

| Approach | Planning | Building and delegation | Verification and feedback | Tradeoff / evidence |
|---|---|---|---|---|
| **Codex: single iterative loop** [1] | The agent can maintain and revise a plan; no separate planner is inherent in the loop. | One model-driven thread calls tools and receives observations. | Tool output, including test results when tests are run, feeds the next step. A final response terminates the turn, not necessarily a verified success. | Minimal handoffs and unified context; long histories require compaction. Implementation description, not a comparative trial. |
| **SWE-agent: single action–observation loop** [2] | Planning is part of the same agent's trajectory, rather than a separate required role. | Repeated model actions edit and inspect the environment. | Action results return to the trajectory; its documented interface can reject edits introducing syntax errors. This is not a guarantee that tests are run. | Tight environment feedback with low coordination complexity; syntax validity is weaker than behavioral correctness. Code and documentation evidence. |
| **Anthropic: initializer → coding sessions** [3] | An initializer creates a feature list and progress artifacts for long-running work. | Subsequent coding sessions implement incrementally and leave state for the next session; role separation is across phases/sessions, not necessarily parallel. | Progress notes and end-to-end checks expose incomplete work and guide the next session. | Durable handoffs help continuity but can be stale or wrong; an engineering case study, not an isolated planner-versus-no-planner trial. |
| **OpenAI cookbook: manager → specialists** [4] | A project manager decomposes a task and specifies required artifacts. | Specialist agents handle assigned stages; the manager coordinates handoffs. | A tester checks work against acceptance criteria; trace and artifacts make handoffs inspectable. | A clear planner–executor example, but handoff artifacts can add latency and their presence does not establish correctness. Illustrative implementation, not a controlled result. |
| **CAID: asynchronous manager → workers** [8] | Manager builds a dependency graph and selects ready work; updates the plan after integration. | Workers implement in isolated Git worktrees and commit; manager merges and reassigns, with conflicts resolved by workers. | Workers self-test; integration and final review provide feedback; limits can terminate incomplete work. | Supports concurrent shared-artifact development, at coordination and integration cost. Matched-framework benchmark provides comparative evidence, with unequal total compute. |

Anthropic's compiler case [5] is a related real-world orchestrator/worker example: agents used separate checkouts and task locks; roles included implementation and review. Early work converged on the same kernel bug until the team partitioned the task. A GCC oracle and executable tests supplied useful feedback. It demonstrates feasibility, not an improvement versus a single-agent control.

## Responsibilities, control, and failure modes

**Documented mechanisms:** The Codex and SWE-agent loops place planning, action, and interpretation of tool feedback within the same agent thread [1, 2]. Anthropic separates initialization from later implementation sessions [3]; the cookbook separates manager and specialist responsibilities [4]; CAID assigns dependency management and integration to a manager while workers implement and self-verify [8]. In CAID, the manager owns reassignment and updates the dependency state; worker test failures drive local correction. A limit reached with unfinished units is incomplete, not success [8]. These examples do not show that all orchestrators must only coordinate or that bounded work needs a parent objective.

**Interpretation:** Probe, Designer, and Maker are useful questions to investigate, not demonstrated natural boundaries. The single-loop examples provide a credible counterexample to mandatory distinct roles; CAID shows a different split, between integration/dependency management and implementation/self-verification. The evidence does not establish when an objective driver and task-level coordinator require separate workflows, or whether a skill/tool instead of an agent would be preferable.

| Failure mode | Observed or plausible mechanism | Candidate mitigation and limitation |
|---|---|---|
| False completion | Anthropic observed features marked complete without end-to-end functionality [3]. | Check acceptance with an executable end-to-end test where available; the coverage and oracle can still be incomplete. |
| Contention and incompatible work | Compiler agents initially targeted the same bug [5]; CAID studies parallel shared-workspace interference [8]. | Partition on dependencies and isolate work; integration and semantic conflicts remain possible. |
| Context or handoff loss | Long sessions require compaction [1]; CAID condenses histories while retaining structured artifacts [8]. | Preserve constraints, decisions, failures and provenance explicitly; whether this preserves enough information remains open. |
| Excessive coordination and review | CAID reports higher costs and a review/runtime tradeoff [8]; concurrency study reports frequently higher runtime [10]. | Compare against a solo baseline; avoid assuming a worker or review round pays for itself. |
| Weak or correlated verification | Self-verification may miss the same assumptions used to implement work; independent agents may share biases. | Use diverse checks, requirements-based acceptance and human review where appropriate; the benefit of independent reviewers remains unquantified here. |

**Not established in this pass:** escalation and human approval policies, circular review and retry termination, conflicting plans, and the effectiveness of reusable skills versus agent boundaries. These are priorities for later work rather than implied properties of the examples above.

## Findings and evidence strength

1. **Executable feedback matters more than a label called “verifier.”** Codex's loop can consume tool results [1]; SWE-agent adds syntax feedback [2]; Anthropic reports agents falsely claiming web-app features were complete until prompted toward end-to-end testing [3]. CAID workers run relevant tests before committing [8]. These sources show mechanisms and observed failures, not a clean causal estimate that verification always improves outcomes. Passing weak or self-written tests does not prove requirements are met. **Evidence: strong for feasibility and failure modes; limited for isolated causal effect.**
2. **Separate planning and handoffs can support long horizons, but their independent value is unresolved.** Feature lists, progress notes, explicit acceptance criteria, and structured assignments can preserve intent across sessions [3, 4, 8]. None of these examples alone proves a separate planner agent is better than the same agent maintaining a plan. Handoff compression can also discard crucial assumptions. **Evidence: implementation and case-study evidence.**
3. **Delegation can improve long-horizon coding outcomes at substantial cost.** On Commit0-Lite, CAID with Claude Sonnet 4.5 scored 59.1 versus 53.1 for the single-agent baseline, at $8.1 versus $1.9 and 1,583 versus 693 seconds; on PaperBench its score was 63.3 versus 57.2 [8, table 2]. The same underlying framework and model were used, but total agent iterations and cost were not equal. PaperBench used a model judge under its Code-Dev protocol, not full reproduction. The comparison bundles delegation, planning, isolation, integration and extra compute; it does not isolate role separation. **Evidence: direct comparative preprint, bounded to its tasks and configurations.**
4. **More parallelism is not automatically faster or better.** CAID's authors report diminishing or negative returns as worker count rises, and an isolation ablation where shared-workspace multi-agent performance fell below the solo baseline on PaperBench [8]. A separate study of 354 tasks and 2,124 runs reports 1.41–3.31× token use when native concurrency was enabled, and higher mean runtime in 14 of 15 agent–benchmark combinations [10]. Those are end-to-end policy comparisons, not a pure measurement of communication overhead. **Evidence: direct but context-specific comparative preprints.**
5. **Parallel decomposition is task-dependent.** Anthropic's research system reports a 90.2% improvement over a single Opus 4 agent on its internal research evaluation [6], but that result is for research, not coding; Anthropic explicitly notes tightly coupled coding can be harder to parallelize. Its 15× token figure compares multi-agent systems with chat, not with single-agent systems. The compiler example shows both substantial work and collisions [5]. **Evidence: vendor-reported result and case study; limited transfer to coding.**
6. **Independent review is a hypothesis, not an automatic win.** CAID's exploratory comparison found per-round manager review improved its reported pass rate relative to worker self-verification, but also increased runtime [8, §4.4]; prompts and review intensity differed together. This does not establish that a separate reviewer is always necessary or cost-effective. **Evidence: exploratory, confounded comparison.**

## Implications and open questions for the proposed architecture

These are evaluation considerations, not design decisions:

- Compare a capable single-agent baseline with separated planning and delegated-worker variants on the **same representative tasks**, models, tools, and acceptance tests. Report both equal-budget and unconstrained comparisons; include success, total tokens/cost, wall-clock time, retries, and integration failures.
- Distinguish **planning as an activity** from **a planner as a separate agent**. Test whether a durable plan and verifiable stopping condition improve outcomes before attributing benefits to an agent boundary.
- Track evidence of verification: command, result, scope, and unresolved failures. Separate unit-level checks from integration and end-to-end acceptance; ask who checks the check.
- Test delegation first on work that can be partitioned cleanly, including read-only exploration, then on overlapping edits. Measure context-transfer loss, stale assumptions, merge conflicts, and the cost of synthesizing results.
- Preserve useful state across long runs, but evaluate whether summaries omit constraints or test failures. A completed handoff or final message should not itself be treated as proof of success.

## Prioritized follow-up questions

1. **Highest:** For our real task mix, where is the break-even point for one agent versus planning-only delegation versus parallel implementation, under equal dollar and latency budgets?
2. Which verification signals catch defects that local tests miss, and when does independent review add enough value to justify its cost?
3. How do task coupling, repository structure, and worktree/merge strategy affect parallel execution and integration failures?
4. What information must survive session boundaries and compaction, and how often do handoffs lose it?
5. How well do these benchmark and vendor observations generalize to our models, permissions, codebases, and human approval requirements?
6. When should a bounded task be standalone, escalated, or reorganized into an evolving objective? Do objective-level and task-level coordination actually need distinct control flows?

## Annotated source index

1. [OpenAI, “Unrolling the Codex agent loop”](https://openai.com/index/unrolling-the-codex-agent-loop/) — Primary engineering account of tool calls, observations, termination, and context compaction; descriptive, not comparative.
2. [SWE-agent, agent implementation](https://github.com/SWE-agent/SWE-agent/blob/main/sweagent/agent/agents.py) and [agent–computer interface documentation](https://github.com/SWE-agent/SWE-agent/blob/main/docs/background/aci.md) — Open-source action–observation loop and edit-time lint feedback; moving repository documentation, not a benchmark of role separation.
3. [Anthropic, “Effective harnesses for long-running agents”](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) — Initializer/coding sessions, progress artifacts, and end-to-end testing observations; vendor case study.
4. [OpenAI, “Building Consistent Workflows with Codex CLI & Agents SDK”](https://developers.openai.com/cookbook/examples/codex/codex_mcp_agents_sdk/building_consistent_workflows_codex_cli_agents_sdk) — Concrete manager, specialist, acceptance and handoff example; instructional rather than controlled evidence.
5. [Anthropic, “Building a C compiler with a team of parallel Claudes”](https://www.anthropic.com/engineering/building-c-compiler) — Concrete parallel coding case, including task collisions, tests and engineering cost; no solo control.
6. [Anthropic, “How we built our multi-agent research system”](https://www.anthropic.com/engineering/multi-agent-research-system) — Internal research evaluation and token tradeoffs; adjacent domain, not coding evidence.
7. [Anthropic, “Building effective agents”](https://www.anthropic.com/engineering/building-effective-agents) — Primary vendor guidance distinguishing orchestrator–workers and evaluator–optimizer loops; conceptual rather than controlled comparison.
8. [Geng and Neubig, “Effective Strategies for Asynchronous Software Engineering Agents”](https://arxiv.org/html/2603.21489v1) — 2026 preprint, open-source CAID implementation and controlled-framework comparisons with isolation and coordination ablations; not equal-compute and subject to benchmark/judge limitations.
9. [OpenAI, Codex subagents documentation](https://developers.openai.com/codex/subagents/) — Operational account of delegation, separate work and token cost; documentation is not efficacy evidence.
10. [Li et al., “When Sub-Agents Work in Parallel”](https://arxiv.org/abs/2610.10263v1) — 2026 preprint comparing concurrency enabled/disabled across coding agents and task horizons; reflects specific agent configurations and measures end-to-end policy effects.

**Dates and versions:** [1] was published 2026-01-23; [8] is the 2026-03-23 v1 preprint; [10] is the 2026-10-07 v1 preprint. [2] and [9] are living documentation, accessed 2026-11-22; [2] links to the moving main branch. Publication dates for the remaining vendor pages were not established in this pass and should be captured before relying on their currentness.

**Stopping point:** The selected examples cover single-agent, phase-separated, planner–executor, and orchestrator–worker workflows. Additional frameworks, benchmark papers, and role taxonomies were intentionally not surveyed.
