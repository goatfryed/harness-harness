---
status: <blurry|refined|approved|executing|done|escalated>
git:
    # Prefer {branch}[#{sha8}] over {sha}
    base: <ref>
    work: <ref>
dependencies:
    - <slice>
---
<!--
Use this document to define the work; keep it current, not a progress log.
Record progress and working details in free-form `./change.notes.md`.
Summarize the outcome in `./change.md` when the work is complete.
Drop subsections without material content; add them as they become relevant.
-->

# {Change title}
## Abstract
<!-- Provide a management summary of the work and its purpose, as well as its outcome once resolved. -->

## Issue
<!-- Describe the requested work using one or more stories. Follow these patterns
closely, but adapt the wording when needed to keep it natural. -->
<!--
As {actor/benefactor}, I want {system} to {reaction/effect/observation}[, when {conditions}], so that {values}.
Or:
As {stakeholder}, I need {system} to {action}[, when {conditions}], so that I can {enabled responsibility}.
-->

## Requirements
<!-- State requirements only if they are not obvious from the issue above. -->

## Context
<!-- Add only material, non-obvious context that matters to implementation. -->
### Dependencies
<!-- Explain how dependencies affect this work; list dependent slices in frontmatter. -->

### Constraints
<!-- State limits the work must respect and their source, if material. -->

### Assumptions
<!-- State unverified assumptions that affect the change. Promote them to constraints only when justified by evidence or a decision. -->
### Others
<!-- Add other implementation context that does not fit above. -->

## Consequences
<!-- Describe external consequences beyond the obvious change. -->

## Verification
<!-- List additional verification steps that were discussed and areas to focus on during review. -->

## References
