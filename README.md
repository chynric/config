# zsh custom functions


###### Shortcuts ######
ALT + .       insert last argument of previouse command
ALT + ,       insert first argument of previouse command

CTRL + V      open command in vi
CTRL + U      delete complete line
CTRL + K      delete line after cursor
CTRL + R      history search backward
CTRL + E      history search forward
CTRL + Z      suspend current foreground process
CTRL + C      interupt / kill foreground process
CTRL + D      exit shell / EOF
CTRL + ->     move curser one word to right
CTRL + <-     move curser one word to left


###### Autocompletion (TAB) ######
cd - + TAB TAB        open interactive menue showing last accessed directories
kill + SPACE + TAB    interactive process list for selection
/e/s/s + TAB          /etc/systemd/system/


###### Tmux Autocompletion ######
CTRL + X               prefix complete previouse command output
CTRL + X CTRL + X      search and complete previouse command output


###### Alias ######
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


###### Autocorrection ######


###### Globbing ######


###### Vi Mode ######
