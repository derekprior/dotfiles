## dotfiles ##

dotfiles is a repository of my OS X configuration files. There is support for providing confidential data via standard input when installing (hat tip, [Ryan Bates][ryanb]).

## Install ##

Installation requires Ruby with the Rake gem - standard on OS X. To install:

1.  git clone git://github.com/derekprior/dotfiles.git
2.  cd dotfiles
3.  rake install

You will be prompted for information such as your email address and GitHub API key, which will be inserted into the appropriate configuration files at runtime. This avoids storing this information on GitHub.

## Machine Specific Overrides ##

bash\_profile and bashrc support local overrides and additions. Simply create ~/.bashrc.local or ~/.bash\_profile.local and these files will be sourced at the end of their respective parent files.

[ryanb]: http://github.com/ryanb/dotfiles