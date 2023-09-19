# desaster

## RaspberryPi konfigurieren

- https



## Specials

### VNC einrichten
https://www.elektronik-kompendium.de/sites/raspberry-pi/2011121.htm

### Auflösung einstellen
https://www.elektronik-kompendium.de/sites/raspberry-pi/2101201.htm

### Player
Make ```/usr/share/applications/desaster.desktop``` with this content

```
[Desktop Entry]
Type=Application
Name=Desaster
Exec=chromium-browser --app=https://meet.cyon.tools/desaster --autoplay-policy=no-user-gesture-required --start-fullscreen
StartupNotify=false
```
For autostart

``` cp /usr/share/application/desater.desktop ~/.config/autostart/.```

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
