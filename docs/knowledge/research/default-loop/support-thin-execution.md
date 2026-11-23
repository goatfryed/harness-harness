---
topic: Evidence for thin execution and economical coding workers
date: 2026-11-23
---

# Thin execution: supporting evidence and boundaries

**Scope:** Empirical software-task evidence available through 2026-11-23 assessing the [default-loop assumption](../../concepts/default-loop.md), complementary to [thin orchestration and smart planners](../thin-orchestration-smart-planners.md) and [adaptive model leads](../adaptive-model-leads.md). The question is whether a runtime can replace routine model control and whether a cheaper worker can implement useful work at competitive cost. These sources do not establish that a strong planner plus mid-tier builder is the best general architecture.

## Bottom line

Fixed execution and machine-enforced filtering have produced competitive repository repairs, and selective use of cheaper coding models has produced favorable *observed* cost–quality points. The most relevant caveat is that the apparently strongest cascade result uses **hidden benchmark tests as an oracle for accepting or rejecting the first patch**. Real deployments generally cannot assume such an oracle. Evidence for an equally good, equally priced replacement of a persistent model dispatcher on evolving multi-worker work remains missing. In particular, none of the following isolates deterministic dispatch with the same initial plan, worker, feedback, checks, and budget.

## Evidence

### 1. An authored pipeline can carry out repair without model-directed next steps

[Agentless v1, §§2–4 and Tables 1–3](https://arxiv.org/html/2407.01489v1#S4) used GPT-4o to localize relevant files, classes and edit locations, then generate candidate patches; a fixed pipeline discarded syntax-invalid or regression-failing candidates and selected among the rest by normalized majority vote. It resolved **82/300 (27.33%)** SWE-bench Lite issues at a reported **$0.34 average inference cost per issue**. Its single-sample configuration resolved 70 at $0.11; adding multiple samples and voting reached 78 at $0.34; adding test filtering reached 82 at the same rounded inference cost. This is direct evidence that coded sequencing and a check gate can perform useful work without a model choosing every next action; the within-pipeline filtering ablation is stronger evidence for the gate than the leaderboard comparison.

**Limits:** The pipeline uses substantial model judgment for localization and repair, and samples up to 42 patches per issue. The filtering increment is four tasks and does not include test-compute costs in the reported inference cost. The baseline systems differed in models, prompts, and procedures; no equal-budget dispatcher ablation is provided. Some closed-source systems scored higher, and the authors identified incomplete, misleading, or solution-bearing issue descriptions. This is a historical bounded repair result, not evidence that a static pipeline handles changing project dependencies.

### 2. A coded escalation rule can save compute—if patch correctness is known

In [Zhou et al., §§IV-F–IV-H and V-C–V-E](https://arxiv.org/html/2611.24324v1#S5.SS3), a trace-driven simulation combined GLM-4.7-Flash as first worker and GLM-4.7 as a cold-restart fallback, using the same mini-swe-agent scaffold. On **466** SWE-bench Verified tasks with complete traces, the best timeout point reported **73.4% resolved and 2,160 effective GPU-hours**, versus **71.2% and 2,585 GPU-hours** for the larger model alone: **16.4% less** estimated compute, with higher observed resolution. A simulated router using human difficulty labels reported 73.4% and 17.9% lower GPU-hours. The latter is an oracle for those difficulty labels, not an optimal oracle for per-task model success.

**Critical qualification:** The cascade escalates not only on timeout, empty patch, or syntax error, but also when the first patch **fails the benchmark's task tests**. Those tests provide outcome information unavailable to a normal runtime when hidden acceptance criteria do not exist; accepting every submitted patch or using only available tests could change both quality and savings. Results replay one recorded run per model/task, exclude 34 incomplete pairs, select the timeout on the same traces, and do not constitute a live end-to-end deployment. GPU-hours assume exclusive per-task allocation despite batched execution, not API dollars or measured total cluster consumption. The 120-minute cascade averaged **84.5 minutes** versus **41.6 minutes** for the large model alone. It tests worker escalation, not a planner–builder handoff; successful first-stage work is not handed to the larger worker.

### 3. A non-generative learned policy can allocate stronger advice selectively

[ARIA, §§3–5 and Tables 2–3](https://arxiv.org/html/2610.13870v1#S5) learns a 24-state tabular policy choosing whether to consult a stronger advisor at workflow contact points. The lower-cost Gemini 3 Flash executor retains responsibility for tools and implementation; Gemini 3.1 Pro supplies guidance. On a **50-task SWE-bench Verified-Mini test set**, averaged over three seeds, executor-only scored **18.0% at $11.48**, advisor-only **62.0% at $45.90**, and ARIA **48.0% at $22.09** per episode. An always-consult condition under the same four-call cap scored **34.0% at $21.39**; the heuristic condition scored **41.3% at $21.50**. The authors estimate that ARIA saves **$12.86** against a task-independent mixture interpolated to the same 48% success rate.

**Limits:** The policy is learned from separate training episodes, rather than being a simple hand-coded rule; its training and development expense is not included in the quoted evaluation cost. Realized cost is close to, not exactly equal to, always-consult; the equal-success mix is an interpolated reference rather than a separately run equal-budget arm. The test set is small, model pair and scaffold are fixed, and advice placement, not routine dispatch alone, is changed. A native LLM orchestrator remains present, so this does not show that model control can be removed altogether. It does show a useful division in which a worker implements while a non-generative policy selectively requests more expensive judgment.

### 4. Partial execution can inform economical model allocation

[SWE-Router, §§3 and 5 and Appendix B](https://arxiv.org/html/2607.00053v1#S5) has a cheaper agent explore for three turns; a fine-tuned Qwen2.5-Coder-7B classifier scores its partial trajectory, and a threshold decides whether to continue or restart a stronger Gemini 3 Pro agent from the original task. On the held-out SWE-bench Verified split, the authors report normalized cost–resolution **Route-AUC 0.780** for DeepSeek V3.2 → Gemini, **15.3 percentage points above** their prompt-only version; the GPT-5-mini → Gemini pair improved by 12 points over its strongest baseline. Curves are based on a threshold sweep, not a single precommitted production budget.

**Limits:** This is learned-model routing, not deterministic dispatch or a strong-planner/cheap-builder experiment. A threshold sweep and replayed trajectories establish an estimated frontier, not a guaranteed result at a chosen equal budget; the paper's theorem about ideal information does not guarantee a trained classifier improves every operating point. Escalation restarts rather than transferring investigation, and router training/serving overhead and distribution shift matter. It supports testing evidence-based escalation as an alternative to consulting a generative lead at each transition, not assuming such routing is free.

## Practical research implication

For an evaluation, compare a capable solo worker, the same worker with scripted checks and bounded retry/escalation, and a model-led controller, with the same acceptance criteria and a common total cost cap. Separately vary worker tier and whether a planner supplies the assignment. Report held-out success, total inference **and** test/compute cost, latency, retries, failed or missing gates, and human review. Use only checks actually available to the runtime for escalation; reserve hidden tests for final scoring. Include harder or cross-module work as well as bounded issue repair, because the evidence above does not establish that decomposition makes difficult work safe for cheaper builders.
