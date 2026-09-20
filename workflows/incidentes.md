# Procedimiento de Gestión y Remediación de Incidentes

Protocolo de contingencia y rollback rápido cuando una acción asistida por IA introduce regresiones, violaciones de invariantes o degradación del servicio.

## Flujo de Remediación en 4 Fases

### Fase 1: Contención y Detención Inmediata
1. **Interrupción de la Sesión**: Detener inmediatamente la tarea del agente o cancelar el pipeline de despliegue.
2. **Adquisición de Bloqueo de Emergencia**: Registrar en `SESSION_LOCK.md` la anomalía:
   `| Agent-Sec | INCIDENTE: <Descripción corta> | <Timestamp> | 🔒 Bloqueado |`

### Fase 2: Reversión (Rollback)
1. Si el fallo se detecta en el entorno de integración o staging, aplicar `git revert` del commit causante.
2. Si afectó base de datos, ejecutar la migración de rollback (`down`) correspondiente garantizando la integridad de datos existentes.

### Fase 3: Análisis de Causa Raíz (RCA)
1. Identificar qué invariante o Quality Gate falló en detectar el problema:
   - ¿Faltó una regla dura en `RULES/`?
   - ¿No existía un anti-patrón catalogado en `ANTI-PATTERNS.md`?
   - ¿Las pruebas unitarias carecían de casos de borde?

### Fase 4: Cierre del Bucle (Knowledge Hardening)
1. **Actualización de Normativa**: Si el incidente reveló un nuevo caso de borde, redactar la regla o anti-patrón en la misma sesión.
2. **Nuevo Test de Regresión**: Incorporar una prueba automatizada que reproduzca el defecto para garantizar que nunca vuelva a ocurrir.
3. **Liberación**: Actualizar `SESSION_LOCK.md` a `✅ Liberado`.
