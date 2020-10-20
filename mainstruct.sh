#!bin/bash

filename="$1"
funcinit="$2"
NEWLINESFUNC="\n{\n\n}\n"


if [ "$filename" == "" ];
then
	echo 'No file is specified!'
	echo 'Process terminated!'
	exit 1;
else 
	if [[ $funcinit = "" ]];
	then
		echo 'No function specified!'
	else
		NEWLINESFUNC="\n{\n\n}"
		funcinit=${funcinit}:$NEWLINESFUNC
	fi
fi

filestart="//------------------------------------------------------------------------\n// NAME:$studentname\n// CLASS:\n// NUMBER:\n// PROBLEM: #\n// FILE NAME:\n// FILE PURPOSE:\n// \n// \n//------------------------------------------------------------------------\n"

funcstart="//------------------------------------------------------------------------\n// FUNCTION:\n// \n// \n// PARAMETERS: \n// \n// \n//------------------------------------------------------------------------\n"

mstruct="$filestart\n#include <stdio.h>\n\n$funcstart\n$funcinit\n\nint main(int argc, char *argv[])\n{\n\n\treturn 0;\n}"

echo -e "$mstruct" > $filename

echo 'Done successfully!'
