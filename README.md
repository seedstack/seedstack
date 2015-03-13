# SeedStack [![Stories in Ready](https://badge.waffle.io/seedstack/seedstack.png?label=ready&title=Ready)](https://waffle.io/seedstack/seedstack)

The seedstack repository contains git submodules for all seedstack
projects. It is used only by seedstack contributors for development
purpose.

# Setup seedstack

The following commands require Git installed, and an environment able
to use make. Windows users take a look at [babun](https://github.com/babun/babun).

    git clone file:////B932250/gitrepo/seedstack
    git submodule init
    git submodule update
    make build

This will clone all the seedstack projects and build them in the right
order, i.e. according to dependencies.

If you want to update all the projects use the following command:

    git submodule foreach git fetch

Be careful with a `foreach git pull` !

# Usage of submodule

Directories under seedstack are git repositories. Work in them
directly. Never use other git commands that those listed above in the
seedstack repository unless you know what you do.

For more information on submodules see this [documentation](http://git-scm.com/book/en/v2/Git-Tools-Submodules).
