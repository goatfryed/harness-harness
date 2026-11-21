# Harness maintenance harness

This self-maintaining harness governs development of the general-purpose [goatfryed/harness](https://github.com/goatfryed/harness), including improvements and tests. Additional benchmark and test projects may be added later.

## Layout

- [src/harness](src/harness/) is a separate checkout of the governed upstream harness.
- `docs/knowledge/` is a separate checkout of [goatfryed/harness-knowledge](https://github.com/goatfryed/harness-knowledge).
- [docs/templates](docs/templates/) contains documentation templates.
- `docs/change/` contains local change material and is not tracked by this repository.

The governed checkout and knowledge repository are managed independently, not as submodules. On a fresh checkout, clone them into the paths above.

## Supported tools

The existing capabilities are retained, including OpenCode, Obsidian, devcontainers, and Rust development support.

---

Based on [goatfryed/harness](https://github.com/goatfryed/harness).
