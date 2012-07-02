#!/bin/bash

# ABOUT THIS SCRIPT

# -- What is this script used for?
#       I use it to log skype message that match certain

# -- How do I use it?
#   - Copy this script somewhere, i.e.: /path/to/this/script/skype-notify.sh
#   - Make it executable, i.e.: chmod +x /path/to/this/script/skype-notify.sh
#   - Start Skype
#   - Go to your skype options, 
#   - Choose "Notifications" from the sidebar
#   - Click the "Advanced View" button
#   - Check the "Execute the following script on any event" checkbox
#   - Paste the following line into the input box: /path/to/this/script/skype-notify.sh -e "%type" -u "%sskype" -n "%sname" -m "%smessage"

# -- Script params explained:
#   -e      The type of the Skype event
#   -u      The Skype username of the message sender
#   -n      The Skype display name of the mesage sender
#   -m      The message body
#
#   The following options are used for file sending, and you can add them if you want
#   -f      The filename of the file being sent
#   -p      The path of the file being sent
#   -s      The filesize of the file being sent


# OPTIONS

# -- Here you configure, which words trigger the notifier
MY_SKYPE_REGEXP_TRIGGER='(these|are|your|trigger|words)'
# -- and in which files the missed messages are stored
MY_SKYPE_LOG_FILE=$HOME/skype_missed_messages

# -- Set the default param values
SKYPE_EVENTTYPE='unknown'
SKYPE_DISPLAYNAME='unknown'
SKYPE_USERNAME='unknown'
SKYPE_MESSAGE='unknown'

# -- Parse the script params
while getopts ":e:u:n:m:f:p:s:" opt; do
  case $opt in
    e)
      SKYPE_EVENTTYPE=$OPTARG
      ;;
    n)
      SKYPE_DISPLAYNAME=$OPTARG
      ;;
    u)
      SKYPE_USERNAME=$OPTARG
      ;;
    m)
      SKYPE_MESSAGE=$OPTARG
      ;;
    #ignore for now
    f) ;;
    p) ;;
    s) ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# -- Convert SKYPE_MESSAGE to lowercase (bash 4)
LOWERCASE_MESSAGE=${SKYPE_MESSAGE,,}

# -- See if the message contains any of the trigger keywords
if [[ $LOWERCASE_MESSAGE =~ $MY_SKYPE_REGEXP_TRIGGER ]]; then
  # Log it
  TS=`date`
  echo "$TS|$SKYPE_DISPLAYNAME ($SKYPE_USERNAME): $SKYPE_MESSAGE" >> "$MY_SKYPE_LOG_FILE"

  # Show the notification
  if which notify-send > /dev/null ; then
    notify-send "Skype" "$SKYPE_DISPLAYNAME: $SKYPE_MESSAGE"
  fi
fi

