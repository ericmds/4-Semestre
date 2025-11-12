# 🧠 GUIA PASSO A PASSO — CONFIGURAÇÃO DE SERVIDOR PROXY  
### Grupo: BLAZER TELECUM  
**Alunos:** Éric Martins da Silva e Guilherme Rolin Frazon  
**Professor:** Sylvio Andre Garcia Vieira  
**Disciplina:** Redes de Computadores  
**Data:** 08/10/2025  

---

## 🧭 Objetivo do Trabalho

O objetivo do trabalho é configurar um ambiente de rede composto por três máquinas:

1. **Windows (Cliente)** — representa o contratante do serviço de internet.  
2. **Linux (Servidor da Empresa - BLAZER TELECUM)** — atua como proxy, servidor web e SSH.  
3. **Linux (Servidor do Laboratório - SILVIO TELECOM)** — funciona como provedor de internet (ISP).

O servidor do grupo deve **bloquear o site bet365.bet.br**, exibir uma **página HTML informando o bloqueio**, e permitir acesso remoto via **SSH**.  
O provedor (Silvio Telecom) é responsável por rotear os pacotes e garantir a comunicação entre todos os grupos.

---

## 🌐 Topologia da Rede

| Função | Equipamento | IP | Rede | Descrição |
|--------|--------------|----|------|------------|
| Cliente | Windows | 200.10.0.18 | LAN (200.10.0.16/29) | Máquina que acessa via proxy |
| Servidor da Empresa | Linux (BLAZER TELECUM) | 200.10.0.17 (LAN) / 192.168.0.9 (WAN) | Proxy + Apache + SSH |
| Provedor | Linux (SILVIO TELECOM) | 192.168.0.10 | WAN (192.168.0.8/30) | ISP que roteia o tráfego |

---

## 🪟 PARTE 1 — CONFIGURAÇÃO DO CLIENTE (WINDOWS)

O Windows atuará como **cliente** e precisa ser configurado para acessar a internet por meio do **proxy Linux**.

### 1️⃣ Configurar o Proxy no Firefox
1. Abrir o **Firefox** → **Configurações** → **Rede** → **Configurações de Proxy**  
2. Definir:
   - Proxy HTTP: `200.10.0.17`  
   - Porta: `3128`  
3. Marcar a opção **“Usar este proxy para todos os protocolos”**

🧩 Isso fará com que todas as requisições HTTP e HTTPS passem primeiro pelo servidor Linux (proxy).

---

### 2️⃣ Configurar o Endereço IPv4 no Windows

1. Acessar: **Configurações** → **Rede e Internet** → **Alterar opções de adaptador**  
2. Clicar com o botão direito → **Propriedades** → **Protocolo IP Versão 4 (TCP/IPv4)** → **Propriedades**  
3. Definir manualmente:
   - Endereço IP: `200.10.0.18`  
   - Máscara de Sub-rede: `255.255.255.248`  
   - Gateway padrão: `200.10.0.17`  
   - DNS: pode ser `8.8.8.8` (Google DNS)

✅ **Resultado esperado:** O cliente Windows enviará suas requisições para o IP do servidor Linux, que atuará como intermediário.

---

## 🐧 PARTE 2 — CONFIGURAÇÃO DO SERVIDOR LINUX (BLAZER TELECUM)

O servidor Linux será responsável por **controlar o tráfego, bloquear sites e hospedar a página de bloqueio**.

---

### ⚙️ 2.1 — Configuração das Interfaces de Rede

```bash
sudo apt update
sudo ip addr add 200.10.0.17/29 dev enp0s31f6:0
sudo ip link set enp0s31f6:0 up
sudo ip addr add 192.168.0.9/30 dev enp0s31f6:0
sudo ip link set enp0s31f6 up
ip addr show enp0s31f6:0
