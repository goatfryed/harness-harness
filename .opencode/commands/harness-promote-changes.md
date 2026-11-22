---
description: Promote changes into upstream
---

Identify changes that this harness contains that are not part of upstream.
Separate project specific aspects from general aspects.
Blocks annotated with harness/project streamlined/custom/specific indicate intended per project deviations.

First list all modifications to upstream governed features grouped by aspects.
Then list all new features that are candidates for promotion to upstream, because they cover general aspects.

Ask the user whether they want to promote all listed aspects or only specific.

Before applying changes, establish a clean PR worktree based on `upstream/main`as branch `harness/<topic>`. Use an existing upstream checkout if available; otherwise create a separate worktree. Don’t stash, reset, or switch the source worktree if it contains user changes. If a separate clean worktree isn’t feasible, ask the user before proceeding.
Then, prepare a PR branch of . Pick a fitting topic or use `improvements-<date>`
Apply picked changes. Prefer cherry pick, if possible. Amend necessary, straight-forward changes for generalization.

Request review by the user.
Highlight problematic spots.
Ask, if any other changes should be promoted.

## Project specialization
Use the worktree in`src/harness` as promotion worktree. Check that it's clean.
When you create the branch, set it up to track an identical named branch on `upstream`.
Commit changes in one or more logical groups. Then, ask the requester to compare the commited branch with the workspace worktree.
Once the user has approved the changes, merge into main and offer to run `harness-update.md`.

### excludes
- README.md
- .devcontainer/base/devcontainer-lock.json
