#!/usr/bin/env bash
# ==============================================================================
# scripts/bootstrap.sh
# Bootstrap del Protocolo SDD de Agentes Supervisados en un repositorio objetivo.
# ==============================================================================

set -euo pipefail

TARGET_DIR="."
PROJECT_NAME=""
STACK="Universal"

usage() {
  cat <<EOF
Uso: $0 [opciones]

Opciones:
  -t, --target DIR      Directorio destino donde inicializar el protocolo (por defecto: actual)
  -p, --project NOMBRE  Nombre del proyecto
  -s, --stack STACK     Tecnología o stack del proyecto (ej: Go, Node, Python)
  -h, --help            Muestra esta ayuda
EOF
  exit 1
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -t|--target)
      TARGET_DIR="$2"
      shift 2
      ;;
    -p|--project)
      PROJECT_NAME="$2"
      shift 2
      ;;
    -s|--stack)
      STACK="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Opción desconocida: $1" >&2
      usage
      ;;
  esac
done

if [[ -z "$PROJECT_NAME" ]]; then
  PROJECT_NAME=$(basename "$(realpath "$TARGET_DIR")")
fi

echo "============================================================"
echo " Bootstrap: Protocolo SDD de Agentes de IA"
echo " Destino  : $TARGET_DIR"
echo " Proyecto : $PROJECT_NAME"
echo " Stack    : $STACK"
echo "============================================================"

# Crear estructura de carpetas
mkdir -p "$TARGET_DIR"/{.github/workflows,contexto,skills,agentes,RULES,DECISIONS,MAPS,workflows,checklists,templates,scripts,examples,docs}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Copiar archivos base si no existen en el destino
copy_if_missing() {
  local src="$1"
  local dest="$2"
  if [[ -f "$dest" ]]; then
    echo "  [SKIP] Ya existe: $dest"
  else
    cp "$src" "$dest"
    echo "  [CREADO] $dest"
  fi
}

copy_if_missing "$SCRIPT_DIR/AGENTS.md" "$TARGET_DIR/AGENTS.md"
copy_if_missing "$SCRIPT_DIR/SESSION_LOCK.md" "$TARGET_DIR/SESSION_LOCK.md"
copy_if_missing "$SCRIPT_DIR/ANTI-PATTERNS.md" "$TARGET_DIR/ANTI-PATTERNS.md"
copy_if_missing "$SCRIPT_DIR/DECISIONS-INDEX.md" "$TARGET_DIR/DECISIONS-INDEX.md" 2>/dev/null || true

# Copiar scripts
for s in sync-constitution.sh validate-skills.sh new-decision.sh; do
  if [[ -f "$SCRIPT_DIR/scripts/$s" ]]; then
    copy_if_missing "$SCRIPT_DIR/scripts/$s" "$TARGET_DIR/scripts/$s"
    chmod +x "$TARGET_DIR/scripts/$s" 2>/dev/null || true
  fi
done

# Copiar templates
if [[ -d "$SCRIPT_DIR/templates" ]]; then
  cp -rn "$SCRIPT_DIR/templates/"* "$TARGET_DIR/templates/" 2>/dev/null || true
fi

echo ""
echo "Protocolo SDD inicializado correctamente en $TARGET_DIR."
echo "Siguiente paso: configurar contexto/01-negocio.md y ejecutar ./scripts/sync-constitution.sh"

