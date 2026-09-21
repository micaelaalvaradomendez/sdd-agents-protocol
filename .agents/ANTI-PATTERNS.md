# Catálogo Global de Anti-Patrones Técnicos y de IA (ANTI-PATTERNS)

Catálogo normativo de prácticas defectuosas, riesgosas o arquitectónicamente degradantes que ningún agente ni desarrollador debe introducir en el repositorio.

---

## Catálogo Detallado

### Categoría: Aislamiento y Dominio

#### `AP-01`: Fuga de Dominio en Capa de Presentación
- **DON'T**: Inyectar lógica de cálculo de negocio, transacciones de base de datos o consultas directas dentro de componentes de UI o controladores HTTP.
- **DO**: Delegar la ejecución a casos de uso o servicios de aplicación aislados mediante interfaces limpias.
- **Por qué**: Rompe la modularidad, dificulta la automatización de pruebas unitarias y genera acoplamiento espagueti.
- **Severidad**: 🔴 Crítica

#### `AP-02`: Dependencia Cíclica entre Módulos
- **DON'T**: Crear referencias cruzadas donde el Módulo A importa el Módulo B y el Módulo B importa el Módulo A.
- **DO**: Extraer contratos comunes a interfaces o desacoplar flujos mediante eventos de dominio asíncronos.
- **Por qué**: Degrada el tiempo de compilación, complica el razonamiento modular y genera fugas de memoria o bloqueos.
- **Severidad**: 🔴 Crítica

---

### Categoría: Persistencia y Datos

#### `AP-03`: Consulta N+1 en Recuperación Relacional
- **DON'T**: Ejecutar una consulta adicional por cada elemento retornado en un bucle o listado.
- **DO**: Utilizar carga temprana (*eager loading*), agrupaciones `JOIN` o consultas por lote (`WHERE IN (...)`).
- **Por qué**: Degrada exponencialmente el tiempo de respuesta y satura las conexiones de base de datos bajo concurrencia.
- **Severidad**: 🟡 Advertencia

#### `AP-04`: Búsqueda Wildcard Ineficiente (`LIKE '%term%'`)
- **DON'T**: Aplicar patrones de búsqueda con comodín al inicio sobre columnas de texto no indexadas en tablas masivas.
- **DO**: Implementar búsqueda de texto completo (*Full-Text Search* - FTS), índices trigram (`pg_trgm`) o motores de búsqueda especializados.
- **Por qué**: Provoca escaneos completos de tabla (*Sequential Scan*), destruyendo el rendimiento de la base de datos.
- **Severidad**: 🟡 Advertencia

#### `AP-05`: Modificación Destructiva Directa (`HARD DELETE`)
- **DON'T**: Ejecutar `DELETE FROM ...` sobre entidades maestras o tablas de auditoría.
- **DO**: Aplicar borrado lógico con `deleted_at` y conservar inmutabilidad histórica.
- **Por qué**: Imposibilita la auditoría forense, invalida referencias históricas y genera pérdida irreparable de datos.
- **Severidad**: 🔴 Crítica

---

### Categoría: Seguridad y Acceso

#### `AP-06`: Credenciales y Secretos Hardcodeados
- **DON'T**: Insertar cadenas de conexión, tokens de prueba o claves privadas directamente en el código fuente.
- **DO**: Proveer las credenciales mediante variables de entorno inyectadas en tiempo de ejecución o almacenes seguros.
- **Por qué**: Expone el sistema a brechas de seguridad masivas en repositorios clonados o logs de depuración.
- **Severidad**: 🔴 Crítica

#### `AP-07`: Confianza Ciega en Payload del Cliente (Mass Assignment)
- **DON'T**: Mapear directamente el cuerpo de la petición HTTP a la entidad de base de datos sin DTO o whitelist.
- **DO**: Filtrar y validar estrictamente los campos permitidos para actualización mediante esquemas tipados.
- **Por qué**: Permite escaladas de privilegios al modificar campos protegidos como `is_admin`, `role` o `tenant_id`.
- **Severidad**: 🔴 Crítica

---

### Categoría: Mensajería y Resiliencia

#### `AP-08`: Mutación de Base de Datos y Envío de Eventos sin Transaccionalidad Doble
- **DON'T**: Guardar en base de datos y luego emitir un mensaje a un broker sin garantizar consistencia en caso de caída intermedia.
- **DO**: Implementar el patrón Outbox Transaccional (`sys_audit_outbox`) guardando el evento en la misma transacción ACID.
- **Por qué**: Puede causar inconsistencias irrecuperables si el servicio cae entre la escritura y el despacho del evento.
- **Severidad**: 🔴 Crítica

#### `AP-09`: Consumo de Mensajes sin Idempotencia
- **DON'T**: Procesar mensajes de cola asumiendo entrega exactamente una vez (*exactly-once*).
- **DO**: Mantener una tabla de deduplicación de IDs de mensaje procesados para tolerar reintentos seguros.
- **Por qué**: Provoca duplicación de pagos, órdenes o notificaciones ante reintentos de red.
- **Severidad**: 🟡 Advertencia

---

### Categoría: Gobierno y Uso de Inteligencia Artificial

#### `AP-10`: Silencio de Atribución de IA
- **DON'T**: Introducir código generado por asistentes o agentes sin marcarlo con `// @ai-gen`.
- **DO**: Incluir consistentemente el tag `@ai-gen` para asegurar trazabilidad en auditorías de código.
- **Por qué**: Impide auditar el origen del código, analizar tasas de defectos asistidos y verificar propiedad intelectual.
- **Severidad**: 🟡 Advertencia

#### `AP-11`: Alucinación de Librerías o Métodos
- **DON'T**: Asumir la existencia de funciones convenientes o paquetes sin verificar la documentación o lockfile oficial.
- **DO**: Inspeccionar el manifiesto del proyecto antes de sugerir llamadas a librerías externas.
- **Por qué**: Causa roturas en tiempo de compilación o introduce riesgos de secuestro de nombres de paquetes (*typosquatting*).
- **Severidad**: 🔴 Crítica

#### `AP-12`: Ejecución sin Contexto de Rol (Prompting Desbocado)
- **DON'T**: Solicitar cambios de arquitectura a un agente sin cargar previamente las directivas de la skill correspondiente.
- **DO**: Activar el rol formal (`Agent-Arch`, `Agent-DB`, etc.) y el modo operativo (`VALIDATE`, `GENERATE`, etc.).
- **Por qué**: Produce código genérico, inconsistente con las invariantes del proyecto y desconectado del estándar del equipo.
- **Severidad**: 🟡 Advertencia

---

## Tabla Resumen de Anti-Patrones

| ID | Título del Anti-Patrón | Categoría | Severidad | Calidad Impactada |
| :--- | :--- | :--- | :--- | :--- |
| `AP-01` | Fuga de Dominio en UI/HTTP | Aislamiento | 🔴 Crítica | Mantenibilidad / Testabilidad |
| `AP-02` | Dependencias Cíclicas | Aislamiento | 🔴 Crítica | Modularidad / Build |
| `AP-03` | Consulta N+1 | Persistencia | 🟡 Advertencia | Rendimiento / Latencia |
| `AP-04` | Wildcard Ineficiente en Texto | Persistencia | 🟡 Advertencia | Escalabilidad / CPU |
| `AP-05` | Hard Delete en Datos Maestros | Persistencia | 🔴 Crítica | Integridad / Auditoría |
| `AP-06` | Secretos Hardcodeados | Seguridad | 🔴 Crítica | Confidencialidad |
| `AP-07` | Mass Assignment sin DTO | Seguridad | 🔴 Crítica | Autorización / Integridad |
| `AP-08` | Despacho de Eventos sin Outbox | Mensajería | 🔴 Crítica | Consistencia Eventual |
| `AP-09` | Consumo sin Idempotencia | Mensajería | 🟡 Advertencia | Resiliencia / Duplicidad |
| `AP-10` | Falta de Atribución `@ai-gen` | Gobierno IA | 🟡 Advertencia | Trazabilidad / Auditoría |
| `AP-11` | Alucinación de Dependencias | Gobierno IA | 🔴 Crítica | Integridad del Build / SecOps |
| `AP-12` | Ejecución sin Skill/Rol | Gobierno IA | 🟡 Advertencia | Calidad / Consistencia |

