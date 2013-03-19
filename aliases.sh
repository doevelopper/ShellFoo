
# Be laaazzzyyy
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# .N where N is the number of dir to go up
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

alias ls='ls --color=auto'
alias la="ls -a"
alias lh="ls -lh"

# Be safe
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -i --preserve-root'

alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Be more human
alias df='df -H'
alias du='du -ch'


alias mkdir='mkdir -pv'

# Show open ports
alias ports='netstat -tulanp'

[ -f ${SHELLFOO_DIR}git.sh ] && . ${SHELLFOO_DIR}git.sh

