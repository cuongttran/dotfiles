source ${ZIM_HOME}/init.zsh

setopt HIST_IGNORE_ALL_DUPS
bindkey -v
WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

KEYTIMEOUT=5
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

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

