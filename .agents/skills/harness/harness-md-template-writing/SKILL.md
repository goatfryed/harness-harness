---
name: harness-md-template-writing
description: |-
    Rules for how to write templates for agents' markdown-artifacts
---

# How to write Markdown templates

Write templates for agents producing human-readable Markdown artifacts. Choose
their structure for the artifact's purpose, audience, and intended use.

## Documenting a template

This illustrates where to put guidance, not which sections an artifact needs:

```md
---
# Document the frontmatter contract.
# Use multiline YAML for descriptions and other long text blocks.
# aim for 80 characters per line, with a 110-character maximum.
description: |-
    <description>
<some-key>: <some value> # Use <placeholder> in YAML values and {placeholder} in comments.
<some enum>: <tiger|cat|dog> # or {tiger|cat|dog} denotes fixed options
---
<!--
State the artifact's purpose and material instructions that apply throughout.
Direct closely related material that belongs elsewhere to its proper location
and briefly explain how to use it.
State what may be omitted, added, merged, renamed, or reordered, and when.
Identify any workflow or machine-consumer contracts that must be preserved.
Explain whether instructional comments stay in the completed artifact.
-->

# {Artifact title}
<!-- Use {placeholders} for content the writer must supply. -->

<!-- Include the following sections only if relevant to the template.
If included, follow this relative order unless instructed otherwise. -->

## Abstract
<!-- Explain what belongs here and its expected detail, if not already clear. -->

## {Another section appropriate to the artifact}
<!-- State whether content is required, conditional, or optional when relevant.
For conditional content, say when to include it. Do not require empty sections.
Prefer examples over complicated explanations. Include at most three distinct
examples, only when they add material value. Label fictional examples and make
clear whether they belong in the output. -->

<!-- Plain text outside comments is required output with this exact phrasing;
replace placeholders and resolve explicitly marked optional parts or choices. -->
This artifact describes {subject}.

<!-- A placeholder may describe a concept rather than a single value.
Square brackets mark an optional clause; choose one alternative separated by |. -->
As {actor or beneficiary}, I want {system} to {action or observable effect}
[, when {conditions}], so that {value is created | harm is avoided}.

<!-- A comment can mark alternatives between whole passages.
Choose one; remove the other and the separator. -->
The change enables {capability}.
<!-- or -->
The change prevents {undesired outcome}.

## References

## Notes
```

## Content rules

- Follow a template's structure unless it explicitly permits deviation.
- Include only material guidance; do not add text merely to fill a section.
- Distinguish unknown, not yet investigated, not applicable, and known absent.
  Investigate or report uncertainty rather than silently omitting a section or
  inventing facts.
- When practical, try representative tasks, including uncertain and inapplicable
  cases. Review usefulness, grounding, appropriate inclusion and omission, and
  unintended leftover guidance or placeholders—not just heading compliance.
