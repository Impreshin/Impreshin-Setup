#!/bin/bash
export LANG=""
echo "updating scripts - please wait..."

	git reset --hard HEAD
	    git pull https://WilliamStam:awssmudge1@github.com/WilliamStam/Impreshin-Setup.git master
sudo ./setup.sh