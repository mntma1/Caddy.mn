#!/usr/bin/env bash
# Craeated by: Manfred
# Date: 23.08.2025

# Legt die Verzeichnisse an und kopiert die Dateien (überschreibt vorhandene).
sudo mkdir -pv /opt/caddy/{data,config,file}
sudo chown -Rv $USER: /opt/caddy
cp -fv install.sh compose.yaml Caddyfile compose-http-server.yaml /opt/caddy/  
cp -fv index.html /opt/caddy/file

docker network create caddy_net
docker compose -f /opt/caddy/compose.yaml up -d
docker compose -f /opt/caddy/compose-http-server.yaml up -d


# Nun das Caddyfile bearbeiten 
cat<<eof

# eMail für Let's encrypt
{
    email deinName@mailDomain.de
}

omv.meine.domain.de {
    reverse_proxy 192.168.xxx.xxx:81
}

immich.meine.domain.de {
    reverse_proxy 192.168.xxx.xxx:2283
}

apachegua.meine.domain.de {
    reverse_proxy 192.168.xxx.xxx:8081
}
eof

cat<<info

Der simple-http-server ist dann zu erreichen unter: http://IP-Adresse:81

info
exit 0
