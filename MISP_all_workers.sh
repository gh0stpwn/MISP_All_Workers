#!/bin/bash
# this search for the work dead in the workers and give us a count.
val=$(/var/www/MISP/app/Console/cake Admin getWorkers | grep dead | wc -l)
echo "Number of dead workers: " > deadworkers.txt
/var/www/MISP/app/Console/cake Admin getWorkers | grep dead | wc -l >> deadworkers.txt
alive=$(/var/www/MISP/app/Console/cake Admin getWorkers | grep alive | wc -l)
echo "Number of alive workers: " >> deadworkers.txt
echo $alive >> deadworkers.txt
/var/www/MISP/app/Console/cake Admin getWorkers >> deadworkers.txt
cat deadworkers.txt | sendmail email@mail.com
