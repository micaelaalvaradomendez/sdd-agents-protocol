# Registro de Sesiones Concurrentes (SESSION_LOCK)

Control de concurrencia y prevención de conflictos de edición entre agentes autónomos o supervisados.

## Política Operativa
1. **Adquisición**: Al iniciar una tarea que modifique archivos en un módulo, el agente **debe** insertar una fila al principio de la tabla con estado `🔒 Bloqueado`.
2. **Exclusión Mutua**: Si otro agente detecta que el módulo requerido está marcado como `🔒`, no debe forjear ramas paralelas ni sobrescribir archivos: debe esperar o coordinar.
3. **Liberación**: Al finalizar la tarea y completar el paso *Closing* del SOP v2, el agente actualiza su estado a `✅ Liberado` registrando la hora de finalización.

---

## Tabla de Estado de Sesiones

| AgentID | Módulo / Componente | Inicio (UTC) | Fin (UTC) | Estado | Propósito / Ticket |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Agent-Arch` | `core/protocol` | 2026-09-20 20:00 | 2026-09-20 20:30 | ✅ Liberado | Inicialización de normativa base |

*Convención de Estados: `🔒 Bloqueado` (en progreso activo), `🟢 En Revisión` (esperando verificación humana o CI), `✅ Liberado` (completado y cerrado).*
