---
description: Promote changes into upstream
---

Identify changes that this harness contains that are not part of upstream.
Separate project specific aspects from general aspects.

First list all modifications to upstream governed features grouped by aspects.
Then list all new features that are candidates for promotion to upstream, because they cover general aspects.

Ask the user whether they want to promote all listed aspects or only specific.

Ensure a clean worktree with the user.
Then, prepare a PR branch of `upstream/main`as `harness/<topic>`. Pick a fitting topic or use `improvements-<date>`
Apply picked changes. Prefer cherry pick, if possible. Amend necessary, straight-forward changes for generalization.

Request review by the user.
Highlight problematic spots.
Ask, if any other changes should be promoted.
