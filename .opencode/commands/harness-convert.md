---
description: Convert the harness to a new agent runtime
---

Ask the user which agent runtime they use such as opencode, copilot, cursor or others. This harness is tailored to opencode by default.
Covnert harness setup to the users needs and point out concepts that are not easy to convert. Use `git mv` and offer an intermediate commit, before you do significant changes to any moved file harness file. Ensure that git tracks the move, so that upstream updates flow back.

If your current agent runtime is opencode, no conversion  is needed.

If your agent runtime is not opencode, first check, if any prior conversion was made. Check [opencode dir](/.opencode)  vs [upstream](git:https://github.com/goatfryed/harness.get). If this harness was already converted to your agent runtime before, verify if any new changes need conversion. If this harness was already converted, but to a different agent runtime, reset moved files and convert fresh from opencode upstream. Ensure git tracking stays stable.

Track high level area of concerns for conversion in [README.md](/README.md)

### Convert to copilot
Move and flatten [agents](../agents). `.opencode/agents/some/nested/name.md --> .github/agents/some-nested-name.agent.md`. Update agent references.

Move commands `.opencode/commands/my-command.md --> .github/prompts/my-command.md`. Not all command concepts are easily convertible. As a follow up, offer to inspect commands and investigate, if any commands need conversion.