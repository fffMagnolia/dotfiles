# .bash_profile:ログイン時のみ実行される．
# exportしたのはプロセス間で共有されるのでこっちに
# link:http://qiita.com/magicant/items/d3bb7ea1192e63fba850

#add path
function set_path() {
    local PHP="/usr/local/bin:/usr/local/php5/bin:"
    local RUBY="$HOME/.rbenv/shims:"
    local BREW="/usr/local/bin:"
    local SQLITE3="/usr/local/opt/sqlite/bin:"
    PATH="${PHP}${RUBY}${BREW}${SQLITE3}${PATH}"
}
set_path

# init pyenv
eval "$(pyenv init -)"

#init rbenv
eval "$(rbenv init -)"
# load .bashrc
test -r ~/.bashrc && . ~/.bashrc
