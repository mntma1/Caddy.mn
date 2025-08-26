
<img width="1200" height="363" alt="caddy" src="https://github.com/user-attachments/assets/c66add0c-d043-4c32-8568-405454cb88ac" />

# Caddy Reverse Proxy 
Siehe: [Caddy Dokumentation](https://caddyserver.com/)

> [!TIP]
> Mach dir erstmal einen Kaffee, dies hier kann nemlich etwas dauern.

> [!NOTE]
> Werde root und logge dich danach mit [Strg+D] wieder aus.
> [Strg+D] ist wie exit.

> [!NOTE]
> $USER ist der angemeldete Benutzer

## Neu anmelden oder eine neue Shell öffnen

**Diese Befehle als Benutzer ausführen**
1. Verzeichnisse erstellen
```
sudo mkdir -pv /opt/caddy/{data,config}
sudo chown -Rv $USER: /opt/caddy
```

2. nano /opt/caddy/doclker-compose.yam
```
services:
  caddy:
    image: caddy:latest
    container_name: caddy
    restart: unless-stopped
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /opt/caddy/Caddyfile:/etc/caddy/Caddyfile
      - /opt/caddy/data:/data
      - /opt/caddy/config:/config
    networks:
      - caddy_net

networks:
  caddy_net:
    external: true

volumes:
  caddy_data:
  caddy_config:
```

3. nano /opt/caddy/compose-http-server.yaml
```
ervices:
  name: http-server
    simple-http-server:
      image: jdkelley/simple-http-server:latest
        volumes:
          - ./file:/serve
        networks:
          - caddy_net
networks:
  caddy_net:
  external: true
```

4. nano /opt/caddy/Caddyfie
```
# E-Mail-Adresse für Let's encrypt
{
    email dein.Name@mail.de
}

omv.deineDomain.org {
    reverse_proxy 192.168.xxx.xxx:port
}

jellyfin.deineDomain.org {
    reverse_proxy 192.168.xxx.xxx:port
}

apachegua.deineDomain.org {
    reverse_proxy 192.16.xxx.xxx:port
}
```

5. Run Caddy docker
```
cd /opt/caddy
docker network create caddy_net
docker compose up -d
#docker compose -f compose-http-server.yaml up -d # Not now! I have to fix it.
```



