# Usando agentes no projeto

O objetivo é tornar o repositório — e não o histórico de um chat — a memória
compartilhada. Um agente novo deve conseguir continuar o trabalho lendo os arquivos
versionados.

## Iniciar uma tarefa

Um pedido curto costuma bastar:

```text
Leia AGENTS.md e o contexto indicado por ele. Implemente [resultado desejado].
Critérios de aceite: [critérios observáveis]. Verifique com os comandos do projeto.
```

Para uma tarefa grande, peça primeiro a criação de um plano a partir de
`docs/tasks/TEMPLATE.md`. Revise resultado, limites, contratos e estratégia de teste
antes da implementação.

## Trocar de agente

Se o estado do repositório está atualizado, não copie a conversa anterior. Informe
o arquivo da tarefa:

```text
Leia AGENTS.md e continue docs/tasks/AAAA-MM-DD-tarefa.md. Inspecione as alterações
locais antes de agir e confirme o próximo passo registrado no plano.
```

Antes da troca, o agente anterior deve registrar no plano ou em `STATUS.md`:

- o que está concluído de fato;
- arquivos relevantes e decisões tomadas;
- comandos executados e seus resultados;
- bloqueios, riscos e o próximo passo reproduzível.

## Revisar trabalho de outro agente

```text
Leia AGENTS.md. Revise as alterações locais em relação aos critérios de aceite.
Priorize bugs, regressões, segurança e testes ausentes. Não altere arquivos; reporte
achados com caminho e linha.
```

## Manter o contexto saudável

- Coloque regras permanentes em `AGENTS.md`, não em prompts ou no handoff.
- Coloque fatos de produto e arquitetura nos documentos próprios.
- Registre decisões significativas em ADRs, com alternativas e consequências.
- Mantenha `STATUS.md` curto; Git e planos são o histórico.
- Use `AGENTS.md` aninhado apenas quando uma subpasta realmente tiver regras
  diferentes.
- Remova instruções obsoletas. Mais contexto não significa contexto melhor.
- Nunca use documentação para esconder uma suíte quebrada: registre a falha e o
  motivo com precisão.

