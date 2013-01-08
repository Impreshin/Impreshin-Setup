#!/bin/bash

WIZARD=$1
trap bashtrap INT
bashtrap()
{
    bash ~/setup/setup.sh
}
cd ~/setup/
function startfn {
php_output=`php ~/setup/cfg.php`
	IFS=":"
	while read -r key val; do
	    eval ${key}="${val}"
	done <<< "$php_output"




	cd /media/data/web

	# echo "path: $git_path"

	if [ -n "$git_path" ]; then
		git reset --hard HEAD
	    git pull https://$git_username:$git_password@$git_path $git_branch

	    wget --quiet --output-document=/dev/null http://localhost/update/index.php
	  else
		echo ""
	    echo "CANT READ CONFIG FILE. EXITING NOW"
		echo ""
	fi

if [ -d /media/data/wip ]; then

php_output=`php ~/setup/cfg_wip.php`
	IFS=":"
	while read -r key val; do
	    eval ${key}="${val}"
	done <<< "$php_output"




	cd /media/data/wip

	# echo "path: $git_path"

	if [ -n "$git_path" ]; then
		git reset --hard HEAD
	    git pull https://$git_username:$git_password@$git_path $git_branch

	    wget --quiet --output-document=/dev/null http://localhost/update/index.php
	  else
		echo ""
	    echo "CANT READ CONFIG FILE. EXITING NOW"
		echo ""
	fi
fi


	cd ~/setup/
	
	finish
}

function finish {

	echo "--- Done ---"
	endfn
}
function endfn {
echo ""
echo ""
 read -p "Press [Enter] key to continue..."
	if [ -z "$WIZARD" ]; then
       bash ./setup.sh " - Impreshin Update Done"
    else
       bash ./setup.sh " - Wizard Complete"
    fi
}

clear

echo "Impreshin Update"
echo "-----------------------------------------------"
echo ""
startfn
