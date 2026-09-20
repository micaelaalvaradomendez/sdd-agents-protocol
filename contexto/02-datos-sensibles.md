# Contexto 02: Clasificación de Datos y Confidencialidad

## 1. Clasificación de Información
- **Nivel 1: Público**: Catálogo de productos, documentación técnica abierta, endpoints públicos de healthcheck.
- **Nivel 2: Interno**: Logs estructurados no sensibles, métricas operativas del sistema.
- **Nivel 3: Confidencial (PII)**: Nombres, correos electrónicos, identificadores fiscales, direcciones IP de clientes. Exige almacenamiento cifrado en reposo y enmascaramiento en logs.
- **Nivel 4: Crítico / Restringido**: Contraseñas, secretos HMAC, claves privadas, tokens JWT maestros. Terminantemente prohibido exponerlos en logs, repositorios o enviarlos en prompts a modelos externos.

## 2. Políticas de Sanitización
- Los logs deben utilizar filtros que reemplacen campos sensibles por `[REDACTED]`.
- Las respuestas de error de API no deben filtrar trazas de pila (*stack traces*) internas en entornos públicos.
