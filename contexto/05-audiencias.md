# Contexto 05: Audiencias y Segmentación de Usuarios

## 1. Perfiles de Usuario
- **Usuario Final (Cliente)**: Acceso restringido exclusivamente a sus propios recursos y pedidos (`tenant_id`/`user_id`).
- **Operador de Soporte**: Permisos de solo lectura ampliada para diagnóstico de incidencias, sin acceso a credenciales o datos financieros brutos.
- **Administrador del Sistema**: Gestión de roles, parámetros de configuración y monitoreo del estado del sistema.
- **Auditor de Seguridad / Cumplimiento**: Acceso directo e inmutable a bitácoras de auditoría (`sys_audit_outbox`) y registros de eventos.

