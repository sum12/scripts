scripts
=======

A collections of various scripts. The Readme should be enuf.

## blog.sh

The script continuosly monitor the parent directory of the blog
checkout for a paritcular file nammed 'blog.txt' and if that file 
is found, its contents are upended to the daily log file. 

The scrit also updates the blog on heroku. Two avoid a race in
between two instances of script trying to update at the same time,
a file based lock has been devised. The lock is however not safe,
and can lead to disaster in case the script exists without removing
the lock it held.

## msgReceived.sh
This script is part of the `gammu` env. The script is run whenever
gammu receives as sms. The sms is parsed for its commands. And then 
an approproate action is taken in most cases an email is sent.

There are various commands in the email, like expense management,
todo management and blog management.

 
