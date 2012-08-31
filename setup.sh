#!/bin/bash
export LANG=""
cd ~/setup/
function runscript {

	INTERFACE=`/sbin/ifconfig  | grep ^eth | sed "s/ .*//" | head -n 1`
	CUR_IFCONFIG=`/sbin/ifconfig $INTERFACE`
	CURRENT_HOST=$(hostname)
	CURRENT_IP=`echo $CUR_IFCONFIG | sed "s/.*inet addr:\([0-9\.]*\).*/\1/"`

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
	ARRAY=( 'w) Wizard - This will erase everything to default settings' '------------------------' ' 1) Partitioning' ' 2) Networking' ' 3) Folders & Files' ' 4) Impreshin Setup' ' 5) Update Impreshin' '------------------------' 'r) Reboot' 's) Shut Down'  )
	ELEMENTS=${#ARRAY[@]}

	# echo each element in array
	# for loop
	for (( i=0;i<$ELEMENTS;i++)); do
	    echo " ${ARRAY[${i}]}"
	done

	echo ""
	read -e -p "Choose Script: " -i "" SCRIPT

	if [ -z "$SCRIPT" ]; then
		exit 0
	fi

	echo ""





	SELECTED=""

	case $SCRIPT in
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
    esac

	if [ -z "$SELECTED" ]; then
		runscript "Sorry, $SCRIPT is not a valid answer"

	fi


}



runscript

