# Instruções do projeto para agentes

Este arquivo é a fonte canônica de instruções para qualquer agente que trabalhe
neste repositório. Arquivos específicos de ferramentas devem apenas importar ou
apontar para ele.

## Ordem de leitura

Antes de alterar arquivos:

1. Leia `README.md`.
2. Leia `docs/project/PRODUCT.md`, `docs/project/TECH.md` e
   `docs/project/STATUS.md`.
3. Leia o plano relevante em `docs/tasks/`, se existir.
4. Leia os `AGENTS.md` mais próximos dos arquivos que serão alterados, se houver.
5. Inspecione o código, testes e alterações locais; não presuma que a documentação
   esteja mais atualizada que o comportamento executável.

## Fontes de verdade

- Comportamento atual: código, testes e configuração executável.
- Decisões aceitas: ADRs em `docs/architecture/decisions/`.
- Intenção do produto: `docs/project/PRODUCT.md`.
- Arquitetura e stack: `docs/project/TECH.md`.
- Estado compartilhado: `docs/project/STATUS.md`.
- Uma solicitação explícita do usuário prevalece sobre os padrões deste arquivo,
  desde que não viole segurança ou restrições do ambiente.

Se as fontes divergirem, pare de propagar a inconsistência: confirme o
comportamento no código, preserve dados e registre ou corrija a documentação na
mesma mudança.

## Comandos do projeto

Substitua os itens `TODO` ao inicializar o projeto. Agentes devem usar os comandos
documentados aqui, em vez de inventar variantes.

- Instalar dependências: `TODO`
- Executar em desenvolvimento: `TODO`
- Lint: `TODO`
- Verificação de tipos: `TODO`
- Testes: `TODO`
- Build: `TODO`
- Verificação completa: `TODO`

Quando um comando não existir, registre isso no resultado; não declare que a
verificação passou.

## Forma de trabalhar

- Mantenha o escopo estritamente ligado ao pedido e prefira o menor diff coerente.
- Preserve alterações do usuário e trabalho local não relacionado.
- Faça suposições pequenas e reversíveis; explicite as que afetem comportamento,
  dados, interfaces ou arquitetura.
- Não adicione dependências, serviços externos ou novas abstrações sem necessidade
  demonstrável.
- Siga os padrões existentes antes de introduzir um novo padrão.
- Atualize ou crie testes para toda mudança de comportamento.
- Corrija a causa do problema, não apenas o sintoma.
- Não edite arquivos gerados manualmente; use o gerador responsável.
- Não faça commit, push, deploy, migração destrutiva ou alteração de dados reais
  sem solicitação explícita.

## Planejamento e continuidade

Crie um arquivo em `docs/tasks/` a partir de `TEMPLATE.md` quando a tarefa for
complexa, tiver riscos, múltiplas etapas ou puder atravessar sessões. Mantenha nele
decisões, progresso e validações factuais; não use o plano como diário de conversa.

Ao encerrar trabalho incompleto, atualize `docs/project/STATUS.md` com estado,
bloqueio e próximo passo reproduzível. Ao concluir, remova notas transitórias e
deixe somente contexto útil ao próximo agente.

## Qualidade e segurança

- Valide entradas nas fronteiras do sistema e trate erros de forma explícita.
- Nunca exponha segredos, tokens, dados pessoais ou conteúdo de `.env` em código,
  logs, testes, documentação ou respostas.
- Use `.env.example` apenas com nomes e valores fictícios seguros.
- Considere compatibilidade e migração antes de alterar contratos públicos,
  schemas ou formatos persistidos.
- Execute primeiro verificações focadas e, antes de concluir, a verificação
  completa documentada acima quando disponível.
- Relate exatamente o que foi e não foi verificado.

## Definição de pronto

Uma mudança está pronta quando:

- os critérios de aceite são atendidos;
- o código é simples e consistente com a arquitetura;
- testes relevantes foram criados ou atualizados e passam;
- lint, tipos e build aplicáveis passam;
- documentação e exemplos afetados estão sincronizados;
- não há segredos, artefatos temporários ou mudanças alheias no diff;
- o resumo final informa mudanças, validações e riscos ou pendências reais.

## Instruções locais

Em monorepos ou módulos com regras próprias, adicione um `AGENTS.md` dentro da
pasta correspondente. Ele deve conter apenas diferenças locais e não repetir este
arquivo.

