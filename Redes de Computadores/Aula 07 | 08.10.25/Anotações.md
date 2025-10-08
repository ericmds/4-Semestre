# Trabalho
* Será necessário configurar dois PC's, um Windows e um Linux
* Realizar um relatório sobre o desenvolvimento do trabalho
* Não usar SUDO APT UPGRADE

## Windows
* Será um cliente, contratante de serviço de internet, que deve ter a página bet365.bet.br bloqueada

## Linux
* Será o servidor da empresa (Empresa 316)
* Proxy - servidor intermediário entre o cliente e o servidor de internet)
* Deve bloquer o site: bet365.bet.br
* Servidor web ➜ Apache
  * Apache é um servidor web, isso significa que ele entrega páginas (HTML, CSS, etc.) para os navegadores do usuário
* Será necessário desenvolver uma página HTML, mostrando:
  * Nome do grupo
  * Mensagem informando que o acesso foi barrado
  * Mensagem informando o site barrado
* SSH (Secure Shell) é um protocolo de rede

## Linux
* Esse outro computador Linux será o Provedor de Serviços de Internet (ISP)
* Chamará Silvio Telecom
* Permite o acesso (se o servidor da empresa não bloquear, ele também não vai)
* Ele vai rotear os grupos, e os grupos vão poder acessar uns aos outros, terá que ter rotad

## Informações sobre as Redes
* Minha rede LAN: 200.10.0.16/29
* Minha rede WAN: 192.168.0.8/30

## Informações descrita do professor Sylvio
### No Rwindows
* Configurar no navegador Firefox, que ele tem que acessar a internet por proxy informando o ip do proxy e a porta que foi configurada.
* Acessar o servidor linux por ssh
* Configurar o IP da LAN do grupo

### No Linux do grupo
* Instalar e configurar o servidor web (Apache2)
* Criar a página que identifica o grupo e avisa aos usuários que o site solicitado está bloqueado.
* Instalar e configurar o Proxy (squid)
* Bloquear o site bet365.bet.br por meio do proxy configurado
* instalar um servidor de ssh
* criar um usuário e colocar ele no grupo do Sudo
* Acessar o servidor por ssh com o usuário criado.
* Configurar uma subinterface com o IP da LAN do grupo
* Configurar a interface física com o endereço da WAN do grupo
* No Servidor Linux do Lab (ISP)
* Configurar servidor ssh
* Criar usuário para o grupo
* colocar o usuário no grupo do Sudo
* Instalar e configurar um proxy transparente
* permitir acesso total aos usuário.
* Criar uma subinterface com o IP de Wan do grupo.
* Rotear o range de IP do grupo
* Todos os grupos devem conseguir acessar a página dos outros grupos

### Informações sobre a entrega
* Entrega: até dia 21/10
* Disponibilidade das aulas de 08 e 15/10 para realizar o trabalho no laboratório 316.
* Dia 22/10 iniciamos com RIP. 
