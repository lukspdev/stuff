# vim:ft=zsh ts=2 sw=2 sts=2

ip_addrs() {
  lan-ip.sh
}

return_code() {
  exit_code=$?
  if [[ $exit_code -ne 0 && $exit_code -ne 126 && $exit_code -ne 127 ]]
  then
    exit_codes.sh $exit_code
  fi
}

# PROMPT='%{$fg_bold[yellow]%}[%D %*]%{$reset_color%} %{$fg_bold[green]%}%n@%m-$(ip_addrs)%{$reset_color%}:%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
# $ '
PROMPT='%{$fg_bold[yellow]%}[%D %*]%{$reset_color%} %{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$ '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg_bold[red]%}$(return_code)%{$reset_color%}'
