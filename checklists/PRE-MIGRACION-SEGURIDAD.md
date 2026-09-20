# Lista de Verificación: Pre-Migración de Seguridad y Persistencia

Lista de control obligatoria antes de aplicar migraciones de esquema o cambios estructurales de base de datos.

## Controles de Persistencia
- [ ] **Esquema Sincronizado**: El manifiesto central de entidades refleja exactamente los cambios propuestos (`DB-MAN-01`).
- [ ] **Migración Reversible**: El script de migración cuenta con sentencias `UP` y `DOWN` verificadas en entorno local.
- [ ] **Identificadores UUIDv7**: Las nuevas tablas de negocio utilizan identificadores ordenados cronológicamente (`DB-ID-01`).
- [ ] **Borrado Lógico**: La tabla incluye la columna `deleted_at TIMESTAMPTZ` por defecto (`DB-SOFT-01`).
- [ ] **Transaccionalidad en Mutaciones**: Las migraciones de datos se ejecutan dentro de bloques `BEGIN` / `COMMIT`.

## Controles de Seguridad Perimetral
- [ ] **Permisos de Rol**: Se verificaron los permisos mínimos de base de datos (evitar usuario `postgres` o `root` en la aplicación).
- [ ] **Protección de Datos Personales / Sensibles**: Los datos confidenciales cuentan con cifrado o enmascaramiento documentado.
- [ ] **Plan de Rollback Probado**: Existe un procedimiento documentado para restaurar el estado previo en caso de falla.
