#!/bin/bash
export LANG=""
echo "-----------------------------------------------"
echo "Updating scripts - Please wait..."

	git reset --hard HEAD
	    git pull https://WilliamStam:awssmudge1@github.com/WilliamStam/Impreshin-Setup.git master
bash ./setup.sh