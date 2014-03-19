#!/bin/bash
function i { sudo pacman -S --noconfirm $1; }
sudo pacman -Syu --noconfirm
i mono
i monodevelop
i xorg-server
i xorg-server-utils
i xorg-xinit
i xterm
i xfce4
i xfce4-goodies
