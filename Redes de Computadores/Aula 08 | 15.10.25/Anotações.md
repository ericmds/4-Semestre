# No Windows
* Configurar o proxy do Firefox
  * Entrar nas configurações do Firefox
  * Entrar nas configurações de Proxy
  * Alterar Proxy HTTP para 200.10.0.17
  * Alterar Porta para 3128
* Nas configurações do Windows
  * Entrar nas configurações de rede
  * Editar as Atribuições de IP
  * Adicionar no IPv4
  * Endereço IP: 200.10.0.16
  * Mascara: 255.255.255.248

# No Linux - Blaze Telecom
# TERMINAL
```
laboratorio@LAB24DT02:~$ sudo apt update
[sudo] senha para laboratorio: 
Atingido:1 http://br.archive.ubuntu.com/ubuntu jammy InRelease
Atingido:2 http://br.archive.ubuntu.com/ubuntu jammy-updates InRelease         
Atingido:3 http://br.archive.ubuntu.com/ubuntu jammy-backports InRelease       
Obter:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]    
Baixados 129 kB em 1s (153 kB/s)   
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto        
97 pacotes podem ser atualizados. Corra 'apt list --upgradable' para vê-los.
laboratorio@LAB24DT02:~$ sudo ip addr add 200.10.0.17/29 dev enp0s31f6
laboratorio@LAB24DT02:~$ sudo ip link set enp0s31f6 up
laboratorio@LAB24DT02:~$ ip addr show enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 604699sec preferred_lft 604699sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
laboratorio@LAB24DT02:~$ ping 200.10.0.16
PING 200.10.0.16 (200.10.0.16) 56(84) bytes of data.
From 200.10.0.17 icmp_seq=1 Destination Host Unreachable
From 200.10.0.17 icmp_seq=2 Destination Host Unreachable
From 200.10.0.17 icmp_seq=3 Destination Host Unreachable
From 200.10.0.17 icmp_seq=4 Destination Host Unreachable
From 200.10.0.17 icmp_seq=5 Destination Host Unreachable
From 200.10.0.17 icmp_seq=6 Destination Host Unreachable
From 200.10.0.17 icmp_seq=7 Destination Host Unreachable
From 200.10.0.17 icmp_seq=8 Destination Host Unreachable
From 200.10.0.17 icmp_seq=9 Destination Host Unreachable
From 200.10.0.17 icmp_seq=10 Destination Host Unreachable
From 200.10.0.17 icmp_seq=11 Destination Host Unreachable
From 200.10.0.17 icmp_seq=12 Destination Host Unreachable
^C
--- 200.10.0.16 ping statistics ---
13 packets transmitted, 0 received, +12 errors, 100% packet loss, time 12326ms
pipe 3
laboratorio@LAB24DT02:~$ sudo ip addr add 192.168.0.9/30 dev enp0s31f6
laboratorio@LAB24DT02:~$ sudo ip link set enp0s31f6 up
laboratorio@LAB24DT02:~$ ip addr show enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 604617sec preferred_lft 604617sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
    inet 192.168.0.9/30 scope global enp0s31f6
       valid_lft forever preferred_lft forever
laboratorio@LAB24DT02:~$ sudo apt install apache2 -y
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto        
apache2 já é a versão mais recente (2.4.52-1ubuntu4.16).
Os seguintes pacotes foram instalados automaticamente e já não são necessários:
  chromium-codecs-ffmpeg-extra gstreamer1.0-vaapi i965-va-driver
  intel-media-va-driver libaacs0 libaom3 libass9 libavcodec58 libavformat58
  libavutil56 libbdplus0 libblas3 libbluray2 libbs2b0 libchromaprint1
  libcodec2-1.0 libdav1d5 libflashrom1 libflite1 libftdi1-2 libgme0 libgsm1
  libgstreamer-plugins-bad1.0-0 libigdgmm12 liblilv-0-0 libllvm13 libmfx1
  libmysofa1 libnorm1 libopenmpt0 libpgm-5.3-0 libpostproc55 librabbitmq4
  librubberband2 libserd-0-0 libshine3 libsnappy1v5 libsord-0-0 libsratom-0-0
  libsrt1.4-gnutls libssh-gcrypt-4 libswresample3 libswscale5 libudfread0
  libva-drm2 libva-wayland2 libva-x11-2 libva2 libvdpau1 libvidstab1.1
  libx265-199 libxvidcore4 libzimg2 libzmq5 libzvbi-common libzvbi0
  mesa-va-drivers mesa-vdpau-drivers pocketsphinx-en-us va-driver-all
  vdpau-driver-all
Utilize 'sudo apt autoremove' para os remover.
0 pacotes atualizados, 0 pacotes novos instalados, 0 a serem removidos e 97 não atualizados.
laboratorio@LAB24DT02:~$ sudo nano /var/www/html/index.html
laboratorio@LAB24DT02:~$ sudo nano /var/www/html/index.html
laboratorio@LAB24DT02:~$ sudo systemctl restart apache2
laboratorio@LAB24DT02:~$ sudo apt install squid -y
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto        
squid já é a versão mais recente (5.9-0ubuntu0.22.04.3).
Os seguintes pacotes foram instalados automaticamente e já não são necessários:
  chromium-codecs-ffmpeg-extra gstreamer1.0-vaapi i965-va-driver
  intel-media-va-driver libaacs0 libaom3 libass9 libavcodec58 libavformat58
  libavutil56 libbdplus0 libblas3 libbluray2 libbs2b0 libchromaprint1
  libcodec2-1.0 libdav1d5 libflashrom1 libflite1 libftdi1-2 libgme0 libgsm1
  libgstreamer-plugins-bad1.0-0 libigdgmm12 liblilv-0-0 libllvm13 libmfx1
  libmysofa1 libnorm1 libopenmpt0 libpgm-5.3-0 libpostproc55 librabbitmq4
  librubberband2 libserd-0-0 libshine3 libsnappy1v5 libsord-0-0 libsratom-0-0
  libsrt1.4-gnutls libssh-gcrypt-4 libswresample3 libswscale5 libudfread0
  libva-drm2 libva-wayland2 libva-x11-2 libva2 libvdpau1 libvidstab1.1
  libx265-199 libxvidcore4 libzimg2 libzmq5 libzvbi-common libzvbi0
  mesa-va-drivers mesa-vdpau-drivers pocketsphinx-en-us va-driver-all
  vdpau-driver-all
Utilize 'sudo apt autoremove' para os remover.
0 pacotes atualizados, 0 pacotes novos instalados, 0 a serem removidos e 97 não atualizados.
laboratorio@LAB24DT02:~$ sudo nano /etc/squid/squid.conf
laboratorio@LAB24DT02:~$ sudo systemctl restart squid
Job for squid.service failed because the control process exited with error code.
See "systemctl status squid.service" and "journalctl -xeu squid.service" for details.
laboratorio@LAB24DT02:~$ systemctl status squid.service
× squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: failed (Result: exit-code) since Wed 2025-10-15 10:21:26 -03; 32s >
       Docs: man:squid(8)
    Process: 4219 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, st>
        CPU: 5ms

out 15 10:21:26 LAB24DT02 systemd[1]: Starting Squid Web Proxy Server...
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Control process exited, co>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| ACL not found: loca>
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Failed with result 'exit-c>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| FATAL: Bungled /etc>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| Squid Cache (Versio>
out 15 10:21:26 LAB24DT02 squid[4219]: CPU Usage: 0.006 seconds = 0.003 user + >
out 15 10:21:26 LAB24DT02 squid[4219]: Maximum Resident Size: 58880 KB
out 15 10:21:26 LAB24DT02 squid[4219]: Page faults with physical i/o: 0
out 15 10:21:26 LAB24DT02 systemd[1]: Failed to start Squid Web Proxy Server.
...skipping...
× squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: failed (Result: exit-code) since Wed 2025-10-15 10:21:26 -03; 32s >
       Docs: man:squid(8)
    Process: 4219 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, st>
        CPU: 5ms

out 15 10:21:26 LAB24DT02 systemd[1]: Starting Squid Web Proxy Server...
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Control process exited, co>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| ACL not found: loca>
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Failed with result 'exit-c>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| FATAL: Bungled /etc>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| Squid Cache (Versio>
out 15 10:21:26 LAB24DT02 squid[4219]: CPU Usage: 0.006 seconds = 0.003 user + >
out 15 10:21:26 LAB24DT02 squid[4219]: Maximum Resident Size: 58880 KB
out 15 10:21:26 LAB24DT02 squid[4219]: Page faults with physical i/o: 0
out 15 10:21:26 LAB24DT02 systemd[1]: Failed to start Squid Web Proxy Server.
~
 ESCOC
/squid.service; enabled; vendor preset: enabled)
since Wed 2025-10-15 10:21:26 -03; 32s ago
/squid --foreground -z (code=exited, status=1/FAILURE)
arting Squid Web Proxy Server...
uid.service: Control process exited, code=exited, status=1/FAILURE
025/10/15 10:21:26| ACL not found: localnet
uid.service: Failed with result 'exit-code'.
025/10/15 10:21:26| FATAL: Bungled /etc/squid/squid.conf line 13: http_access a>
025/10/15 10:21:26| Squid Cache (Version 5.9): Terminated abnormally.
PU Usage: 0.006 seconds = 0.003 user + 0.002 sys
aximum Resident Size: 58880 KB
age faults with physical i/o: 0
iled to start Squid Web Proxy Server.
laboratorio@LAB24DT02:~$ systemctl status squid.service
× squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: failed (Result: exit-code) since Wed 2025-10-15 10:21:26 -03; 1min>
       Docs: man:squid(8)
    Process: 4219 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, st>
        CPU: 5ms
out 15 10:21:26 LAB24DT02 systemd[1]: Starting Squid Web Proxy Server...
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Control process exited, co>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| ACL not found: loca>
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Failed with result 'exit-c>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| FATAL: Bungled /etc>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| Squid Cache (Versio>
out 15 10:21:26 LAB24DT02 squid[4219]: CPU Usage: 0.006 seconds = 0.003 user + >
out 15 10:21:26 LAB24DT02 squid[4219]: Maximum Resident Size: 58880 KB
out 15 10:21:26 LAB24DT02 squid[4219]: Page faults with physical i/o: 0
out 15 10:21:26 LAB24DT02 systemd[1]: Failed to start Squid Web Proxy Server.
...skipping...
× squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: failed (Result: exit-code) since Wed 2025-10-15 10:21:26 -03; 1min>
       Docs: man:squid(8)
    Process: 4219 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, st>
        CPU: 5ms
out 15 10:21:26 LAB24DT02 systemd[1]: Starting Squid Web Proxy Server...
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Control process exited, co>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| ACL not found: loca>
out 15 10:21:26 LAB24DT02 systemd[1]: squid.service: Failed with result 'exit-c>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| FATAL: Bungled /etc>
out 15 10:21:26 LAB24DT02 squid[4219]: 2025/10/15 10:21:26| Squid Cache (Versio>
out 15 10:21:26 LAB24DT02 squid[4219]: CPU Usage: 0.006 seconds = 0.003 user + >
out 15 10:21:26 LAB24DT02 squid[4219]: Maximum Resident Size: 58880 KB
out 15 10:21:26 LAB24DT02 squid[4219]: Page faults with physical i/o: 0
out 15 10:21:26 LAB24DT02 systemd[1]: Failed to start Squid Web Proxy Server.
laboratorio@LAB24DT02:~$ sudo systemctl restart squid
Job for squid.service failed because the control process exited with error code.
See "systemctl status squid.service" and "journalctl -xeu squid.service" for details.
laboratorio@LAB24DT02:~$ sudo nano /etc/squid/squid.conf
laboratorio@LAB24DT02:~$ 
laboratorio@LAB24DT02:~$ 
laboratorio@LAB24DT02:~$ sudo systemctl restart squid
Job for squid.service failed because the control process exited with error code.
See "systemctl status squid.service" and "journalctl -xeu squid.service" for details.
laboratorio@LAB24DT02:~$ ^C
laboratorio@LAB24DT02:~$ sudo nano /etc/squid/squid.conf
laboratorio@LAB24DT02:~$ sudo systemctl restart squid
laboratorio@LAB24DT02:~$ ip addr show enp0s31f6
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 603601sec preferred_lft 603601sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
    inet 192.168.0.9/30 scope global enp0s31f6
       valid_lft forever preferred_lft forever
laboratorio@LAB24DT02:~$ sudo apt install openssh-server -y
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto        
openssh-server já é a versão mais recente (1:8.9p1-3ubuntu0.13).
Os seguintes pacotes foram instalados automaticamente e já não são necessários:
  chromium-codecs-ffmpeg-extra gstreamer1.0-vaapi i965-va-driver
  intel-media-va-driver libaacs0 libaom3 libass9 libavcodec58 libavformat58
  libavutil56 libbdplus0 libblas3 libbluray2 libbs2b0 libchromaprint1 libcodec2-1.0
  libdav1d5 libflashrom1 libflite1 libftdi1-2 libgme0 libgsm1
  libgstreamer-plugins-bad1.0-0 libigdgmm12 liblilv-0-0 libllvm13 libmfx1 libmysofa1
  libnorm1 libopenmpt0 libpgm-5.3-0 libpostproc55 librabbitmq4 librubberband2
  libserd-0-0 libshine3 libsnappy1v5 libsord-0-0 libsratom-0-0 libsrt1.4-gnutls
  libssh-gcrypt-4 libswresample3 libswscale5 libudfread0 libva-drm2 libva-wayland2
  libva-x11-2 libva2 libvdpau1 libvidstab1.1 libx265-199 libxvidcore4 libzimg2
  libzmq5 libzvbi-common libzvbi0 mesa-va-drivers mesa-vdpau-drivers
  pocketsphinx-en-us va-driver-all vdpau-driver-all
Utilize 'sudo apt autoremove' para os remover.
0 pacotes atualizados, 0 pacotes novos instalados, 0 a serem removidos e 97 não atualizados.
laboratorio@LAB24DT02:~$ sudo systemctl enable ssh
Synchronizing state of ssh.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable ssh
laboratorio@LAB24DT02:~$ sudo systemctl start ssh
laboratorio@LAB24DT02:~$ sudo adduser ericfraz
adduser: O usuário 'ericfraz' já existe.
laboratorio@LAB24DT02:~$ sudo adduser ericfrazzon
Adicionando o usuário `ericfrazzon' ...
Adicionando novo grupo 'ericfrazzon' (1004) ...
Adicionando novo usuário `ericfrazzon' (1004) ao grupo `ericfrazzon' ...
Criando diretório pessoal `/home/ericfrazzon' ...
Copiando arquivos de '/etc/skel' ...
Nova senha: 
SENHA INCORRETA: A senha não passa pela verificação do dicionário - é muito simples/sistemática
Redigite a nova senha: 
As senhas não são iguais.
Nova senha: 
SENHA INCORRETA: A senha não passa pela verificação do dicionário - é muito simples/sistemática
Redigite a nova senha: 
As senhas não são iguais.
Nova senha: 
SENHA INCORRETA: A senha não passa pela verificação do dicionário - é muito simples/sistemática
Redigite a nova senha: 
As senhas não são iguais.
passwd : Esgotado o número máximo de tentativas para serviço
passwd: senha inalterada
Tentar novamente? [s/N] s
Nova senha: 
Redigite a nova senha: 
passwd: senha atualizada com sucesso
Modificando as informações de usuário para ericfrazzon
Informe o novo valor ou pressione ENTER para aceitar o padrão
	Nome Completo []: 
	Número da Sala []: 
	Fone de Trabalho []: 
	Fone Residencial []: 
	Outro []: 
A informação está correta? [S/n] s
laboratorio@LAB24DT02:~$ sudo usermod -aG sudo ericfrazzon
laboratorio@LAB24DT02:~$ ssh ericfrazzon@200.10.0.17
The authenticity of host '200.10.0.17 (200.10.0.17)' can't be established.
ED25519 key fingerprint is SHA256:RZ1Q0pQopOnbE+n9lerNPQ40WJJCA4ObFD7rBZxkHIo.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '200.10.0.17' (ED25519) to the list of known hosts.
ericfrazzon@200.10.0.17's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-45-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

Manutenção de Segurança Expandida para Applications não está ativa.
91 as atualizações podem ser aplicadas imediatamente.
8 dessas atualizações são atualizações de segurança padrão.
Para ver as actualizações adicionais corre o comando: apt list --upgradable
Ativar ESM Apps para poder receber possiveis futuras atualizações de segurança.
Consulte https://ubuntu.com/esm ou execute: sudo pro status
The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
ericfrazzon@LAB24DT02:~$ sudo systemctl status apache2
[sudo] senha para ericfrazzon: 
● apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enab>
     Active: active (running) since Wed 2025-10-15 10:19:11 -03; 20min ago
       Docs: https://httpd.apache.org/docs/2.4/
   Main PID: 4062 (apache2)
      Tasks: 55 (limit: 18715)
     Memory: 5.5M
        CPU: 94ms
     CGroup: /system.slice/apache2.service
             ├─4062 /usr/sbin/apache2 -k start
             ├─4063 /usr/sbin/apache2 -k start
             └─4064 /usr/sbin/apache2 -k start
out 15 10:19:11 LAB24DT02 systemd[1]: Starting The Apache HTTP Server...
out 15 10:19:11 LAB24DT02 apachectl[4061]: AH00558: apache2: Could not reliably determ>
out 15 10:19:11 LAB24DT02 systemd[1]: Started The Apache HTTP Server.
ericfrazzon@LAB24DT02:~$ sudo systemctl status squid.service
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: active (running) since Wed 2025-10-15 10:27:54 -03; 11min ago
       Docs: man:squid(8)
   Main PID: 4322 (squid)
      Tasks: 3 (limit: 18715)
     Memory: 18.7M
        CPU: 132ms
     CGroup: /system.slice/squid.service
             ├─4322 /usr/sbin/squid --foreground -sYC
             ├─4324 "(squid-1)" --kid squid-1 --foreground -sYC
             └─4325 "(pinger)"
out 15 10:27:54 LAB24DT02 squid[4324]: Using Least Load store dir selection
out 15 10:27:54 LAB24DT02 squid[4324]: Current Directory is /
out 15 10:27:54 LAB24DT02 squid[4324]: Finished loading MIME types and icons.
out 15 10:27:54 LAB24DT02 squid[4324]: HTCP Disabled.
out 15 10:27:54 LAB24DT02 squid[4324]: Pinger socket opened on FD 13
out 15 10:27:54 LAB24DT02 squid[4324]: Squid plugin modules loaded: 0
out 15 10:27:54 LAB24DT02 squid[4324]: Adaptation support is off.
out 15 10:27:54 LAB24DT02 squid[4324]: Accepting HTTP Socket connections at conn3 loca>
out 15 10:27:54 LAB24DT02 systemd[1]: Started Squid Web Proxy Server.
out 15 10:27:55 LAB24DT02 squid[4324]: storeLateRelease: released 0 objects
ericfrazzon@LAB24DT02:~$ curl -x 200.10.0.17:3128 http://bet365.bet.br
Comando 'curl' não encontrado, mas poder ser instalado com:
sudo snap install curl  # version 8.16.0, or
sudo apt  install curl  # version 7.81.0-1ubuntu1.21
Veja 'snap info curl' para versões adicionais.
ericfrazzon@LAB24DT02:~$ sudo nano /etc/squid/squid.conf
ericfrazzon@LAB24DT02:~$ sudo sustemctl restart squid
sudo: sustemctl: comando não encontrado
ericfrazzon@LAB24DT02:~$ sudo systemctl restart squid
ericfrazzon@LAB24DT02:~$ sudo systemctl restart squid
ericfrazzon@LAB24DT02:~$ pwd
/home/ericfrazzon
ericfrazzon@LAB24DT02:~$ cd /etc/squid
ericfrazzon@LAB24DT02:/etc/squid$ ls -la
total 1040
drwxr-xr-x   4 root root   4096 out 15 10:43 .
drwxr-xr-x 133 root root  12288 out 15 10:35 ..
drwxr-xr-x   2 root root   4096 out 15 08:31 conf.d
-rw-r--r--   1 root root   1800 jul  9  2024 errorpage.css
drwxr-xr-x   3 root root   4096 out  2 15:02 errors
-rw-r--r--   1 root root    754 out 15 10:27 squid.conf
-rw-r--r--   1 root root 342950 out  1 10:10 squid.conf.bkp
-rw-r--r--   1 root root 342961 out  1 10:12 squid.conf.save
-rw-r--r--   1 root root 342950 out  1 10:17 squid.conf.save.1
ericfrazzon@LAB24DT02:/etc/squid$ cat squid.conf
# Porta do proxy
http_port 3128
visible_hostname Proxy.SQUID

# Mensagens personalizadas
error_directory /etc/squid/errors/Personalizado

# Logs
cache_access_log /var/log/squid/access.log

# ACL da rede local (10.104.16.0 até 10.104.16.63)
acl redelocal src 10.104.16.0/26

# Libera localhost
acl localhost src 127.0.0.1/32

# Bloquear site de apostas
acl site_bloqueado dstdomain .bet365.bet.br

# Segurança básica
acl SSL_ports port 443 563
acl Safe_ports port 80 21 443 563 70 210 1025-65535 280 488 591 777 901

# Regras de acesso
http_access deny site_bloqueado
http_access deny !Safe_ports
http_access deny CONNECT !SSL_ports

http_access allow localhost
http_access allow redelocal

# Bloqueia tudo que não foi permitido
http_access deny all

ericfrazzon@LAB24DT02:/etc/squid$ cat /var/www/html/index.html 
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Site Bloqueado</title>
<style>
body { font-family: Arial; text-align: center; margin-top: 10%; background-color: #f4f4f4; }
h1 { color: red; }
</style>
</head>
<body>
  <h1>🚫 ACESSO BLOQUEADO 🚫</h1>
  <h2>Grupo: BLAZER TELECUM</h2>
  <p>O site solicitado foi bloqueado pelo proxy do grupo.</p>
</body>
</html>
EOF
ericfrazzon@LAB24DT02:/etc/squid$ cd /var/www/html/
ericfrazzon@LAB24DT02:/var/www/html$ ls -la
total 16
drwxr-xr-x 2 root root 4096 out 15 10:18 .
drwxr-xr-x 3 root root 4096 out 18  2024 ..
-rw-r--r-- 1 root root  242 out  8 10:16 blockbet.html
-rw-r--r-- 1 root root  393 out 15 10:18 index.html
ericfrazzon@LAB24DT02:/var/www/html$ cat blockbet.html 
<!DOCTYPE html>
<html>
  <head>
    <title>Site Bloqueado</title>
  </head>
  <body>
    <h1>Grupo: Blaze Telecum</h1>
    <p>O acesso ao site <strong>bet365.bet.br</strong> foi bloqueado. Acesse a Blaze que é melhor.</p>
  </body>
</html>

ericfrazzon@LAB24DT02:/var/www/html$ cd ..
ericfrazzon@LAB24DT02:/var/www$ ls -la
total 12
drwxr-xr-x  3 root root 4096 out 18  2024 .
drwxr-xr-x 15 root root 4096 out 18  2024 ..
drwxr-xr-x  2 root root 4096 out 15 10:18 html
ericfrazzon@LAB24DT02:/var/www$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.22  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:12:c4  txqueuelen 1000  (Ethernet)
        RX packets 7640  bytes 4049217 (4.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4814  bytes 1702892 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 2148  bytes 212519 (212.5 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2148  bytes 212519 (212.5 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ericfrazzon@LAB24DT02:/var/www$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 602485sec preferred_lft 602485sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
    inet 192.168.0.9/30 scope global enp0s31f6
       valid_lft forever preferred_lft forever
ericfrazzon@LAB24DT02:/var/www$ pwd
/var/www
ericfrazzon@LAB24DT02:/var/www$ ls -la
total 12
drwxr-xr-x  3 root root 4096 out 18  2024 .
drwxr-xr-x 15 root root 4096 out 18  2024 ..
drwxr-xr-x  2 root root 4096 out 15 10:18 html
ericfrazzon@LAB24DT02:/var/www$ cd html
ericfrazzon@LAB24DT02:/var/www/html$ ls -la]
ls: opção inválida -- “]”
Tente "ls --help" para mais informações.
ericfrazzon@LAB24DT02:/var/www/html$ ls -la
total 16
drwxr-xr-x 2 root root 4096 out 15 10:18 .
drwxr-xr-x 3 root root 4096 out 18  2024 ..
-rw-r--r-- 1 root root  242 out  8 10:16 blockbet.html
-rw-r--r-- 1 root root  393 out 15 10:18 index.html
ericfrazzon@LAB24DT02:/var/www/html$ cat index.html 
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Site Bloqueado</title>
<style>
body { font-family: Arial; text-align: center; margin-top: 10%; background-color: #f4f4f4; }
h1 { color: red; }
</style>
</head>
<body>
  <h1>🚫 ACESSO BLOQUEADO 🚫</h1>
  <h2>Grupo: BLAZER TELECUM</h2>
  <p>O site solicitado foi bloqueado pelo proxy do grupo.</p>
</body>
</html>
EOF
ericfrazzon@LAB24DT02:/var/www/html$ cat blockbet.html 
<!DOCTYPE html>
<html>
  <head>
    <title>Site Bloqueado</title>
  </head>
  <body>
    <h1>Grupo: Blaze Telecum</h1>
    <p>O acesso ao site <strong>bet365.bet.br</strong> foi bloqueado. Acesse a Blaze que é melhor.</p>
  </body>
</html>

ericfrazzon@LAB24DT02:/var/www/html$ cd /etc/squid
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.22  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:12:c4  txqueuelen 1000  (Ethernet)
        RX packets 7890  bytes 4117611 (4.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 4938  bytes 1756998 (1.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 3275  bytes 311467 (311.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3275  bytes 311467 (311.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ericfrazzon@LAB24DT02:/etc/squid$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 602238sec preferred_lft 602238sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
    inet 192.168.0.9/30 scope global enp0s31f6
       valid_lft forever preferred_lft forever
ericfrazzon@LAB24DT02:/etc/squid$ ifconfigifconfig
ifconfigifconfig: comando não encontrado
ericfrazzon@LAB24DT02:/etc/squid$ iiiiiifconfig
iiiiiifconfig: comando não encontrado
ericfrazzon@LAB24DT02:/etc/squid$ ls -la
total 1040
drwxr-xr-x   4 root root   4096 out 15 10:53 .
drwxr-xr-x 133 root root  12288 out 15 10:35 ..
drwxr-xr-x   2 root root   4096 out 15 08:31 conf.d
-rw-r--r--   1 root root   1800 jul  9  2024 errorpage.css
drwxr-xr-x   3 root root   4096 out  2 15:02 errors
-rw-r--r--   1 root root    754 out 15 10:27 squid.conf
-rw-r--r--   1 root root 342950 out  1 10:10 squid.conf.bkp
-rw-r--r--   1 root root 342961 out  1 10:12 squid.conf.save
-rw-r--r--   1 root root 342950 out  1 10:17 squid.conf.save.1
ericfrazzon@LAB24DT02:/etc/squid$ ls -la conf.d/
total 12
drwxr-xr-x 2 root root 4096 out 15 08:31 .
drwxr-xr-x 4 root root 4096 out 15 10:53 ..
-rw-r--estou salvando alunos comando em um bloco de codigo em mk no github qual nome de linguagem eu coloco para ele identificar e colorir as letrar no bloco decodigo, exemplo .java, .pyr-- 1 root root  230 jul  9  2024 debian.conf
ericfrazzon@LAB24DT02:/etc/squid$ ls -la errors
total 12
drwxr-xr-x 3 root root 4096 out  2 15:02 .
drwxr-xr-x 4 root root 4096 out 15 10:53 ..
drwxr-xr-x 2 root root 4096 out  2 15:23 Personalizado
ericfrazzon@LAB24DT02:/etc/squid$ ls -la errors/Personalizado/
total 16
drwxr-xr-x 2 root root 4096 out  2 15:23 .
drwxr-xr-x 3 root root 4096 out  2 15:02 ..
-rw-r--r-- 1 root root  254 out  2 15:23 ERR_ACCESS_DENIED
-rw-r--r-- 1 root root  265 out  2 15:03 ERR_BLOCKED_SITE
lrwxrwxrwx 1 root root    2 out  2 15:17 Portuguese -> pt
ericfrazzon@LAB24DT02:/etc/squid$ cat errors/Personalizado/ERR_ACCESS_DENIED 
<html>
<head><title>Site Bloqueado</title></head>
<body>
<h1 style="color:red;">Site bloqueado por Bernardo e Maria</h1>
<p>O site que você tentou acessar está bloqueado por SER DO DJABO.</p>
<p>NÃO APOSTA NO TIGRINHO DESGRAÇADO</p>
</body>
</html>

ericfrazzon@LAB24DT02:/etc/squid$ cat errors/Personalizado/ERR_BLOCKED_SITE 
<html>
<head><title>Site Bloqueado</title></head>
<body>
<h1 style="color:red;">Acesso Bloqueado!</h1>
<p>O site que você tentou acessar está bloqueado pela política da rede.</p>
<p>Se você acha que isso é um erro, contate o administrador.</p>
</body>
</html>
ericfrazzon@LAB24DT02:/etc/squid$ pwd
/etc/squid
ericfrazzon@LAB24DT02:/etc/squid$ ls -la
total 1040
drwxr-xr-x   4 root root   4096 out 15 10:53 .
drwxr-xr-x 133 root root  12288 out 15 10:35 ..
drwxr-xr-x   2 root root   4096 out 15 08:31 conf.d
-rw-r--r--   1 root root   1800 jul  9  2024 errorpage.css
drwxr-xr-x   3 root root   4096 out  2 15:02 errors
-rw-r--r--   1 root root    754 out 15 10:27 squid.conf
-rw-r--r--   1 root root 342950 out  1 10:10 squid.conf.bkp
-rw-r--r--   1 root root 342961 out  1 10:12 squid.conf.save
-rw-r--r--   1 root root 342950 out  1 10:17 squid.conf.save.1
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ sudo cp squid.conf squid.conf.MARIA_BERNARDO
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi bloqueado.txt
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid stop
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid status
○ squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: inactive (dead) since Wed 2025-10-15 11:10:44 -03; 8s ago
       Docs: man:squid(8)
    Process: 5053 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, status=0/>
    Process: 5057 ExecStart=/usr/sbin/squid --foreground -sYC (code=exited, status=0/S>
   Main PID: 5057 (code=exited, status=0/SUCCESS)
        CPU: 240ms

out 15 11:10:44 LAB24DT02 squid[5059]: Shutting down...
out 15 11:10:44 LAB24DT02 squid[5059]: storeDirWriteCleanLogs: Starting...
out 15 11:10:44 LAB24DT02 squid[5059]:   Finished.  Wrote 0 entries.
out 15 11:10:44 LAB24DT02 squid[5059]:   Took 0.00 seconds (  0.00 entries/sec).
out 15 11:10:44 LAB24DT02 squid[5059]: Logfile: closing log stdio:/var/log/squid/acces>
out 15 11:10:44 LAB24DT02 squid[5059]: Squid Cache (Version 5.9): Exiting normally.
out 15 11:10:44 LAB24DT02 squid[5057]: Squid Parent: squid-1 process 5059 exited with >
out 15 11:10:44 LAB24DT02 squid[5057]: Removing PID file (/run/squid.pid)
out 15 11:10:44 LAB24DT02 systemd[1]: squid.service: Deactivated successfully.
out 15 11:10:44 LAB24DT02 systemd[1]: Stopped Squid Web Proxy Server.
...skipping...
○ squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: inactive (dead) since Wed 2025-10-15 11:10:44 -03; 8s ago
       Docs: man:squid(8)
    Process: 5053 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, status=0/>
    Process: 5057 ExecStart=/usr/sbin/squid --foreground -sYC (code=exited, status=0/S>
   Main PID: 5057 (code=exited, status=0/SUCCESS)
        CPU: 240ms

out 15 11:10:44 LAB24DT02 squid[5059]: Shutting down...
out 15 11:10:44 LAB24DT02 squid[5059]: storeDirWriteCleanLogs: Starting...
out 15 11:10:44 LAB24DT02 squid[5059]:   Finished.  Wrote 0 entries.
out 15 11:10:44 LAB24DT02 squid[5059]:   Took 0.00 seconds (  0.00 entries/sec).
out 15 11:10:44 LAB24DT02 squid[5059]: Logfile: closing log stdio:/var/log/squid/acces>
out 15 11:10:44 LAB24DT02 squid[5059]: Squid Cache (Version 5.9): Exiting normally.
out 15 11:10:44 LAB24DT02 squid[5057]: Squid Parent: squid-1 process 5059 exited with >
out 15 11:10:44 LAB24DT02 squid[5057]: Removing PID file (/run/squid.pid)
out 15 11:10:44 LAB24DT02 systemd[1]: squid.service: Deactivated successfully.
out 15 11:10:44 LAB24DT02 systemd[1]: Stopped Squid Web Proxy Server.
~
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid start
Job for squid.service failed because the control process exited with error code.
See "systemctl status squid.service" and "journalctl -xeu squid.service" for details.
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid start
Job for squid.service failed because the control process exited with error code.
See "systemctl status squid.service" and "journalctl -xeu squid.service" for details.
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid start
ericfrazzon@LAB24DT02:/etc/squid$ sudo vi squid.conf
ericfrazzon@LAB24DT02:/etc/squid$ cat squid.conf
# Porta do proxy
http_port 3128
visible_hostname Proxy.SQUID

# Bloquear site de apostas
acl site_bloqueado url_regex -i "/etc/squid/bloqueado.txt"


# Regras de acesso
http_access deny site_bloqueado
deny_info http://200.10.0.17 site_bloqueado

ericfrazzon@LAB24DT02:/etc/squid$ sudo vi bloqueado.txt
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid stop
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid status
○ squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: inactive (dead) since Wed 2025-10-15 11:19:45 -03; 4s ago
       Docs: man:squid(8)
    Process: 5880 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, status=0/>
    Process: 5883 ExecStart=/usr/sbin/squid --foreground -sYC (code=exited, status=0/S>
   Main PID: 5883 (code=exited, status=0/SUCCESS)
        CPU: 557ms

out 15 11:19:45 LAB24DT02 squid[5885]:   Finished.  Wrote 0 entries.
out 15 11:19:45 LAB24DT02 squid[5885]:   Took 0.00 seconds (  0.00 entries/sec).
out 15 11:19:45 LAB24DT02 squid[5885]: Logfile: closing log daemon:/var/log/squid/acce>
out 15 11:19:45 LAB24DT02 squid[5885]: Logfile Daemon: closing log daemon:/var/log/squ>
out 15 11:19:45 LAB24DT02 squid[5885]: Open FD UNSTARTED    10 IPC UNIX STREAM Parent
out 15 11:19:45 LAB24DT02 squid[5885]: Squid Cache (Version 5.9): Exiting normally.
out 15 11:19:45 LAB24DT02 squid[5883]: Squid Parent: squid-1 process 5885 exited with >
out 15 11:19:45 LAB24DT02 squid[5883]: Removing PID file (/run/squid.pid)
out 15 11:19:45 LAB24DT02 systemd[1]: squid.service: Deactivated successfully.
out 15 11:19:45 LAB24DT02 systemd[1]: Stopped Squid Web Proxy Server.
...skipping...
○ squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: inactive (dead) since Wed 2025-10-15 11:19:45 -03; 4s ago
       Docs: man:squid(8)
    Process: 5880 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, status=0/>
    Process: 5883 ExecStart=/usr/sbin/squid --foreground -sYC (code=exited, status=0/S>
   Main PID: 5883 (code=exited, status=0/SUCCESS)
        CPU: 557ms

out 15 11:19:45 LAB24DT02 squid[5885]:   Finished.  Wrote 0 entries.
out 15 11:19:45 LAB24DT02 squid[5885]:   Took 0.00 seconds (  0.00 entries/sec).
out 15 11:19:45 LAB24DT02 squid[5885]: Logfile: closing log daemon:/var/log/squid/acce>
out 15 11:19:45 LAB24DT02 squid[5885]: Logfile Daemon: closing log daemon:/var/log/squ>
out 15 11:19:45 LAB24DT02 squid[5885]: Open FD UNSTARTED    10 IPC UNIX STREAM Parent
out 15 11:19:45 LAB24DT02 squid[5885]: Squid Cache (Version 5.9): Exiting normally.
out 15 11:19:45 LAB24DT02 squid[5883]: Squid Parent: squid-1 process 5885 exited with >
out 15 11:19:45 LAB24DT02 squid[5883]: Removing PID file (/run/squid.pid)
out 15 11:19:45 LAB24DT02 systemd[1]: squid.service: Deactivated successfully.
out 15 11:19:45 LAB24DT02 systemd[1]: Stopped Squid Web Proxy Server.
~
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid start
ericfrazzon@LAB24DT02:/etc/squid$ sudo service squid status
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset: enable>
     Active: active (running) since Wed 2025-10-15 11:19:56 -03; 1s ago
       Docs: man:squid(8)
    Process: 5982 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, status=0/>
   Main PID: 5985 (squid)
      Tasks: 4 (limit: 18715)
     Memory: 18.3M
        CPU: 72ms
     CGroup: /system.slice/squid.service
             ├─5985 /usr/sbin/squid --foreground -sYC
             ├─5987 "(squid-1)" --kid squid-1 --foreground -sYC
             ├─5988 "(logfile-daemon)" /var/log/squid/access.log
             └─5989 "(pinger)"

out 15 11:19:56 LAB24DT02 squid[5987]: Using Least Load store dir selection
out 15 11:19:56 LAB24DT02 squid[5987]: Current Directory is /
out 15 11:19:56 LAB24DT02 squid[5987]: Finished loading MIME types and icons.
out 15 11:19:56 LAB24DT02 squid[5987]: HTCP Disabled.
out 15 11:19:56 LAB24DT02 squid[5987]: Pinger socket opened on FD 14
out 15 11:19:56 LAB24DT02 squid[5987]: Squid plugin modules loaded: 0
out 15 11:19:56 LAB24DT02 squid[5987]: Adaptation support is off.
out 15 11:19:56 LAB24DT02 squid[5987]: Accepting HTTP Socket connections at conn3 loca>
out 15 11:19:56 LAB24DT02 systemd[1]: Started Squid Web Proxy Server.
out 15 11:19:57 LAB24DT02 squid[5987]: storeLateRelease: released 0 objects
ericfrazzon@LAB24DT02:/etc/squid$ 
```
# TERMINAL 2
```
laboratorio@LAB24DT02:~$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.22  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:12:c4  txqueuelen 1000  (Ethernet)
        RX packets 8409  bytes 4228654 (4.2 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5329  bytes 1875505 (1.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 3722  bytes 348743 (348.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3722  bytes 348743 (348.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

laboratorio@LAB24DT02:~$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 604755sec preferred_lft 604755sec
laboratorio@LAB24DT02:~$ ip addr add 200.10.0.17/29 dev enp0s31f6
RTNETLINK answers: Operation not permitted
laboratorio@LAB24DT02:~$ sudo ip addr add 200.10.0.17/29 dev enp0s31f6
[sudo] senha para laboratorio: 
laboratorio@LAB24DT02:~$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 604684sec preferred_lft 604684sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
laboratorio@LAB24DT02:~$ ls -la
total 92
drwxr-x--- 17 laboratorio laboratorio 4096 out 15 10:22  .
drwxr-xr-x  7 root        root        4096 out 15 10:33  ..
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024 'Área de Trabalho'
-rw-------  1 laboratorio laboratorio 7101 out 15 10:10  .bash_history
-rw-r--r--  1 laboratorio laboratorio  220 out 11  2024  .bash_logout
-rw-r--r--  1 laboratorio laboratorio 3771 out 11  2024  .bashrc
drwx------ 12 laboratorio laboratorio 4096 out 24  2024  .cache
drwx------ 15 laboratorio laboratorio 4096 out  8 09:59  .config
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Documentos
drwxr-xr-x  3 laboratorio laboratorio 4096 out 15 10:24  Downloads
drwxr-xr-x  2 laboratorio laboratorio 4096 out 24  2024  .fontconfig
drwx------  2 laboratorio laboratorio 4096 out 15 10:11  .gnupg
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Imagens
-rw-------  1 laboratorio laboratorio   20 out 15 10:22  .lesshst
drwx------  3 laboratorio laboratorio 4096 out 11  2024  .local
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Modelos
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Música
-rw-r--r--  1 laboratorio laboratorio  807 out 11  2024  .profile
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Público
drwx------  4 laboratorio laboratorio 4096 out 17  2024  snap
drwx------  2 laboratorio laboratorio 4096 out 15 10:36  .ssh
-rw-r--r--  1 laboratorio laboratorio    0 out 11  2024  .sudo_as_admin_successful
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Vídeos
laboratorio@LAB24DT02:~$ ls -la /etc/squid/errors/Personalizado/
total 16
drwxr-xr-x 2 root root 4096 out  2 15:23 .
drwxr-xr-x 3 root root 4096 out  2 15:02 ..
-rw-r--r-- 1 root root  254 out  2 15:23 ERR_ACCESS_DENIED
-rw-r--r-- 1 root root  265 out  2 15:03 ERR_BLOCKED_SITE
lrwxrwxrwx 1 root root    2 out  2 15:17 Portuguese -> pt
laboratorio@LAB24DT02:~$ pwd
/home/laboratorio
laboratorio@LAB24DT02:~$ ls -la
total 92
drwxr-x--- 17 laboratorio laboratorio 4096 out 15 10:22  .
drwxr-xr-x  7 root        root        4096 out 15 10:33  ..
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024 'Área de Trabalho'
-rw-------  1 laboratorio laboratorio 7101 out 15 10:10  .bash_history
-rw-r--r--  1 laboratorio laboratorio  220 out 11  2024  .bash_logout
-rw-r--r--  1 laboratorio laboratorio 3771 out 11  2024  .bashrc
drwx------ 12 laboratorio laboratorio 4096 out 24  2024  .cache
drwx------ 15 laboratorio laboratorio 4096 out  8 09:59  .config
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Documentos
drwxr-xr-x  3 laboratorio laboratorio 4096 out 15 10:24  Downloads
drwxr-xr-x  2 laboratorio laboratorio 4096 out 24  2024  .fontconfig
drwx------  2 laboratorio laboratorio 4096 out 15 10:11  .gnupg
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Imagens
-rw-------  1 laboratorio laboratorio   20 out 15 10:22  .lesshst
drwx------  3 laboratorio laboratorio 4096 out 11  2024  .local
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Modelos
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Música
-rw-r--r--  1 laboratorio laboratorio  807 out 11  2024  .profile
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Público
drwx------  4 laboratorio laboratorio 4096 out 17  2024  snap
drwx------  2 laboratorio laboratorio 4096 out 15 10:36  .ssh
-rw-r--r--  1 laboratorio laboratorio    0 out 11  2024  .sudo_as_admin_successful
drwxr-xr-x  2 laboratorio laboratorio 4096 out 11  2024  Vídeos
laboratorio@LAB24DT02:~$ ls -la /var/www/html/
total 16
drwxr-xr-x 2 root root 4096 out 15 10:18 .
drwxr-xr-x 3 root root 4096 out 18  2024 ..
-rw-r--r-- 1 root root  242 out  8 10:16 blockbet.html
-rw-r--r-- 1 root root  393 out 15 10:18 index.html
laboratorio@LAB24DT02:~$ cat /var/www/html/index.html 
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Site Bloqueado</title>
<style>
body { font-family: Arial; text-align: center; margin-top: 10%; background-color: #f4f4f4; }
h1 { color: red; }
</style>
</head>
<body>
  <h1>🚫 ACESSO BLOQUEADO 🚫</h1>
  <h2>Grupo: BLAZER TELECUM</h2>
  <p>O site solicitado foi bloqueado pelo proxy do grupo.</p>
</body>
</html>
EOF
laboratorio@LAB24DT02:~$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.22  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:12:c4  txqueuelen 1000  (Ethernet)
        RX packets 9252  bytes 4460187 (4.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5812  bytes 2079343 (2.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 5328  bytes 491421 (491.4 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5328  bytes 491421 (491.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

laboratorio@LAB24DT02:~$ ip add
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether d0:94:66:e8:12:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.104.16.22/26 brd 10.104.16.63 scope global dynamic noprefixroute enp0s31f6
       valid_lft 604175sec preferred_lft 604175sec
    inet 200.10.0.17/29 scope global enp0s31f6
       valid_lft forever preferred_lft forever
laboratorio@LAB24DT02:~$ 


```

# CONFIGURAÇÃO DO SUDO VI bloqueado.txt
```
.bet365.bet.br
.lasmi.ufn.edu.br
.terra.com.br
```

# CONFIGURAÇÃO DO CAT SQUID.CONF
```
# Porta do proxy
http_port 3128
visible_hostname Proxy.SQUID


# Bloquear site de apostas
acl site_bloqueado url_regex -i "/etc/squid/bloqueado.txt"


# Regras de acesso
http_access deny site_bloqueado
deny_info http://200.10.0.17 site_bloqueado
```
