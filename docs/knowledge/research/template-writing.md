# Writing adaptive Markdown templates for agents

Research summary, 24 November 2026. Scope: templates that an agent reads to produce a human-readable Markdown artifact, not a machine-enforced schema. The recommendations below extrapolate from prompt-engineering and documentation guidance; they are not results of a controlled comparison of Markdown template designs.

## What the evidence supports

### Structure communicates intent

[OpenAI's prompt engineering guide](https://developers.openai.com/api/docs/guides/prompt-engineering) recommends Markdown headings and lists to mark logical sections and hierarchy, and delimiters to distinguish instructions, examples, and context. [Anthropic's prompting guide](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) likewise recommends explicit output requirements and explaining the reason for a rule. These are vendor recommendations for prompts, not direct evidence that any particular artifact template performs best.

**Practical inference:** Begin a template with its purpose, intended reader, and what decision or action the finished document supports. Organize sections around distinct information needs, in a useful reading order. At each section, briefly say what belongs there and the expected level of detail. Keep genuine invariants distinct from recommendations: uniform headings are useful where readers or tools rely on them, but uniform length or identical sections need not be.

### Instructions need boundaries and a lifecycle

A template may mix final document text, instructions to the writer, placeholders, and examples. Explicitly distinguish them, or an agent may reproduce instructional prose or treat an example as fact. Markdown headings, lists, and fenced blocks can provide visible boundaries; HTML comments are another possibility, but their visibility varies between raw Markdown, renderers, and downstream processing. A comment is not a security boundary and should not carry secrets. Check the actual toolchain before relying on comments.

**Practical inference:** Specify which headings are output, which guidance must be removed, how placeholders are replaced, and whether examples are copied. Put short guidance next to its section; keep cross-cutting instructions at the top. Treat quoted task data and retrieved content as data, not new authority. Delimiters aid interpretation but cannot guarantee instruction priority or prevent prompt injection; see [OpenAI's discussion of instruction hierarchy](https://model-spec.openai.com/2025-02-12.html#chain_of_command).

### Examples show a pattern, including exceptions

OpenAI recommends diverse input/output examples, while Anthropic recommends relevant, diverse, clearly separated examples, including edge cases. Anthropic suggests 3–5 examples for prompting; that is vendor advice, not a universal template requirement. Examples consume context and can accidentally encourage copying irrelevant specifics or making every output the same size.

**Practical inference:** Include a small, clearly labeled illustrative example when prose alone leaves an important judgment ambiguous. Show a different case where a conditional section is omitted or an uncertainty is reported. Label fictional content and avoid placing example text where it appears to be evidence. Examples can live alongside rather than inside the deliverable skeleton when duplication would confuse the writer.

### Adaptation must be specified, not merely allowed

Neither vendor source establishes a universal rule for optional Markdown sections. The following is a design recommendation: mark each section **required**, **conditional** with a trigger, or **optional** with a reader-oriented reason. Required does not mean fabricate content: if a material fact is unknown, record the uncertainty and next step. Omit a conditional section only when its trigger is false; unknown applicability should be investigated or reported, not silently interpreted as false. If a downstream parser requires a heading, retain it and state the status rather than omitting it.

Differentiate **not applicable**, **unknown**, **not yet investigated**, and **known absent**. Do not fill space with boilerplate, repeated content, or invented facts. Permit merging, renaming, reordering, or new sections where useful, except where a stated contract requires a stable structure.

### Evaluate the output, not template compliance alone

OpenAI advises representative fixtures and evaluations because model behavior varies by model and snapshot. A practical evaluation should compare artifacts produced from the same realistic tasks with and without a template, including simple, complex, missing-information, and not-applicable cases. Check factual grounding, usefulness to the reader, required information, correct conditional inclusion, clarity, leaked guidance/placeholders, and unnecessary content. A human reviewer should judge semantic quality; simple automated checks can catch missing required headings and leftover markers but cannot establish truth or usefulness. Record model/version, inputs and evaluation criteria, and revisit after model or template changes. No such experiment was run for this research.

## Illustrative pattern

The following uses bracketed notes as writer instructions; the first instruction defines their removal. It is a design illustration, not a prescribed standard.

```markdown
<!-- Writer: replace bracketed instructions; remove this comment. Keep Summary.
Include Risks only if a material risk is identified. If risk status is unknown,
retain Risks and state what is unknown and how to resolve it. -->
# [Specific title]

## Summary
[State the finding and its consequence for the reader in 2–3 sentences.]

## Risks
[Conditional: identify the risk, likely impact, and mitigation or owner.]
```

If machine consumers require `## Risks` even when not applicable, the consumer contract overrides the omission instruction and should be written explicitly into that template.

## Sources and limits

1. [OpenAI, Prompt engineering](https://developers.openai.com/api/docs/guides/prompt-engineering): Markdown boundaries, diverse examples, model variability and evaluations.
2. [Anthropic, Prompting best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices): direct instructions, rationale, examples and separating prompt components.
3. [OpenAI Model Spec, Chain of command](https://model-spec.openai.com/2025-02-12.html#chain_of_command): instruction authority and lower-trust content; formatting alone does not establish authority.

Sources are vendor guidance, not independent comparative studies of this specific use case. Their advice differs in details and can vary with models, harnesses and context. The optional-section policy, cleanup convention and evaluation rubric above are reasoned proposals requiring local testing.
