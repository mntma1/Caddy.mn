{#!/usr/bin/env bash
# Createted By manfred 19.10.2025
#
# Add domain to Caddy 
CFIELE=/opt/caddy/Caddyfile
clear
echo
read -p 'Den Domainnamen bitt: ' DOMAIN
echo
read -p 'Die IP-Adreee bitte: ' IPADR
echo
read -p 'Den Port bitte: ' CPORT
echo

echo Zum Caddyfile hinzugefügt:
echo ==========================
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
echo
cat<<ergebnis

Die Domain lautet: $DOMAIN und zeigt auf: $IPADR:$CPORT

 https://$DOMAIN

ergebnis
