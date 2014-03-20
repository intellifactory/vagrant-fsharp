#!/bin/bash
function i { sudo pacman -S --noconfirm $1; }

function make_fsharp {
    u=vagrant
    h=/home/$u
    b=$h/fsharp-build
    rm -rf $b
    mkdir $b
    chown $u:$u $b
    cd $b
    curl https://aur.archlinux.org/packages/fs/fsharp-git/PKGBUILD > PKGBUILD
    su - $u -c "cd ~/fsharp-build && makepkg"
    pacman -U --noconfirm *.xz
}

function make_fsharpbinding {
    u=vagrant
    h=/home/$u
    b=$h/fsharpbinding-build
    rm -rf $b
    mkdir $b
    chown $u:$u $b
    cd $b
    su - $u -c "git clone https://github.com/intellifactory/fsharpbinding"
    su - $u -c "cd fsharpbinding/monodevelop && ./configure.sh && make MDTOOL=mdtool && make MDTOOL=mdtool install"
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
    make_fsharpbinding
}

if [ ! -f "~/.setupvm" ]; then
    setupvm
    touch ~/.setupvm
fi
