export PATH=~/bin:$PATH
export SVDIR=~/.sv
export RBENV_ROOT=/usr/local/var/rbenv
alias dus='du -ksx * | sort -n'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
