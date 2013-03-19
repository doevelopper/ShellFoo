#!/bin/bash

### Parameters
#PROJECT_NAME=parsa
SRC=src
#PATTERN='.\(enum\|cpp\)$'

############ Notepad++ ############

### Templates
header='<NotepadPlus>
	<Project name=\"%s\">'
	
folderOpen() {
	printf '
		<Folder name="%s">' $1
}

folderClose() {
printf '
		</Folder>'
}

file='
			<File name="%s" />'
		

footer='
	</Project>
</NotepadPlus>'


### Printing

printNotepadPP() {
	printf "$header" $PROJECT_NAME

	folderOpen src
	tree $SRC -fi | grep '.\(enum\|cpp\)$' | xargs printf "$file"
	folderClose
	
	folderOpen include
	tree $SRC -fi | grep '.\(h\)$' | xargs printf "$file"
	folderClose

	folderOpen makefiles
	if [ -f makefile ]; then
		printf "$file" makefile
	fi
	tree -fi | grep '.\(mak\)$' | xargs printf "$file"
	folderClose
	
	printf "$footer"
}



############ Kate ############