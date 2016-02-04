# Paths
PATH=/usr/local/bin:$PATH
PATH=~/Applications/homebrew/bin:$PATH


# C++11 build support for make
export CXXFLAGS="-std=c++0x"


# Editor
export EDITOR="/usr/local/bin/mate -w"


# Git autocomplete for OS X (or systems that don't have it preinstalled).
# We need to source git-completion.bash.
# If you've installed git using brew, a "brew info git" will show where this is installed.
# Otherwise you should be able to find this file in your system.
source ~/Applications/homebrew/etc/bash_completion.d/git-completion.bash


# Git prompt.
# We need to source git-prompt.sh.
# If you've installed git using brew, a "brew info git" will show where this is installed.
# Otherwise you should be able to find this file in your system.
source ~/Applications/homebrew/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1


# Prompt.
# For git-prompt details see git-prompt.sh (you will find this installed locally e.g. "brew info git")
# For prompt color information see http://www.cyberciti.biz/faq/bash-shell-change-the-color-of-my-shell-prompt-under-linux-or-unix/

# Basic Prompt with highlighted current directory
# export PS1='\u@\h \e[1;36m\W\e[m$ '

# Git Status Prompt
export PS1='\u@\h \e[1;36m\W\e[1;31m$(__git_ps1 " (%s)")\e[m$ '


# Aliases
alias la="ls -a"
alias ll="ls -lh"
alias du="du -khs"
alias df="df -h" 
