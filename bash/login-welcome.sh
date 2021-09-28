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

if [ "$day" = "Sunday" ]
then
Output1=$"Happy Sunday! You are awesome! enjoy work tomorrow!"
fi

if [ "$day" = "Monday" ]
then
Output1=$"Hope you had a good day at work since its Monday!"
fi

if [ "$day" = "Tuesday" ]
then
Output1=$"Keep on Truckin! Its Tuesday!!"
fi

if [ "$day" = "Wednesday" ]
then
Output1=$"Happy Humpday! Half way to the weekend!"
fi

if [ "$day" = "Thursday" ]
then
Output1=$"One more day till friday! Have a good day"
fi

if [ "$day" = "Friday" ]
then
Output1=$"AYE! Its friday my guy! Enjoy"
fi

if [ "$day" = "Saturday" ]
then
Output1=$"Friday message"
fi

Output2=$(echo "The current time is $datenow")

Output3=$(echo "Welcome to planet $hostname, $title $USER!")

cowsay $Output1 $Output2 $Output3
