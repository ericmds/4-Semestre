* Apresentação do Plano de Ensino

# Modelagem

## O que é
É um conjunto de técnicas que trazem fenômenos reais em representações matemáticas que podem ser simuladas em computadores

## Objetivo
Criar representações úteis para estudar sistemas complexos

## Conceitos Fundamentais
* Modelo: Representação matemática ou algorítimica de um sistema real
* **Simulação: Execução do modelo no computador para observar seu comportamento**
* Conjunto de elementos que interagem para alcançar um objetivo comum 
* Variáveis: Características mensuráveis do sistema que podem mudar
* Parâmetros: Valores que controlam o comportamento do modelo

## Tipos de Modelagem
* Deterministica
  * Resultado único e previsível para um conjunto de entradas (Sempre vai dar o mesmo resultado)
  * Para um mesmo conjunto de entradas, o sistema sempre produzirá a mesma saída
  * **NÃO HÁ INCERTEZA**
  * Exemplo: Cálculo de trajetória de um projeto (em vácuo)

* Estocástica (Probabilidade)
  * Incorpora elementos aleatórios, produzindo diferentes resultados possíveis
  * O comportamento futuro não pode ser previsto com certeza, apenas com uma certa probabilidade
  * Envolvem variáveis aleatórias
  * Exemplo: Previsão meteorológica
 
* Baseada em Agentes (IA)
  * Simula comportamentos individuais que geram padrões coletivos
  * Autonomia: Cada agente age por conta própria, como se fosse um "personagem" cmo suas próprias regras
  * Interação: O que acontece no sistema depende das trocas e relações entre os agentes e o ambiente
  * Exemplo: Comportamento de multidões

## Processo de Modelagem
1. Definição do Problema
2. Coleta e Análise de Dados
3. Formulação Matemática
4. Implementação Computacional
5. Validação e Calibração
6. Análise de Resultados
7. Refinamento e Otimização

## Sistemas Contínuos

## Sistemas Discretos
### Características
* Valores específicos (inteiros)
* Mudanças em instantes pontuais
* Equações de diferenças
* Tempo em intervalos discretos

### Matemática
x[n+1] = f(x[n]) - Equações de Diferenças
* As variáveis de um sistema discreto só podem assumir certos valores, geralmente inteiros ou contáveis.
* Exemplo: O número de pessoas em uma sala pode ser 0, 1, 2, 3... mas nunca 1,5 pessoas

### Exemplo Computacionais
* Redes de Computadores: Pacotes de dados
* Sistemas de Filas: Atendimento discreto
* Jogos Digitais: Estados de jogo
* Sinais Digitais: Processamento DSP

### Representação Visual
* Pontos discretos e degraus

### Exemplos

## Importância na Computação
### Compreensão
* Sistemas com milhares variáveis
* Comportamentos emergentes
* Padrões não óbvios

### Predição
* Testa cenários futuros
* Avalia impacto de mudanças
* Decisões baseadas em dados

### Economia
* Redução de custos de prototipagem
* Menor tempo de desenvolvimento
* Evita experimentos perigosos

### Formação
* Raciocínio algorítmico
* Abstração de problemas
* Preparação para IA e Data Science

## Aplicações Práticas
### Indústria
* Otimização de linhas de produção
* Simulação de fluxos industriais
* Análise de confiabilidade
* Design de produtos virtuais

### Jogos
* Física de jogos realística
* Simução de multidões
* Efeitos visuais avançados
* Inteligência artificial

### Medicina
* Propagação de epidemias
* Descoberta de medicamentos
* Análise de fluxo sanguíneo
* Dinâmica molecular

### Finanças
* Modelagem de risco financeiro
* Simulação Monte Carlo (inserir valores aleatórios)
* Análise de mercados
* Otimização de portfólios

## Ferramentas e Tecnologias

### Iniciais
* Python
 * NumPy, SciPy, Matplotlib
* MATLAB
 * Interface visual amigável
* NetLogo
 * Modelagem baseada em agentes

### Específicas
* R
 * Estatísticas e análise de dados
* Julia
 * Alto desempenho científico
* AnyLogic
 * Sistemas complexos
