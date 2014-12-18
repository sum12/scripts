#!/bin/bash
source ~/.rvm/scripts/rvm
blogLocation="/home/pi/blog/whispering-forest-1331"
fileName=${blogLocation}/source/_posts/$(date +"%Y-%m-%d-daily-log.markdown")
lockFile=${blogLocation}/../blog.lock
gammuFile=${blogLocation}/../blog.txt
if [[ ! -e $lockFile && -e $gammuFile ]]
then
	touch $lockFile
	if [[ ! -e $fileName ]]
	then	
		echo "---" >> $fileName
		echo "layout: post" >> $fileName
		echo "title: Daily-log" >> $fileName
		echo "date: $(date +"%Y-%m-%d")" >> $fileName
		echo "comments: false" >> $fileName
		echo "path: $fileName" >> $fileName
		echo "categories: " >> $fileName
		echo "---" >> $fileName
	fi
	cat $gammuFile >> $fileName
	sudo rm -f $gammuFile
	cd $blogLocation
	rvm use 1.9.3
	rake generate 
	git add .
	git commit -m "daily log update"
	git push heroku master
	rm -f $lockFile
fi 
