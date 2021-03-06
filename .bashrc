# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#Source the colorfile
source ~/.bashrc_colors

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[${BPurple}\]\u\[${NC}\]\[${Blue}\]@\[${Red}\]\$(hostname -f)\[${NC}\]:\[${BBlue}\]\w\[${Cyan}\]\$(__git_ps1 ' [%s]')::\[${Yellow}\]  " 
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Git Auto-complete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
source ~/.git-completion.bash
source ~/.git-prompt.sh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# rbenv, and generally ruby version managers, hadn't played well
# with chefdk. The following reflects some tinkering which may not be applicable .
# Generally place a dynamic loading utility, like a version manager reading a dot file
# to the later in  $PATH than static contained tools (bundles and specifics).

# Put rbenv at the begining of my user path, load all other tools behind it
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Specify a specific chefdk binpath
export PATH=$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:$PATH

# Direnv, use it
eval "$(direnv hook $0)"

# I like to local install applications and control a softlink for versions
# The paths below are softlinks, the path neverchanges and I don't have 
# to rely on an env

# Specify vagrant path to use 
export PATH=$PATH:/opt/vagrant/bin/vagrant

# Go install
export PATH=/Users/joe/workspace/josephfreynolds/go/bin:$PATH

# Go Workspace
export GOPATH=$HOME/workspace/go

# Packer path, softlink to version
export PATH=$PATH:$HOME/bin

# Add binaries in $GOPATH to my path
export PATH=$PATH:$GOPATH/bin

# Teraform path, softlink to version
export PATH=$PATH:$HOME/bin/terraform

export PATH=/usr/local/sbin:$PATH

# System python path
export PATH=/usr/local/share/python:$PATH

# Where to install and track work for virtualenv
#export WORKON_HOME=~/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Coreutils

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Maven

export PATH=$PATH:$HOME/bin/maven/bin

# Kafka

export PATH=$PATH:$HOME/kafka/bin

# Openssl Flags 
export CFLAGS="-I/usr/local/opt/openssl/include $CFLAGS"
export LDFLAGS="-L/usr/local/opt/openssl/lib $LDFLAGS"


# Flink

export PATH=$PATH:$HOME/opt/flink-1.3.2/bin

# Zookeeper

export PATH=$PATH:$HOME/bin/zookeeper/bin
