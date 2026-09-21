#!/usr/bin/env bash
# ==============================================================================
# scripts/validate-skills.sh
# Validador de formato, esquema YAML y estructura para skills de agentes
# ==============================================================================

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"

echo "Validando estructura de skills en: $SKILLS_DIR"
errors=0

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "Error: No existe el directorio de skills en $SKILLS_DIR" >&2
  exit 1
fi

shopt -s nullglob
skills=("$SKILLS_DIR"/*)
shopt -u nullglob

if [[ ${#skills[@]} -eq 0 ]]; then
  echo "No hay skills para validar aún."
  exit 0
fi

for skill_dir in "${skills[@]}"; do
  if [[ ! -d "$skill_dir" ]]; then
    continue
  fi

  dir_name=$(basename "$skill_dir")
  skill_file="$skill_dir/SKILL.md"

  # 1. Verificar archivo SKILL.md
  if [[ ! -f "$skill_file" ]]; then
    echo "❌ [$dir_name] Falta el archivo SKILL.md"
    ((errors++))
    continue
  fi

  # 2. Verificar YAML Frontmatter
  has_start_yaml=$(head -n 1 "$skill_file" | grep -E '^---$' || true)
  if [[ -z "$has_start_yaml" ]]; then
    echo "❌ [$dir_name] Falta el inicio de frontmatter YAML (---)"
    ((errors++))
    continue
  fi

  # 3. Validar campos requeridos
  for field in name description domain scope criticality; do
    if ! grep -q -E "^${field}:" "$skill_file"; then
      echo "❌ [$dir_name] Falta el campo requerido en frontmatter: '$field'"
      ((errors++))
    fi
  done

  # 4. Validar kebab-case en name
  skill_name=$(awk -F': ' '/^name:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)
  if [[ ! "$skill_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    echo "❌ [$dir_name] El campo name ('$skill_name') debe estar en formato kebab-case."
    ((errors++))
  fi

  # 5. Coincidencia entre directorio y name
  if [[ "$dir_name" != "$skill_name" ]]; then
    echo "⚠️ [$dir_name] El nombre de directorio no coincide exactamente con name ('$skill_name')"
  fi

  echo "✅ [$dir_name] Estructura y frontmatter válidos."
done

if [[ $errors -gt 0 ]]; then
  echo ""
  echo "Se encontraron $errors errores de validación en skills." >&2
  exit 1
fi

echo ""
echo "Todas las skills han pasado la validación exitosamente."

