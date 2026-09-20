# Reglas Duras de Uso y Gobierno de IA (AI-USAGE-RULES)

> [!CAUTION]
> **REGLA AI-ATTR-01 — ATRIBUCIÓN OBLIGATORIA DE CÓDIGO GENERADO POR IA (INQUEBRANTABLE)**
> - **Exige**: Todo archivo, bloque de código, función o migración creada o asistida por un modelo de lenguaje debe incluir un comentario explícito `// @ai-gen` o `/* @ai-gen */` en su cabecera o bloque de inicio.
> - **Prohíbe**: Introducir código generado por IA haciéndolo pasar por desarrollo manual sin marca de trazabilidad.
> - **Acción ante violación**: Bloqueo automático en linter de CI y reversión del commit.

---

> [!CAUTION]
> **REGLA AI-CTX-01 — CARGA PREVIA DE SKILL Y ROL OBLIGATORIA (INQUEBRANTABLE)**
> - **Exige**: Cargar la definición de rol y la skill correspondiente antes de emitir cualquier propuesta o código ejecutable.
> - **Prohíbe**: Responder a requerimientos técnicos complejos mediante suposiciones genéricas de prompt sin consultar la constitución y estándares del repositorio.
> - **Acción ante violación**: Descartar la respuesta del agente y forzar la inicialización bajo SOP v2.

---

> [!CAUTION]
> **REGLA AI-HAL-01 — PROHIBICIÓN DE APIS Y PAQUETES ALUCINADOS (INQUEBRANTABLE)**
> - **Exige**: Verificar la existencia real en el ecosistema y manifiesto de dependencias (`package.json`, `go.mod`, etc.) de cualquier biblioteca o método propuesto.
> - **Prohíbe**: Invocar métodos inventados o sugerir dependencias externas no declaradas sin aprobación explícita mediante ADR.
> - **Acción ante violación**: Falla inmediata de compilación y corrección requerida.
