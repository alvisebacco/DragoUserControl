#!/bin/bash

function usage()
{
        clear
        title
                echo "╔════════════════════════════════════════════════════════════════════════════╗"
                echo "║                                                                            ║"
                echo "║                   Hello, this is DragoUserControl HELP                     ║"
                echo "║                                                                            ║"
                echo "║                                                                            ║"
                echo "╠════════════════════════════════════════════════════════════════════════════╣"
                echo "║              this is a command line script, please use:                    ║"
                echo "╠════════════════╦═══════════════════════════════════════════════════════════╣"
		echo "║                ║                                                           ║"
                echo "║ -h, --help     ║                    Display this help                      ║"
		echo "║                ║                                                           ║"
                echo "║ -c, --console  ║              Use the DragoUserControl core                ║"
                echo "║                ║                                                           ║"
                echo "╠════════════════╩═══════════════════════════════════════════════════════════╣"
                echo "║   or you can use command line quick commands for simpler operations        ║"
                echo "╠═══════════════════╦════════════════════════╦═══════════════════════════════╣"
                echo "║                   ║                        ║                               ║"
		echo "║ -s, --show        ║ display all users      ║ ./DragoUserControl -s         ║"
		echo "║                   ║                        ║                               ║"
		echo "║ -fu, --findUser   ║ find users by username ║ ./DragoUserControl -fu elsire ║"
		echo "║                   ║                        ║                               ║"
		echo "║ -fuid, --findUID  ║ find user by UID       ║ ./DragoUserControl -fuid 1001 ║"
		echo "║                   ║                        ║                               ║"
		echo "║ -duid, --deleteUID║ delete user by UID     ║ ./DragoUserControl -duid 1001 ║"
		echo "║                   ║                        ║                               ║"
		echo "║ -du, --deleteUser ║ delete users by name   ║ ./DragoUserControl -du elsire ║"
		echo "║                   ║                        ║                               ║"
		echo "║ -w, --who         ║ show who is connected  ║ ./DragoUserControl -w         ║"
		echo "╚═══════════════════╩════════════════════════╩═══════════════════════════════╝"
}

function title()
{
	echo "	 _____                          _    _               "
	echo "	|  __ \                        | |  | |              "
	echo "	| |  | |_ __ __ _  __ _  ___   | |  | |___  ___ _ __ "
	echo "	| |  | |  __/ _  |/ _  |/ _ \  | |  | / __|/ _ \  __|"
	echo "	| |__| | | | (_| | (_| | (_) | | |__| \__ \  __/ |"
	echo "	|_____/|_|  \__,_|\__, |\___/   \____/|___/\___|_|"
	echo "                             / |"
	echo "                           |___/"
	echo "	  _____            _             _"
	echo " 	 / ____|          | |           | |"
	echo "	| |     ___  _ __ | |_ _ __ ___ | |"
	echo "	| |    / _ \| '_ \| __| '__/ _ \| |"
	echo "	| |___| (_) | | | | |_| | | (_) | |"
	echo "	 \_____\___/|_| |_|\__|_|  \___/|_|"
}

function loading_bar()
{
	clear
	echo "[̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅] 100%"
	sleep 0.1
	clear
	echo "██████_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅̅_̲̅_̲̅_̲̅_̲̅] 100%"
	sleep 0.1
	clear
	echo "██████████̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅̅_̲̅_̲̅_̲̅_̲̅] 100%"
	sleep 0.1
	clear
	echo "██████████████̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅_̲̅̅_̲̅_̲̅_̲̅_̲̅] 100%"
	sleep 0.1
	clear
	echo "██████████████████̲̅_̲̅_̲̅_̲̅_̲̅̅_̲̅_̲̅_̲̅_̲̅] 100%"
	sleep 0.1
	clear
	echo "█████████████████████████̲̅██̲ 100%"
	sleep 0.1
}

function load_config()
{
	cd $HOME/DragoUserControl/bash
	. config.ini
}
function press_any_k()
{
	echo
	echo
	read -n 1 -r -s -p $'Press any key to continue...'
}

function defensive_code_prerequisites()
{
	CONFIG="$HOME/DragoUserControl/bash/config.ini"
	if [ -s "$CONFIG" ] 
	then
		return 0
	else 
		return 1
	fi
}

function who_is_connected()
{
	w
}

function give_me_users()
{
	load_config
	clear
        echo "╔═════════════════════════════╗"
        echo "║ these are the visible users ║"
        echo "╚═════════════════════════════╝"
	awk -F: '$3>'$LIMIT_USER' {print "User: " $1 " UID: " $3 " GID: " $4 " HomeDirectory: " $6}' $PATH_TO_FAKE_PASSWD
	press_any_k
}

function give_me_users_sorted_by_name()
{
	load_config
        name=$1
	echo "╔════════════╗"
        echo "║ Searching! ║ $name"
        echo "╚════════════╝"
        awk  -F: '($1 ~ /'$name'/) && ($3>'$LIMIT_USER') {print "User: " $1 " UID: " $3 " GID: "$4 " HomeDirectory: "$6}' $PATH_TO_FAKE_PASSWD
	press_any_k
}

function defensive_UID()
{
	load_config
	if [[ -z "$1" ]]
	then
		echo "╔═══════════════════════════════════════╗"
                echo "║ Null value should be very dangerous!  ║"
                echo "╚═══════════════════════════════════════╝"
		press_any_k
		return 1
	else
		if [ "$1" -eq "$1" ] 2> /dev/null
		then
			if (("$1" >= "$LIMIT_USER"))
			then
				return 0
			else
				echo "╔═════════════════════════════════════════════════════════╗"
               		 	echo "║ You do not have the privileges to operate with this UID ║"
               		 	echo "╚═════════════════════════════════════════════════════════╝"
               	 		press_any_k
				return 1
			fi
		else
			echo "╔════════════════════════╗"
        		echo "║ UID should be a number ║ NOT: $1"
        		echo "╚════════════════════════╝"
			return 1
		fi
	fi
}

function defensive_is_not_null_or_spacebar_value()
{
	load_config
        if [[ -z "$1" ]]
        then
                echo "╔═══════════════════════════════════════╗"
                echo "║ Null value should be very dangerous!  ║"
                echo "╚═══════════════════════════════════════╝"
                press_any_k
                return 1
	else
		return 0
	fi
}

function  give_me_users_sorted_by_id()
{

	load_config
	id=$1
	echo "╔═══════════════════╗"
        echo "║ Searching     UID ║ $id"
        echo "╚═══════════════════╝"
	if defensive_UID $id
	then
		search_results=$(awk  -F: '($3=='$id') && ($3>'$LIMIT_USER') {print "User: " $1 " UID: " $3 " GID: "$4 " HomeDirectory: "$6}' $PATH_TO_FAKE_PASSWD)
		if [ "$search_results" ]
		then
			echo "╔═══════════════════════╗"
	       		echo "║ Here's what I found!  ║"
       			echo "╚═══════════════════════╝"
			echo
			echo $search_results
		else
			echo "╔═══════════════╗"
   	         	echo "║ No UID match! ║"
       	         	echo "╚═══════════════╝"
		fi
		press_any_k
	fi
}

function del_user_by_id()
{
	load_config
	id=$1
	if defensive_UID $id
	then
		results=$(awk -F: '($3=='$id') && ($3>'$LIMIT_USER') {print "User: " $1 " UID: " $3 " GID: "$4 " HomeDirectory: "$6}' $PATH_TO_FAKE_PASSWD)
		if [ "$results" ]
		then
			echo "╔═════════════════════════════════════════════════════════════════════╗"
               		echo "║ Are you sure you want to delete the user corresponding to this UID? ║ $id"
               	 	echo "╚═════════════════════════════════════════════════════════════════════╝"
			echo $results
			name=$(awk -F: '($3=='$id') && ($3>'$LIMIT_USER') {print $1}' $PATH_TO_FAKE_PASSWD)
			read -p "(Y/n)" is_he_sure 
			if [ "$is_he_sure" == "Y" ]
			then
				echo "I'm killing..."
				cd $SHELL
				echo "$name"
				bin/userdel $name
				press_any_k
			fi
		else
			echo "╔═══════════════╗"
                        echo "║ No UID match! ║"
                        echo "╚═══════════════╝"
			press_any_k
		fi
	fi
}

function del_user_by_name()
{
	load_config
        name=$1
	me=$(whoami)
	echo "I'm looking for users starting with $name"
        user_obj=$(awk  -F: '($1 ~ /'$name'/) && ($3>'$LIMIT_USER') {print $1 }' $PATH_TO_FAKE_PASSWD)
	if [ "$user_obj" ]
	then
		echo "╔════════════════════════════════════════════════════════════════════╗"
                echo "║ Do you really want to delete all these guys whose names start with ║ $name"
                echo "╚════════════════════════════════════════════════════════════════════╝"
		for user in $user_obj
		do
			echo $user
		done
		echo
                read -p "(Y/n):" is_he_sure 
                if [ "$is_he_sure" == "Y" ]
                then
			cd $SHELL
			clear
			for user in $user_obj
			do
				if [ $user != $me ]
				then
                        		bin/userdel $user
					echo "$user killed."
				else
					echo "I can't kill you, skipping $user"
				fi
			done
                fi
	else
		echo "No, users found"
	fi
        press_any_k
}

function create_single_user()
{
	load_config
	user=$1
	uid=$2
	gid=$3
	shell=$4
	passwd=$5
	echo
	 echo "╔═══════════════════════╗"
         echo "║ I'll create this guy: ║ User: $user UID: $uid GID: $gid shell: $shell passwd: "
         echo "╚═══════════════════════╝"
	echo
	read -p "(Y/n): " is_he_sure
	if [ "$is_he_sure" == "Y" ]
	then
		cd $SHELL
		clear
		bin/useradd -u $uid -g $gid -p $passwd -s $shell $user
	fi
	press_any_k
}

function create_group()
{
	load_config
	user=$1
	final_number=$2
	starting_uid=$3
	n_users=$4
	limit=$final_number+$n_users
	start_gid=10000
	cd $SHELL
	echo "" > .secret.txt
	clear
	for (( ; $final_number<=$limit; (( final_number++ )) ))
	do
		echo "I'm creating the $final_number user!"
		passwd=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)
		echo "$user$final_number "" $passwd" | base64 >> .secret.txt
		bin/useradd -u $starting_uid -g $start_gid -p $passwd -s "/bin/sh" "$user$final_number"
		((starting_uid++))
	done
	press_any_k
}

function load_user_interface()
{
	while true
	do
		clear
		echo
		echo "╔═════════════════════════════════════════════════════════════════════════╗"
		echo "║                                                                         ║"
		echo "║           Hello, this is the local console of DragoUserControl!         ║"
		echo "║                    What do you want to do? You can:                     ║"
                echo "║                                                                         ║"
		echo "╠═════════════════════════════════════════════════════════════════════════╣"
	        echo "║       VIEW                      DELETE                   CREATE         ║"
	        echo "╠═══════════════════════╦═════════════════════════╦═══════════════════════╣"
		echo "║                       ║                         ║                       ║"
		echo "║ 1. User list view     ║ 4. Delete user by UID   ║ 6. Create single user ║"
		echo "║                       ║                         ║                       ║"
		echo "║ 2. View users by name ║ 5. Delete user by name  ║ 7. Create users       ║"
		echo "║                       ║                         ║                       ║"
		echo "║ 3. View users by UID  ║                         ║                       ║"
		echo "║                       ║                         ║                       ║"
		echo "╠═══════════════════════╩═════════════════════════╩═══════════════════════╣"
		echo "║                                wq. EXIT                                 ║"
                echo "╚═════════════════════════════════════════════════════════════════════════╝"
		echo
		read -p "> " chose

		case $chose in
			"1" )
				give_me_users
				;;

			"2" )
				clear
				echo
				echo "╔═════════════════════════════╗"
			        echo "║ Who are you looking for?    ║"
        			echo "╚═════════════════════════════╝"
				read -p "> " who_are_u_looking_4
				give_me_users_sorted_by_name $who_are_u_looking_4
				;;
			"3" )
				clear
				echo
                                echo "╔═══════════════════════════════════╗"
                                echo "║ Whitch id are you looking for?    ║"
                                echo "╚═══════════════════════════════════╝"
				read -p "> " id
				give_me_users_sorted_by_id $id
				;;
			"4" )
				clear
				echo
                                echo "╔═══════════════════════════════════╗"
                                echo "║ Whitch UID do you want to delete? ║"
                                echo "╚═══════════════════════════════════╝"
				read -p "> " id
				del_user_by_id $id
				;;
			"5" )
				echo
				echo "╔═════════════════════════╗"
                                echo "║ Who you want to delete? ║"
                                echo "╚═════════════════════════╝"
				read -p "> " who_are_u_looking_4
				del_user_by_name $who_are_u_looking_4
				;;
			"6" )
				echo
                                echo "╔══════════════════╗"
                                echo "║ Create new user! ║"
                                echo "╚══════════════════╝"
				while true
				do
					echo
					read -p "Username: " new_username
					if defensive_is_not_null_or_spacebar_value $new_username
					then
						break
					fi
				done

				while true
				do
					echo
					read -p "UID: " uid
					if defensive_UID $uid
					then
						break
					fi
				done
				
				while true
				do
					echo
					read -p "GID: " gid
					if defensive_is_not_null_or_spacebar_value $gid
					then
						break
					fi
				done
				while true
				do
					echo
					read -p "shell: " shell
					if defensive_is_not_null_or_spacebar_value $shell
					then
						break
					fi
				done
				while true
				do
					read -s -p "Password:" passwd
					echo
					read -s -p "Confirm password: " _passwd
					if [ $passwd == $_passwd ]
					then
						break
					else
						echo
						echo "Passwords do not match! Retry"
					fi
				done
					clear
					create_single_user $new_username $uid $gid $shell $passwd
				;;
			"7" )
				echo
				clear
				echo
                                echo "╔══════════════════╗"
                                echo "║ Create new users ║"
                                echo "╚══════════════════╝"
				echo
				while true
				do
					echo
					read -p "Please, insert the root of the username, e.g. > student: " user
					if defensive_is_not_null_or_spacebar_value $user
					then
						break
					fi
				done

				while true
				do
					echo
					read -p "Please, insert the final number for iteration, e.g. 11 for student11, student12 etc.: " final_number
					if defensive_is_not_null_or_spacebar_value $user
					then
						break
					fi
				done
				while true
				do
					echo
					read -p "Please, insert the starting UID number: " starting_uid
					if defensive_UID $starting_uid
					then
						break
					fi
				done
				while true
				do
					echo
					read -p "How many users? : " n_users
					if defensive_is_not_null_or_spacebar_value $n_users
					then
						break
					fi
				done

				create_group $user $final_number $starting_uid $n_users
				;;
			"wq" )
				exit
				;;
			* )
                                echo "╔═════════════════════════════╗"
                                echo "║ Admittet only n.between 1-7 ║"
                                echo "╚═════════════════════════════╝"
                                press_any_k
                                ;;

		esac
	done
}

loading_bar
if defensive_code_prerequisites
then 
	echo "╔═══════════════════════╗"
	echo "║ Prerequisites passed  ║"
	echo "╚═══════════════════════╝"
	title
	sleep 1
	if [ $# != 0 ]
	then
		PARAM=`echo $1`
		case $PARAM in
			-h | --help)
				usage
				exit
				;;
			-s | --show)
				give_me_users
				exit
				;;
			-fu | --findUser)
				give_me_users_sorted_by_name $2
				exit
				;;
			-fuid | --findUID)
				give_me_users_sorted_by_id $2
				exit
				;;
			-duid | --deleteUID)
				del_user_by_id $2
				exit
				;;
			-du | --deleteUser)
				del_user_by_name $2
				exit
				;;
			-w | --who)
				w
				exit
				;;
			-c | --console)
				load_user_interface
				exit
				;;
			*)
				echo "ERROR: unknown parameter \"$PARAM"
				usage
				exit 1
				;;
		esac
	shift
	else
		clear
        	echo "╔═════════════════════════════╗"
        	echo "║ No arguments specified   :( ║"
        	echo "╚═════════════════════════════╝"
		usage
	fi
else
	clear
	echo "╔═════════════════════════════╗"
	echo "║ No config.ini file found :( ║"
	echo "╚═════════════════════════════╝"
fi

#  vr457098
# alvise bacco
# elaborato shell
