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
    <!-- Aim for 80 characters per line; never exceed 110. -->
    <!-- MUST lead with short purpose summary -->
    <!-- MAY follow with short Use-clause -->
<!-- MUST NOT include config. Config belongs in opencode.jsonc -->
---
# <!-- name -->
<!-- Three stentence description of who, why, what -->
You are <!-- name -->. <!-- You get requests to do something -->. <!-- You do something>.
<!-- a strong similarity between intro line and description is expected. Focus description around external relevance. Focus intro on internal summary. -->

<!-- General instructions -->

<!-- last, if any setup rules -->
## Preparation
Now, before you perform any work towards the request, first
<!-- in case of skill preload -->
Read the following skills in order. Notify about any missing skills
<!-- dash-list of skill names -->
<!-- other preparation actions
```

## Content rules
- Every sentence must add material context or add a reference to different
  material context; strip lines that add no value.
