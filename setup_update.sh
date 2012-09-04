#!/bin/bash
export LANG=""
trap bashtrap INT
bashtrap()
{
    bash ~/setup/setup.sh
}


echo "Checking internet connection"
echo "-----------------------------------------------"

host1=github.com
if  [ "`ping -c 1 $host1`" ]; then
	echo "Updating scripts - Please wait..."
	echo ""
	git stash
    git pull https://WilliamStam:awssmudge1@github.com/WilliamStam/Impreshin-Setup.git master

fi

sudo bash ~/setup/setup.sh