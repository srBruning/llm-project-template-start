#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
template_mode=false

if [ "${1:-}" = '--template' ]; then
  template_mode=true
elif [ "$#" -gt 0 ]; then
  printf 'Uso: %s [--template]\n' "$0" >&2
  exit 2
fi

required_files='README.md
AGENTS.md
CLAUDE.md
GEMINI.md
.agents/rules/project.md
.github/copilot-instructions.md
docs/project/PRODUCT.md
docs/project/TECH.md
docs/project/STATUS.md
docs/tasks/TEMPLATE.md
docs/architecture/decisions/TEMPLATE.md'

failed=false
printf '%s\n' "$required_files" | while IFS= read -r relative_path; do
  [ -f "$project_root/$relative_path" ] || {
    printf 'Faltando: %s\n' "$relative_path" >&2
    exit 1
  }
done || failed=true

grep -Fq '@AGENTS.md' "$project_root/CLAUDE.md" || {
  printf 'CLAUDE.md não importa AGENTS.md.\n' >&2
  failed=true
}

grep -Fq '@./AGENTS.md' "$project_root/GEMINI.md" || {
  printf 'GEMINI.md não importa AGENTS.md.\n' >&2
  failed=true
}

grep -Fq 'AGENTS.md' "$project_root/.agents/rules/project.md" || {
  printf 'A regra do Antigravity não aponta para AGENTS.md.\n' >&2
  failed=true
}

if [ "$template_mode" = false ]; then
  if grep -R -E '__PROJECT_(NAME|DESCRIPTION)__|__DATE__' \
    "$project_root/README.md" "$project_root/docs/project" >/dev/null; then
    printf 'Ainda há marcadores de inicialização no projeto.\n' >&2
    failed=true
  fi
fi

[ "$failed" = false ] || exit 1
printf 'Contexto multiagente válido.\n'
