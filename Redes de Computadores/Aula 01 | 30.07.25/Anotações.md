# Revisão

# Segunda parte da aula

## Tramissão em Tempo Contínuo
* Se o canal está disponível pode mandar dados a vontade

## Tramissão em Tempo Fatiado
* Cada estação tem seu determinado tempo para transmitir, se não tem nada para transmitir o canal fica ocioso

## Tramissão com Teste de Portadora
* Portadora é a transmissão
* Escutar a rede para ver se tem alguém transmitindo
* Se tiver alguem transmitindo, usa o algoritmo para esperar um tempo aleatório

## Tramissão sem Teste de Portadora
* Não faz o teste para ver se tem alguém transmitindo

## Protocolos de Acesso Múltiplo
### Aloha 1970
* Um dos primeiros a ser desenvolvido
* Eficiência de aproximadamente 18%

### Aloha Fatiado 1970
* Estação aguarda o seu tempo de transmissão
* Transmite o seu quadro
* Escuta a transmissão para ver se receberam o quadro
* Eficiencia aproximadamente de 36%

### CSMA - Carrier Sense Multiple Access (1-persistente)
* "Burro do Sherek - já chegamos?" Verifica "toda hora" se o canal está livre
* Eficiência 56%

### CSMA - Não persistente
* Primeiro escuta a rede
* Se estiver alguém transmitindo, aguarda o tempo aleatório (backoff)
* Quando a rede estiver livre, transmite
* Eficiência 86%

### CSMACD - Collision Detection
* Primeiro escuta a rede
* Se estiver alguém transmitindo, aguarda o tempo aleatório (backoff)
* Esscuta novamente
* Se não estiver ninguém transmitindo envia
* Escuta a rede para ver se não tem colisão (Se chegar um pacote de bits sem sentindo, houve colisão)

## Função da camada de rede
### Routing
* Determinar o pacote
* Escolher o caminho que o pacote vai passar da origem ao destino

### Switching
* QUESTÃO 16 - QUAL A DIFERENÇA DE HUB E SWITCH
  * HUB: envia os pacotes para todos as maquinas que estão ligadas na porta, e o computador verifica se o pacote e para ele, se for abre se não for, não abre
  * SWITCH: Trabalha no nivel de camada dois, pega o endereço mac da placa e anota em cada porta, quando vem um pacote para determinada maquina, o switch abre o pacote e abre uma porta virtual "vlan" para o destino e a origem. Com o uso da vlan elimina bastante colisões. Pode trabalhar na camada 3 - transporte - 

### Estabelecimento de circuitos
* VPN

## Camada de Rede - Datagrama IP

## Camada de Rede - Endereço IP
* Fornece uma abstração
* Independente de endereçamento de hardware (MAC)
* Utilizado por
  * protoclos de camadas mais altas e
  * aplicações
* Dividido em duas partes
  * Prefixo iedentifica a rede - rede
  * sufixo identifica o comptador/interface - host
  * Exemplo: 172.25.2.212
    * 172.25.2 - rede
    * 212 - host
  * Existe uma autoridade global que atribui um prefixo distinto para a rede
  * Administrador local atribui sufixo distindo para o computador/interface
