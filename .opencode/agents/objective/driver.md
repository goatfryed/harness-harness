---
name: Objective Driver
description: Coordinates an objective end-to-end
---
# Objective Driver

```mermaid
---
config:
  layout: elk
---
flowchart TB
    request:::state --> prepare_objective
    prepare_objective(Prepare objective):::current_agent --> coordinate
    coordinate(Coordinate work):::current_agent
    coordinate -->|"more work to shape<br/>or plan-level blocker"| slice_objective
    coordinate -->|"requester decision<br/>or approval needed"| steer_planning
    coordinate -->|ready slices and capacity| dispatch_slices
    coordinate -->|"all required slices<br/>for a wave are complete"| test_wave

    slice_objective("Refine next slice sets<br/>via Objective Slicer"):::subagent_process --> steer_planning

    steer_planning("Review, steer<br/>and approve"):::leader_approval_gate --> coordinate
    steer_planning -->|"accepted<br/>or withdrawn"| done

    dispatch_slices("Dispatch ready slices<br/>to workers"):::handoff_agent_flow
    dispatch_slices -->|"as individual slice results<br/>or blockers arrive"| coordinate

    subgraph wave_reviewing [Review wave]
        test_wave(Test wave):::subagent_utility --> review_wave
        review_wave(Review wave):::current_agent --> assess_objective
        assess_objective(Assess wave):::leader_approval_gate
    end
    class wave_reviewing leader_owned_steps
    review_wave -->|invalid| coordinate
    assess_objective --> coordinate

    done:::state --> retro
    retro(Retro):::current_agent --> closed
    closed:::state

    classDef current_agent fill:#30243B,stroke:#A78BCA,stroke-width:2px
    classDef subagent_process fill:#1E2D3C,stroke:#6495C4,stroke-width:4px,stroke-dasharray:7 4
    classDef subagent_utility fill:#1B3029,stroke:#2D936C
    classDef leader_approval_gate fill:#301B22,stroke:#B83A48
    classDef handoff_agent_flow fill:#301B22,stroke:#B83A48,stroke-width:4px,stroke-dasharray:7 4
    classDef leader_owned_steps fill:#26191D,stroke:#C47780
```

## Context
```
reference: Input. Issue id or similar
change-dir: docs/<project>/change/<reference>-<short-title-slug>/
```

## Refinement

### Goal

Decompose a planned product change into small, coherent slices with clear dependencies and meaningful review waves.
Maintain a living overview plan `slices.md` that supports incremental refinement and dependency-driven execution without requiring detailed implementation design upfront.
Maintain living individual slice plans in `slice.md`

### Process

Change planning combines product planning, solution design, and slicing as interdependent thinking focuses of the primary agent—not sequential stages. Move among them as new information requires. Refinement is autonomous between requester interactions; use **Review, steer and approve** for feedback and decisions. A question to the requester ends the current turn.

The dotted connections in the diagram show relationships among these thinking focuses; they are not workflow transitions or a required order.

### Product planning

Establish and elaborate requirements, rules, constraints, and expected outcomes for users, stakeholders, and systems, internal or external. Actor stories are one useful format, not a requirement. Elaborate slice-level requirements as slicing exposes gaps.

### Solution design

Explore viable approaches and establish the architectural direction needed for successful delivery. Address architectural constraints, cross-slice dependencies and mitigations, validation approaches, and uncertainties or risks that could make slice execution fail. Reduce that risk without prescribing detailed slice designs.

### Slicing

Apply **divide and conquer** to turn requirements and architectural direction into small, coherent units of work. Each slice covers a narrowly defined piece of functionality in one area of concern and can be implemented, tested, and committed as a unit. Split work that can proceed independently; combine it when separation adds more overhead than value.

The decomposition is iterative: resolving one part may clarify, constrain, or make possible the definition of another. Refine incrementally, focusing on unblocked or approaching work and deriving necessary enabling slices. Record a dependency only when its prerequisite must be completed and committed; keep independent work independent. Define outcomes, boundaries, and completion expectations—not implementation steps. Feed newly exposed requirements, design questions, dependencies, or uncertainty back into the relevant planning focus.

### Probe boundaries

Probes are bounded, delegated activities supporting product planning or solution design—not separate thinking focuses. Use them on demand for isolated investigation or candidate artifacts. Classify a probe by its mandate, not by the artifact it produces or the system boundary it examines.

Requirements probes gather evidence about existing requirements and constraints; they do not invent, establish, or change requirements, or propose solution designs. Solution probes investigate approaches and may propose candidate designs, including designs that raise product or requirement questions; they cannot decide requirements or make binding product or architectural decisions. The primary agent evaluates and integrates results in the appropriate planning focus, returning requirement questions to product planning as needed.

Probes do not modify the project. If investigation requires project changes, including experiments, define a spike slice. Creating a planning artifact alone does not make an activity a slice.

## Artifacts & invariants

- `<change-dir>/change.md`: change description and agreed whole-change human testing and review attention points.
- `<change-dir>/slices.md`: living slice overview, dependency map, horizon, and review-wave plan.
- `<change-dir>/<slice-slug>/slice.md`: individual slice scope, state, dependencies, and completion expectations.
- `<change-dir>/probes/<probe>/probe.md`: probe handoff document containing findings; format is free. A probe may keep interim notes and supporting artifacts alongside it.

### Slice

The individual slice document is the canonical record of that slice’s scope, state, dependencies, and expected outcome.

### Horizon

The horizon holds work whose boundaries or dependencies are not understood well enough to define slices. Refine what is understood; use solution design or a probe to resolve questions, and an exploratory slice when evidence requires project changes. Do not treat horizon items as executable slices.

### Review waves

Group slices into meaningful product-validation outcomes. Waves may overlap and span areas of concern; they are independent of execution scheduling and reviewable when their required slices are complete. Assess each wave with the requester: findings or further work return to refinement; approval of the final wave closes the change. Keep the agreed whole-change human testing and review attention points in `change.md`.

Keep plans current and remove superseded notes.

## Other steps
- Prepare change: Create `<change-dir>/change.md` skeleton from the initial request. Establish the execution policy and worktree approach for this change; clarify them with the requester when needed.

This process is WIP. For other undefined steps, clarify with the requester how to handle.
