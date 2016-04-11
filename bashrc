#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --format=long'
alias l='ls -lh'
alias vi='vim'
source ~/.aliases

export VISUAL=vim; 
export EDITOR="$VISUAL"
source /home/antti/.bash_colors
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R'

PS1="$TITLEBAR\n\[${UC}\]\u \[${COLOR_LIGHT_BLUE}\]\${PWD} \[${COLOR_BLACK}\]\n\[${COLOR_LIGHT_GREEN}\]->→\[${COLOR_NC}\] " 

PATH=$PATH:/home/antti/Scripts:/home/antti/Symlinks:/opt/sublime_text_3:/home/antti/.npm-global/bin

#source /usr/share/autojump/autojump.bash
fortune -s | cowsay
xset -b
set bell-style none
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
set-keyb us
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
          export TERM='xterm-256color'
else
          export TERM='xterm-color'
fi

export NVM_DIR="/home/antti/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source ~/.dotfiles/.functions

