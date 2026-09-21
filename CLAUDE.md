# Claude Code Guidelines: Spec-Driven Development (SDD)

This repository strictly enforces the **Spec-Driven Development (SDD)** protocol defined in `AGENTS.md`.

## Mandatory Developer & Agent Workflow
- **Rules of Precedence**: Domain Integrity > Atomicity > Context Economy (SDS-500).
- **Session Locking**: Run `./sdd lock "<module>" "<task>"` before editing code. Run `./sdd unlock` upon task completion.
- **AI Code Attribution**: All generated or assisted code must include `// @ai-gen` or `/* @ai-gen */` (Rule `AI-ATTR-01`).
- **Quality Verification**: Execute `./sdd check` prior to committing. Never bypass Git pre-commit hooks.
- **Decision Records**: When creating new architectural standards, scaffold ADRs using `./sdd adr "<Title>"`.
- **Zero Secrets**: Never include credentials or tokens in code or prompts (`SEC-SECRETS-01`).
