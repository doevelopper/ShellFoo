
# Source global definitions (now with cool syntax)
[ -f /etc/bashrc ] && . /etc/bashrc
if [ -f aliases.sh ]; then
	. aliases.sh
fi
[ -f functions.sh ] && . functions.sh

#Source local (current dir) bashrc
if [ -f $(pwd)/bashrc ]; then
	. $(pwd)/bashrc
fi


alias lastnel="tac $1 | grep '.' | head -n 1"



#PATH=$HOME/bin:$PATH
#CDPATH+=":$LIB/src:$TESTS:$PROJET"


