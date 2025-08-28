#!/usr/bin/env bash
# Craeated by: Manfred
# Date: 23.08.2025

# Legt die Verzeichnisse an und kopiert die Dateien (überschreibt vorhandene).
sudo mkdir -pv /opt/caddy/{data,config,file}
sudo chown -Rv $USER: /opt/caddy
cp -fv install.sh compose.yaml Caddyfile compose-http-server.yaml /opt/caddy/  
cp -fv index.ftml /opt/caddy/file
docker network create caddy_net

# Gibt mehrzeiligen Text aus.
cat<<eof

Führe nun nacheinander die folgenden Befehle aus:

cd /opt/caddy
docker compose up -d
docker compose -f compose-http-server.yaml up -d

eof
exit 0
