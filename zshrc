# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory
setopt sharehistory
setopt extendedhistory
setopt histignoredups
setopt rm_star_silent
unsetopt beep
bindkey -v

# by compinstall
zstyle :compinstall filename '/home/luke/.zshrc'
# more extensive tab completion
autoload -Uz compinit
compinit
# Tab completion from both ends.
setopt completeinword
# Tab completion should be case-sensitive.
#zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
CASE_SENSITIVE="true"
# Better completion for killall.
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
# Changes the definition of "word", e.g. with ^W.
autoload select-word-style
select-word-style shell

# globbing
setopt extendedglob
unsetopt caseglob

# PATH
typeset -U path
path=(/home/luke/.opam/system/bin /usr/lib/ccache/bin/ /usr/local/sbin /usr/local/bin /usr/bin /bin /usr/bin/vendor_perl /usr/bin/core_perl /home/luke/scripts)

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias cd-='cd -'

# For converting doc to html
# USAGE: doc2html input1.doc input2.doc ...
alias doc2html='soffice --headless --convert-to html'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ifup/ifdown ethernet
alias eup='sudo ip link set enp4s0 up'
alias edn='sudo ip link set enp4s0 down'
alias wup='sudo ip link set wlp2s0 up'
alias wdn='sudo ip link set wlp2s0 down'

# Pacman aliases
alias pac="pacaur -S"     # default action- install one or more packages
alias pacu="pacaur -Syu"  # '[u]pdate'pacaur- upgrade all packages to their newest version
alias pacr="pacaur -Rns"  # '[r]emove'pacaur- uninstall one or more packages
alias pacs="pacaur -Ss"        # '[s]earch'pacaur- search for a package using one or more keywords
alias paci="pacaur -Si"        # '[i]nfo'pacaur- show information about a package
alias paclo="pacaur -Qdt"      # '[l]ist [o]rphans'rphans- list all packages which are orphaned
alias pacc='sudo paccache -rk2 && find /var/cache/pacman/pkg/ -size +60M -exec sh -c "echo Removing large files...; ls -lh --color=auto {}; sudo rm -f {}" \; && rm -rf ~/.cache/pacaur/*' # '[c]lean cache'cache- delete all not currently installed package files
alias paclf="pacaur -Ql"       # '[l]ist [f]iles'iles- list all files installed by a given package

# For merging PDFs
# USAGE: pdfmerge input1.pdf input2.pdf ...
alias pdfmerge='gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output.pdf'

alias py='ptpython'
alias py2='ptpython2'
alias pys='xonsh'

# Quick webserver on current dir
alias qs='python -m http.server'

# rename
alias rename='perl-rename'

# ssh gone wild
alias rpi='ssh luke@rpi'
alias rpj='ssh luke@rpj'
alias grd0='ssh localadmin@grd0'
alias grd1='ssh localadmin@grd1'
alias grd2='ssh localadmin@grd2'
alias grd3='ssh localadmin@grd3'
alias grd4='ssh localadmin@grd4'
alias grd5='ssh localadmin@grd5'
alias grd6='ssh localadmin@grd6'
alias grd7='ssh localadmin@grd7'
alias grd8='ssh localadmin@grd8'
alias grd9='ssh localadmin@grd9'

alias tar='bsdtar'

# Use vim instead of vi
alias vi="vim -u NONE"

# Open a tab for each file
alias vim="vim -p"

# Download webpage and contents
# Usage: wgetfull URL
alias wgetfull='wget -r --no-parent -e robots=off'

# generate subresource integrity hash for html
sr-integrity() {
    if [ $# -eq 1 ]; then
        cat $1 | openssl dgst -sha384 -binary | openssl enc -base64 -A
    elif [ $# -eq 2 ]; then
        cat $2 | openssl dgst -$1 -binary | openssl enc -base64 -A
    else
        echo "Usage: sr-integrity [hash] file"
    fi
}

export EDITOR=vim
export SVN_EDITOR=nano

export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/opt/android-ndk
export PATH=/usr/lib/ccache/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/luke/scripts:/opt/cuda/bin

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

# OPAM configuration
. /home/luke/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR  ]]; then
    mkdir $ZSH_CACHE_DIR
fi

# oh-my-zsh
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="luke"
DISABLE_AUTO_UPDATE="true"
plugins=(git history jsontools sudo svn systemd tmux)
source $ZSH/oh-my-zsh.sh

alias ls='ls -hF --color=auto'
alias l='ls'
alias ll='ls -alF'
alias la='ll -A'
alias lr='ls -R'                    # recursive ls
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date

export TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S'
