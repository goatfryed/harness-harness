# Default loop: thin orchestrator, strong planner, mid-tier builder

**Status:** Starting assumption, not a settled architecture decision.  
**Recorded:** 2026-11-23

For nontrivial software work, start with a **thin orchestrator, a strong planner, and a mid-tier builder**. Keep the orchestrator simple about *what to do next* and strict about *what must be enforced*.

- **Orchestrator:** Dispatch eligible work, track results, and enforce scope, budgets, and required checks. Route substantive failures back to the person or agent who can resolve them. Reaching a limit is not success.
- **Planner:** Decide what to do once there is enough evidence to make a useful plan. Bring it back when a key assumption breaks, dependencies change, or scope needs revisiting—not after every handoff.
- **Builder:** Own local implementation decisions and run the relevant checks. If it repeatedly struggles with a clear, well-understood assignment, try a stronger builder before paying for another planning round.

**Rule of thumb:** Spend more on planning when the next step is unclear; spend more on building when it is clear but hard.

For small, clear tasks, skip the separate planner: let one capable agent plan, build, and verify. These are responsibilities, not mandatory roles or model calls.

## Evidence behind the assumption

[Thin orchestration and smart planners](../research/thin-orchestration-smart-planners.md) records cases where a stronger planner improved a fixed coding worker and cases where cheaper implementers either saved money or reduced quality. [Adaptive model leads](../research/adaptive-model-leads.md) compares one-shot, exception-triggered, and ongoing guidance. Together, they make this a reasonable default to test, not a fixed model-tier policy.

The [default-loop evidence review](../research/default-loop/synthesis.md) links all eight supporting and challenging research notes and summarizes where this starting assumption holds up and where it breaks down.
