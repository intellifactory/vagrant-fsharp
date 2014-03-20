# vagrant-fsharp

Provides [Vagrant][vagrant] VM descriptors for quickly obtaining
virtual machines set up for [F#][fsharp] development.

Code below assumes you have [Vagrant][vagrant] set up.

* [Issue tracker](https://github.com/intellifactory/vagrant-fsharp/issues)
* [GitHub Git repo](http://github.com/intellifactory/vagrant-fsharp)
* [Bitbucket Mercurial repo](http://bitbucket.org/IntelliFactory/vagrant-fsharp)

## Boxes

## arch-linux

Latest x64 Arch Linux, Mono & MonoDevelop from Arch base distro, basic
Xfce4 desktop, F# and F# MD binding compiled from GitHub.

Instructions:

    cd ./arch-linux && vagrant up
    vagrant ssh
    startxfce4

Since we are building F# from source, the process can take a while.

## ubuntu-trusty

Ubuntu Trusty x64, Mono, MonoDevelop & F# from base distro, F# binding
from MD add-in universe.

Instructions:

* [Download][trusty-box] the box (requires confirmation)
* Register the box: `vagrant add trusty ~/Downloads/*.box`
* `cd ./ubuntu-trusty && vagrant up`

If all goes well, you should login visually via XFCE with
`user=vagrant` and `pw=vagrant`.

Right now the whole 1.6G box is sitting on Google Drive.  It would be
much nicer to derive this box from a smaller base box, however it is
not clear how to automate it -- how to make `apt-get` install the
needed packages non-interactively.

[fsharp]: http://fsharp.org/
[trusty-box]: https://docs.google.com/uc?export=download&id=0B4rIj3jfBrslVFJrYWhRZl9xMlU
[vagrant]: http://www.vagrantup.com/
