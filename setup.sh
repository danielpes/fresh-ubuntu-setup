#!/bin/bash

#FILES_ROOT_DIR=/mnt/files

#rmdir $HOME/Documents
#rmdir $HOME/Pictures
#rmdir $HOME/Downloads
#rmdir $HOME/Videos
#rmdir $HOME/Music

#ln -s $FILES_ROOT_DIR/Documents $HOME
#ln -s $FILES_ROOT_DIR/Downloads $HOME
#ln -s $FILES_ROOT_DIR/Music $HOME
#ln -s $FILES_ROOT_DIR/Pictures $HOME
#ln -s $FILES_ROOT_DIR/Videos $HOME
#ln -s $FILES_ROOT_DIR/Dropbox $HOME
#ln -s $FILES_ROOT_DIR/dev $HOME

#Install packages
sudo apt-get update

#Install basic tools to programming
# build-essentials: gcc, g++, make, libc and dpkg-dev
# ctags: make a index of commands of several programming languages
# dh-make, debhelper: build deb packages
# fakeroot: build packages without root permission
# dkms, module-assistant: build linux/debian kernels
# patch: apply the file generate by the diff command to patch new files (See man patch)
sudo apt-get install -y build-essential exuberant-ctags dh-make debhelper fakeroot \
dkms module-assistant patch git

#Extracting tools
sudo apt-get install -y rar unrar zip unzip p7zip-full p7zip-rar arj zoo cabextract uudeview mpack unace sharutils

#Java
sudo apt-get install -y openjdk-8-jdk

#dev
sudo apt-get install -y npm
sudo ln -s /usr/bin/nodejs /usr/bin/node #by default executable is **nodejs**, but bower expects **node**, see http://stackoverflow.com/questions/20886217/browserify-error-usr-bin-env-node-no-such-file-or-directory
sudo apt-get install -y mvn #maven
sudo apt-get install -y zeal #offline documentations

#Codecs
sudo apt-get -y install ubuntu-restricted-extras #TODO: asks for manual configuration
sudo apt-get -y install id3tool lame libjpeg-progs  flac faac faad sox  ffmpeg2theora libmpeg3-1  mpegdemux x264

#fonts
sudo apt-get -y install fonts-roboto
sudo apt-get -y install fonts-noto
sudo apt-get -y install fonts-inconsolata
sudo apt-get -y install ttf-anonymous-pro

#System tools
sudo apt-get -y install gparted synaptic
sudo apt-get -y install unity-tweak-tool
sudo apt -y install xdotool # using to set the default workspace

#OTHERS
sudo apt-get -y install guake
sudo apt-get -y install vim-gtk vim-syntax-gtk vim-addon-manager vim-common
sudo apt-get -y install nautilus-dropbox
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install audacity
sudo apt-get -y install vlc
sudo apt-get -y install keepassx #password manager
sudo apt-get -y install qbittorrent
sudo apt-get -y install wireshark #TODO: asks for manual configuration
sudo apt-get -y install chromium-browser
sudo apt-get -y install skype #TODO won't work
sudo apt-get -y install virtualbox virtualbox-guest-additions-iso
sudo apt-get -y install putty
sudo apt-get -y install htop #a beautiful top

#uninstall
sudo apt-get -y purge transmission-* #Default torrent client
sudo apt-get autoremove

#Add external repos TODO: it asks to press enter do add the repository

#spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo add-apt-repository ppa:webupd8team/atom
#TODO ...

sudo apt-get update

#install packages from external repos
sudo apt-get install -y spotify-client
sudo apt-get install -y atom

#Updating IDS Hardware List - helps to recognize unknown devices
sudo update-pciids && update-usbids

#Making VLC the default video player
sudo sed -i 's/totem/vlc/g' /usr/share/gnome/applications/defaults.list

#Startup applications
#error
#sed -i 's/Autostart-enabled=false/Autostart-enabled=true/g' $HOME/.config/autostart/guake.desktop #guake

#Restore VIM backup
VIM_DIR=$HOME/.vim
VIM_COLOR_DIR=$VIM_DIR/colors
VIM_COLOR_TAR_URL=https://github.com/AlessandroYorba/Sierra/archive/v2.2.2.tar.gz
VIM_COLOR_PATH=Sierra-2.2.2/colors/sierra.vim
VIM_COLOR_NAME=sierra

mkdir -p $VIM_COLOR_DIR

#set colorscheme
mkdir $HOME/temp_color_vim_dir
wget -O $HOME/temp_color_vim_dir/color-vim.tar.gz $VIM_COLOR_TAR_URL #download file
tar -xzf $HOME/temp_color_vim_dir/color-vim.tar.gz -C $HOME/temp_color_vim_dir #uncompress
cp $HOME/temp_color_vim_dir/$VIM_COLOR_PATH $VIM_COLOR_DIR #copy colorscheme file
rm -rf $HOME/temp_color_vim_dir #remove files

cp vimrc $HOME/.vimrc
cp gvimrc $HOME/.gvimrc

echo "colorscheme $VIM_COLOR_NAME" >> $HOME/.vimrc

#Unset
unset VIM_COLOR_NAME
unset VIM_DIR
unset VIM_COLOR_DIR
unset VIM_COLOR_TAR_URL
unset VIM_COLOR_PATH
unset FILES_ROOT_DIR
