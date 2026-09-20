# Modos Operativos y Quality Gates (docs/modes.md)

Para evitar la ambigüedad en la ejecución y asegurar que los agentes actúen con el nivel adecuado de rigor y precaución, el framework define cuatro **modos operativos estandarizados**.

---

## 1. Modo `VALIDATE` (Validación y Auditoría)
- **Propósito**: Evaluar código, esquemas o arquitecturas existentes frente a las reglas y anti-patrones del proyecto sin alterar el estado del sistema.
- **Desencadenantes Típicos**: "validar", "auditar", "revisar", "analizar vulnerabilidades", "chequear conformidad".
- **Comportamiento**:
  - Lectura exhaustiva de las fuentes.
  - Mapeo de hallazgos contra `RULES/` y `ANTI-PATTERNS.md`.
  - Cero escrituras destructivas o mutaciones automáticas de código sin consentimiento expreso.
- **Quality Gates**:
  - El reporte emitido debe citar el ID exacto de la regla o anti-patrón infringido (e.g. `[🔴 AP-06]`).
  - No puede cerrarse la tarea con hallazgos críticos (🔴) pendientes sin documentar una excepción.

---

## 2. Modo `GENERATE` (Construcción e Implementación)
- **Propósito**: Escribir nuevo código, generar migraciones de datos o refactorizar módulos existentes.
- **Desencadenantes Típicos**: "implementar", "crear", "desarrollar", "generar", "construir".
- **Comportamiento**:
  - Aplica la Jerarquía de Precedencia (Integridad de Dominio > Atomicidad > Economía de Contexto).
  - Incluye obligatoriamente la cabecera `// @ai-gen` o `/* @ai-gen */`.
  - Genera pruebas unitarias asociadas a la lógica implementada.
- **Quality Gates**:
  - Código sintácticamente válido y tipado estrictamente.
  - Pruebas automatizadas en verde.
  - Manifiesto de entidades actualizado si hubo cambios de persistencia.

---

## 3. Modo `EXPLAIN` (Explicación y Pedagogía Técnica)
- **Propósito**: Describir cómo funciona un componente, clarificar decisiones pasadas o documentar flujos para nuevos desarrolladores.
- **Desencadenantes Típicos**: "explicar", "cómo funciona", "interpretar", "documentar flujo".
- **Comportamiento**:
  - Utiliza terminología técnica exacta basada en el glosario del proyecto.
  - Cita archivos específicos, diagramas en `MAPS/` y decisiones en `DECISIONS/`.
  - No inventa abstracciones externas ni conceptos ajenos a la base de código.
- **Quality Gates**:
  - Toda afirmación técnica debe referenciar un archivo o estándar verificable.

---

## 4. Modo `ARCH-REVIEW` (Revisión y Decisión de Arquitectura)
- **Propósito**: Evaluar compromisos técnicos, analizar trade-offs y resolver bifurcaciones de diseño.
- **Desencadenantes Típicos**: "decidir entre A y B", "evaluar trade-off", "analizar alternativas de arquitectura".
- **Comportamiento**:
  - Analiza un mínimo de dos alternativas viables con sus fortalezas y debilidades.
  - Fundamenta la recomendación en los invariantes del sistema.
  - Redacta un borrador formal de ADR.
- **Quality Gates**:
  - La sesión concluye obligatoriamente con la creación o actualización de un archivo en `DECISIONS/` mediante `./scripts/new-decision.sh`.
