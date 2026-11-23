---
topic: Adaptive model leads in agentic software development
date: 2026-11-23
summary: |-
  An adaptive lead interprets execution evidence and can change the next
  assignment, the plan, or the decision to stop. Coding studies show
  benefits from targeted intervention in some settings, but do not establish
  that a persistent lead is generally worth its cost.
---

# Adaptive model leads

**Evidence reviewed through:** 2026-11-23. This companion to [thin orchestration and smart planners](thin-orchestration-smart-planners.md) asks when the model making decisions should come back into the loop. It is research for the [harness goal](goal.md), not a proposed architecture.

## What makes a lead adaptive?

An adaptive model lead can **change what happens next based on evidence from the current run**. It might ask for a focused check, revise an assignment, unblock a dependency, stop an unproductive line of work, or ask the user to resolve an ambiguity. An upfront planner that never sees execution is not an adaptive lead. A script with conditional branches does adapt to results, but it is not a *model* lead unless a model interprets that evidence and makes a new decision at runtime.

**Adaptivity and thin orchestration are compatible.** The runtime can deliver evidence, enforce permissions and budgets, and dispatch approved work. The model can own the judgment while remaining absent from routine transitions. Two choices matter independently: **when to consult the model**, and **what it can change once consulted**.

## Four patterns, with different authority

| Pattern | When the model gets involved | What it can change |
|---|---|---|
| **Single checkpoint** | A known event, such as the first source edit after investigation. | Give a plan or a second opinion. The same worker keeps its workspace and context. PAUSE is the reference case [1]. |
| **Exception advisor or monitor** | A rule detects a repeat failure or skipped step, or an earlier inspection calls for closer supervision. | Give corrective advice or block one proposed action and ask the worker to regenerate it. The worker still owns the task. LivePlan and Cadence are examples [2, 3]. |
| **Round-by-round controller** | A worker returns at a defined boundary with a progress and verification report. | Assign the next bounded round, ask for targeted verification, or stop. LoopArena separates this role from the worker that edits code [4]. |
| **Scope-owning lead** | Worker handoffs, integration results, or changing dependencies alter the project state. | Change decomposition, priorities, or ownership across work units. CAID does this with a central manager; Cursor describes recursive planners that own separate scopes [6, 7]. |

A lead need not be constantly running or have direct write access. It needs enough continuity to know what it already decided, what evidence has changed, and which work those decisions affect. Conversely, a monitor with authority to veto one action is not necessarily in charge of the overall objective.

## What the comparisons say

**1. Targeted intervention can help; more calls are not inherently better.** On 500 SWE-bench Verified tasks using the same SWE-agent executor, PAUSE's single pre-edit planning call resolved **65.0%**, versus **61.8%** for rule-triggered LivePlan and **67.6%** for periodic SICA oversight. PAUSE and LivePlan each spent about **$26 total in planner inference**; SICA spent **$232** and used substantially more executor tokens. Neither PAUSE's lead over LivePlan nor SICA's lead over PAUSE was statistically significant in this comparison; that does not establish equivalence. The executor budgets were matched, not total spend [1, Table 3]. LivePlan's own evaluation nevertheless found gains over an unmonitored worker across the three tested executor models on both benchmarks. The narrower conclusion is that event-triggered help is useful in some repair settings, not that one trigger wins on every worker [2, Tables II–III].

**2. Timing and intervention authority can matter separately.** Cadence uses a model to choose between advice and asking the worker to replace a proposed action. Code then widens the inspection interval after advisory verdicts and shortens it after replacement verdicts. In a 300-task SWE-bench Lite ablation with the same worker, monitor, and intervention choices, adaptive inspection resolved **42.33%** vs. **33.33%** for inspection every seven steps, at nearly identical *realized* total tokens per task (**1.028M vs. 1.025M**). Inspecting every three steps reached **45.67%** with 15% more tokens; the score difference vs. adaptive was not significant. In a separate ablation, forcing advice only scored **35.00%**, and forcing replacement only scored **38.00%**. This is direct evidence about intervention policy on an issue-repair benchmark, not about running a multi-agent project [3, §5.3].

**3. A stronger controller can help, but can make the worker spend much more.** LoopArena v2 held the worker model fixed for 80 full coding tasks, each repeated three times. Its best model controller reached **36.25% strict success at $34.68/run**, versus **31.25% at $9.47** for deterministic goal restatement and **27.50% at $2.61** for the worker alone. One controller spent only **$0.15/run on its own calls** but drove total spend to **$32.66/run** with **28.33%** success. These are no-cache inference estimates; the task budgets and tool setup were shared, but realized spend was not equal. The deterministic baseline did not use structured exception handling or revise assignments, so it is not a full comparison against thin orchestration [4, Tables 2–3].

**4. Continuous workflow authorship has no clear aggregate advantage in the available transfer experiment.** WorkflowArena let a separate model either write a workflow and exit or stay engaged and revise it from worker results. Holding each worker model fixed on 32 selected hard tasks, Opus-authored workflows gained **6.41 points static** and **6.27 dynamic** over each executor's own dynamic workflow, averaged over four worker models on the continuous score. Individual workers favored different modes. A static authored workflow could still branch on feedback; this tested whether the *author* needed to return, not whether feedback should exist. The subset spans multiple domains and the experiment matched wall-clock limits, not dollars [5, §4.5].

**5. Project-scale deployments show why a lead might need to return, not how often it should.** CAID's manager merges isolated worker changes and revises the remaining dependency plan after handoffs. Its comparison with solo work bundles adaptive direction, worktree isolation, integration, and extra compute [6]. Cursor reports that static upfront decomposition delayed correction, but its next design—an executor responsible for planning, building, coordinating, merging, and judging completion—also drifted and sometimes stopped early. It moved to scope-owning planners that receive worker handoffs and can revisit decisions. This is useful evidence about failure modes at scale, not a controlled comparison of lead policies [7].

## What a lead needs to see

LoopArena provides a concrete example: a read-only reporter cites worker turns in a packet describing the task, current state, verification evidence, and remaining issues; the controller issues a bounded contract for the next round [4, §2.2]. An **evaluation hypothesis** for our tasks is to test whether a small packet containing the following is enough, with links back to the underlying evidence:

- **State:** current objective and scope, last accepted revision, active assignments and dependencies, remaining budget.
- **What changed:** worker outputs and artifact versions, check results with provenance, violated assumptions or contradictions. Keep observed results distinct from a worker's interpretation.
- **What still needs a decision:** whether to let the worker continue, ask for a focused check, revise work across scopes, or pause for user input. A lead's “done” decision should not substitute for required checks or approvals.

For example, during a migration, a worker may discover a second caller of an interface it was assigned to replace. If it can update that caller within scope and pass the agreed check, no lead call may be needed. If another worker owns the caller or the interface contract itself has changed, integration evidence could justify pausing affected jobs and revising assignments. If compatibility requirements are ambiguous, the lead can surface the trade-off to the user rather than silently expanding scope. This example illustrates three levels of response; it is not an observed benchmark result.

The signal need not always be another model. In a recent long-horizon coding study, injecting automatically measured complexity feedback into the *same* worker reduced the concentration of code complexity in several settings, without a detectable per-model effect on held-out correctness. That is a reason to include direct feedback as a comparison before crediting a separate lead for the effect of making evidence visible [8].

## What to test next

On the same tasks, compare **direct feedback to a capable solo worker**, **one evidence-rich checkpoint**, **exception-triggered lead calls**, and **a lead called at every meaningful work boundary**. For multi-worker tasks, hold the initial plan, worker model, permissions, acceptance checks, and concurrency fixed across lead policies. Vary *when the lead is called* before varying *how much authority it has*. Separate bounded repairs from multi-unit work with surprises such as a changed dependency or conflicting verification. The open question for the Tasker and Objective Driver hypotheses is whether they need different control loops or simply different scope and intervention thresholds.

Measure held-out acceptance at the same dollar and latency caps, plus worker and lead costs separately. Examine helped and harmed runs, unnecessary interventions, missed opportunities, stale assignments, repeated retries, and premature completion. Compare model decisions starting from the same saved evidence on a small subset, but replay the following execution when measuring whether a different decision actually helped. The evidence is stronger for **selective steering on bounded tasks** than for a standing lead's net benefit on evolving objectives, and weaker still on when to escalate to a human.

## Primary sources

1. Patel et al., [*PAUSE: Search-Free Steering of Coding Agents Before Their First Source-Code Edit*](https://arxiv.org/html/2610.29870v1), preprint, 2026-10-21. Table 3 compares one-shot, rule-triggered, and periodic steering.
2. Liu et al., [*Online Monitoring and Corrective Steering of Programming Agents*](https://arxiv.org/html/2608.06701v1), preprint, 2026-08-07. LivePlan's monitor/advisor split and cross-model repair comparisons.
3. Wang et al., [*Cadence: Strategic Guidance for Coding Agents*](https://arxiv.org/html/2610.12269v1), preprint, 2026-10-08. Table 4 separates inspection timing and intervention mode; §5.4 discusses misdiagnosis, missed inspection, and poorly executed advice.
4. Wang et al., [*LoopArena: Benchmarking Models as Runtime Controllers for Loop Engineering*](https://arxiv.org/html/2608.28281v2), preprint v2, 2026-10-13. Fixed-worker comparison, controller evidence packets, and downstream costs.
5. Jiang et al., [*WorkflowArena: Benchmarking Executable Workflow Orchestration in LLM-Based Multi-Agent Systems*](https://arxiv.org/html/2611.12856v1), preprint, 2026-11-09. §4.5 distinguishes frozen workflow authorship from live revision.
6. Geng and Neubig, [*Effective Strategies for Asynchronous Software Engineering Agents*](https://arxiv.org/html/2603.21489v2), arXiv v2, 2026-07-08; [COLM 2026 paper](https://proceedings.colm.cc/paper_files/paper/2026/file/3b5c10bf5d70533e955cba9fba491bf4-Paper-Conference.pdf). CAID's dependency-aware replanning and integration loop.
7. Wilson Lin, Cursor, [“Towards self-driving codebases”](https://cursor.com/blog/self-driving-codebases), 2026-02-05. Vendor report on iterative experiments with different scope and decision owners.
8. [*Metrics-in-the-Loop: Complexity Feedback Reshapes Agent-Written Code*](https://arxiv.org/abs/2611.23817), preprint, 2026-11-18. Direct measurement feedback in the worker loop, with a reminder-only control.
