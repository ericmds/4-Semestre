# Endereço IP
Classes de redes:
* A - 1 à 127 bits
  * Começa com 0
* B - 128 à 191 bits
  * Começa com 10
* C - 192 a 223 bits
  * Começa com 110
* D - 224 a 239 bits
  * Começa com 1110
* E - 240 a 255
  * Começa com 1111
* Exemplo
  * <ins>**192**</ins>.168.1.5 - É de 192 à 233 = Classe C
  * <ins>**110**</ins>00000.10101000.00000001.00000101 - Começa com 110 = Classe C
## Subredes
* Mascaras
  * Possui 32 bits
  * 11111111.11111111.11111111.11111111
  * Um octeto pode variar de 0 a 256
  * Para existir uma Rede de Computadores é preciso:
    * Que no mínimo dois computadores devem estar conectados e compartilhando dados em uma mesma máscara
    * Endereço de rede
    * Endereço de Broadcast: transmite para todo mundo ao mesmo tempo, quem estiver na frêquencia certa tem acesso as informações 
* Exemplo
  * 255.255.255.255 - 32 bits
  * Pega o bit mais significativo, ou seja, o mais da direita, e empresta para o IP
  * Ficará: 255.255.255.254 - 31 bits
* Menor rede de computadores possível é
* Exemplos:
  * 255.255.255.255 - 32 bits - 01 endereços possíveis -  1 - 2 = 0 - Necessário reservar 1 endereço para rede e 1 para broadcast, portanto não há endereços de rede disponíveis
  * 255.255.255.254 - 31 bits - 02 endereços possíveis -  2 - 2 = 0 - Necessário reservar 1 endereço para rede e 1 para broadcast, portanto não há endereços de rede disponíveis
  * 255.255.255.252 - 30 bits - 04 endereços possíveis - 04 - 2 = 2 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 2 endereços
  * 255.255.255.248 - 29 bits - 08 endereços possíveis - 08 - 2 = 6 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 6 endereços
  * 255.255.255.240 - 28 bits - 16 endereços possíveis - 16 - 2 = 14 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 14 endereços
  * 255.255.255.224 - 27 bits - 32 endereços possíveis - 32 - 2 = 30 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 30 endereços
  * 255.255.255.192 - 26 bits - 64 endereços possíveis - 64 - 2 = 62 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 62 endereços
  * 255.255.255.128 - 25 bits - 128 endereços possíveis - 128 - 2 = 126 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 126 endereços
  * 255.255.255.0   - 24 bits - 256 endereços possíveis - 256 - 2 = 254 - Necessário reservar 1 endereço para rede e 1 para broadcast: pode ter uma rede com 256 endereços
* Transmitindo pacotes
  * ICMP (IP): 
  * ARP: 
  * CSMACD:

# Endereços Rede e Broadcast
* **Rede** SEMPRE é **PAR**
* **Broadcast** SEMPRE é **IMPAR**
* Anda sempre de 8 em 8, 16 em 16, ... e depois tira dois
  * 0  -  7
  * 8  - 15
  * 16 - 23
  * 24 - 31
  * 32 - 39
  * 40 - 47
  * 48 - 55
  * 56 - 63
  * 64 - 71
  * 72 - 79
  * 80 - 87
  * 88 - 95

### Exercício
1. 192.168.15.70/29
  *  Primeiro: pega o quanto varia a rede, no caso da 29, varia de 8 em 8
  *  Segundo: somar até achar o range do 70
  *  0-7, 8-15, 16-23, 24-31, 32-39, 40-47, 48-55, 56-63, **64-71**
  *  Rede: 192.168.15.**64**
  *  Broadcast: 192.168.15.**71**
2. 200.100.73.125/25
  * Duas metades
  * 0-127, 128-255
  * Rede: 200.100.73.0
  * Broadcast: 200.100.73.127
3. 10.114.99.202/26
  * 64 em 64
  * 0-63, 64-127, 128-191, 192-255
  * Rede: 10.114.99.192
  * Broadcast: 10.144.99.255
4. 172.25.18.37/27
  * 32 em 32
  * 0-31, 32-63
  * Rede: 172.25.18.32
  * Broadcast: 172.25.18.63
5. 40.65.9.190/28
  * Rede: 40.65.9.176
  * Broadcast: 40.65.9.191
6. 192.168.100.100/27
  * Rede: 192.168.100.96
  * Broadcast: 192.168.100.127
7. 200.200.4.250/29
  * Rede: 200.200.4.248
  * Broadcast: 200.200.4.255
8. 201.10.120.3/23
  * Rede: 201.10.120.0
  * Broadcast: 201.10.121.255
