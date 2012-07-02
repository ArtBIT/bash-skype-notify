bash-skype-notify
=================

Bash Skype Notify

Linux Skype lacks the proper notifications and message filtering. I have at least 20 group chats open at the same time, and it is pretty time consuming to check all those chats just to see if someone has mentioned my name, and sent me a message.

You can use "/alertson triggerword1 triggerword2" of course, but you need to set it up for every new chatroom.
Bash Skype Notify allows me to have a global chat secretary, that will log any message that matches the trigger regexp to a file, and show a desktop notification (if you have notify-send installed) about your missed message. 

The trouble is that Skype cannot send you the name of the chat, that message that triggered the notification has been sent to. So in order to find the context for the message you will still have to search through all the chats that have unread messages.

Usually the message itself is enough to guess the context and contact the sender for more info.

If you need more functionality, you should probably consider using the Skype API directly.