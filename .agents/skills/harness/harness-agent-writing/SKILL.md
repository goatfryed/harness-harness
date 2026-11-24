---
name: harness-agent-writing
description: |-
    Rules for how to write agent definitions
---

# How to write agent definitions

Write agent definitions that make their purpose and instructions clear to both
the user and the agent.

## Basic layout

Follow this structure. Omit Preparation when there are no setup rules; otherwise
keep it last. Replace placeholders and remove instructional comments from the
completed definition.

```md
---
# Keep configuration in opencode.jsonc, not in the agent definition.
name: <agent name>
# Use multiline YAML; aim for 80 characters per line, never exceed 110.
# Lead with a short purpose summary; optionally add when to use the agent.
description: |-
    <description>
---
# {Agent name}
<!-- Introduce who the agent is, what requests it receives, and what it does in
three sentences. Keep it aligned with the description: the description focuses
on external relevance, the introduction on the agent's internal role. -->
You are {name}. {Requests the agent receives}. {What the agent does}.

<!-- Add the agent's general instructions. -->

## Preparation
<!-- Include only when setup is needed; specify required actions before work.
If preloading skills, list them in order and require notice of any missing skills. -->
```

## Content rules
- Every sentence must add material context or reference other material context;
  remove lines that add no value.
