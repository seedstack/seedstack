# SeedStack

The seedstack repository contains git submodules for all seedstack
projects. It is used only by seedstack contributors for development
purpose.

# Setup seedstack

The following commands require Git installed, and an environment able
to use make. Windows users take a look at [babun](https://github.com/babun/babun).

    git clone git@github.com:seedstack/seedstack.git
    make init

If you want to update all the projects to the latest master use the following command:

    make update

# Usage of submodule

Directories under seedstack are git repositories. Work in them
directly. Never use other git commands that those listed above in the
seedstack repository unless you know what you do.

For more information on submodules see this [documentation](http://git-scm.com/book/en/v2/Git-Tools-Submodules).
