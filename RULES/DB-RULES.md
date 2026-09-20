# Reglas Duras de Base de Datos y Persistencia (DB-RULES)

> [!CAUTION]
> **REGLA DB-MAN-01 — MANIFIESTO DE ESQUEMA OBLIGATORIO (INQUEBRANTABLE)**
> - **Exige**: Toda creación, alteración o eliminación de tablas, columnas o índices debe sincronizarse en la misma sesión con el archivo de manifiesto o esquema central del proyecto.
> - **Prohíbe**: Aplicar migraciones o cambios estructurales huérfanos sin actualizar la definición de tipos o catálogo del repositorio.
> - **Acción ante violación**: Revertir la migración en la misma sesión y bloquear el pipeline hasta su regularización.

---

> [!CAUTION]
> **REGLA DB-TX-01 — ESCRITURAS TRANSACCIONALES STRICT ACID (INQUEBRANTABLE)**
> - **Exige**: Toda operación que mute múltiples entidades o altere estado crítico debe ejecutarse dentro de un bloque de transacción explícito (`BEGIN` / `COMMIT`) con captura de error y reversión (`ROLLBACK`).
> - **Prohíbe**: Escrituras parciales sin transacción o llamadas de mutación asíncronas no idempotentes sobre registros maestros.
> - **Acción ante violación**: Rechazar el cambio en el Quality Gate de persistencia.

---

> [!CAUTION]
> **REGLA DB-ID-01 — IDENTIFICADORES ORDENADOS TEMPORALMENTE (INQUEBRANTABLE)**
> - **Exige**: Utilizar identificadores universalmente únicos ordenados cronológicamente (UUIDv7 / ULID) como clave primaria en tablas de negocio.
> - **Prohíbe**: El uso de secuencias autoincrementales predecibles (`SERIAL`, `AUTO_INCREMENT`) expuestas como identificadores externos de entidad.
> - **Acción ante violación**: Refactorizar la clave primaria antes de la aprobación de diseño.

---

> [!CAUTION]
> **REGLA DB-SOFT-01 — BORRADO LÓGICO EN ENTIDADES MUTABLES (INQUEBRANTABLE)**
> - **Exige**: Incluir columna `deleted_at TIMESTAMPTZ` (o equivalente nulo) en toda tabla transaccional o de negocio que admita bajas.
> - **Prohíbe**: La ejecución de sentencias `DELETE` directas sobre datos operativos sin política formal de purga documentada mediante ADR.
> - **Acción ante violación**: Revertir la consulta destructiva e implementar el flag de soft-delete.
