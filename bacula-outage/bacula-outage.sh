#!/bin/bash 
# 
# Release: 2018-07-18
# - Separate jobs for level and execute them according to priority with an interval between them
#
# Relase: 2018-07-31
# - Identify the Catalog job and set up to run in the correct pool, level and priority
#
# Release: 2018-08-02
# - cancel must not save in the $BOF file if there isn't any job running
# - ask if the operator wants to finish all the current jobs
# - get the jobs from bacula ( @output )
# - ask if the operator wants to save the currently backups in a file to run them later
#
# If for some reason you need to cancel and rerun all the current jobs in Bacula
# the <<< Bacula Run Jobs >>> script will do the work for you
# 
# TODO:
# - ask to the operator if he wants to recover queue saved backups or run just re-run the current queue 
# - CANCEL: change to query running jobs instead of run status dir (too slow !!)
#
##
### Script by Molinux <molinuxbr@gmail.com>
##
#
# For debug purposes, uncomment the command below 
# set -x
#

#
# GLOBAL VARIABLES
#

BOF=$HOME/bacula-outage-jobs-to-run.txt   #File where jobs will be save
CATJOB=MyCatalog   # Catalog Backup Job

#
# FUNCTIONS
#

check_queue() {
# 	For tests purpose
#	RC=1
#	if [ $RC -eq 1 ]; then	
	echo "status dir" | bconsole | grep "No Jobs running" 
	if [ $? == 1 ]; then
		echo "Saving jobs ..."
		save_jobs
	else
	# 	For test purpose
	#	echo "No Jobs running"
		exit 0

	fi
}

cancel_jobs() {
	echo "WARNING !!! This option will cancel all the current job"
	echo "Are you shure ? (yes|no)"
	read yesno
	case "$yesno" in
		yes)
			check_queue
			echo "cancel all jobs yes" | bconsole
			;;
		no)
			echo "You not canceled the current jobs"
			;;
		*)
			echo "Usage: (yes or no):"
			cancel_jobs
			;;
			
	esac
}

menu_help() {
	echo -e "Command\t Description"
	echo -e "=======\t ==========="
	echo -e "Save\t Save the current jobs in a file"
	echo -e "Cancel\t Cancel the current jobs without save them"
	echo -e "Recover\t Re-run previous jobs saved in a file"
	echo -e "Help\t Print the help menu"
	echo -e "Quit\t Terminate the $0"
	echo
}

save_jobs() {
	echo "status dir" | bconsole > $BOF
	echo "Jobs saved in $BOF file"
}

run_jobs() {

# For test purposes, uncomment one of these lines below
#readarray -t runt <<< "$(echo "status dir" | bconsole)"
#readarray -t runt <<< "$(cat jobs-to-run.txt)"
#readarray -t runt <<< "$(cat jobs-to-run-Catalog.txt)"

readarray -t runt <<< "$(cat $BOF)"

for (( i = 0; i < ${#runt[@]}; i++ ))
do
	r=`printf "%s\n" "${runt[$i]}" | awk '{ print $7 }'`
	if [[ $r == "is" || $r == "has" ]]
	then
		job=$(printf "%s\n" "${runt[$i]}" | awk '{ print $6 }')
		level=$(printf "%s\n" "${runt[$i]}" | awk '{ print $3 }')
        	pool="`echo $level | tr [:lower:] [:upper:]`"
		if [[ $job != $CATJOB ]] ; then
				case $level in
					Base)
						level=Base
						priority=7
						when=`date +"%Y-%m-%d %H:%M:%S" -d "now + 10 seconds"`
						;;
					Full)
						level=Full
						priority=8
						when=`date +"%Y-%m-%d %H:%M:%S" -d "now + 20 seconds"`
						;;
					Diff)
						level=Differential
						priority=9
						when=`date +"%Y-%m-%d %H:%M:%S" -d "now + 30 seconds"`
						;;
					Incr)
						level=Incremental
						priority=10
						when=`date +"%Y-%m-%d %H:%M:%S" -d "now + 40 seconds"`
						;;
					*)
						echo "Level <<< $level >>> or priority <<< $priority >>> not recognized" 
						echo "Please use a valid backup level"
						exit 0
				esac
			# Just for test and avoid to make some shit
			echo "run job=$job level=$level pool=$pool priority=$priority when=\"$when\" yes" 
			# Are you ready to play this game ? So... uncomment the line below and... Let's do it !!!	
			#echo "run job=$job level=$level pool=$pool priority=$priority when=\"$when\" yes" | bconsole
		else
			when=`date +"%Y-%m-%d %H:%M:%S" -d "now + 30 seconds"`
			# Just for test and avoid to make some shit
			echo "run job=$job level=$level pool=CATC priority=11 when=\"$when\" yes" 
			#echo "run job=$job level=$level pool=CATC priority=11 when=\"$when\" yes" | bconsole
		fi
	fi
done
}


PS3='Please enter your choice: '
options=("Save"\
	"Cancel"\
	"Recover"\
	"Help"\
	"Quit"\
	)
echo
echo "Bacula Outage Tool"
echo
select opt in "${options[@]}"
do
	opt[1]="save"
	opt[2]="cancel"
	opt[3]="recover"
	opt[4]="help"
	opt[5]="quit"
	case $opt in
		"Save")
			check_queue
			break
			;;
		"Cancel")
			cancel_jobs
			;;
		"Recover")
			echo "Recovering jobs..."
			run_jobs
			break
			;;
		"Help")
			echo "Help"
			echo
			menu_help
			;;
		"Quit")
			break
			;;
		*) 
			echo "Invalid option $REPLY"
			for index in 1 2 3 4 5 
			do
				printf "%4d: %s\n" $index ${opt[$index]}
			done
			;;
	esac
done
