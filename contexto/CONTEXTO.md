# Contexto Global del Proyecto (contexto/CONTEXTO.md)

Este documento es la **Fuente Central de Contexto de Dominio** para los agentes y desarrolladores. Consolida la visión de producto, políticas de seguridad, contratos de integración y directivas de interfaz en un formato cohesivo y conciso (< 200 líneas) para respetar la **Economía de Contexto (SDS-500)**.

---

## 1. Visión de Negocio y Dominio
- **Misión del Producto**: Proveer una plataforma confiable, escalable y transaccional para la gestión integral de operaciones y servicios con trazabilidad append-only y alta disponibilidad.
- **Objetivos Estratégicos**: Automatización de flujos de trabajo, eliminación de inconsistencias de datos y auditoría forense de operaciones administrativas.
- **Modelo Operativo**:
  - *Servicios Core*: Procesamiento transaccional de órdenes, gestión de identidades y control de acceso perimetral.
  - *Workers Asíncronos*: Despacho de eventos, notificaciones y procesamiento por lotes vía cola transaccional (`sys_audit_outbox`).

---

## 2. Clasificación de Datos y Confidencialidad
- **Nivel 1: Público**: Catálogo de productos, documentación técnica abierta, endpoints de healthcheck.
- **Nivel 2: Interno**: Logs estructurados generales, telemetría y métricas operativas.
- **Nivel 3: Confidencial (PII)**: Nombres, correos electrónicos, identificadores fiscales e IPs de clientes. Almacenamiento cifrado en reposo y enmascaramiento en logs.
- **Nivel 4: Crítico / Restringido**: Contraseñas (argon2id), secretos HMAC, claves privadas y tokens JWT maestros. **Prohibición absoluta** de exposición en código, logs o prompts (`SEC-SECRETS-01`).

---

## 3. Integraciones y Servicios Externos
- **Gateway de Pagos**: Comunicación HTTPS síncrona con verificación criptográfica de firmas de webhooks.
- **Broker de Mensajería / Eventos**: Publicación mediante patrón Outbox transaccional para garantizar entrega confiable (*at-least-once*) sin pérdida de mensajes por fallas de red.
- **Proveedor de Identidad (OIDC / Keycloak)**: Verificación asimétrica de tokens JWT mediante endpoint JWKS.
- **Invariantes de Red**: Timeouts explícitos (máximo 5s por defecto) y retroceso exponencial (*exponential backoff*) con jitter en reintentos.

---

## 4. Marcos Regulatorios y Normativos
- **Protección de Datos**: Soporte obligatorio para borrado lógico (`deleted_at`) o anonimización ante peticiones de derecho al olvido.
- **Trazabilidad Forense**: Conservación inmutable de registros de auditoría administrativa (`sys_audit_outbox`) por al menos 5 años.
- **Seguridad en Aplicaciones**: Cumplimiento de OWASP Top 10 y directivas ASVS nivel 2.

---

## 5. Audiencias y Segmentación de Usuarios
- **Cliente (Usuario Final)**: Acceso restringido exclusivamente a sus propios recursos y órdenes (`tenant_id` / `user_id`).
- **Operador de Soporte**: Permisos de solo lectura para diagnóstico de incidentes, sin acceso a credenciales o datos financieros brutos.
- **Administrador**: Gestión de roles, parámetros de configuración y monitoreo del sistema.
- **Auditor de Seguridad**: Acceso exclusivo a bitácoras de auditoría y registros inmutables.

---

## 6. Estándares de Frontend e Interfaces
- **Arquitectura de Componentes**: Separación estricta entre obtención de datos/estado (Contenedores) y renderizado visual (Presentacionales).
- **Manejo Obligatorio de 4 Estados**: Toda vista remota debe contemplar:
  1. *Empty state*: Vista vacía accesible con llamada a la acción.
  2. *Loading state*: Skeletons accesibles durante la carga.
  3. *Error state*: Mensaje amigable con opción de reintento.
  4. *Success state*: Renderizado reactivo de la información.
- **Accesibilidad**: Cumplimiento de WCAG 2.1 nivel AA (contraste, etiquetas ARIA, navegación 100% por teclado).
