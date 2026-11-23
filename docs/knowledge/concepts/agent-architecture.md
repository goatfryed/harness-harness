# Initial Architecture
## definitions

### material

**objective** fuzzy, general, rough goal. idea/feature/initiative/epic. larger size. often initially blurry

**task** has a concrete work or output expectation . might be research question, spike, code change, or others

**slice** task within and towards an objective

### roles

**probe** investigates, collects evidence, collects knowledge

**synthesizer** produces value-add artifacts 

**controller** is an agent that supervises agent  work and controls its work mainly through delegation

**worker** is an agent responsible to complete a task with a specified objective and scope

**planner** is an agent that creates a well defined task with clear boundaries to reduce implementation conflicts and steer solution sanity

**reviewer** reviews work and provides feedback

## agents
**objective/driver** is a thin controller that drives an objective to completion. delegates planning to the slicer, dispatches slices to workers, and sends plan-level blockers back to the slicer

**objective/slicer** iteratively turns fuzzy objectives into actionable slices. isolates key unknowns and creates enabler slices to resolve them, unblock work, and reveal what’s next.

**tasker** is a general-purpose worker&synthesizer that plans and builds its own solution. checks it against the task's expectations and gets a second tasker to review major work

**coding/change-worker** is a controller that owns delivery of a well-defined code change. delegates design to the solution-designer and coding to the programmer. verifies it meets task criteria

**coding/solution-designer** is a smart planner that sets implementation boundaries and designs key parts (e.g. shared interfaces). leaves local decisions to the programmer

**coding/programmer** is a worker&synthesizer that implements a scoped change. owns local decisions, runs relevant checks, and flags anything that needs a redesign or scope change

**coding/spike-worker** is a worker that tests a specific technical uncertainty with a small experiment or throwaway prototype. reports what worked, what didn't, and what remains unknown

**coding/scout** is a probe that explores the existing codebase. locates relevant code, traces how it fits together, and reports findings with file references without making changes

**researcher** is a probe&synthesizer that investigates a bounded question beyond the codebase. compares sources and summarizes the evidence, tradeoffs, and open questions
