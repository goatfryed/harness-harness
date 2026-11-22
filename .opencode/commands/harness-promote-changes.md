---
description: Promote changes into upstream
---

Identify changes in this harness that are not in upstream. Separate project-specific aspects from general aspects. Treat blocks annotated like `harness-streamlined`, `project-specific`, `harness-customization` as project-specific deviations.

First list modifications to upstream-governed features, grouped by aspect. Then list new features that may be candidates for upstream because they address general needs. Ask the user which aspects to promote.
Offer a concise, numbered list.

Before applying changes, establish a clean PR worktree based on `upstream/main`. Use an existing clean upstream checkout if available; otherwise create a separate worktree. Do not stash, reset, or switch a source worktree that contains user changes. If a clean PR worktree is unavailable, ask the user before proceeding.

Create `harness/<topic>` from `upstream/main` as a local branch **without upstream tracking**. Pick a fitting topic or use `improvements-<date>`.

Apply the selected changes verbatim, preferring cherry-picks where possible; otherwise create and apply patches, where possible. If both are not possible, edit yourself.
Never reword, fix typos, refactor, or generalize them during promotion. If a change cannot be applied as-is, stop and ask the user. Propose any necessary, straightforward generalizations separately; apply them only if approved.

Review the diff of all touched files and their project version.

Request the user's review, highlight potentially problematic spots, and ask whether they want any other changes promoted.

## Project specialization
Use the worktree in`src/harness` as promotion worktree. Check that it's clean.
When you create the branch, set it up to track an identical named branch on `upstream`.
Commit changes in one or more logical groups. Then, ask the requester to compare the commited branch with the workspace worktree.
Once the user has approved the changes, merge into main and offer to run `harness-update.md`.

### excludes
- README.md
- .devcontainer/base/devcontainer-lock.json
