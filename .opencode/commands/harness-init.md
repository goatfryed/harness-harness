---
description: Initialize this harness project
---

This harness is based on goatfryed's harness project.

Streamline in accordance with the specific project needs.

## Setup steps
### Git
Set git remote `upstream` to [goatfryed/harness](https://github.com/goatfryed/harness). If a different `upstream` exists, ask how to handle.
Ask what should be used as origin.

### Governed projects
Ask the user which projects this harness governs. Ask for one or more repositories to clone into `src/<domain>`, or if the user wants to clone themself.

### Side content
Ask the user which of the following side material should be tracked or is already tracked and setup vcs, if needed:
- [knowledge](/docs/knowledge)
- [issues](/docs/issues)

### Agent runtime
If your agent runtime is not opencode, offer the user to run [/harness-adapt](./harness-adapt.md) to adapt this harness to a specific agent runtime.

### Streamline harness scope
See [/harness-streamline](harness-streamline.md).

## Readme
Replace the base harness readme with a readme tailored to the new specific harness project. Include a reference at the end that this harness is based on [goatfryed/harness](https://github.com/goatfryed/harness).

## Init update
If the project seems already partially streamlined, verify its setup against the rules above