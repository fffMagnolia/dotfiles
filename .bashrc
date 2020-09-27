# when do login, this file is load.

# Bash color scheme
# $HOME/Development/Bash/
# link:https://github.com/lysyi3m/osx-terminal-themes

# change prompt
parse_git_branch() {
     git branch 2> $HOME/.err.txt | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# color sample in Development/Bash/256-colors.sh
# https://misc.flogisoft.com/bash/tip_colors_and_formatting#colors2

function change_prompt() {
  local IMAGE_GREEN="\[\e[38;5;87m\]"
  local IMAGE_RED="\[\e[38;5;196m\]"
  local IMAGE_GOLD="\[\e[38;5;11m\]"
  local IMAGE_BLACK="\[\e[38;5;235m\]"
  local DEFAULT="\[\e[m\]"

  PS1="${IMAGE_GREEN}\u${IMAGE_BLACK}@${IMAGE_RED}\W${IMAGE_GREEN}\$(parse_git_branch)${IMAGE_GOLD}$ ${DEFAULT}"
}
change_prompt

# alias
alias rm='rm -i' # check remove file
alias ls='ls -aGF'
alias ll='ls -l'
alias ..='cd ..'
alias cdev='cd $HOME/Development/'
alias vi='env LANG=ja_JP.UTF-8  /Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='env LANG=ja_JP.UTF-8  /Applications/MacVim.app/Contents/MacOS/Vim'
alias c='clear'
alias f='open .' # f and cdf link:https://goo.gl/G0gNhP
alias b='brew'
alias bd='brew doctor'
alias bu='brew update'
# mean stack
alias gulp='node_modules/.bin/gulp'

cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]
        then
                cd "$target"
                pwd
        else
                echo 'No Finder window found' >&2
        fi
}
