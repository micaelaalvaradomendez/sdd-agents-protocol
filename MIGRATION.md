# Guía de Adopción y Migración al Protocolo SDD (MIGRATION.md)

Instrucciones prácticas paso a paso para que cualquier equipo de ingeniería adopte el **Protocolo de Desarrollo Guiado por Especificaciones (SDD)** en un repositorio nuevo o existente.

---

## 1. Requisitos Previos
- Entorno tipo Unix (Linux, macOS o WSL en Windows) con `bash`, `awk`, `grep` y `git`.
- Repositorio Git inicializado.

---

## 2. Paso a Paso de Adopción

### Paso 1: Ejecutar el Script de Bootstrap
Desde el repositorio `sdd-agents-protocol`, ejecute el instalador indicando la ruta de su proyecto objetivo:

```bash
./scripts/bootstrap.sh --target /ruta/a/mi-proyecto --project "mi-proyecto" --stack "Go/PostgreSQL"
```

El script creará automáticamente el árbol de directorios estándar (`.github/`, `contexto/`, `skills/`, `agentes/`, `RULES/`, `DECISIONS/`, `MAPS/`, `workflows/`, `checklists/`, `scripts/`) y copiará los archivos normativos base.

---

### Paso 2: Personalizar el Contexto de Dominio
Acceda a la carpeta `contexto/` del proyecto y complete los archivos fundamentales:
1. `contexto/01-negocio.md`: Resuma la misión, las entidades maestras y los casos de uso principales.
2. `contexto/02-datos-sensibles.md`: Identifique qué campos contienen información personal (PII) o requieren cifrado.

---

### Paso 3: Adaptar las Reglas Duras de Persistencia
En `RULES/DB-RULES.md`, ajuste los requisitos a su motor de base de datos específico (PostgreSQL, MySQL, SQLite, MongoDB):
- Verifique si el proyecto cuenta con un archivo central de manifiesto de tablas o declare la ruta del esquema principal.
- Confirme la política de claves primarias (UUIDv7 recomendada).

---

### Paso 4: Validar y Generar la Primera Constitución
Ejecute las herramientas de sincronización en su proyecto:

```bash
cd /ruta/a/mi-proyecto
chmod +x scripts/*.sh

# Validar que las habilidades iniciales cumplan el estándar
./scripts/validate-skills.sh

# Generar la constitución de habilidades viva
./scripts/sync-constitution.sh
```

---

### Paso 5: Activar la Validación en Integración Continua (CI)
Asegúrese de que `.github/workflows/lint-skills.yml` esté activo en su repositorio de GitHub. A partir de este momento, cualquier pull request que introduzca habilidades rotas o desincronice `CONSTITUCION.md` será bloqueado automáticamente.

---

### Paso 6: Instruir a su Entorno de Desarrollo (IDE)
Copie o enlace `.github/copilot-instructions.md` para que GitHub Copilot, Cursor o Antigravity sigan el protocolo de inicio obligatorio de 5 pasos en cada conversación técnica.
