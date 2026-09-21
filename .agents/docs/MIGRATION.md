# Guía de Adopción y Migración al Protocolo SDD (MIGRATION.md)

Instrucciones prácticas paso a paso para que cualquier equipo de ingeniería adopte el **Protocolo de Desarrollo Guiado por Especificaciones (SDD)** en un repositorio nuevo o existente.

---

## 1. Requisitos Previos
- Entorno tipo Unix (Linux, macOS o WSL en Windows) con `bash`, `awk`, `grep` y `git`.
- Repositorio Git inicializado.

---

## 2. Paso a Paso de Adopción

### Paso 1: Ejecutar el Inicializador SDD
Desde el repositorio `sdd-agents-protocol`, ejecute el comando de inicialización indicando la ruta de su proyecto objetivo:

```bash
./sdd init /ruta/a/mi-proyecto
```

El script configurará automáticamente:
- El árbol de directorios estándar.
- El ejecutable `./sdd` en la raíz del proyecto.
- Los auto-conectores para IAs: `.cursorrules`, `CLAUDE.md` y `.github/copilot-instructions.md`.
- El contexto base en `contexto/CONTEXTO.md`.
- Las matrices agnósticas en `data/`.

---

### Paso 2: Personalizar el Contexto de Dominio
Abra el archivo unificado `contexto/CONTEXTO.md` y adapte:
1. Misión y entidades maestras del negocio.
2. Políticas de datos sensibles (PII).
3. Integraciones externas y contratos de red.

---

### Paso 3: Validar y Activar Pre-commit Hook
En el repositorio destino:

```bash
cd /ruta/a/mi-proyecto

# Verificar que todo esté en verde
./sdd check

# Instalar el pre-commit hook de Git
./sdd hook install
```

A partir de este momento, cualquier agente o desarrollador que intente hacer un commit que viole invariantes o desincronice la constitución será interceptado automáticamente por Git.

