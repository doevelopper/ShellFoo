#From http://sudonetworks.com/wiki/index.php?title=Windows_BASH


function pef {
 procname=${1}
 if [ $# -eq 0 ] ; then tasklist ; else tasklist | grep -i ${procname} | grep -v grep ; fi
}

function ki {
 procname=${1}
 processes=$(tasklist | grep -i ${procname} | grep -v grep | gawk '{print $1}')
 for process in ${processes}
 do
   wmic process where name=\"${process}\" delete
 done
}