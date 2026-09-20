#!/usr/bin/env bash
# ==============================================================================
# scripts/new-decision.sh
# Generador de Registros de Decisiones Arquitectónicas (ADR)
# ==============================================================================

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DECISIONS_DIR="$ROOT_DIR/DECISIONS"
INDEX_FILE="$ROOT_DIR/DECISIONS-INDEX.md"

if [[ $# -lt 1 ]]; then
  echo "Uso: $0 \"Título de la decisión\"" >&2
  exit 1
fi

TITLE="$1"
TODAY=$(date +"%Y-%m-%d")

# Convertir título a kebab-case normalizado
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')
FILENAME="${TODAY}-${SLUG}.md"
FILEPATH="$DECISIONS_DIR/$FILENAME"

mkdir -p "$DECISIONS_DIR"

if [[ -f "$FILEPATH" ]]; then
  echo "Error: Ya existe el archivo $FILEPATH" >&2
  exit 1
fi

cat <<EOF > "$FILEPATH"
# ADR: $TITLE
- **Fecha**: $TODAY
- **Estado**: Propuesto <!-- Propuesto | Aceptado | Superado | Deprecado -->
- **Autor(es)**: Agent-Arch / Equipo

## Contexto y Planteo del Problema
Describir la situación, fuerzas en conflicto, requisitos técnicos o cambios en el dominio que motivan la necesidad de tomar una decisión.

## Opciones Consideradas
1. **Opción 1**: Descripción de la alternativa.
2. **Opción 2**: Descripción de la alternativa.

## Decisión Adoptada
Explicar qué opción se elige y la justificación técnica fundamentada en la Jerarquía de Precedencia y los invariantes del sistema.

## Consecuencias
### Positivas
- Beneficio 1.
- Beneficio 2.

### Negativas / Trade-offs
- Concesión o complejidad asumida.

## Cumplimiento y Verificación
Cómo los agentes y el pipeline verificarán que esta decisión se respete en el código.
EOF

echo "Creado nuevo ADR: $FILEPATH"

# Actualizar índice si existe o crearlo
if [[ ! -f "$INDEX_FILE" ]]; then
  cat <<'EOF' > "$INDEX_FILE"
# Índice Maestro de Decisiones Arquitectónicas (ADR)

| Fecha | Título / Archivo | Estado | Resumen |
| :--- | :--- | :--- | :--- |
EOF
fi

echo "| $TODAY | [$TITLE](DECISIONS/$FILENAME) | Propuesto | Nueva decisión de arquitectura |" >> "$INDEX_FILE"
echo "Actualizado índice en $INDEX_FILE"
