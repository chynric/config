# zsh custom functions
Zsh is a powerful shell that operates as both an interactive shell and as a scripting language interpreter. Paul Falstad wrote the first version of Zsh in 1990 while a student at Princeton University. The name zsh derives from the name of Yale professor Zhong Shao (then an Assistant Professor at Princeton University) — Paul Falstad regarded Shao's login-id, "zsh", as a good name for a shell. [wikipedia]

## Shortcuts ##
* ALT + .       insert last argument of previouse command
* ALT + ,       insert first argument of previouse command

* CTRL + V      open command in vi
* CTRL + U      delete complete line
* CTRL + L      clean screen
* CTRL + K      delete line after cursor
* CTRL + R      history search backward
* CTRL + E      history search forward
* CTRL + Z      suspend current foreground process
* CTRL + C      interupt / kill foreground process
* CTRL + D      exit shell / EOF
* CTRL + ->     move curser one word to right
* CTRL + <-     move curser one word to left


## Autocompletion (TAB) ##
* cd - + TAB TAB        open interactive menue showing last accessed directories
* kill + SPACE + TAB    interactive process list for selection
* /e/s/s + TAB          /etc/systemd/system/


## Tmux Autocompletion ##
* CTRL + X               prefix complete previouse command output strings
* CTRL + X CTRL + X      search and complete strings of previouse command output

## Vi mode ##
* ESC         change to command mode
* i           change from command mode to insert mode

## Alias ##
* alias zmv='noglob zmv'
* alias zcp='noglob zmv -C'
* alias zln='noglob zmv -L'
* alias zsy='noglob zmv -Ls'

* alias ls='ls --color=auto'
* alias cp='cp -v'
* alias ..='cd ..'
* alias grep="grep --color=auto"
* alias -g gp='| grep -i'
* alias diff="colordiff"
* alias rm="rm -vi"
* alias mv="mv -v"
* alias vi="vim"


## Autocorrection ##


## Globbing ##

