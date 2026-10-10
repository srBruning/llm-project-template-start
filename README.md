# __PROJECT_NAME__

> __PROJECT_DESCRIPTION__

Este repositório nasceu do template `llm-project-start`. Ele mantém o contexto do
projeto portátil entre Codex, Claude Code, Antigravity, Gemini CLI e outros agentes
compatíveis com `AGENTS.md`.

## Começo rápido

1. Copie este diretório para o nome do novo projeto.
2. Na raiz da cópia, execute:

   ```sh
   ./scripts/init-project.sh "nome-do-projeto" "Descrição curta do projeto"
   ```

3. Preencha `docs/project/PRODUCT.md`, `docs/project/TECH.md` e os comandos em
   `AGENTS.md`.
4. Escolha uma licença, configure o repositório remoto e faça o primeiro commit.
5. Peça ao agente para ler `AGENTS.md` e implementar uma tarefa bem delimitada.

## Onde fica cada informação

| Informação | Fonte de verdade |
| --- | --- |
| Como o agente deve trabalhar | `AGENTS.md` |
| Objetivo, escopo e critérios do produto | `docs/project/PRODUCT.md` |
| Stack, arquitetura e mapa do código | `docs/project/TECH.md` |
| Estado atual e próximo passo | `docs/project/STATUS.md` |
| Decisões arquiteturais duráveis | `docs/architecture/decisions/` |
| Planos de tarefas maiores | `docs/tasks/` |
| Como iniciar e transferir sessões | `docs/USING-AGENTS.md` |
| Segredos locais | `.env` (nunca versionar) |

`CLAUDE.md`, `GEMINI.md`, `.agents/rules/project.md` e
`.github/copilot-instructions.md` são apenas adaptadores. Não replique regras
nesses arquivos; altere `AGENTS.md`.

## Fluxo recomendado

- Antes de codificar, confirme o objetivo e os critérios de aceite.
- Para trabalho que atravessa sessões, crie um plano a partir de
  `docs/tasks/TEMPLATE.md`.
- Faça mudanças pequenas e verificáveis.
- Execute os comandos de qualidade descritos em `AGENTS.md`.
- Atualize documentação e `docs/project/STATUS.md` quando o estado compartilhado
  realmente mudar.
- Ao trocar de agente, indique apenas a tarefa; o repositório deve fornecer o
  restante do contexto.

## Validar o template

Antes da inicialização:

```sh
./scripts/validate-agent-context.sh --template
```

Depois da inicialização:

```sh
./scripts/validate-agent-context.sh
```

## Por que esta estrutura

O arquivo `AGENTS.md` é um formato aberto e multiagente. Claude Code e Gemini CLI
possuem arquivos de memória próprios e suportam importação; o Antigravity usa
regras de workspace em `.agents/rules/`. Adaptadores mínimos dão compatibilidade
sem criar várias cópias das mesmas regras.

