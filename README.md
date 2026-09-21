# Spec-Driven Development (SDD) Protocol for Supervised AI Agents

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

## 📂 Mapa de Arquitectura del Repositorio

La raíz del proyecto se mantiene **100% limpia y desacoplada** de la lógica de producto, encapsulando toda la maquinaria en `.agents/`:

```
sdd-agents-protocol/
├── sdd                       # ⚡ CLI unificado y autosuficiente (lock, check, sync, adr)
├── .cursorrules              # 🤖 Auto-conector mandatorio para Cursor IDE
├── CLAUDE.md                 # 🤖 Auto-conector mandatorio para Claude Code
├── README.md                 # 📄 Presentación y guía del framework
├── LICENSE                   # 📄 Licencia MIT
├── .github/
│   ├── copilot-instructions.md# 🤖 Auto-conector para GitHub Copilot
│   └── workflows/
│       └── lint-skills.yml   # 🔍 CI: Validación de skills y drift con ./sdd check
│
└── .agents/                  # 🛡️ MOTOR DEL PROTOCOLO (Encapsulado)
    ├── AGENTS.md             # SSoT operativa maestra (Jerarquía e Invariantes)
    ├── CONSTITUCION.md       # Catálogo vivo autogenerado de skills
    ├── SESSION_LOCK.md       # Control atómico de concurrencia
    ├── ANTI-PATTERNS.md      # Catálogo formal de anti-patrones indexados
    ├── DECISIONS-INDEX.md    # Índice central de Architecture Decision Records
    ├── context/              # Contexto global consolidado (CONTEXTO.md)
    ├── skills/               # Habilidades modulares con frontmatter YAML
    ├── roles/                # Perfiles de agentes compuestos con Quality Gates
    ├── rules/                # Reglas duras inquebrantables [!CAUTION]
    ├── workflows/            # Procedimientos operativos (SOP v2, incidentes, KB)
    ├── checklists/           # Listas de control de pre-commit, migración y pre-release
    ├── maps/                 # Topografía arquitectónica viva y diagramas Mermaid
    ├── templates/            # Plantillas estandarizadas (Skills, Agentes, ADRs)
    ├── data/                 # Matrices agnósticas (detección de stack y vulnerabilidades)
    ├── docs/                 # Documentación conceptual profunda y MIGRATION.md
    └── examples/             # Casos reales anonimizados (contexto, skill vertical)
```

---

## ⚖️ Jerarquía de Precedencia Mandatoria
1. **Integridad de Dominio**: Inmutabilidad de datos maestros, auditoría append-only y cumplimiento de contratos.
2. **Atomicidad**: Toda operación de escritura es transaccional (`BEGIN` / `COMMIT`). Sin escrituras parciales.
3. **Economía de Contexto (SDS-500)**: Modularidad estricta, archivos concisos y carga de contexto bajo demanda.

---

## 📄 Licencia
Distribuido bajo licencia de código abierto **MIT**. Consulte [LICENSE](LICENSE) para más información.