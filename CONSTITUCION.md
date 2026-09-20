# Constitución del Proyecto: Catálogo Normativo de Skills
<!-- ESTE ARCHIVO ES AUTOGENERADO. NO EDITAR DIRECTAMENTE. -->
<!-- Regenerar con: ./scripts/sync-constitution.sh -->

> **Regla de Oro**: Si una capacidad, procedimiento o invariante no está reflejada
> en una skill catalogada en esta Constitución, **no existe como estándar oficial**.

---

## 📜 Tabla de Habilidades Activas

| Skill / Identificador | Dominio | Criticidad | Alcance | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| [`auditor-seguridad`](skills/auditor-seguridad/SKILL.md) | `security` | `high` | `global` | Habilidad vertical para detectar vulnerabilidades en dependencias y código, mapear vectores de ataque, generar parches correctivos y verificar remediaciones. |
| [`creador-habilidades`](skills/creador-habilidades/SKILL.md) | `knowledge` | `high` | `global` | Meta-habilidad para diseñar, validar y catalogar nuevas habilidades técnicas de agentes bajo el estándar SDD. |
| [`detector-stack`](skills/detector-stack/SKILL.md) | `routing` | `medium` | `global` | Inspecciona el árbol de directorios de un repositorio para identificar el stack tecnológico, gestores de paquetes y patrones de arquitectura activos. |
| [`redactor-adr`](skills/redactor-adr/SKILL.md) | `knowledge` | `medium` | `global` | Facilita la redacción, evaluación de trade-offs y registro estructurado de Decisiones Arquitectónicas (ADR) según la jerarquía de precedencia. |
| [`revisor-codigo`](skills/revisor-codigo/SKILL.md) | `routing` | `high` | `global` | Inspecciona código fuente, esquemas y migraciones para asegurar el cumplimiento de invariantes, tipado estricto y ausencia de anti-patrones. |

---

## Invariantes de la Constitución

1. **Obligatoriedad**: Todo agente debe consultar este índice durante la fase *Discovery* del SOP v2.
2. **Sincronización**: Toda modificación o creación de una skill exige ejecutar `./scripts/sync-constitution.sh`.
3. **Total de habilidades indexadas**: 5

*Última regeneración: 2026-09-20 23:53:52 UTC*
