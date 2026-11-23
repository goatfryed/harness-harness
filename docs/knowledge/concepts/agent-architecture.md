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
**objective/driver** is a thin controller tasked to bring an objective to completion. utilizes slicer. hands off slices to workers 

**objective/slicer** is a smart planner that slices and conquers iteratively. extracts tasks towards the goal, refines them until actionable

**tasker** is a general purpose worker&synthesizer that plans & builds its solution itself and reviews itself with a second tasker after major work

**coding/change-worker** is a controller that oversees a well defined code change. utilizes solution-designer and programmer

**coding/solution-designer** is a smart planner that plans and designs the boundaries of an implementation task and synthesizes parts of the solution (e.g. external interfaces)

**coding/programmer** is a worker&snythesizer that implements an actual change

**coding/spike-worker** is a worker that tests a specific technical uncertainty with a small experiment or throwaway prototype. reports what worked, what didn't, and what remains unknown

**coding/scout** is a probe that explores the existing codebase. locates relevant code, traces how it fits together, and reports findings with file references without making changes

**researcher** is a probe&synthesizer that investigates a bounded question beyond the codebase. compares sources and summarizes the evidence, tradeoffs, and open questions
