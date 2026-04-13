#!/usr/bin/env bash
# Craeated by: Manfred
# Date: 23.08.2025
# Modified: 13.04.2026
# manne@open-jazz.de

CFILE=/opt/caddy/Caddyfile

# Fragt deine E-MAil Adresse ab.
clear
echo "Trage hier eine gültige E-Mail Adresse für Let's Encrypt hinzu"
echo "======================================================"
read -p 'Die E-Mail Adresse bitte: ' EMAIL

# Legt die Verzeichnisse an und kopiert die Dateien (überschreibt vorhandene).
sudo mkdir -pv /opt/caddy/{data,config,file}
sudo chown -Rv $USER: /opt/caddy
cp -fv install.sh compose.yaml compose-http-server.yaml /opt/caddy/  
cp -fv index.html /opt/caddy/file

# Trägt deine E-Mail Adresse ins Caddyfile ein.
cat<<editcaddyfile>$CFILE
# eMail für Let's encrypt
{
    email $EMAIL
}

# Beispiele
#omv.meine.domain.de {
#    reverse_proxy 192.168.xxx.xxx:81
#}

#jellyfin.meine.domain.de {
#    reverse_proxy 192.168.xxx.xxx:8096
#}

#guacamo.meine.domain.de {
#    reverse_proxy 192.168.xxx.xxx:8081
#}
editcaddyfile

# Startet Caddy
docker network create caddy_net
docker compose -f /opt/caddy/compose.yaml up -d
docker compose -f /opt/caddy/compose-http-server.yaml up -d
clear;
echo ...warte 3 Sekunden;
sleep 3; 
docker stats --no-stream
echo

cat<<info

Die E-Mail Adresse für Let's Encrypt lautet: $EMAIL

Der simple-http-server ist zu erreichen unter: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):81

=> Füge nun eine Domain mit: -> ./addDomain.sh <- hinzu
=> Oder editiere: $CFILE

....Das war einfach :-)

info
exit 0
