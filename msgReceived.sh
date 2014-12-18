#!/bin/bash
TZ=Asia/Kolkata
text=""
blogLocation=
if [[ -n "$blogLocation" ]]:
then
    echo "Blog Location is not defined."
    exit 1
fi
phnNumber=

if [[ -n "$blogLocation" ]]:
then
    echo "Phn Number is not defined."
    exit 1
fi
fileName=${blogLocation}/../blog.txt
for i in $(seq $SMS_MESSAGES)
do
 name=SMS_${i}_NUMBER
 if [[ ${!name} -eq "$phnNumber" ]]
 then
   name=SMS_${i}_TEXT
   text=${text=""}${!name}
 fi
done
if [[ $text != "" ]]
then
	cmd=${text:0:4}
	if [[ $cmd == "/exp" ]]
	then
		 echo -e "subject:expense from THE BOT\n$text" | ssmtp sumitjami@gmail.com &
	fi
	case "$cmd" in

	/log)
		echo \`$(date +"%T")\`${text:6} >> $fileName
		echo  >> $fileName
	;;

	/sms | /tod)
		echo -e "subject:sms from THE BOT\n$text" | ssmtp sumitjami@gmail.com &
	;;

	/pin)
		echo -e "subject: sms from THE BOT\n/sms ,`curl -s ifconfig.co`" | ssmtp sumitjami@gmail.com &
	;;
    
    /reb)
        sudo reboot -n
    ;;

	esac
fi
