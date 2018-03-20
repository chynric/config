#PROMPT=' %F{white}%n%f@%m%f %1~%f %F{yellow}%B$%b%f '
PROMPT=' %F{white}% 旭%f@%m%f %1~%f %F{yellow}%B$%b%f '

#RPROMPT='[%F{yellow}%?%f]'
#if [[ -z "$STY" ]]; then
#   tmux attach
#fi

if [ "$(tty)" = "/dev/tty2" ]; then
        startx -- :1 vt8 -nolisten tcp
        logout
fi      

autoload -Uz compinit
autoload edit-command-line; zle -N edit-command-line
compinit
zstyle ':completion:*' menu select=1 interactive
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
setopt complete_aliases
setopt correct
setopt autocd
setopt extendedglob
setopt autopushd
bindkey -v
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey	"\e[1~" beginning-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[[8~" end-of-line
bindkey "\e[F" end-of-line
bindkey "\eOF" end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^E' history-incremental-search-forward
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^E' history-incremental-pattern-search-forward
bindkey '^K' kill-line
bindkey \^U kill-whole-line
bindkey -M vicmd \^U kill-whole-line
bindkey -M vicmd "^V" edit-command-line
export KEYTIMEOUT=1
zle_highlight=(region:standout special:standout)
zle_highlight=(isearch:fg=red)
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt appendhistory
setopt sharehistory
setopt incappendhistory

foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/ c }/(main|viins)/ i }"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

_tmux_pane_words() {
  local expl
  local -a w
  if [[ -z "$TMUX_PANE" ]]; then
    _message "not running inside tmux!"
    return 1
  fi
  w=( ${(u)=$(tmux capture-pane \; show-buffer \; delete-buffer)} )
  _wanted values expl 'words from current tmux pane' compadd -a w
}

zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^Xt' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'

autoload zmv
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'

alias ls='ls --color=auto'
alias cp='cp -v'
alias ..='cd ..'
alias grep="grep --color=auto"
alias -g gp='| grep -i'
alias diff="colordiff"
alias rm="rm -vi"
alias mv="mv -v"
alias vi="vim"

export EDITOR="/usr/bin/vi"
export TERMINAL="/usr/bin/sakura"
export OOO_FORCE_DESKTOP=gnome

#powerline-daemon -q
#. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon custom_user  host  dir_writable dir )
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
#POWERLEVEL9K_CUSTOM_USER="echo 旭"
#POWERLEVEL9K_CUSTOM_USER_BACKGROUND="blue"
#POWERLEVEL9K_CUSTOM_USER_FOREGROUND="orange"
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
