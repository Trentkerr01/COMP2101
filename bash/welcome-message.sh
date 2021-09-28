#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
title="Overlord"
hostname=$(hostname)
datenow=$(date +%H%M%p)
day=$(date +%A)
###############
# Main        #
###############

if [ "$day" == "Sunday" ]
then echo "Happy Sunday! You are awesome! enjoy work tomorrow!"
fi

if [ "$day" == "Monday" ]
then echo "Hope you had a good day at work since its Monday!"
fi

if [ "$day" == "Tuesday" ]
then echo "Keep on Truckin! Its Tuesday!!"
fi

if [ "$day" == "Wednesday" ]
then echo "Happy Humpday! Half way to the weekend!"
fi

if [ "$day" == "Thursday" ]
then echo "One more day till friday! Have a good day"
fi

if [ "$day" == "Friday" ]
then echo "AYE! Its friday my guy! Enjoy"
fi

if [ "$day" == "Saturday" ]
then echo "Friday message"
fi

cat <<EOF
The current time is $datenow

Welcome to planet $hostname, "$title $USER!"

EOF
