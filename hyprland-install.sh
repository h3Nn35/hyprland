#/bin/bash
#  _   _                  _                 _ 
# | | | |_   _ _ __  _ __| | __ _ _ __   __| |
# | |_| | | | | '_ \| '__| |/ _` | '_ \ / _` |
# |  _  | |_| | |_) | |  | | (_| | | | | (_| |
# |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_|
#        |___/|_|                             
#

if command -v yay &> /dev/null; then
    echo 'yay ist bereits installiert'
else
    echo 'yay muss installiert werden'
    cd /opt
    sudo git clone https://aur.archlinux.org/yay.git
    sudo chown -R christian:users ./yay
    cd yay
    makepkg -si
fi

echo 'Abhängigkeiten werden installiert\n'
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio --noconfirm

echo 'Hyprland wird installiert'
yay -S hyprland dolphin wofi hyprpaper kitty --noconfirm

cd ~/dotfiles
stow kitty hypr

