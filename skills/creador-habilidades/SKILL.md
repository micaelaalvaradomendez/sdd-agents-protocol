---
name: creador-habilidades
description: Meta-habilidad para diseñar, validar y catalogar nuevas habilidades técnicas de agentes bajo el estándar SDD.
domain: knowledge
scope: global
depends_on: []
criticality: high
---

# Habilidad: Creador de Habilidades

## 1. Descripción y Propósito
Esta meta-habilidad instruye al agente en el proceso normativo para la creación, estandarización y verificación de nuevas habilidades (`SKILL.md`). Garantiza que toda nueva capacidad cumpla con las convenciones de frontmatter YAML, nombres kebab-case, reglas de oro y estructura de 11 secciones.

## 2. Entradas Requeridas
- **Nombre de la Habilidad**: Formato kebab-case estricto (ej: `validador-esquema`).
- **Dominio**: Uno de: `routing`, `persistence`, `security`, `messaging`, `frontend`, `knowledge`.
- **Propósito**: Problema técnico concreto que resuelve.
- **Nivel de Criticidad**: `high`, `medium` o `low`.

## 3. Proceso Operativo (Paso a Paso)
1. **Verificación de Unicidad**: Validar que la habilidad no duplique una capacidad existente en `CONSTITUCION.md`.
2. **Aplicación de Reglas de Oro**:
   - Nomenclatura: `snake_case` para datos/columnas, `kebab-case` para habilidades, `PascalCase` para tipos/interfaces.
   - Prefijos consistentes: `sys_` (sistema), `mov_` (transacciones), `cfg_` (configuración).
   - Normalización ASCII: Prohibidos acentos o `ñ` en nombres de archivos o identificadores.
   - Bilingüismo estructurado: Código e identificadores en inglés; prosa y descripciones en español.
3. **Generación del Archivo**: Crear el directorio `skills/<nombre-skill>/` y escribir `SKILL.md` usando la plantilla base.
4. **Validación Sintáctica**: Ejecutar `./scripts/validate-skills.sh` para comprobar frontmatter y estructura.
5. **Regeneración Normativa**: Ejecutar `./scripts/sync-constitution.sh` para incorporar la nueva habilidad a la constitución viva.

## 4. Salida Esperada
- Directorio y archivo `skills/<nombre-skill>/SKILL.md` válido.
- `CONSTITUCION.md` actualizada y sincronizada.

## 5. Límites y Restricciones (Qué NO hace)
- No crea habilidades monolíticas que mezclen múltiples dominios inconexos.
- No introduce habilidades con código hardcodeado dependiente de entornos privados o nombres institucionales.

## 6. Dependencias e Interacciones
- Interactúa directamente con `scripts/validate-skills.sh` y `scripts/sync-constitution.sh`.

## 7. Permisos y Accesos
- Lectura y escritura sobre el directorio `skills/` y `CONSTITUCION.md`.

## 8. Manejo de Errores y Excepciones
- Si `validate-skills.sh` reporta error, corregir inmediatamente el frontmatter o campos omitidos antes de commitear.

## 9. Auditoría y Trazabilidad
- Etiquetar cualquier script auxiliar generado con `// @ai-gen`.

## 10. Ejemplos de Uso
Invocación para crear una nueva habilidad de compresión:
- Nombre: `compresor-activos`
- Dominio: `frontend`
- Criticidad: `medium`

## 11. Lista de Verificación (Checklist de Finalización)
- [ ] Directorio y archivo `skills/<nombre>/SKILL.md` creados.
- [ ] Frontmatter YAML completo y sin advertencias.
- [ ] `./scripts/validate-skills.sh` ejecutado con resultado exitoso.
- [ ] `./scripts/sync-constitution.sh` ejecutado y reflejado en `CONSTITUCION.md`.
