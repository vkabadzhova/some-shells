#!bin/bash

Help()
{
	echo 'Run using bash command!'
	echo
	echo Syntax
	echo ..Or otherwise said, how do I use it: 
	echo "bash ./mainstruct [file name] \"[function's prototype]\""	
	echo

	echo "If file name not specified, the program will not be executed."
	echo "If the function's prototype is not specified, the program will be executed \
and this will result in main and basic comments only"
	echo 
	echo "If there's a file already with the same name, the program will overwrite it"

}

while getopts ":h" option; do
	case $option in
		h) #sksdjs
			Help
			exit;;
	esac
done


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
