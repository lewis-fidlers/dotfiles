export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Customize to your needs...
export GOPATH=$HOME/Go
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/lewis/Go/bin:

# Use Z (https://github.com/rupa/z)
. `brew --prefix`/etc/profile.d/z.sh

# .zshenv or .zshrc
fpath=( "/usr/local/share/zsh/site-functions" $fpath )

export ARCHFLAGS='-arch x86_64'
# Node
# export NODE_PATH=/usr/local/lib/node
# export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

if [ -f ~/.git-completion.zsh ]; then
    . ~/.git-completion.zsh
fi

alias lein="nocorrect lein"
alias subl="nocorrect subl"
alias gop="nocorrect gop"
alias g="nocorrect git"
alias gst='git status -sb'
alias gz='git z'
alias p='powify'
alias gdd='git diff --stat master..develop'
alias git='hub'
alias gpr='git pull-request -b develop'
alias gco='git checkout'
alias gp='git push'
alias gl='git pull'
alias gca='git commit -a'
alias gc='git commit'
alias drsh="nocorrect drsh"
alias getmyip='dig +short myip.opendns.com @resolver1.opendns.com'
alias s='foreman start -f Procfile.local'
alias rs='touch tmp/restart.txt'
alias redis-start="redis-server /usr/local/etc/redis.conf"
# From the "Vendor everything" blog post
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"
alias devlog="tail -f log/development.log"
alias tower="gittower ."
alias gh="git browse"
alias v="open -a MacVim.app ."
alias mvim="open -a MacVim.app ."
function browse { open "http://$(basename $PWD).dev" }

# alias mysql_start="/usr/local/Cellar/mysql/5.1.41/share/mysql/mysql.server start"
# alias mysql_stop="/usr/local/Cellar/mysql/5.1.41/share/mysql/mysql.server stop"
# alias psql_start="/usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
# alias psql_stop="/usr/local/bin/pg_ctl -D /usr/local/var/postgres stop -s -m fast"
# alias mongo_start="mongod run --config /usr/local/Cellar/mongodb/1.6.5-x86_64/mongod.conf"

source /usr/local/share/zsh/site-functions/history.zsh
source /usr/local/share/zsh/site-functions/history-substring-search.zsh
source /usr/local/share/zsh/site-functions/completion.zsh
source /usr/local/share/zsh/site-functions/key-bindings.zsh
source ~/.zsh_functions/functions.zsh
autoload -U promptinit && promptinit zsh_functions
prompt pure

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source /usr/local/share/zsh/site-functions/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
