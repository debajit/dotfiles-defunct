My Dotfiles
==============================

My configuration files for git, vim, etc.

Installation
------------

Clone this repository (or your fork), and install the dotfiles:

    git clone https://github.com/debajit/dotfiles.git
    cd dotfiles
    rake

### Selective Installation

To install a specific set of files, run `rake` with a particular name e.g.

    rake git
    rake vim

To see a list of things you can install, run

    rake -T


Running `rake` by itself will install everything.


Updating
--------

Pull in the latest changes and install the dotfiles. From the dotfiles repository, run

    git up
    rake
