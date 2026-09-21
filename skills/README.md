# Registro de Habilidades (skills/)

Este directorio contiene las habilidades técnicas modulares (`SKILL.md`) del proyecto. Cada habilidad representa una capacidad atómica y reutilizable acotada a un dominio de ingeniería.

## Convención de Archivos
- Cada habilidad reside en su propio subdirectorio en formato kebab-case: `skills/<nombre-skill>/SKILL.md`.
- El archivo `SKILL.md` debe contener un bloque de frontmatter YAML obligatorio:

```yaml
---
name: nombre-skill-kebab-case
description: Descripción clara de la capacidad y cuándo activarla.
domain: routing | persistence | security | messaging | frontend | knowledge
scope: global | module | agent
depends_on: []
criticality: high | medium | low
---
```

## Gobernanza
- Para crear una nueva habilidad, utilizar la meta-habilidad `creador-habilidades` o la plantilla en `templates/SKILL-TEMPLATE.md`.
- Toda habilidad debe validarse con `./scripts/validate-skills.sh`.
- La lista oficial se sincroniza en `CONSTITUCION.md` mediante `./scripts/sync-constitution.sh`.

