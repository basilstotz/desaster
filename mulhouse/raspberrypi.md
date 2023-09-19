# desaster

## RaspberryPi konfigurieren

- Von https://github.com/basilstotz/desaster/tree/main/debian das Paket **desaster_xxxxxxx_all.deb** installieren
- desaster-setup-user-config rennen
- in **~/bin/desaster-presenter** den "richtigen" link setzen
- raspi-config: hostname einrichten
- raspi-config: fan einrichten
- evtl raspi-config: ssh einrichten

- sudo **epoptes-client** -c rennen

Reboot und test, wenn ok:

- raspi-config: read-only filesystem setzen

 Reboot und testen




## Specials

### VNC einrichten
https://www.elektronik-kompendium.de/sites/raspberry-pi/2011121.htm

### Auflösung einstellen
https://www.elektronik-kompendium.de/sites/raspberry-pi/2101201.htm


### Hide Cursor


Install unclutter

```sudo apt install unclutter```

Make ```/usr/share/applications/unclutter.desktop``` with this content
```
[Desktop Entry]
Type=Application
Name=Unclutter
Exec=unclutter
StartupNotify=false
```
For autostart

``` cp /usr/share/application/unclutter.desktop ~/.config/autostart/.```
