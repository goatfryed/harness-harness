---
topic: Challenging the default loop on coordination and evolving work
date: 2026-11-23
---

# Challenge: when coordination and context dominate

**Question:** What measured failures challenge a thin orchestrator, strong planner, and mid-tier builder as a starting point for nontrivial software work? Evidence reviewed through 2026-11-23; four primary research papers, including one adjacent web-agent study.

**Bottom line:** The strongest challenge is not that dispatch must be model-driven. It is that a plan and assignment can become semantically stale without any obvious dispatch failure, while splitting tightly coupled work can lose to one capable agent. A fixed plan lost substantially to step-by-step replanning in a web task, but that comparison also changed planner training. In coupled coding tasks, solo agents sometimes beat every tested specialist protocol, and dependency failures persisted behind high partial test scores. These findings motivate testing more frequent semantic control and a strong solo baseline; they do not prove either is generally superior to the stated default.

The [default](../../concepts/default-loop.md) already permits local builder adaptation and returning the planner when assumptions or dependencies change. Its vulnerable empirical assumption is **when the need to return becomes detectable and who has enough context to recognize it**. A deterministic dispatcher can deliver observations and enforce checks while a model owns semantic replanning; calling that arrangement “thin” does not mean the plan is fixed.

## Direct observations

### 1. Static plan versus continuously updated plan: a large but confounded gap

In **Plan-and-Act**, the planner writes an initial plan for a web executor; the dynamic variant revises it after every executor action with the current state and prior actions. On 165 WebArena-Lite tasks, using the same executor trained with synthetic trajectories, the static targeted-augmentation planner achieved **43.63%** task success; dynamic replanning achieved **53.94%**, a **10.31 percentage-point** gain. The base executor showed **29.63% vs. 44.24%**. The authors describe static-plan failures when a search returned nothing or the executor had to interpret previously unknown content [1, Table 1, §§3.3, 5.3].

**Boundary:** This is web navigation, not coding; the replanner was additionally fine-tuned on replanning data, and the comparison does not isolate call frequency, total compute, or quality of initial planner. It does not compare against exception-triggered replanning or a builder strong enough to reinterpret the plan itself. The result supports the risk of an immutable plan, not an always-on manager requirement.

### 2. Coupled implementation: solo sometimes beats even the best tested team

**AsynCodeBench** evaluates 19 repository tasks with 52 human-validated directed cross-component dependencies, ten models and four multi-agent protocols, including serial handoff, isolated asynchronous specialists, and manager variants. For **four of ten models**, the same model's solo agent exceeded its best multi-agent protocol on task-macro test pass rate. For Qwen3.8-27B, solo scored **93.6%** versus **86.7%** for best multi-agent; for DeepSeek-V4, **93.6% vs. 89.9%**. Six other models benefited from their best team [2, §§3–5].

An independent integration measure reveals the hazard of partial progress: in the read-only manager protocol, **32 of 190 model–task outcomes** had at least **80% test pass rate** but passed fewer than half of the benchmark's dependency checks; 26 passed none. These are partial test-point scores, not 32 fully accepted tasks. A dependency checker tests an integrated producer–consumer relation, so it adds information rather than proving a particular handoff caused each failure [2, §5.2].

**Boundary:** Small benchmark and model/protocol-dependent outcomes; the multi-agent protocols differ in integration and manager permissions, not just dispatcher type. The comparison is not a test of the default's stronger planner plus mid-tier worker at matched dollars. It does show that “nontrivial and multi-file” alone is insufficient evidence that dividing implementation helps.

### 3. A broader controlled architecture comparison also favors solo on bounded fixes

**Towards a Science of Scaling Agent Systems** compares five topologies with standardized prompts, tools and compute. On a **20-instance SWE-bench Verified subset**, mean solo score was **0.522**, versus **0.511 hybrid**, **0.506 centralized**, **0.494 decentralized**, and **0.444 independent** across tested models [3, §4 and Appendix F]. These are aggregate means, not a claim that every model or issue favors solo. The same paper reports strong multi-agent gains in other domains, and its small coding sample makes the ranking directional.

**Boundary:** This tests complete coordination topologies rather than a thin scheduler against a continuously adaptive planner. It does not isolate the cause of degradation as lost context, integration, or inferior allocation of the fixed compute budget. It nevertheless challenges treating a separate planning handoff as free, even where the task requires tool use and iterative adaptation.

### 4. Counterevidence: adaptive state can help without a continuously called model lead

**PMCoder** augments the same issue-solving loop with phase-aware memory, deterministic stuck detection and recovery, plus execution-grounded signals when a validated issue reproducer exists. On 500 SWE-bench Verified tasks over three runs, baseline resolved **28.5%** and the combined system **33.5%**; plan-only scored **29.7%** and memory-only **30.1%** [4, Tables III and VIII]. Failed-action recurrence fell from **0.0137 to 0.0069** and empty/give-up patches from **8.3% to 2.7%** [4, Table V].

This is an important counterexample to “more frequent model calls are necessary”: the planner has **one initial LLM call** and uses deterministic per-step phase tracking and recovery; the worker model retains semantic agency. The full system also bundles memory, checks, and feedback, and the baseline has none, so the gain is not attributable solely to replanning. It supports stronger state continuity and direct feedback, and is consistent with a thin runtime plus an adaptive builder.

## What would actually challenge the default?

Compare on the same coupled or evolving coding tasks: (A) a capable solo agent, (B) the stated default with explicit exception-triggered planner return, and (C) the same planner and workers with semantic review at each meaningful integration boundary. Keep worker model, starting plan, permissions, checks, and concurrency fixed for B versus C; separately compare matched total cost and wall-clock limits. Include newly discovered dependencies and failed integration checks, but do not assume all meaningful surprises produce a detectable exception.

Record held-out acceptance, dependency-check outcomes, missed or late replans, stale assignments, handoff information loss, integration repairs, cost, and latency. If C improves acceptance at the same budget specifically on changes that B failed to flag, that challenges the default's consultation cadence; if A wins, it challenges role separation for those tasks. Replay scheduling on identical accepted decisions separately to distinguish semantic control from job dispatch.

## Sources

1. Erdogan et al., [*Plan-and-Act: Improving Planning of Agents for Long-Horizon Tasks*](https://arxiv.org/html/2503.09572v3), 2025, §§3.3, 5.1–5.3 and Table 1.
2. Zhang et al., [*AsynCodeBench: Benchmarking Collaboration of Asynchronous Multi-Agent Systems in Software Engineering*](https://arxiv.org/html/2609.32662v1), 2026-09-26 preprint, §§3–5.
3. Kim et al., [*Towards a Science of Scaling Agent Systems*](https://arxiv.org/html/2512.08296v3), 2026-04-08 revision, §4 and Appendices D–F.
4. Zhang, Zhang and Huang, [*Coupling Planning with Episodic Memory in LLM Agents for Software Issue Resolution*](https://arxiv.org/html/2608.06811v1), 2026-08-07 preprint, §§III–V, Tables III, V and VIII.
