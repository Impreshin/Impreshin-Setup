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


	sudo chown -R www-data:www-data /media/data/web
	if [ -d /media/data/wip ]; then
		sudo chown -R www-data:www-data /media/data/wip
	fi

	cd /media/data/web





	# echo "path: $git_path"
	echo "$git_branch"
	echo ""

	if [ -n "$git_path" ]; then

		git reset --hard HEAD
	    git pull https://$git_username:$git_password@$git_path $git_branch

	    wget --quiet --output-document=/dev/null http://localhost/update/index.php
	  else
		echo ""
	    echo "CANT READ CONFIG FILE. EXITING NOW"
		echo ""
	fi

echo ""
if [ -d /media/data/wip ]; then
php_output=`php ~/setup/cfg_wip.php`
	IFS=":"
	while read -r key val; do
	    eval ${key}="${val}"
	done <<< "$php_output"




	cd /media/data/wip

	# echo "path: $git_path"
echo ""
echo ""
echo ""
echo ""
echo "$git_branch"
	echo ""


	if [ -n "$git_path" ]; then
		git reset --hard HEAD
	    git pull https://$git_username:$git_password@$git_path $git_branch

	    wget --quiet --output-document=/dev/null http://localhost:81/update/index.php
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

	sudo chown -R www-data:www-data /media/data/web

	if [ -d /media/data/wip ]; then
		sudo chown -R www-data:www-data /media/data/wip
	fi

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
