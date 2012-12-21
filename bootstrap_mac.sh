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

echo "setup osx settings"
./.osx