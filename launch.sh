#!bin/bash

# Data

RED='\033[0;31m'
GREEN='\033[0;32m'

declare -a malicious_processes=(

"OSX.Generic.Suspicious",
"OSX.FakeFileOpener",
"OSX.ThiefQuest",
"OSX.BirdMiner",
"OSX.SearchAwesome", 
"OSX.FakeAV",
"OSX.Honkbox", 
"OSX.Dummy",
"OSX.Adwind", 
"OSX.KeRanger",
"mafntask",
"com.macfixer"

)

new_array=$(launchctl list);
for (( i=0; i < ${#new_array[@]}; i++ ))
do
    for (( j=0; j < ${#malicious_processes[@]}; j++ ))
    do
        if [[ ${new_array[$i]} = ${malicious_processes[$j]} ]]; then
	    printf "%s\t%s\n" "$j" "${malicious_processes[$j]}"
            echo $j "${RED}Malicious processes were found on this MAC." 
        fi
	    printf "%s\t%s\n" "$j" "${malicious_processes[$j]}" 
	    echo "${GREEN}No such malicious process."
    done
done
echo "Your Mac is safe."
