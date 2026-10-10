#!/bin/sh
set -eu

usage() {
  printf 'Uso: %s "nome-do-projeto" "Descrição curta"\n' "$0" >&2
  exit 2
}

[ "$#" -eq 2 ] || usage

project_name=$1
project_description=$2
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_root=$(CDPATH= cd -- "$script_dir/.." && pwd)

[ -n "$project_name" ] && [ -n "$project_description" ] || usage
[ -f "$project_root/AGENTS.md" ] || {
  printf 'Erro: execute o script dentro de uma cópia válida do template.\n' >&2
  exit 1
}

if ! grep -q '__PROJECT_NAME__' "$project_root/README.md"; then
  printf 'Erro: este projeto já parece ter sido inicializado.\n' >&2
  exit 1
fi

replace_literal() {
  file=$1
  token=$2
  value=$3
  temp_file="${file}.tmp.$$"
  awk -v token="$token" -v value="$value" '
    {
      while ((position = index($0, token)) > 0) {
        $0 = substr($0, 1, position - 1) value substr($0, position + length(token))
      }
      print
    }
  ' "$file" > "$temp_file"
  mv "$temp_file" "$file"
}

replace_literal "$project_root/README.md" '__PROJECT_NAME__' "$project_name"
replace_literal "$project_root/README.md" '__PROJECT_DESCRIPTION__' "$project_description"
replace_literal "$project_root/docs/project/PRODUCT.md" '__PROJECT_DESCRIPTION__' "$project_description"
replace_literal "$project_root/docs/project/STATUS.md" '__DATE__' "$(date +%Y-%m-%d)"

"$script_dir/validate-agent-context.sh"

printf '\nProjeto "%s" inicializado.\n' "$project_name"
printf 'Agora preencha PRODUCT.md, TECH.md e os comandos em AGENTS.md.\n'

