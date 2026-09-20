# Contexto 03: Integraciones y Servicios Externos

## 1. Topología de Conexiones
- **Gateway de Pagos**: Comunicación HTTPS síncrona vía API REST con verificación de firma webhook mediante secreto compartido.
- **Servicio de Mensajería / Broker**: Publicación y consumo desacoplado mediante patrón Outbox para evitar pérdida de mensajes ante caídas de red.
- **Proveedor de Identidad (IdP / OIDC)**: Verificación asimétrica de tokens JWT mediante endpoint de claves públicas (JWKS).

## 2. Invariantes de Integración
- Timeout explícito mandatorio en todos los clientes HTTP (máximo 5 segundos por defecto).
- Reintentos con retroceso exponencial (*exponential backoff*) y jitter para mitigar tormentas de reintentos.
