# vagrant-fsharp

Attempt to get a Vagrant-compatible description of a Linux machine set
up for F# development with latest tools.

Status: not quite working yet.

Provides a quick way to get a clean F# linux development environment:

    hg clone $repo/vagrant-fsharp
    cd vagrant-fsharp
    vagrant up
    vagrant ssh
    startxfce4    

Assuming you have [vagrant][vagrant] set up.

## Notes

Currently using Arch Linux, basic Xfce4 desktop.

## TODO

Got latest `mono` and `monodevelop` installed via `pacman`, but still
need to set up `fsharp` and its binding.

[vagrant]: http://www.vagrantup.com/
