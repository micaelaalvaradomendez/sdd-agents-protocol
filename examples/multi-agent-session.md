# Ejemplo de Sesión Multi-Agente Concurrente (examples/multi-agent-session.md)

Este documento ilustra la interacción ordenada entre múltiples agentes autónomos trabajando en un mismo proyecto sin colisiones de código ni forks caóticos, utilizando `SESSION_LOCK.md` y el SOP v2.

---

## Escenario
Dos tareas simultáneas ingresan a la cola de trabajo:
1. **Tarea A (`Agent-DB`)**: Añadir particionamiento mensual y tabla outbox a `mov_events`.
2. **Tarea B (`Agent-Dev`)**: Implementar endpoint de consulta histórica de eventos.

---

## Cronología de Ejecución

### T0:00 — `Agent-DB` Adquiere Bloqueo
`Agent-DB` lee `SESSION_LOCK.md`, verifica que el módulo `database/events` está libre y registra su inicio:

```markdown
| AgentID | Módulo / Componente | Inicio (UTC) | Fin (UTC) | Estado | Propósito / Ticket |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Agent-DB` | `database/events` | 2026-09-20 14:00 | - | 🔒 Bloqueado | Particionamiento mensual de eventos |
```

### T0:02 — `Agent-Dev` Detecta Bloqueo y Aplica Backoff
`Agent-Dev` intenta iniciar la Tarea B. Inspecciona `SESSION_LOCK.md` y observa que `database/events` está `🔒 Bloqueado`.
- **Acción del Agente**: Respeta la regla de exclusión mutua (§7 de `AGENTS.md`). No modifica el esquema ni asume columnas preliminares.
- **Respuesta al Usuario**: "El módulo `database/events` se encuentra bloqueado por `Agent-DB`. Pausando implementación de endpoint hasta confirmación de esquema."

### T0:15 — `Agent-DB` Concluye y Cierra Bucle
`Agent-DB` finaliza la migración, actualiza el manifiesto de tablas y ejecuta el paso *Closing* del SOP v2:
1. Actualiza `DECISIONS-INDEX.md` con el ADR de particionamiento.
2. Actualiza `SESSION_LOCK.md`:

```markdown
| AgentID | Módulo / Componente | Inicio (UTC) | Fin (UTC) | Estado | Propósito / Ticket |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Agent-DB` | `database/events` | 2026-09-20 14:00 | 2026-09-20 14:15 | ✅ Liberado | Particionamiento mensual de eventos |
```

### T0:16 — `Agent-Dev` Reanuda con Esquema Sincronizado
`Agent-Dev` detecta el estado `✅ Liberado`:
1. Adquiere el bloqueo para `api/events`.
2. Consulta el nuevo manifiesto actualizado por `Agent-DB`.
3. Implementa el endpoint consumiendo la tabla particionada con soporte de filtros temporales óptimos.
4. Libera su propio bloqueo tras pasar los tests en verde.

