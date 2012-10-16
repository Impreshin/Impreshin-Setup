#!/bin/bash
export LANG=""
echo "Checking internet connection"
echo "-----------------------------------------------"

host1=github.com
if [ ping -w5 -c3 $host1 > /dev/null 2>&1 ]; then
	echo "Updating scripts - Please wait..."
	git reset --hard HEAD
    git pull https://ImpreshinDeploy:impreshindeploy015@github.com/Impreshin/Impreshin-Setup.git master
else
	echo "no connection"
	sleep 1
fi

bash ./setup.sh