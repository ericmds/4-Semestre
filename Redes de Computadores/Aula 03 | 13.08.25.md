# Correção
Correção dos exercícios passados na ultima aula
| Ip | Variação | Nº de Bits| Variação no octeto |
| :----: | :----: |  :----: | :----: |
| 255.255.255.255.255 | | 1   | 4º |
| 255.255.255.255.254 | | 2   | 4º |
| 255.255.255.255.252 | | 4   | 4º |
| 255.255.255.255.248 | | 8   | 4º |
| 255.255.255.255.240 | | 16  | 4º |
| 255.255.255.255.224 | | 32  | 4º |
| 255.255.255.255.192 | | 64  | 4º |
| 255.255.255.255.128 | | 128 | 4º |
| 255.255.255.255.0   | | 256 | 4º |

## Variação no 3 Octeto
| Ip | Variação | Nº de Bits| Variação no octeto |
| :----: | :----: |  :----: | :----: |
| 255.255.255.0 |  | 254    |
| 255.255.254.0 |  | 510    |
| 255.255.252.0 |  | 1022   |
| 255.255.248.0 |  | 2046   |
| 255.255.240.0 |  | 4094   |
| 255.255.224.0 |  | 8190   |
| 255.255.192.0 |  | 16382  |
| 255.255.128.0 |  | 32761  |
| 255.255.0.0   |  | 265534 |

* Função do roteador: interligar redes diferentes

### Comandos Roteador
* Verificar o tamanho da rede necessária para conseguir suportar 3 PCS
* Rede escolhida / 192.168.0.0
* Mascara escolhida /29
* Colocar PC (3 PCS)
  * Utilizar Cabo Straitght-Through na conexão PC -> HUB  (Dispositivos que não pensam usam Straitght-Through)
  * Configurar IPV4, MASCARA E GATEWAY nos PC's
  * PC A
    * IP: 192.168.0.4
    * MC: 255.255.255.248
    * GW: 192.168.0.9
* Colocar Roteadores (2 Roteadores)
  * Utilizar Cabo Cross-Over na conexão Roteador -> Roteador (Dispositivos pensantes usam Cross-Over)
  * Utilizar Mascara /30 na conexão Roteador -> Roteador
 
<img width="1502" height="525" alt="image" src="https://github.com/user-attachments/assets/2fdbaa6d-74a9-4d7c-a365-45acfc4b9197" />
