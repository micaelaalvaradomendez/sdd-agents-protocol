# ADR: Adopción del Framework SDD para Agentes de IA Supervisados
- **Fecha**: 2026-01-01
- **Estado**: Aceptado
- **Decisores**: Lead Architect / Agent-Arch
- **Dominio**: Arquitectura y Metodología

## 1. Contexto y Planteo del Problema
El desarrollo asistido por inteligencia artificial sin un marco de gobernanza introduce inconsistencia, fugas de secretos, alucinaciones en librerías y deuda técnica invisible ("prompt blobs"). Se requería un estándar reproducible que garantizara que los agentes actúen como ejecutores técnicos supervisados sujetos a contratos formales, invariantes duras y trazabilidad auditable.

## 2. Opciones Consideradas
### Opción 1: Instrucciones No Estructuradas en System Prompts Monolíticos
- **Descripción**: Mantener un prompt largo con todas las reglas en cada interacción.
- **Pros**: Rápido de arrancar inicialmente.
- **Contras**: Desperdicio masivo de ventana de contexto, desincronización frecuente y nula trazabilidad.

### Opción 2: Framework SDD Modular (Constitución + Skills + Agentes + SOP v2)
- **Descripción**: Desacoplar responsabilidades en tres capas (Constitución normativa, habilidades modulares con frontmatter YAML y perfiles de agentes) junto con un ciclo cerrado de conocimiento (SOP v2) y control de concurrencia (`SESSION_LOCK.md`).
- **Pros**: Escalable, portable, auditable, verificado por CI y con economía de contexto estricta (SDS-500).
- **Contras**: Requiere disciplina de inicialización y mantenimiento de esquemas.

## 3. Decisión Adoptada
Se adopta la **Opción 2**: Implementación del estándar SDD con Círculo Virtuoso de Conocimiento. La Jerarquía de Precedencia prioriza la **Integridad de Dominio** y la **Atomicidad** por sobre la inmediatez, respaldada por validadores automatizados (`validate-skills.sh`, `sync-constitution.sh`).

## 4. Consecuencias y Trade-offs
### Impacto Positivo
- Consistencia garantizada en las implementaciones generadas por IA.
- Trazabilidad legal y de autoría mediante `@ai-gen`.
- Reutilización de habilidades atómicas en múltiples proyectos.

### Concesiones y Deuda Técnica Asumida
- Los desarrolladores y agentes deben seguir rigurosamente el protocolo de inicio de 5 pasos y adquirir bloqueos en `SESSION_LOCK.md`.

## 5. Validación y Calidad
- Integración en CI (`lint-skills.yml`) que rechaza PRs con skills mal formateadas o constitución desactualizada.
