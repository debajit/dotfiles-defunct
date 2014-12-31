My Dotfiles
==============================

My configuration files for git, vim, etc.

Installation
------------

* Clone this repository, or your own fork.
```
git clone https://github.com/debajit/dotfiles.git
```
* Install all the dotfiles:
```
rake
```

To install a specific set of files, run `rake` with a particular name e.g.

```
rake git
rake vim
```

To see a list of things you can install, run
```
rake -T
```

Running `rake` by itself will install everything.