#!/bin/bash
if [[ $(tail -n50 /var/log/syslog |  grep  "gammu-smsd\[[0-9]*\]: Error at init connection: Error opening device, it doesn't exist. (DEVICENOTEXIST\[4\])" | wc -l) -gt 10 ]]
then  
     echo "bind and unbind now"
     echo -e "subject:sms from THE BOT\nBinding and unbind now" | ssmtp sumitjami@gmail.com
     echo "1-1.4" >> /sys/bus/usb/drivers/usb/unbind
     sleep 2
     echo "1-1.4" >> /sys/bus/usb/drivers/usb/bind
fi
