# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Save history of all open terminals
export PROMPT_COMMAND='history -a'

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace:erasedups

# Add date and time to bash history
export HISTTIMEFORMAT='%F %T '

# Ignore certain commands
export HISTIGNORE="cd:l:ll:ls:pwd:exit"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=100000
export HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] !\[\e[0;32m\]\! job(\j) exit($?)\[\e[0m\] \[\e[033;33m\][\d \t]\[\e[0m\] \n\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Use bsdtar
alias tar='bsdtar'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# If gcc is up to date, use color output
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# some more ls aliases
alias ls='ls -hF --color=auto'
alias l='ls -CF'
alias ll='ls -alF'
alias la='ll -A'
alias lr='ls -R'                    # recursive ls
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date

alias cd..='cd ..'
alias cd-='cd -'
alias ..='cd ..'
alias ...='cd ../..'

# Use vim instead of vi
alias vi="vim -u NONE"

# Open a tab for each file
#alias vim="vim -p"

# Python
alias py='ptpython'
alias py2='ptpython2'
alias pys='xonsh'

# For converting JPG to jpg
alias renameJPG='rename "s/JPG/jpg/g" *.JPG *.jpg'

# For merging PDFs
# USAGE: pdfmerge input1.pdf input2.pdf ...
alias pdfmerge='gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output.pdf'

# For converting doc to html
# USAGE: doc2html input1.doc input2.doc ...
alias doc2html='soffice --headless --convert-to html'

# rename
alias rename='perl-rename'

# Download webpage and contents
# Usage: wgetfull URL
alias wgetfull='wget -r --no-parent -e robots=off'

# Quick webserver on current dir
alias qs='python -m http.server'

# Battery information without desktop
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# ifup/ifdown ethernet
alias eup='sudo ip link set enp4s0 up'
alias edn='sudo ip link set enp4s0 down'
alias wup='sudo ip link set wlp2s0 up'
alias wdn='sudo ip link set wlp2s0 down'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Pacman aliases
alias pac="pacaur -S"     # default action- install one or more packages
alias pacu="pacaur -Syu"  # '[u]pdate'pacaur- upgrade all packages to their newest version
alias pacr="pacaur -Rns"  # '[r]emove'pacaur- uninstall one or more packages
alias pacs="pacaur -Ss"        # '[s]earch'pacaur- search for a package using one or more keywords
alias paci="pacaur -Si"        # '[i]nfo'pacaur- show information about a package
alias paclo="pacaur -Qdt"      # '[l]ist [o]rphans'rphans- list all packages which are orphaned
alias pacc='sudo paccache -rk2 && find /var/cache/pacman/pkg/ -size +60M -exec sh -c "echo Removing large files...; ls -lh --color=auto {}; sudo rm -f {}" \;'  # '[c]lean cache'cache- delete all not currently installed package files
alias paclf="pacaur -Ql"       # '[l]ist [f]iles'iles- list all files installed by a given package

# For CS 233
alias qtspim="qtspim -file"
alias qtspimbot="qtspimbot -file"
alias qtspimbot2="qtspimbot -file2"

# the fuck
alias fuck='$(thefuck $(fc -ln -1))'

# Rename all files to their checksum
alias renameToChecksum="md5sum * | sed -e 's/\([^ ]*\) \(.*\(\..*\)\)$/mv -v \2 \1\3/e'"

# readline wrapper to ocaml
alias ocaml='rlwrap -c ocaml'

# xclip clipboard
alias xclip="xclip -selection c"

# gone wild
alias lvm='ssh jianliu4@lvm'
alias rpi='ssh luke@rpi'

mcd() { mkdir -p "$1"; cd "$1";}

cdl() { cd "$1"; l;}

export EDITOR=vim
export SVN_EDITOR=nano
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/opt/android-ndk

export PATH="/usr/lib/ccache/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/luke/scripts"

# For ccache
export CCACHE_DIR=/media/ccache

# For less
alias less='less -N'
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# OPAM configuration
. /home/luke/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
