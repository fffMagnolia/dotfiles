# when do login, this file is load.

# change prompt
parse_git_branch() {
     git branch 2> $HOME/.err.txt | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function change_prompt() {
    # colors
    local PURPLE="\[\e[38;5;54m\]"
    local GOLD="\[\e[38;5;214m\]"
    local BROWN="\[\e[38;5;52m\]"
    local RED="\[\e[38;5;196m\]"
    local DEFAULT="\[\e[m\]"

    PS1="${BROWN}\u${PURPLE}@${GOLD}\w${PURPLE}${DEFAULT}\$(parse_git_branch)${PURPLE}$ ${DEFAULT}"
}
change_prompt

# alias
alias rm='rm -i' # check remove file
alias ls='ls -aGF'
alias ..='cd ..'
alias cdev='cd $HOME/Development/'
alias vi='env LANG=ja_JP.UTF-8  /Applications/MacVim.app/Contents/MacOS/Vim'
alias vim='env LANG=ja_JP.UTF-8  /Applications/MacVim.app/Contents/MacOS/Vim'
alias c='clear'
alias f='open .' # f and cdf link:https://goo.gl/G0gNhP
alias bd='brew doctor'
alias bu='brew update'
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
