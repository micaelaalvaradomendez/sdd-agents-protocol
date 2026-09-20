# Directorio de Agentes Compuestos (agentes/)

Este directorio define los perfiles formales de los agentes de IA que operan en el marco SDD. Cada agente es una combinación especializada de contexto, habilidades permitidas, restricciones, modos de operación y Quality Gates.

## Catálogo de Agentes Disponibles
- `agente-analista.md` (`Agent-Domain`): Análisis de requerimientos, especificaciones de dominio y contratos de interfaz.
- `agente-desarrollador.md` (`Agent-Domain` / `Agent-DB`): Construcción e implementación de código con TDD e invariantes duras.
- `agente-auditor.md` (`Agent-Sec` / `Agent-Audit`): Seguridad, calidad de código, análisis de dependencias y resiliencia.
- `agente-conocimiento.md` (`Agent-KB` / `Agent-Arch`): Mantenimiento de la base de conocimiento, ADRs, constitución y sesiones.

## Reglas de Concurrencia
Todo agente en operación debe registrar su estado en `SESSION_LOCK.md` antes de modificar código o documentación.
