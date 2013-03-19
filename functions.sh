#### KEEP THIS IN ALPHABETICAL ORDER PLZ


#Change directory and list it.
function cl() {
  if [[ -d "${1}" ]]; then
    cd $1
    ls
  fi
}


# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

function j() { jobs && read id && fg $id; }; 



# Convert the parameters or STDIN to lowercase.
function lc {
	if [ $# -eq 0 ]; then
		tr '[:upper:]' '[:lower:]';
	else
		tr '[:upper:]' '[:lower:]' <<< "$@";
	fi;
}

# Convert the parameters or STDIN to uppercase.
function uc {
	if [ $# -eq 0 ]; then
		tr '[:lower:]' '[:upper:]';
	else
		tr '[:lower:]' '[:upper:]' <<< "$@";
	fi;
}


#ls exclusif
#Liste tout sauf ce qui est passé en paramètre
#Attention, les paramètres sont envoyés, sans être filtré, à grep.
function lx() {
  ls | grep -v $*
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}


# let you interactivly choose a directory in the stack.
# usage:
# pushd .
# pushd ~
# pushd ~/some/other/dir
# pd
function pd()
{
    if [[ $# -ge 1 ]];
    then
        choice="$1"
    else
        dirs -v
        echo -n "? "
        read choice
    fi
    if [[ -n $choice ]];
    then
        declare -i cnum="$choice"
        if [[ $cnum != $choice ]];
        then #choice is not numeric
            choice=$(dirs -v | grep $choice | tail -1 | awk '{print $1}')
            cnum="$choice"
            if [[ -z $choice || $cnum != $choice ]];
            then
                echo "$choice not found"
                return
            fi
        fi
        choice="+$choice"
    fi
    pushd $choice
}

function see() {
	cat $1 | less
}


extract () { # extract files. Ignore files with improper extensions.
    local x
    ee() { # echo and execute
        echo "$@"
        $1 "$2"
    }
    for x in "$@"; do
        [[ -f $x ]] || continue
        case "$x" in
                *.tar.bz2 | *.tbz2 )    ee "tar xvjf" "$x"      ;;
                *.tar.gz | *.tgz ) ee "tar xvzf" "$x"   ;;
                *.bz2 )                         ee "bunzip2" "$x"       ;;
                *.rar )                         ee "unrar x" "$x"   ;;
                *.gz )                          ee "gunzip" "$x"    ;;
                *.tar )                         ee "tar xvf" "$x"   ;;
                *.zip )                         ee "unzip" "$x"     ;;
                *.Z )                           ee "uncompress" "$x" ;;
                *.7z )                          ee "7z x" "$x"      ;;
        esac
    done
}