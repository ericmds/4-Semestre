# Hash ou Tabelas Hash
* É uma técnica de "espalhamento" ou posicionamento, via endereço, por cálculo a partir de uma chave de entrada
* É uma técnica do Sistema Operacional (SO) para gerenciamento de arquivos em memória secundária, ou seja, quando um arquivo é criado, o SO aplica a função Hash sobre um dos campos de arquivo (chave), em geral identificador, e define uma posição na memória

## Vantagens da técnica
* Acesso direto, ou seja pesquisa/busca otimizada

## Problemas
* COLISÃO, ou seja, chaves iguais que levam ao mesmo endereço podem colidir

## Técnicas de tratamento de colisão
* Via uso de vetor (alocação estática)
  * Open Addressing (endereçamento aberto) com TABELA HASH FECHADA (existe limite do vetor)

...
