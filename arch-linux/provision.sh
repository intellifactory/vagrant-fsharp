#!/bin/bash
function i { sudo pacman -S --noconfirm $1; }

function make_fsharp {
    mkdir ~/fsharp-build
    cd ~/fsharp-build
    curl https://aur.archlinux.org/packages/fs/fsharp-git/PKGBUILD > PKGBUILD
    makepkg && sudo pacman -U *.xz
}

function setupvm {
    sudo pacman -Syu --noconfirm
    i autoconf
    i automake
    i fakeroot
    i git
    i make
    i mono
    i monodevelop
    i pkg-config
    i xorg-server
    i xorg-server-utils
    i xorg-xinit
    i xterm
    i xfce4
    i xfce4-goodies
    make_fsharp
}

if [ -e "~/.setupvm" ]; then
    setupvm
    touch ~/.setupvm
fi
