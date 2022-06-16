
#!/bin/bash

# Core system

## base desktop
apt install -y gnome-shell gnome-terminal gnome-tweaks gnome-system-monitor gnome-disk-utility gnome-shell-extensions nautilus ubuntu-drivers-common linux-sound-base alsa-base alsa-utils flatpak software-properties-common
apt purge gedit
apt autoremove --purge

## core drivers
ubuntu-drivers install

## flatpak and flathub
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.gnome.eog
flatpak install -y flathub org.gnome.TextEditor
flatpak install -y flathub org.mozilla.firefox
flatpak install -y flathub io.github.celluloid_player.Celluloid
flatpak install -y flatpak com.github.maoschanz.drawing
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.wps.Office
flatpak install -y flathub com.teamspeak.TeamSpeak
flathub install -y flathub com.spotify.Client

## steam
wget -O steam.deb https://cdn.akamai.steamstatic.com/client/installer/steam.deb
dpkg -i steam.deb
rm steam.deb
apt install -y lutris

## lutris
add-apt-repository -y ppa:lutris-team/lutris
apt update
apt install lutris

# Customization

## styling dependencies
apt install -y libsass1

## fonts
apt install -y fonts-inter

## cursors
apt install -y yaru-theme-icon

## gtk theme (fluent)
git clone https://github.com/vinceliuice/fluent-gtk-theme
cd fluent-gtk-theme
./install.sh --color dark --tweaks round --tweaks noborder --tweaks square
cd ..
rm -rf fluent-gtk-theme

## icon theme (fluent)
git clone https://github.com/vinceliuice/fluent-icon-theme
cd fluent-icon-theme
./install.sh --round
cd ..
rm -rf fluent-icon-theme

## windows 10 sounds
mkdir -p ../.local/share/sounds
tar -xf msaudio.tar.xz -C ../.local/share/sounds

## personalization
mkdir -P ../Pictures/Wallpapers
cp wallpaper.png ../Pictures/Wallpapers
