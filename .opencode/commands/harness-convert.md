---
description: Convert the harness to a new agent runtime
---

Ask the user which agent runtime they use such as opencode, copilot, cursor or others. This harness is tailored to opencode by default.
Convert the harness setup to the user's needs and point out concepts that are not easy to convert. Use `git mv` and offer an intermediate commit before significant changes to any moved harness file, to help Git detect renames during upstream updates.

If your current agent runtime is opencode, no conversion  is needed.

If your agent runtime is not opencode, first check if any prior conversion was made. Compare the [opencode directory](..) with [upstream](https://github.com/goatfryed/harness). If this harness was already converted to your agent runtime, verify if any new changes need conversion. If it was converted to a different runtime, discuss how to preserve local changes with the user before converting from opencode upstream.

Track high-level areas of concern for conversion in [README.md](../../README.md).

### Convert to copilot
Move and flatten [agents](../agents). `.opencode/agents/some/nested/name.md --> .github/agents/some-nested-name.agent.md`. Update agent references.

Move commands `.opencode/commands/my-command.md --> .github/prompts/my-command.md`. Not all command concepts are easily convertible. As a follow up, offer to inspect commands and investigate, if any commands need conversion.
