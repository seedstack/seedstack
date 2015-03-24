# Contributing to SeedStack

Contributions to SeedStack are always welcome. You can help make it better by following these guidelines.  

## Questions or problems

If you have any question or problem please use [StackOverflow](http://stackoverflow.com) and make sure to tag your question with `seedstack`.

You can also use the [Google Group](https://groups.google.com/forum/#!forum/seedstack) or directly the mailing list via [seedstack@googlegroups.com](mailto:seedstack@googlegroups.com).

We are available on the Freenode IRC community, at [#seedstack](irc://freenode.net/#seedstack). 

## Bugs

If you find a bug in the source code or a mistake in the documentation, please submit an issue to the corresponding GitHub repository. 

## Features

If you need a feature, please consider the following options:

* If the feature is concerning **only one existing repository**, please submit an issue on the corresponding GitHub repository. If the feature is small, you can submit it directly as a Pull Request.
* If the feature is concerning **multiple repositories** or implies the creation of at least one **new repository**, please ask first on the [Google Group](https://groups.google.com/forum/#!forum/seedstack) or the [IRC channel](irc://freenode.net/#seedstack).

## Documentation fixes

If you want to improve the documentation:

* If the scope of the modification is limited to one page, please use the **"Contribute to this page"** button in the menu. This will allow you to edit the file directly from a fork of the repository. 
* If the modification is larger, please check if it hasn't already been identified [in the issues](https://github.com/seedstack/website/issues). If not, please submit one on the [website repository](https://github.com/seedstack/website) describing the modification.

## Code contribution

This section describes the requirements for contributing code to SeedStack. If you are unfamiliar with how to contribute to projects on GitHub, please read [this documentation](http://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project). 

### Development

To contribute code to SeedStack, please make sure that:

* You have identified the modification with an issue on the corresponding repository, 
* You have notified with a comment in the issue that you are working on it.

Then fork the repository in your personal account. Clone it and create a branch with the following name conventions:

* For bug fixes: `fix-?-very-short-description`
* For features: `feat-?-very-short-description`

Where ? is the number of the corresponding issue. Examples:

    fix-3-jms-connection
    feat-9-jpa-enhancements

Add the `upstream` remote denoting the official repository:

    git remote add upstream ...

### Submission

After finishing your work you can submit it as a Pull Request only if the following conditions are met:

* Your code is well-tested (it should at least have unit tests for the complex parts and have a more general integration test),
* The build is OK in your environment,
* Your branch has been rebased on the latest commit of the upstream branch,
* You have squashed all your commits into one with a self-describing message. You can add a `Closes #?` or a `Fixes #?` sentence at the end of the commit message to relate the commit to the corresponding issue. 

You can then proceed to submit a Pull Request on the official repository, where the code will be reviewed and discussed. The Travis CI build must be OK for the Pull Request to be accepted. 

You may have to modify you code after the Pull Request creation. In that case, don't forget to resquash all your commits into one. The Pull Request will be automatically updated.

Please note that when you rebase your branch or squash commits after having already pushed a version on GitHub, you will need to push-force (`git push --force ...`) it. 

## Using the meta-repository

If you need to contribute to the whole stack you may find easier to use the [SeedStack meta repository](https://github.com/seedstack/seedstack) as an entry point. It regroups all the other repositories as [Git submodules](http://git-scm.com/book/be/v2/Git-Tools-Submodules). This meta-repository contains a Makefile for easy maintenance of all submodules. You need to have GNU make installed to be able to use it.

### Clone the meta repository

Fork [seedstack/seedstack](https://github.com/seedstack/seedstack) in your personal GitHub account.

Clone the fork on your computer:

    git clone your-fork-url

Then initialize the submodules with :
    
    cd seedstack
    make init

### Work in a submodule

You need to manually fork the module corresponding repository on GitHub, if necessary.

The following command will map the submodule to your fork and add the `upstream` remote to the official repository automatically:

    make setup-fork

This command will ask for the name of the submodule and the fork url as interactive input.

