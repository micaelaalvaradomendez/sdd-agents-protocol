#!/usr/bin/env bash
# ==============================================================================
# scripts/sync-constitution.sh
# Regenera CONSTITUCION.md a partir del frontmatter YAML de skills/*/SKILL.md
# ==============================================================================

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_FILE="$ROOT_DIR/CONSTITUCION.md"
SKILLS_DIR="$ROOT_DIR/skills"

echo "Sincronizando constitución desde $SKILLS_DIR..."

cat <<'EOF' > "$OUTPUT_FILE"
# Constitución del Proyecto: Catálogo Normativo de Skills
<!-- ESTE ARCHIVO ES AUTOGENERADO. NO EDITAR DIRECTAMENTE. -->
<!-- Regenerar con: ./scripts/sync-constitution.sh -->

> **Regla de Oro**: Si una capacidad, procedimiento o invariante no está reflejada
> en una skill catalogada en esta Constitución, **no existe como estándar oficial**.

---

## 📜 Tabla de Habilidades Activas

| Skill / Identificador | Dominio | Criticidad | Alcance | Descripción |
| :--- | :--- | :--- | :--- | :--- |
EOF

count=0
if [[ -d "$SKILLS_DIR" ]]; then
  for skill_file in "$SKILLS_DIR"/*/SKILL.md; do
    if [[ ! -f "$skill_file" ]]; then
      continue
    fi

    # Extraer variables del frontmatter YAML
    name=$(awk -F': ' '/^name:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)
    desc=$(awk -F': ' '/^description:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)
    domain=$(awk -F': ' '/^domain:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)
    criticality=$(awk -F': ' '/^criticality:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)
    scope=$(awk -F': ' '/^scope:/ {print $2; exit}' "$skill_file" | tr -d '\r"' || true)

    if [[ -n "$name" ]]; then
      rel_path="skills/$(basename "$(dirname "$skill_file")")/SKILL.md"
      echo "| [\`$name\`]($rel_path) | \`${domain:-general}\` | \`${criticality:-medium}\` | \`${scope:-global}\` | $desc |" >> "$OUTPUT_FILE"
      count=$((count + 1))
    fi
  done
fi

cat <<EOF >> "$OUTPUT_FILE"

---

## Invariantes de la Constitución

1. **Obligatoriedad**: Todo agente debe consultar este índice durante la fase *Discovery* del SOP v2.
2. **Sincronización**: Toda modificación o creación de una skill exige ejecutar \`./scripts/sync-constitution.sh\`.
3. **Total de habilidades indexadas**: $count

*Última regeneración: $(date -u +"%Y-%m-%d %H:%M:%S UTC")*
EOF

echo "CONSTITUCION.md regenerada con éxito. Habilidades indexadas: $count."
