# Reglas Duras de Seguridad (SECURITY-RULES)

> [!CAUTION]
> **REGLA SEC-SECRETS-01 — CERO SECRETOS EN CÓDIGO O PROMPTS (INQUEBRANTABLE)**
> - **Exige**: Inyectar secretos exclusivamente a través de gestores seguros de variables de entorno o almacenes de secretos en tiempo de ejecución.
> - **Prohíbe**: Hardcodear claves privadas, contraseñas, tokens JWT, API keys o URLs de conexión con credenciales en código, tests, fixtures o mensajes dirigidos a LLMs.
> - **Acción ante violación**: Revocación inmediata del secreto comprometido, rotación de credencial y reescritura del historial Git si fue commiteado.

---

> [!CAUTION]
> **REGLA SEC-RBAC-01 — VALIDACIÓN DE AUTORIZACIÓN PERIMETRAL Y DE DOMINIO (INQUEBRANTABLE)**
> - **Exige**: Validar permisos de rol y propiedad de recursos (`tenant_id` / `user_id`) en cada endpoint y caso de uso antes de ejecutar la lógica interna.
> - **Prohíbe**: Confiar ciegamente en identificadores enviados desde el cliente sin contrastar contra la identidad del token autenticado.
> - **Acción ante violación**: Bloquear el despliegue y corregir el middleware de autorización.

---

> [!CAUTION]
> **REGLA SEC-SAN-01 — VALIDACIÓN ESTRICTA DE ENTRADA (INQUEBRANTABLE)**
> - **Exige**: Validar y sanitizar todo payload entrante mediante esquemas tipados rígidos (Zod, Pydantic, Struct tags) en la frontera del sistema.
> - **Prohíbe**: Concatenación directa de strings en consultas SQL, comandos de shell o intérpretes de plantillas.
> - **Acción ante violación**: Rechazar el PR de inmediato.

