# Spec-Driven Development (SDD) Protocol for Supervised AI Agents
[![Lint Skills & Constitution](https://github.com/micaelaalvaradomendez/sdd-agents-protocol/actions/workflows/lint-skills.yml/badge.svg)](https://github.com/micaelaalvaradomendez/sdd-agents-protocol/actions/workflows/lint-skills.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![SDD Standard](https://img.shields.io/badge/Standard-SDD--v1.0-emerald.svg)](AGENTS.md)
[![SDS-500 Compliant](https://img.shields.io/badge/Context-SDS--500-orange.svg)](docs/architecture.md)

> **Un marco de ingeniería auditable para transformar asistentes de inteligencia artificial en ejecutores técnicos supervisados, gobernados por especificaciones formales, invariantes duras y un círculo virtuoso de conocimiento.**

---

## ⚡ El Problema: El Mito del "Prompt Engineering"
Usar inteligencia artificial en ingeniería de software sin gobierno genera tres problemas críticos:
1. **Inconsistencia y Alucinaciones**: Modelos de lenguaje asumiendo estructuras de persistencia o llamando a librerías inexistentes (*prompt blobs* desbordados).
2. **Fugas de Seguridad y Deuda Técnica**: Secretos expuestos en ventanas de contexto, ausencia de pruebas automáticas y pérdida de trazabilidad de autoría.
3. **Amnesia de Sesión**: Soluciones brillantes que mueren en cuanto se cierra la ventana del chat, sin incorporarse al estándar del repositorio.

---

## 🛡️ La Solución: Arquitectura SDD en Tres Capas

Este framework desacopla el conocimiento en tres niveles de abstracción articulados por gobernanza continua:

```
┌─────────────────────────────────────────────────────────────────────┐
│  1. CONSTITUCIÓN (SSoT Normativa y Brújula de Dominio)              │
│     Invariantes duros, jerarquía de precedencia, reglas duras       │
│     [!CAUTION]. Autogenerada y sincronizada desde las skills.       │
├─────────────────────────────────────────────────────────────────────┤
│  2. SKILLS (Capacidades Atómicas con Frontmatter YAML)              │
│     Unidades modulares de ingeniería con entrada, proceso, límites, │
│     auditoría outbox y anti-patrones. Agnósticas de stack.          │
├─────────────────────────────────────────────────────────────────────┤
│  3. AGENTES (Roles Compuestos con Modos y Quality Gates)            │
│     Orquestadores acotados: Agent-Arch, Agent-Dev, Agent-Sec,       │
│     Agent-KB operando en VALIDATE / GENERATE / EXPLAIN / ARCH-REVIEW│
└─────────────────────────────────────────────────────────────────────┘
       │                                                    │
       ├── EJE TRANSVERSAL A: Círculo Virtuoso (SOP v2)     │
       │   Init ──> Discovery ──> Execution ──> Closing Loop│
       │                                                    │
       └── EJE TRANSVERSAL B: Auditoría y Concurrencia      │
           SESSION_LOCK.md · DECISIONS (ADR) · MAPS · @ai-gen
```

---

## 📊 Métricas del Framework
- **CLI Unificado de Productividad**: `./scripts/sdd` (`lock`, `unlock`, `status`, `check`, `sync`, `adr`, `detect`, `hook`).
- **Matrices Agnósticas Basadas en Datos**: Detección de stacks y patrones de vulnerabilidades multitecnología en `data/`.
- **5 Habilidades Base Catalogadas**: Meta-habilidades, revisión de código, auditoría vertical de seguridad, detector agnóstico de stack y redactor de decisiones.
- **12 Anti-Patrones Indexados**: Catálogo formal con IDs (`AP-01` a `AP-12`), DO/DON'T y severidades 🔴/🟡.
- **7 Reglas Duras Inquebrantables**: Persistencia transaccional, prohibición de borrado físico directo, etiquetado `@ai-gen` mandatorio y cero secretos.
- **4 Perfiles de Agentes Especializados**: Analista, Desarrollador, Auditor de Seguridad y Custodio del Conocimiento.
- **Pipeline de CI Automatizado**: Validación sintáctica y detección de drift en GitHub Actions.

---

## 🚀 Inicio Rápido en 30 Segundos

### 1. Inicializar en un nuevo repositorio
```bash
git clone https://github.com/micaelaalvaradomendez/sdd-agents-protocol.git
cd sdd-agents-protocol
./scripts/sdd init /ruta/a/mi-proyecto
```

### 2. Bloqueo y desbloqueo de sesiones sin fricción
```bash
# Adquirir sesión concurrente antes de editar un módulo
./scripts/sdd lock "orders/service" "Implementar transaccionalidad outbox" "Agent-Dev"

# Comprobar estado de locks activos
./scripts/sdd status

# Liberar la sesión al terminar
./scripts/sdd unlock
```

### 3. Validar repositorio y detectar stack
```bash
# Validar skills y constitución viva
./scripts/sdd check

# Detectar stack tecnológico de forma agnóstica
./scripts/sdd detect

# Instalar pre-commit hook de Git
./scripts/sdd hook install
```

---

## 📂 Mapa de Estructura del Repositorio

```
sdd-agents-protocol/
├── AGENTS.md                  # SSoT operativa maestra (Jerarquía, Invariantes D0-D4)
├── CONSTITUCION.md            # Índice normativo autogenerado de skills activas
├── SESSION_LOCK.md            # Control de sesiones concurrentes y exclusión mutua
├── ANTI-PATTERNS.md           # Catálogo formal de anti-patrones indexados (AP-01..)
├── DECISIONS-INDEX.md         # Índice central de Architecture Decision Records
├── MIGRATION.md               # Guía paso a paso para adoptar SDD en repositorios
├── LICENSE                    # Licencia MIT
├── .github/
│   ├── copilot-instructions.md# Protocolo de inicio de 5 pasos para Copilot/Cursor/AGY
│   └── workflows/
│       └── lint-skills.yml    # CI: Validador de frontmatter YAML y drift en PRs
├── contexto/                  # Información global de negocio modularizada (SDS-500)
├── skills/                    # Habilidades modulares (creador, revisor, auditor, etc.)
├── agentes/                   # Definición de roles compuestos con Quality Gates
├── RULES/                     # Reglas duras [!CAUTION] de persistencia, seguridad e IA
├── DECISIONS/                 # ADRs fechados (YYYY-MM-DD-titulo.md)
├── MAPS/                      # Topografía arquitectónica viva y diagramas Mermaid
├── workflows/                 # Procedimientos operativos (SOP v2, incidentes, KB)
├── checklists/                # Listas de control de pre-commit, migración y pre-release
├── templates/                 # Plantillas listas para usar (Skills, Agentes, ADRs)
├── scripts/                   # Utilidades en POSIX Bash (bootstrap, sync, validate, new)
├── examples/                  # Casos reales anonimizados (contexto, skill vertical)
└── docs/                      # Documentación conceptual profunda y patrones
```

---

## ⚖️ Jerarquía de Precedencia Mandatoria
1. **Integridad de Dominio**: Inmutabilidad de datos maestros, auditoría append-only y cumplimiento de contratos.
2. **Atomicidad**: Toda operación de escritura es transaccional (`BEGIN` / `COMMIT`). Sin escrituras parciales.
3. **Economía de Contexto (SDS-500)**: Modularidad estricta, archivos concisos y carga de contexto bajo demanda.

---

## 📄 Licencia
Distribuido bajo licencia de código abierto **MIT**. Consulte [LICENSE](LICENSE) para más información.