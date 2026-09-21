# SDD Protocol: Mandatory In-Context Guardrails for Claude Code

This project operates under the **Spec-Driven Development (SDD)** protocol.
As an AI coding agent, you MUST follow these constraints strictly.

## 🛑 MANDATORY EXECUTION CONTRACT (Zero-Tolerance)
Before generating or modifying any code in this repository:

1. **ROLE DECLARATION**:
   Begin your plan or response with your active role:
   `[SDD: Agent-<Arch|Dev|Sec|DB|Audit|KB> | Mode: <VALIDATE|GENERATE|EXPLAIN|ARCH-REVIEW>]`

2. **CONCURRENCY LOCKING**:
   - Before writing or editing any code or schema, run:
     `./sdd lock "<module>" "<task description>"`
   - Once all edits and tests pass, run:
     `./sdd unlock`

3. **MANDATORY AI CODE TAGGING (Rule AI-ATTR-01)**:
   - Every file, function, or block created or modified by AI MUST include:
     `// @ai-gen` or `/* @ai-gen */`
   - The Git pre-commit hook will hard-reject any commit missing this tag.

4. **HARD ARCHITECTURAL INVARIANTS**:
   - **Persistence**: All database mutations must be strictly transactional (BEGIN/COMMIT). No hard deletes without soft-delete (`deleted_at`). Use UUIDv7 instead of serial keys.
   - **Security**: Never hardcode API keys, passwords, or tokens (`SEC-SECRETS-01`).
   - **Quality**: Strict typing, no ignored errors, mandatory unit tests for new logic.

5. **VERIFICATION**:
   - Before concluding your turn, run:
     `./sdd check`
   - If `./sdd check` fails, you must resolve all issues before asking user review.
