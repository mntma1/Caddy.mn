#!/usr/bin/env bash
# Createted By manfred 19.10.2025
#
# Add domain to Caddy 
CFIELE=/opt/caddy/Caddyfile
clear
echo
echo 'Hier sub.deinedomain.de'
read -p 'Den Domainnamen bitt: ' DOMAIN
echo
echo 'die locale IP  192.168.xxx.xxx'
read -p 'Die IP-Adreee bitte: ' IPADR
echo
echo 'Den Port der App :xx'
read -p 'Den Port bitte: ' CPORT
echo

cat<<admomain>>$CFIELE

$DOMAIN {
    reverse_proxy $IPADR:$CPORT
}
admomain

echo Zum Caddyfile hinzugefügt: 
echo ==========================
cat<<addet

$DOMAIN {
    reverse_proxy $IPADR:$CPORT
}
addet
docker restart caddy
echo
cat<<ergebnis

Die Domain lautet: $DOMAIN und zeigt auf: $IPADR:$CPORT

 https://$DOMAIN

ergebnis
