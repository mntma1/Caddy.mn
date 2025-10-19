#!/usr/bin/env bash
# Craeated by: Manfred
# Date: 23.08.2025

CFILE=/opt/caddy/Caddyfile
clear
echo "Eine E-Mail Adresse für Let's Encrypt"
echo "===================================="
read -p 'Die E-Mail Adresse bitte: ' EMAIL
# Legt die Verzeichnisse an und kopiert die Dateien (überschreibt vorhandene).
sudo mkdir -pv /opt/caddy/{data,config,file}
sudo chown -Rv $USER: /opt/caddy
cp -fv install.sh compose.yaml compose-http-server.yaml /opt/caddy/  
cp -fv index.html /opt/caddy/file

cat<<editcaddyfile>$CFILE
# eMail für Let's encrypt
{
    email $EMAIL
}
editcaddyfile

docker network create caddy_net
docker compose -f /opt/caddy/compose.yaml up -d
docker compose -f /opt/caddy/compose-http-server.yaml up -d
echo



cat<<info

ie E-Mail Adresse lautet für Let's Encrypt: $EMAIL

Der simple-http-server ist zu erreichen unter: http://$(hostname -I | awk '{print $1}' | cut -d/ -f1):81

Füge nun eine Domain mit: -> ./addDomain.sh" <- hinzu
info
exit 0
