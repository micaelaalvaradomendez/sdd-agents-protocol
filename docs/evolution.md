# Evolución del Estándar de Agentes de IA (docs/evolution.md)

Análisis histórico y lecciones aprendidas en la evolución desde simples instrucciones sueltas hacia un protocolo formal de ingeniería gobernada.

---

## 1. Generación 1: La Era de los Prompts Sueltos (v1)
- **Características**: Archivos markdown con nombres como `IA-Master.md` o `IA-Base-de-Datos.md` que contenían párrafos extensos de instrucciones en lenguaje natural.
- **Limitaciones**:
  - Ventana de contexto saturada de instrucciones redundantes.
  - Ausencia de validación sintáctica: el agente podía interpretar las reglas de forma arbitraria.
  - Falta de límites claros entre roles (un solo mega-prompt intentaba cubrir frontend, base de datos y auditoría).

---

## 2. Generación 2: Estandarización de Habilidades y Manifiestos (v2)
- **Características**: Separación inicial de habilidades en carpetas numeradas, introducción de manifiestos centrales de persistencia y scripts en PowerShell (`bootstrap-agents.ps1`, `sincronizar-constitucion.ps1`).
- **Avances**:
  - Incorporación del concepto de SSoT para bases de datos relacionales.
  - Creación de la primera versión del Círculo Virtuoso (SOP v1).
- **Limitaciones**:
  - Dependencia de scripts acoplados al ecosistema Windows/PowerShell.
  - Reglas duras dispersas entre diferentes notas y documentación de proyectos específicos.

---

## 3. Generación 3: Protocolo SDD Universal (v3 - Estado Actual)
- **Características**:
  - **Tres Capas Ortogonales**: Constitución (SSoT), Habilidades modulares con frontmatter YAML, y Agentes compuestos con Quality Gates.
  - **Independencia de Stack y Plataforma**: Automatizaciones en POSIX Bash portables a Linux, macOS y runners de GitHub Actions.
  - **Gobernanza de Concurrencia**: Control explícito de sesiones concurrentes mediante `SESSION_LOCK.md`.
  - **Validación Automatizada en CI**: Linter estricto de skills (`validate-skills.sh`) que bloquea pull requests ante drift de estándares o frontmatter inválido.
  - **Auditoría y Trazabilidad**: Convención formal `@ai-gen` y catálogo de anti-patrones indexados (`AP-01`..`AP-15`).
