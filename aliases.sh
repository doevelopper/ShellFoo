
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# .N where N is the number of dir to go up
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias ls='ls --color=auto'
alias la="ls -a"
alias lh="ls -lh"

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

[ -f ${SHELLFOO_DIR}git.sh ] && . ${SHELLFOO_DIR}git.sh

