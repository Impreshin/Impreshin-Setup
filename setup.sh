#!/bin/bash
export LANG=""
cd ~/setup/
function runscript {

	INTERFACE=`/sbin/ifconfig  | grep ^eth | sed "s/ .*//" | head -n 1`
	CUR_IFCONFIG=`/sbin/ifconfig $INTERFACE`
	CURRENT_HOST=$(hostname)
	CURRENT_IP=`echo $CUR_IFCONFIG | sed "s/.*inet addr:\([0-9\.]*\).*/\1/"`

	host1=github.com
   if  [ "`ping -c 1 $host1`" ]; then
        INTERNETUP="1"
    else
        INTERNETUP="0"
    fi

	clear
	echo "Welcome to Impreshin"
	echo "-----------------------------------------------"
	echo "To access Impreshin open your web browser and go to:"
	echo ""
	echo "   http://$CURRENT_HOST/"
	echo "        - or -"
	echo "   http://$CURRENT_IP/"
	echo ""
	echo "-----------------------------------------------"
	echo "Setup $1"
	echo ""


	echo 'w) Wizard - This will erase everything to default settings'
	echo '------------------------'
	echo ' 1) Partitioning'
	echo ' 2) Networking'
	echo ' 3) Folders & Files'
	echo ' 4) Impreshin Setup'

	if [ "$INTERNETUP"="1" ]; then
		echo ' 5) Update Impreshin'
	fi

	echo '------------------------'
	echo 'u) Update System'
	echo 'r) Reboot'
	echo 's) Shut Down'
	echo ''
	echo 'e) Exit'



	echo ""
	read -e -p "Choose Option: " -i "" RUNIT

	if [ -z "$RUNIT" ]; then
		exit 0
	fi

	echo ""





	SELECTED=""

	case $RUNIT in
        w)
            SELECTED="1"
	        read -e -p "this will launch the first time wizard. Continue?: " -i "y" goon

	        if [ $goon = "y" ]; then
            		 bash ./s_drive.sh "1"
            	else
            		runscript
            fi

          ;;
        1)
	        SELECTED="1"
            bash ./s_drive.sh
         ;;
        2)
	        SELECTED="1"
	        bash ./s_network.sh
         ;;
        3)
	        SELECTED="1"
	        bash ./s_folder.sh
         ;;
        4)
	        SELECTED="1"
	        bash ./s_database.sh
         ;;
        5)
            SELECTED="1"
            bash ./s_update.sh
         ;;
         r)
            SELECTED="1"
            sudo reboot
         ;;
         s)
            SELECTED="1"
            sudo shutdown -h now
         ;;
         e)
            SELECTED="1"
            echo "Exiting"
            sleep 1
            clear
            exit
         ;;
         u)
            SELECTED="1"
            clear
            echo "Updating System"
            echo "-----------------------------------------------"
            echo ""
            echo "this may take a while...."
            sleep 1
            sudo apt-get update
            sudo apt-get upgrade
            sudo apt-get dist-upgrade

            runscript
         ;;
    esac

	if [ -z "$SELECTED" ]; then
		runscript " - Sorry, $RUNIT is not a valid answer"

	fi


}



runscript $1

