# NixOS login theme for KDE Plasma

Your desktop just got a real make up with this awesome login screen. NixOS reduces the clutter of your greeter and leaves you with a clean, easy to use, login interface with a modern yet classy touch.

### Prerequisites
KDE Plasma 5.12  
SDDM 0.17

### Installing
The easiest way to install this theme is through the KDE system configuration dialog. This requires the `sddm-kcm` package to be installed. If in doubt use your package manager to search and if necessary install `sddm-kcm` first.  
Go to `System Settings > Startup and Shutdown > Login Screen (SDDM) > Get New Theme` and search for NixOS.

### Manually
Go to [openDesktop.org](https://www.opendesktop.org/p/1214121), download the file and extract the contents to the theme directory of the SDDM manager (change the path for the downloaded file if necessary):
```
$ sudo tar -xzvf ~/Downloads/nixos-sddm.tar.gz -C /usr/share/sddm/themes
```
This will extract all the files to a folder called nixos inside of the themes directory of SDDM. After that you will have to point SDDM to the new theme by editing its config file:
```
$ sudo nano /usr/lib/sddm/sddm.conf.d/sddm.conf
```
In the `[Theme]` section set `Current=nixos`. For a more detailed description please refer to the [Arch wiki on sddm](https://wiki.archlinux.org/index.php/SDDM).

### How to tweak
I consider this theme to be visually balanced and appealing as it is.

That said if you still want to tweak fonts and their sizes search these files for "font.family" and "font.pointSize" and change their respective values where you feel need. Be aware that the upper right corner consists of the following elements: KeyboardButton.qml, Battery.qml and Clock.qml. So if you change any of these in size you may want to adapt the others as well.

You can also change the weight of the blur filter effect by searching for "RecursiveBlur" in the Background.qml file and altering the values "radius" and "loops". Refer to the [Qt documentation](http://doc.qt.io/qt-5/qml-qtgraphicaleffects-recursiveblur.html) for more details.

You might see some grey pixels around your avatar image which is caused by the color of the opacity mask blending with the anti-aliasing of the Qt blur effect in use. You may change the fill color of the mask that resides in "components/artwork/mask.svg" to a color that better matches with your avatar colors. Do not change the opacity of the mask. Take note that this might affect other avatar images present on your system.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

### Acknowledgments

Original code is taken from KDE plasmas breeze theme. In specific the SDDM login theme written by [David Edmundson](davidedmundson@kde.org).

### Coffee
In the past years I have spent quite some hours on open source projects. If you are the type of person who digs attention to detail, know how much work is involved in it and/or simply likes to support makers with a coffee or a beer I would greatly appreciate your donation on my [PayPayl](https://www.paypal.me/marianarlt) account.
