---
name: harness-agent-writing
description: |-
    Rules for how to write agent definitions
---

# How to write *agent*.md-s
## Basic layout

```md
---
name: <!-- Agent Name -->
description: |-
    <!-- use yaml multi-line -->  
    <!-- MUST lead with short purpose summary -->
    <!-- MAY follow with short Use-clause -->
<!-- MUST NOT include config. Config belongs in opencode.jsonc -->
---
# <!-- name -->
<!-- You are xyz. Brief summary how your usually requests look. Brief summary of what you are supposed to do -->

<!-- General instructions -->

<!-- last, if any setup rules -->
## Preparation
Now, before you perform any work towards the request, first
<!-- in case of skill preload -->
Read the following skills in order. Notify about any missing skills
<!-- dash-list of skill names -->
<!-- other preparation actions
```

## General rules
- Every sentence must add material context or add a reference to different material context; strip lines that add no value.