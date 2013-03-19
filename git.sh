#!/bin/bash

#Remove deleted files
alias gitrd="git ls-files -d | xargs git rm"

#Add untracked files
alias gitau="git ls-files -o --exclude-standard | xargs git add"

#Add All (tracked and untracked files)
alias gitaa="git add --all"


## See https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh

alias gst='git status'
alias gp='git push'
alias gd='git diff'
alias gco='git checkout'


#Revert a file
#git reset $file #unstage
#git checkout $file #restore

