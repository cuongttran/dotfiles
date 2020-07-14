source ${ZIM_HOME}/init.zsh

setopt HIST_IGNORE_ALL_DUPS
bindkey -v
WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

KEYTIMEOUT=5

# Cursor style {{{
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^i^e' edit-command-line

zle-line-init () {
  zle -K viins
  #echo -ne "\033]12;Grey\007"
  #echo -n 'grayline1'
  echo -ne "\033]12;Gray\007"
  echo -ne "\033[5 q"
  #print 'did init' >/dev/pts/16
}
zle -N zle-line-init
zle-keymap-select () {
  if [[ $KEYMAP == vicmd ]]; then
    if [[ -z $TMUX ]]; then
      printf "\033]12;Green\007"
      printf "\033[2 q"
    else
      printf "\033Ptmux;\033\033]12;red\007\033\\"
      printf "\033Ptmux;\033\033[2 q\033\\"
    fi
  else
    if [[ -z $TMUX ]]; then
      printf "\033]12;Grey\007"
      printf "\033[5 q"
    else
      printf "\033Ptmux;\033\033]12;grey\007\033\\"
      printf "\033Ptmux;\033\033[5 q\033\\"
    fi
  fi
  #print 'did select' >/dev/pts/16
}
zle -N zle-keymap-select
# }}}

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^r' history-incremental-search-backward

alias tsm='transmission-remote'
alias hgs='hugo server -D'
alias cat='bat'
alias cl='clear'
alias mcc='mvn clean compile'
alias mcp='mvn clean package'
alias mcv='mvn clean verify'
alias mdt='mvn dependency:tree'
alias nv='nvim'
alias vim='nvim'
alias tx='tmux'

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-20.0.0/Contents/Home
export GOPATH=~/Documents/code/go
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

