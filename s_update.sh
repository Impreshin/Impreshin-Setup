#!/bin/bash

WIZARD=$1
cd ~/setup/
function startfn {
php_output=`php ~/setup/cfg.php`
	IFS=":"
	while read -r key val; do
	    eval ${key}="${val}"
	done <<< "$php_output"




	cd /media/data/web

	echo "path: $git_path"

	if [ -n "$git_path" ]; then
		git reset --hard HEAD
	    git pull https://$git_username:$git_password@$git_path $git_branch

	    wget --quiet --output-document=/dev/null http://localhost/update/index.php
	  else
		echo ""
	    echo "CANT READ CONFIG FILE. EXITING NOW"
		echo ""
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
       bash ./setup.sh
    else
       bash ./setup.sh
    fi
}

clear

echo "Impreshin Update"
echo "-----------------------------------------------"
echo ""
startfn
