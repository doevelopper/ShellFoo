
# Watchout, this doesn't look portable at all.
# see http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
export SHELLFOO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"

# Source global definitions (now with cool syntax)
[ -f /etc/bashrc ] && . /etc/bashrc

if [ -f ${SHELLFOO_DIR}aliases.sh ]; then
	. ${SHELLFOO_DIR}aliases.sh
fi
[ -f functions.sh ] && . functions.sh

#Source local (current dir) bashrc
if [ -f $(pwd)/bashrc ]; then
	. $(pwd)/bashrc
fi


[ -f ${SHELLFOO_DIR}private.sh ] && . ${SHELLFOO_DIR}private.sh



alias lastnel="tac $1 | grep '.' | head -n 1"



#PATH=$HOME/bin:$PATH
#CDPATH+=":$LIB/src:$TESTS:$PROJET"


