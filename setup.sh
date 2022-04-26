#!

sudo pacman -Syyu

# BASE PACKAGES TO INSTALL

PKG=(

# GRAPHICAL
    'nvidia-utils' 
    'nvidia-settings' 
    'xorg-server-devel' 
    'opencl-nvidia'

# MEDIA
    'audacious'
    'vlc'

# INTERNET
    'firefox'
    'chromium'
    'thunderbird'

# DEV TOOLS
    'git'
    'python3'
    'code'
    'netbeans'
    'pycharm-community-edition'

# BLUETOOTH
    'bluez'
    'bluez-utils'
    'blueman'

# DE
    'gnome'
    'gnome-extra'

# MIRRORLIST
    'reflector'   
    'rsync' 
    'curl'
)


for PKG in "${PKGS[@]}"; do
    sudo pacman -S "$PKG" --noconfirm --needed
done

# CONFIGURING GRAPHICAL DRIVER
echo "blacklist nouveau" > /usr/lib/modprobe.d/nvidia.conf

# CONFIGURING YAY
sudo git clone https://aur.archlinux.org/yay-git.git --noconfirm --needed
cd yay-git
makepkg -si --noconfirm --needed

# INSTALLING PAMAC
yay -S pamac-all

# INITIALIZABLE APPS
sudo systemctl enable bluetooth.service
sudo systemctl enable gdm

# CONFIG REFLECTOR
reflector --verbose --country 'Brazil' -l 5 --sort rate --save /etc/pacman.d/mirrorlist