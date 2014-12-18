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
