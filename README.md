bash-skype-notify
=================

Bash Skype Notify

## What is this? ##

Linux Skype lacks the proper notifications and message filtering. I have at least 20 group chats open at the same time, and it is pretty time consuming to check all those chats just to see if someone has mentioned my name, and sent me a message.

You can use "/alertson triggerword1 triggerword2" of course, but you need to set it up for every new chatroom.
Bash Skype Notify allows me to have a global chat secretary, that will log any message that matches the trigger regexp to a file, and show a desktop notification (if you have notify-send installed) about your missed message. 

The trouble is that Skype cannot send you the name of the chat, that message that triggered the notification has been sent to. So in order to find the context for the message you will still have to search through all the chats that have unread messages.

Usually the message itself is enough to guess the context and contact the sender for more info.

If you need more functionality, you should probably consider using the Skype API directly.

## How do I use it? ##

  * Copy this script somewhere, i.e.: `/path/to/this/script/skype-notify.sh`
  * Make it an executable file, i.e.: `chmod +x /path/to/this/script/skype-notify.sh`
  * Start Skype
  * Go to your skype options, 
  * Choose "Notifications" from the sidebar
  * Click the "Advanced View" button
  * Check the "Execute the following script on any event" checkbox
  * Paste the following line into the input box: `/path/to/this/script/skype-notify.sh -e "%type" -u "%sskype" -n "%sname" -m "%smessage"`

## Script params explained: ##
  *  -e      The type of the Skype event
  *  -u      The Skype username of the message sender
  *  -n      The Skype display name of the mesage sender
  *  -m      The message body

  The following options are used for file sending, and you can add them if you want
  *  -f      The filename of the file being sent
  *  -p      The path of the file being sent
  *  -s      The filesize of the file being sent