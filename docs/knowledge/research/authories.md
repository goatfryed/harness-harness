---
topic: Authorities and sources for agentic software development
date: 2026-11-22
summary: |-
  A curated directory of 24 researchers, practitioners, vendor engineering
  teams, and open projects or evaluation organizations relevant to coding
  agents. It links each entry to a concrete starting point, identifies
  source biases and evidence limits, and records when relevance was checked.
  The list is a research starting point, not a definitive ranking or an
  endorsement of particular agent architectures.
---

# Authorities and sources: agentic software development

**Selection:**  This is a curated, unranked list of certain authorities on agent developt. It is not a reproducible popularity ranking or a claim that these are objectively the world's top authorities. Categories describe the main reason for inclusion; several entries fit more than one. People and organizations are distinct entries even where their work overlaps.

**Relevance check:** The date in the table means we checked for a relevant primary work or project on that date. It is not a guarantee that an author is currently active, an affiliation remains unchanged, every linked page was independently audited in depth, or all their claims are correct. Vendor sources can have commercial incentives; personal accounts are usually practical experience rather than controlled studies.

Producing work on agents establishes topical connection, not by itself prominence or adoption. The entries below identify external uptake, recognition, relevant prior experience, or specific evidence gaps. These signals are not measures of correctness; a named user or research use does not establish widespread adoption.


## Summary

| Name | Category | Short description | Last relevance check |
|---|---|---|---|
| [Carlos E. Jimenez](#carlos-e-jimenez) | Researcher | SWE-bench and SWE-agent contributor. | 2026-11-22 |
| [John Yang](#john-yang) | Researcher | Coding-agent interfaces and evaluation. | 2026-11-22 |
| [Graham Neubig](#graham-neubig) | Researcher | Open coding agents and evaluation. | 2026-11-22 |
| [Shunyu Yao](#shunyu-yao) | Researcher | Reasoning-and-action agents and evaluation. | 2026-11-22 |
| [Daniel Kang](#daniel-kang) | Researcher | Agent evaluation and test quality. | 2026-11-22 |
| [David Rein](#david-rein) | Researcher | Agent evaluation and holistic code quality. | 2026-11-22 |
| [Simon Willison](#simon-willison) | Practitioner | Agentic engineering patterns and testing. | 2026-11-22 |
| [Birgitta Böckeler](#birgitta-böckeler) | Practitioner | Coding-agent harnesses and human steering. | 2026-11-22 |
| [Mitchell Hashimoto](#mitchell-hashimoto) | Practitioner | Personal coding-agent adoption and feedback. | 2026-11-22 |
| [Armin Ronacher](#armin-ronacher) | Practitioner | Hands-on agent workflows and tooling. | 2026-11-22 |
| [Mario Zechner](#mario-zechner) | Practitioner | Minimal coding-agent design and Pi. | 2026-11-22 |
| [Geoffrey Huntley](#geoffrey-huntley) | Practitioner | Repeated autonomous coding loops. | 2026-11-22 |
| [Anthropic Engineering](#anthropic-engineering) | Vendor | Agent workflows, harnesses and evaluations. | 2026-11-22 |
| [OpenAI Engineering](#openai-engineering) | Vendor | Codex agent loop and harness practice. | 2026-11-22 |
| [Google Research](#google-research) | Vendor | Research on agent scaling and coordination. | 2026-11-22 |
| [GitHub Engineering](#github-engineering) | Vendor | Copilot harness evaluation across tasks. | 2026-11-22 |
| [Microsoft Research](#microsoft-research) | Vendor | Coding-agent evaluation and trajectories. | 2026-11-22 |
| [Cognition](#cognition) | Vendor | Coding-agent context and multi-agent tradeoffs. | 2026-11-22 |
| [SWE-bench](#swe-bench) | Project / evaluation | Repository-level coding benchmark and artifacts. | 2026-11-22 |
| [SWE-agent](#swe-agent) | Project / evaluation | Open agent and agent–computer interfaces. | 2026-11-22 |
| [OpenHands](#openhands) | Project / evaluation | Open coding-agent implementation and benchmarks. | 2026-11-22 |
| [Aider](#aider) | Project / evaluation | Open coding assistant and editing benchmark. | 2026-11-22 |
| [METR](#metr) | Project / evaluation | Independent agent capability and productivity research. | 2026-11-22 |
| [mini-SWE-agent](#mini-swe-agent) | Project / evaluation | Minimal coding-agent reference implementation. | 2026-11-22 |

## Researchers

### Carlos E. Jimenez

[Profile](https://closji.com/) · [SWE-bench, ICLR 2024](https://proceedings.iclr.cc/paper_files/paper/2024/hash/edac78c3e300629acfe6cbe9ca88fb84-Abstract-Conference.html)

Co-led [SWE-bench](#swe-bench) and [SWE-agent](#swe-agent).

### John Yang

[Profile and publications](https://john-b-yang.github.io/) · [SWE-agent, NeurIPS 2024](https://proceedings.neurips.cc/paper_files/paper/2024/hash/5a7c947568c1b1328ccc5230172e1e7c-Abstract-Conference.html)

Co-led SWE-agent and SWE-bench. [OpenAI's Verified subset](https://openai.com/index/introducing-swe-bench-verified/) demonstrates uptake of the benchmark family; this does not independently establish adoption of SWE-agent's particular interface.

### Graham Neubig

[Profile](https://www.phontron.com/) · [OpenHands paper](https://arxiv.org/abs/2407.16741)

Co-authored the OpenHands paper. Researchers at NVIDIA used OpenHands among the agents generating [Open-SWE-Traces](https://huggingface.co/datasets/nvidia/Open-SWE-Traces), evidence of research use rather than production adoption. Neubig is connected to the OpenHands ecosystem.

### Shunyu Yao

[Profile](https://ysymyth.github.io/) · [ReAct project, ICLR 2023](https://react-lm.github.io/)

Co-authored ReAct and SWE-agent. [IBM's explanation of ReAct agents](https://www.ibm.com/think/topics/react-agent) is an external example of the pattern being discussed and taught. ReAct is broader than coding; this recognition does not establish its superiority for coding agents.

### Daniel Kang

[Profile](https://ddkang.github.io/) · [UTBoost, ACL 2025](https://aclanthology.org/2025.acl-long.189/)

Co-authored UTBoost on weak coding-agent tests; the subsequent [SWE-ABS preprint](https://arxiv.org/html/2603.00520v1) cites and compares against that work. This is evidence of research attention, not production adoption or proof of a general result.

### David Rein

[METR profile](https://metr.org/team/david-rein/) · [Algorithmic vs. holistic evaluation, 2025](https://metr.org/blog/2025-08-12-research-update-towards-reconciling-slowdown-with-time-horizons/)

Contributed to METR's holistic-evaluation research and co-authored its [experienced-developer productivity study](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/), which drew [external practitioner discussion](https://blog.stdlib.io/reflection-on-the-metr-study-2025/). The study covers early-2025 tools; METR now cautions that its results are outdated as a measure of current AI productivity.

## Practitioners and bloggers

### Simon Willison

[Weblog](https://simonwillison.net/) · [Agentic Engineering Patterns](https://simonwillison.net/guides/agentic-engineering-patterns/)

[PyCon's speaker profile](https://us.pycon.org/2025/speaker/profile/26/) identifies him as a Django co-creator and creator of Datasette and LLM, with a programming blog dating to 2002. His *Agentic Engineering Patterns* guide covers agent loops, testing, and review; treat its practices as experience, not controlled comparisons.

### Birgitta Böckeler

[Personal site](https://birgitta.info/) · [Harness engineering for coding agent users](https://martinfowler.com/articles/harness-engineering.html)

Former Thoughtworks Distinguished Engineer with over 20 years of experience in software development, architecture, and technical leadership; [Thoughtworks now lists her as an alumna](https://www.thoughtworks.com/profiles/b/birgitta-bockeler). She has presented on coding agents at [QCon](https://www.infoq.com/presentations/ai-coding-agents/) and publishes extensively on AI-assisted delivery. Her harness framework is practitioner analysis, not a controlled evaluation.

### Mitchell Hashimoto

[Personal site](https://mitchellh.com/) · [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey)

HashiCorp cofounder and creator of developer tools including [Vagrant and Terraform](https://www.hashicorp.com/en/blog/authors/mitchell-hashimoto). His linked account describes his coding-agent workflow; prior infrastructure experience does not establish adoption of that particular workflow.

### Armin Ronacher

[Weblog](https://lucumr.pocoo.org/) · [Agentic Coding Recommendations](https://lucumr.pocoo.org/2025/6/12/agentic-coding/)

Original creator of Flask and Jinja, as credited by [Pallets](https://palletsprojects.com/people/mitsuhiko/), and author of the linked coding-agent recommendations. His established framework work does not establish uptake of those recommendations; note his affiliation with Earendil when assessing product claims.

### Mario Zechner

[Personal site](https://mariozechner.at/) · [Building an opinionated and minimal coding agent](https://mariozechner.at/posts/2025-11-30-pi-coding-agent/)

Creator of the Pi coding agent and the libGDX game-development framework. Pi's agent framework has been used by [OpenClaw](https://lucumr.pocoo.org/2026/1/31/pi/); a [May 2026 independent report](https://www.implicator.ai/pi-is-not-a-claude-code-rival-it-is-a-harness-rebellion/) recorded about 45,000 GitHub stars for its repository. Stars indicate interest, not active users. His linked implementation account explains tool and context-management choices; Pi has commercial connections, and its design is not evidence of universal superiority.

### Geoffrey Huntley

[Weblog](https://ghuntley.com/) · [Ralph Wiggum as a “software engineer”](https://ghuntley.com/ralph/)

Created and documented the Ralph Wiggum coding technique, a repeated agent loop described in the linked 2025 article. Its relevance extends beyond his own writing: [another developer's Ralph for Claude Code](https://github.com/frankbria/ralph-claude-code) implements and credits the technique, and [HumanLayer's history](https://www.humanlayer.dev/blog/brief-history-of-ralph) documents its spread and an Anthropic plugin inspired by it. These examples establish external uptake, not how many people use it or whether it works reliably. His reported results are personal experience; unattended execution is not itself evidence of safety or correctness.

## Vendor engineering and research

### Anthropic Engineering

[Engineering hub](https://www.anthropic.com/engineering) · [Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)

Built Claude Code and published the linked harness case study. [Ramp's vendor-published customer account](https://claude.com/customers/ramp) describes engineering use of Claude Code; it is a selected case, not independent validation of productivity claims.

### OpenAI Engineering

[Engineering article](https://openai.com/index/unrolling-the-codex-agent-loop/) · [Harness engineering](https://openai.com/index/harness-engineering/)

Built Codex and published descriptions of its loop and context management. [OpenAI's Datadog customer account](https://openai.com/index/datadog/) describes Codex in pull-request review; this vendor-selected case is not independent proof of effectiveness.

### Google Research

[Research hub](https://research.google/) · [Towards a science of scaling agent systems](https://research.google/blog/towards-a-science-of-scaling-agent-systems-when-and-why-agent-systems-work/)

Published the linked empirical comparison of agent architectures, reporting 180 configurations across tasks. This demonstrates relevant research activity, not adoption of a particular architecture; check the study's task types before transferring results to coding.

### GitHub Engineering

[GitHub Blog](https://github.blog/) · [Evaluating the GitHub Copilot agentic harness](https://github.blog/ai-and-ml/github-copilot/evaluating-performance-and-efficiency-of-the-github-copilot-agentic-harness-across-models-and-tasks/)

Builds GitHub Copilot and published the linked harness evaluation. [ZoomInfo's engineering account](https://engineering.zoominfo.com/experience-with-github-copilot-for-developer-productivity-at-zoominfo) describes a Copilot trial and rollout; it concerns an earlier assistant, not necessarily today's agentic harness.

### Microsoft Research

[Research hub](https://www.microsoft.com/en-us/research/) · [AgentLens: the lucky-pass problem](https://www.microsoft.com/en-us/research/publication/agentlens-revealing-the-lucky-pass-problem-in-swe-agent-evaluation/)

Published AgentLens research examining 1,815 agent trajectories beyond final pass/fail results. This shows relevant empirical work; external uptake of AgentLens was not established here. Microsoft also has commercial developer-AI interests.

### Cognition

[Engineering blog](https://cognition.com/blog) · [Don't Build Multi-Agents](https://cognition.com/blog/dont-build-multi-agents) · [Multi-Agents: What's Actually Working](https://cognition.com/blog/multi-agents-working)

Builds Devin and published the linked accounts of context fragmentation and multi-agent coding. Its [Nubank customer case](https://devin.ai/customers/nubank) describes refactoring use, but is vendor-published. Read both engineering posts rather than treating the earlier title as a permanent position.

## Open projects and evaluation organizations

### SWE-bench

[Project and leaderboard](https://www.swebench.com/) · [Benchmark repository](https://github.com/SWE-bench/SWE-bench) · [Experiment artifacts](https://github.com/swe-bench/experiments)

Real-repository benchmark used by [OpenAI](https://openai.com/index/introducing-swe-bench-verified/) and [Anthropic](https://www.anthropic.com/research/swe-bench-sonnet) in model evaluations. Its tests and task distribution cannot measure every aspect of maintainable software; OpenAI collaborated on Verified.

### SWE-agent

[Repository](https://github.com/SWE-agent/SWE-agent) · [Agent–computer interface documentation, v0.7](https://swe-agent.com/0.7/background/aci/)

Open implementation of a software agent. NVIDIA lists it among the agents used to generate [Open-SWE-Traces](https://huggingface.co/datasets/nvidia/Open-SWE-Traces), demonstrating research use. The cited interface documentation is version-specific, not necessarily current behavior.

### OpenHands

[Repository](https://github.com/OpenHands/OpenHands) · [Benchmark infrastructure](https://github.com/OpenHands/benchmarks)

Open agent implementation and evaluation ecosystem. NVIDIA lists OpenHands among the agents used to generate [Open-SWE-Traces](https://huggingface.co/datasets/nvidia/Open-SWE-Traces); this shows research use, not necessarily production adoption. The project also has a commercial platform.

### Aider

[Project site](https://aider.chat/) · [Polyglot benchmark methodology](https://aider.chat/2024/12/21/polyglot.html)

Open coding assistant with its own Polyglot editing benchmark. [GraphFrames maintainer Sem Sinchenko](https://semyonsinchenko.github.io/ssinchenko/post/aider_2026_and_other_topics/) describes using Aider for small, reviewed changes—one practitioner's experience, not a prevalence measure.

### METR

[Research](https://metr.org/research/) · [Experienced developer productivity study, 2025](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/)

Nonprofit evaluator whose [external testing work for OpenAI](https://openai.com/index/strengthening-safety-with-external-testing) demonstrates engagement by a major model developer. Its linked productivity study concerns early-2025 tools; METR now warns that those historical results no longer reflect current AI productivity.

### mini-SWE-agent

[Repository](https://github.com/SWE-agent/mini-swe-agent) · [SWE-bench leaderboard](https://www.swebench.com/)

Small open coding-agent implementation used by NVIDIA to generate [Open-SWE-Traces](https://huggingface.co/datasets/nvidia/Open-SWE-Traces). This is research uptake, not proof of broad production use; leaderboard outcomes depend on model, version, budget, and setup.
