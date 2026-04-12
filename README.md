
<img width="1200" height="363" alt="caddy" src="https://github.com/user-attachments/assets/f766b5db-b1bb-4a8e-8461-9d0f6c11b63a" />


# Caddy Reverse Proxy 
## Installations-Script von Manne Maus
### Siehe auch: [Caddy Blogbeitrag von Jusec ](https://jusec.me/caddy/)
> [!TIP]
> Mach dir erstmal einen Kaffee, dies hier kann nämlich etwas dauern.
> > Erst alles lesen, dann Machen!

1. Feste IP 

Hast du eine Feste IP, 
dann fahere mit Punkt 2. fort.

Wenn nicht:
Richte dir eine DynDNS Domain ein.

> [!TIP]
> Meine Empfehlung
> > Ein guter DynDNS Anbieter 
> > > https://ipv64.net/dyndns 

1.1 Richte ein Portforwardig auf deinem Router ein

Lasse Port: 
```
80,443
```
auf die Maschine zeigen auf der Du Caddy installien möchtest.

<img width="1274" height="143" alt="PortforwardFB" src="https://github.com/user-attachments/assets/12e2d985-ca91-4929-815d-c102120f2429" />


2. Installiere Docker
```
sudo apt install curl
curl -sSL https://get.docker.com/ | CHANNEL=stable sh
```

2.1 Füge dich zur Gruppe ***docker*** hinzu
```
sudo usermod -aG docker $USER 
```

> [!TIP]
> Mede dich ab und wieder an
>> Erst dann bist du in der Guppe ***docker***

3. Installiere git
```
sudo apt install git

# Unter Debian & Ubuntu  
```

3.1 Lade das Repository herunter
```
git clone https://github.com/mntma1/Caddy.mn.git
```

4. Führe das install-Script aus.
```
cd Caddy.mn
./install.sh
```

5. Befolge die Anweisungen

**Caddy ist echt Cool** <span style='font-size:80px;'>&#128526;</span>
 
## Viel Spaß
