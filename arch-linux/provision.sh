#!/bin/bash

# installs a package non-interactively
function i { pacman -S --noconfirm $1; }

# creates a dir under /home/vagrant, and enters it
function mk_dir {
    u=vagrant
    h=/home/$u
    b=$h/$1
    rm -rf $b
    mkdir $b
    chown $u:$u $b
}

# compiles and installs latest F# from Git
function make_fsharp {
    dir=fsharpbuild
    mk_dir $dir
    su - vagrant -c "cd ~/$dir && curl -Os https://aur.archlinux.org/packages/fs/fsharp-git/PKGBUILD && makepkg"
    cd $dir && pacman -U --noconfirm *.xz
}

# compiles and installs F# binding for MonoDevelop
function make_fsharpbinding {
    dir=fsharpbinding-build
    mk_dir $dir
    su - vagrant -c "cd ~/$dir && git clone https://github.com/intellifactory/fsharpbinding"
    su - vagrant -c "cd ~/$dir/fsharpbinding/monodevelop && ./configure.sh && make MDTOOL=mdtool && make MDTOOL=mdtool install"
}

# complete VM setup function
function setupvm {
    # upgrade system
    pacman -Syu --noconfirm
    # install packages
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
    # build & install F# and tools
    make_fsharp
    make_fsharpbinding
    # do not setupvm next time
    touch /root/.setupvm
}

# only setup the system once
if [ ! -f "/root/.setupvm" ]; then setupvm; fi
