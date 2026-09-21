# Preguntas Frecuentes (FAQ)

Respuestas a las dudas más habituales sobre la implementación y adopción del Protocolo SDD para agentes de IA supervisados.

---

### 1. ¿En qué se diferencia el Protocolo SDD de un System Prompt tradicional?
Un system prompt tradicional es una cadena monolítica de texto que se reenvía en cada llamada al LLM, consumiendo miles de tokens innecesariamente y sufriendo de degradación atencional. 

El **Protocolo SDD** es una arquitectura modular de ingeniería: las habilidades se cargan bajo demanda según la tarea, la normativa está dividida en invariantes verificables y la interacción sigue un procedimiento operativo estándar (SOP v2) con control de versiones y auditoría continua en CI.

---

### 2. ¿Este framework está acoplado a un modelo de IA específico?
**No.** El framework es 100% agnóstico respecto al proveedor de inteligencia artificial. Ha sido probado y optimizado para funcionar con Claude (Anthropic), Gemini (Google DeepMind), GPT-4o (OpenAI) y modelos de código locales (DeepSeek, Qwen), a través de cualquier interfaz compatible (IDE Cursor, GitHub Copilot, Antigravity o llamadas API directas).

---

### 3. ¿Por qué se utilizan scripts en POSIX Bash en lugar de librerías en un lenguaje específico?
Para garantizar portabilidad universal sin requerir la instalación de un runtime pesado previo (como Node.js, Python o .NET). Cualquier entorno Unix/Linux moderno, máquina de desarrollo macOS o contenedor de CI (GitHub Actions, GitLab CI) ejecuta `bash` de manera nativa sin pasos de instalación adicionales.

---

### 4. ¿Cómo gestiona el framework los conflictos de edición entre múltiples agentes?
A través de la política de exclusión mutua documentada en `SESSION_LOCK.md`. Ningún agente puede modificar archivos en un subsistema si ya existe una marca activa de bloqueo (`🔒`). El agente detecta la colisión, suspende su intervención o colabora a través de contratos de integración sin mutar directamente el código del módulo bloqueado.

---

### 5. ¿Qué significa la etiqueta `// @ai-gen` y por qué es obligatoria?
Es una marca de trazabilidad técnica (Regla `AI-ATTR-01`). Permite a los equipos de ingeniería, auditores de seguridad y herramientas automatizadas diferenciar el código generado o asistido por IA del código escrito manualmente, facilitando análisis de calidad y revisiones de propiedad intelectual.

