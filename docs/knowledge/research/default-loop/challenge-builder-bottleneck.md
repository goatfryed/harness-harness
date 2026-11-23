---
topic: Challenge to a mid-tier coding builder default
date: 2026-11-23
---

# Challenge: the builder may be the bottleneck

**Question.** On coding work, is the best use of a stronger model a separate planner, or should capability and compute go to implementation and verification instead? This is an independent challenge to the [default loop](../../concepts/default-loop.md), using three primary studies not analyzed in its two companion notes. Evidence reviewed through 2026-11-23. None directly compares strong-planner/mid-tier-builder against strong solo under the same total dollar cap, so none establishes a universal replacement.

## Bottom line

There are **observed implementation and tool-use failures**, not just missing planner evidence. In long-horizon SWE-EVO, a stronger solo coding model substantially outperformed its smaller family member, while the latter's failed trajectories included incorrect implementations. In a fixed-scaffold repair study, a small model almost never solved the hardest cases, while its larger counterpart solved some. Extra candidate execution and selection can also outperform additional model-based judgment in a specific fixed-sample experiment.

These results challenge making a mid-tier builder the starting point for *all* nontrivial work: a capable solo builder and stronger implementation deserve to be baseline arms, including before a worker has repeatedly failed. They do **not** refute the concept's existing caveats about stronger builders, small tasks, or uncertainty-driven planning; nor do they isolate the value of a separately supplied good plan.

## Evidence and actual failures

### 1. Smaller solo agents fail at the work, not merely the plan [1]

SWE-EVO tests 48 release-to-release evolution tasks across seven Python repositories, averaging about 21 changed files and 874 tests per task. Using the same SWE-agent scaffold, medium reasoning and a 100-call cap, with release notes plus linked PR/issue context, GPT-5 resolved **20.83% (10/48)** versus GPT-5-mini **10.42% (5/48)**; GPT-5-nano resolved **4.17% (2/48)**. Under OpenHands, the corresponding figures were **18.75%, 10.42%, and 4.17%**, with a 100-iteration cap. Stronger solo was better here, not necessarily cheaper.

The authors' automated analysis of unresolved SWE-agent trajectories reports GPT-5-mini failures including both **incorrect implementation and instruction following**, and nano failures including **tool misuse and syntax errors**. Kimi-K2's failures were about **70% incorrect implementation**, despite little tool-use failure. This makes “give a clear plan to a cheaper worker” a substantive risk: an agent can understand how to operate the interface yet write the wrong behavior. Conversely, GPT-5's own failures were **over 60% instruction-following** according to the classifier, so stronger implementation alone is no cure for misunderstood requirements.

**Limits.** A GPT-5-mini judge assigned a single label using only each failed trajectory's last 20 turns; labels are not a causal diagnosis or independent human audit. This is a small Python-only historical benchmark; model costs were not equalized, and stronger solo is not compared against a strong external planner. The paper's abstract describes 21% as OpenHands, but its Table 2 assigns **20.83% to SWE-agent** and **18.75% to OpenHands**; the table values are used above.

### 2. Hard-task model swap: a worker capability gap, with a warning about verification [2]

An AMD-affiliated study ran 36 open-weight models with a fixed mini-SWE-agent prompt, tools, 250-step limit and two-hour per-task limit on SWE-bench Verified. For GLM-4.7-Flash versus GLM-4.7, resolution was **62% vs 77%** on 194 easy tasks, **36% vs 68%** on 261 medium tasks, and **2% vs 36%** on 45 hard tasks, with difficulty based on human estimated repair time. Thus in this pair the smaller builder failed almost all hard tasks; same scaffold and task set make a model swap a meaningful comparison, but the model change affects investigation and reasoning as well as editing.

Their trace-simulated small-first, large-fallback policy on **466 tasks with complete paired traces** scored **73.4%** vs **71.2%** for large-only and reduced estimated GPU-hours **16.4%**. However, the policy accepts a small-model patch only if it passes the benchmark's task tests and otherwise cold-restarts the larger agent. **Those success tests are not normally available as an oracle in deployment.** It is not evidence that a timeout alone detects wrong-but-plausible patches. At the 120-minute first-stage timeout average sequential runtime rose from **41.6 to 84.5 minutes**; GPU-hour accounting assumes exclusive allocation per task even though runs were batched. Each model/task was sampled once; the apparent advantage in accuracy may be noise. This is a quality-matched cost comparison, not an equal-dollar comparison to planner separation.

### 3. Spend on alternative implementations and checks, not necessarily another judge [3]

SWE-Replay samples **ten candidate trajectories per issue**, using existing repository regression tests to filter trajectories, replaying selected intermediate states, and an Agentless-style selection procedure to submit a patch. On SWE-bench Verified with mini-SWE-agent and Gemini-2.5-Pro, replay achieved **60.2% at $1.32/problem**, versus ten fresh trajectories at **58.0% at $1.52/problem**. With Gemini-3-Pro it achieved **75.6% at $2.38**, versus **75.4% at $2.88**. These are **2.2 and 0.2 percentage points**, not the paper's relative percentage improvements; costs include modeled prompt caching.

An especially concrete failure of added judgment appears in a **50-task Verified-mini ablation**, with Live-SWE-agent and Devstral-Small-2: using an LLM judge to select replay steps scored **54% at $3.31/problem**, versus heuristic replay **60% at $1.52**. The judge cost **$1.87/problem** itself. The authors' example also shows repeated fresh trajectories fixating on `message.py`, while a replay explored `utils.py` and fixed the underlying problem.

**Limits.** Ten attempts is a fixed *sample count*, not an equal dollar cap; replay's lower cost reflects prefix sharing and cached pricing. The judge chooses branching steps, not a strong task planner, and the 50-task ablation is small. Candidate selection and regression coverage are imperfect: passing existing tests does not prove a candidate implements the requested change, and filtering out a trajectory with regressions can discard a promising path. This study supports a verification/exploration budget as a serious alternative, not a universal claim that planning is wasteful.

## Practical falsification test

For the same repository tasks, prompt, tools, acceptance tests, time and **total inference budget**, compare (A) one capable solo agent including its own investigation and checks, (B) a strong planner plus mid-tier builder, (C) the same plan handed to a stronger builder, and (D) a capable builder given the remaining budget for independent attempts and test-based selection. Include planning, reports, retries, selection and integration in spend. Blind held-out tests must not be exposed to the candidate selector.

Record incorrect edits despite correct plans, missed requirements, tool failures, false-positive checks, regressions, and tasks that exhaust budget. Compare accepted quality at equal cap and total cost at equal quality; a plan-quality review alone cannot establish that the builder can execute it. Include cross-file evolution as well as localized fixes, and stratify by task ambiguity and verification strength. This is a proposed experiment, not a finding from these papers.

## Primary sources

1. Pham et al., [*SWE-EVO: Benchmarking Coding Agents in Long-Horizon Software Evolution Scenarios*](https://arxiv.org/html/2512.18470v3), preprint v3, 2026-01-09, §4, Tables 2–3 and Figure 6.
2. Zhou et al., [*Reducing Inference Cost of Coding Agents with Timeout Cascades*](https://arxiv.org/html/2611.24324v1), preprint v1, 2026-11-18, §§IV–VI and Table I. AMD-affiliated authors; trace-driven simulation, not a live deployment.
3. Ding and Zhang, [*SWE-Replay: Efficient Test-Time Scaling for Software Engineering Agents*](https://arxiv.org/html/2601.22129v2), preprint v2, 2026-02-05, §§2–4, Tables 1 and 4.
