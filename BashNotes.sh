###
###  Notes with some useful bash commands
###

setsid			"Launch command independently of terminal"
grive			"Google drive (use -a to setup)"


###
### Bash scripting
###

#!/bin/bash

OPTION="$1" # First arguement

if [[ $OPTION == "-h" ]]; then
	echo -h		Help
fi

