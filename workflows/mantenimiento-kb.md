# Procedimiento de Mantenimiento de la Base de Conocimiento (KB)

Guía operativa para evitar el *knowledge drift* (desfase entre el código y la documentación normativa) y mantener la salud de skills, ADRs e índices.

## Frecuencia de Ejecución
- **Semanal**: Revisión pasiva por parte de `Agent-KB`.
- **Por Evento**: Tras cada merge significativo en la rama principal o cambio de arquitectura.

## Protocolo de Auditoría
1. **Detección de Skills Huérfanas**:
   - Ejecutar `./scripts/validate-skills.sh`.
   - Verificar que no existan directorios en `skills/` sin `SKILL.md`.
2. **Sincronización de Constitución**:
   - Correr `./scripts/sync-constitution.sh`.
   - Si `git diff CONSTITUCION.md` detecta diferencias, commitear la sincronización.
3. **Limpieza de Bloqueos de Sesión**:
   - Inspeccionar `SESSION_LOCK.md`.
   - Si existen sesiones marcadas con `🔒 Bloqueado` con más de 24 horas de antigüedad sin actividad, cambiar su estado a `⚠️ Desbloqueo Forzado (Timeout)` tras confirmar que no hay procesos corriendo.
4. **Verificación de Enlaces Rotos**:
   - Revisar que los enlaces relativos entre `AGENTS.md`, `DECISIONS-INDEX.md`, `RULES/` y `skills/` apunten a archivos existentes.
