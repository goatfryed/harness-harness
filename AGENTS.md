# AGENTS.md
## Shared terminology

### Human roles

- **Developer:** The human using the harness to steer and carry out development work.
  Use this instead of “user” or “requester” when you mean that person.
- **Objective owner:** The person with final say on the objective's direction and acceptance.
  Use this term when that authority needs to be explicit.

When asking for human input, name the role and what you need: a developer decision, artist feedback, or designer sign-off.
Ask for approval only from the role that owns that decision.

### Work units

- **Objective:** An evolving goal that may start out fuzzy and span several tasks.
- **Task:** A bounded assignment with a concrete expected outcome.
- **Slice:** A task that advances an objective.

### Agent roles

These roles describe the work an agent takes on, not its name.
An agent can fill more than one role.

- **Probe:** Investigates a bounded question and reports evidence without changing the project.
  If answering the question requires an experiment or project change, define a spike task instead.
- **Planner:** Defines what work needs to be done, including the boundaries and expected outcomes.
- **Controller:** Coordinates work by assigning it, tracking results, and escalating decisions.
- **Worker:** Delivers the outcome of a bounded assignment.

## Project checkouts and worktrees

The primary checkout is the developer's normal workspace for a project.
Look for it at `src/{project}` or `src/{project}.primary`.

Use the checkout assigned for the task, and do not edit other checkouts unless the developer asks.
If no checkout is assigned and it is unclear where changes belong, ask before editing.

Create a worktree when a change needs to run alongside other edits or be reviewed and integrated separately.
Use one worktree per independently integrated change, not per agent.
Read-only investigations can use an existing checkout.

Keep slice worktrees alongside the primary checkout and name them `src/{project}.{slice-slug}`.
When assigning work, record the checkout path and starting commit so the developer can inspect and compare changes while work is in progress.
Keep the worktree until the result is integrated or the developer confirms it can be removed.