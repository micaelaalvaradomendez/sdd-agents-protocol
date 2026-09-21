# Protocolo de Inicio Obligatorio para Agentes de IA

Este repositorio opera bajo el **Protocolo de Desarrollo Guiado por Especificaciones (SDD)**.
Cualquier agente de IA (GitHub Copilot, Cursor, Antigravity, etc.) que asista en este proyecto **debe** ejecutar el siguiente protocolo de arranque antes de responder o generar código:

---

## Protocolo de Arranque en 5 Pasos

### 1. Leer `AGENTS.md`
- Interiorizar la **Jerarquía de Precedencia** (1. Integridad de Dominio > 2. Atomicidad > 3. Economía de Contexto).
- Comprender los invariantes globales (D0 a D4).

### 2. Verificar `SESSION_LOCK.md`
- Comprobar que el módulo objetivo no esté marcado como `🔒 Bloqueado` por otra sesión.
- Si vas a realizar mutaciones, agrega tu registro de inicio en la tabla.

### 3. Declarar Rol y Modo Operativo
En tu primera respuesta técnica al usuario, declara explícitamente:
- **Rol asumido**: (`Agent-Arch`, `Agent-DB`, `Agent-Sec`, `Agent-Audit`, `Agent-Scale`, `Agent-Domain`, `Agent-KB`).
- **Modo operativo**: (`VALIDATE`, `GENERATE`, `EXPLAIN`, `ARCH-REVIEW`).
- **Skills activadas**: Lista de habilidades primarias cargadas para la tarea.

### 4. Cargar Skills del Rol
- Consulta `CONSTITUCION.md` y carga el contenido de las habilidades declaradas desde `skills/<nombre-skill>/SKILL.md`.
- Aplica las reglas duras en `RULES/` correspondientes a tu dominio.

### 5. Aplicar SOP v2 y Cerrar con el Knowledge Loop
Durante la ejecución:
- Prioriza la integridad sobre la velocidad.
- Todo bloque de código generado o modificado debe contener el comentario `// @ai-gen` o `/* @ai-gen */`.
- No ignores retornos de error y aplica transaccionalidad estricta.
- Al terminar tu tarea, ejecuta el cierre del bucle de conocimiento:
  1. Si hubo decisiones nuevas, redactar ADR en `DECISIONS/`.
  2. Si hubo mejoras a skills, actualizar `skills/` y correr `./scripts/sync-constitution.sh`.
  3. Liberar el bloqueo en `SESSION_LOCK.md`.

