#!/usr/bin/env bash
#Created by Manfred 19.10.2025

compose -f /opt/caddy/compose.yaml down
compose -f /opt/caddy/compose-http-server.yaml down
docker image rm caddy:latest
docker network rm caddy_net
sudo rm -rfv /opt/caddy
clear
cat<<fertig

....Fertig

fertig
exit 0
