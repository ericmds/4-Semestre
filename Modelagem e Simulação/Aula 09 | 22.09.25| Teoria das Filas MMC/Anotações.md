# Teoria da Fila M/M/C
## Vantagens dos Múltiplos Servidores
* Redução significativa do tempo de espera
* Melhor aproveitamento da capacidade total
* Maior variavilidade nos tempos de espera

### Exemplos Práticos
* Call center: vários atendentes para uma fila de chamada
* Banco: múltiplos caixas atendendo fila única
* Hospital: vários médicos no pronto-socorro
* Supermercado: sistema de fila única para vários caixas
* Servidor Web: múltiplos processadores/threads

Resultado: Mesmo nível de serviço com menor custo total

## O que significa M/M/C
### Primeira letra M
* Processo de chegada Markoviano (Poisson)
* Taxa de chegada λ constante
* Chegadas independentes e aleatórias

### Segunda letra M
* Tempo de serviço Markoviano (exponencial)
* Taxa de atendimento μ por servidor
* Tempos de serviço independentes

## A Fórmula de Erlang C

## Interpretando Erlang C
* Wait = esperar
* Se ele é 0,10 - 10% de clientes esperam na fila
* Quanto mais ocupação tiver nossa fila maior vai ser o wait
* Quanto mais servidores menor o wait

## Métricas de Desempenho M/M/C
* Dica: Sempre que tiver o q, é na fila. Exemplo Wq, Lq

## Exemplo 1 - Call Center
### Resolução
### Cálculo detalhado
$P(wait) = \frac{ \frac{a^c}{c!} \times \frac{c}{c - a} }{ \sum_{n=0}^{\infty} \frac{a^n}{n!} + \frac{a^c}{c!} \times \frac{c}{c - a} }$

## Exemplo 2

## Vantagens do M/M/C

## Quando Usar M/M/C

## Dimensionamento Prático

## Exemplo 3 - Banco

### Análise de Sensibilidade
* Quando há um aumento de tráfego, é necessário aumentar os servidores para atingir a meta

## Regras Práticas de Dimensionamento
* Sempre considerar o crescimento futuro (aumento de 10% ou 20%)

## Limitações do M/M/C


