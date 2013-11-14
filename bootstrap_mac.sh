#!/bin/bash

echo "symlink .bash_profile"
rm -f ~/.bash_profile
ln -s ~/.dotfiles/.bash_profile_mac ~/.bash_profile

echo "symlink .gitconfig"
rm -f ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

echo "symlink .gitignore"
rm -f ~/.gitignore
ln -s ~/.dotfiles/.gitignore ~/.gitignore

echo "symlink .ackrc"
rm -f ~/.ackrc
ln -s ~/.dotfiles/.ackrc ~/.ackrc

ln -s ~/.dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.mutt
mkdir -p ~/.mail
ln -s ~/.dotfiles/mutt/.goobookrc  ~/.goobookrc
ln -s ~/.dotfiles/.muttrc ~/.muttrc
ln -s ~/.dotfiles/mutt/offlineimap.py ~/.mutt/offlineimap.py
ln -s ~/.dotfiles/.offlineimaprc ~/.offlineimaprc
ln -s ~/.dotfiles/.urlview ~/.urlview

ln -s ~/.private_dotfiles/.hgcredentials  ~/.hgcredentials
ln -s ~/.dotfiles/.hgigonre  ~/.hgigonre_global

ln ~/.private_dotfiles/ssh-config ~/.ssh/config

echo "setup osx settings"
./.osx
