# SeedStack

This meta-repository contains the full stack as Git submodules. 

# Usage

You can initialize all submodules to the tip of their master branch and checkout it with the following commands:

    git submodule update --remote --recursive --init
    git submodule foreach --recursive git checkout master
    
Later, you may need to update all submodules to the tip of their master branch again:     

    git submodule update --remote --recursive

# Meta

This repository also contains all things meta about SeedStack like contributing rules, legal terms,
assets, the list of contributors, etc...

# Contributing to SeedStack

The CONTRIBUTING.md file in this repository defines the global contribution rules to SeedStack. Beyond this file,
more specific rules may apply on some repositories. When a specific CONTRIBUTING.md file is available in a 
repository, please follow its rules in addition to the global rules.

# License and legal terms

SeedStack source code and documentation is copyrighted by "The SeedStack Authors", whose list is available in 
the [AUTHORS file](../../tree/master/AUTHORS). 

Source code is released under the terms of the [Mozilla Public License 2.0](https://www.mozilla.org/MPL/2.0/).

Documentation is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

Additional legal terms are available under the [legal subdirectory](../../tree/master/legal).

# Logo

SeedStack logo is available in various sizes and formats in the [assets/logo subdirectory](../../tree/master/assets/logo) of this
repository. The logo is copyrighted by "The SeedStack Authors". Please ask us the permission before any use of the logo.
