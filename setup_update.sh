#!/bin/bash
export LANG=""
echo "Checking internet connection"
echo "-----------------------------------------------"

host1=github.com
if  [ "`ping -c 1 $host1`" ]; then
	echo "Updating scripts - Please wait..."
	git reset --hard HEAD
    git pull https://WilliamStam:awssmudge1@github.com/WilliamStam/Impreshin-Setup.git master
else
	echo "no connection"
	sleep 1
fi

bash ./setup.sh