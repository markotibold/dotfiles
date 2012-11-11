#!/bin/bash

echo "symlink .dotfiles dir"
rm ~/.dotfiles
ln -s $(pwd)/ ~/.dotfiles

echo "symlink .bashrc"
rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

echo "symlink .gitconfig_osx"
rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig_osx ~/.gitconfig

echo "symlink .gitignore_osx"
rm ~/.gitignore
ln -s ~/.dotfiles/.gitignore_osx ~/.gitignore

echo "symlink Sublime Text preferences and keymap"
rm ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
ln -s ~/.dotfiles/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
rm ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s ~/.dotfiles/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Default\ \(OSX\).sublime-keymap
