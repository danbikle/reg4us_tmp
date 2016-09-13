#!/bin/bash

# ~/reg4us/script/whatif.bash

# This script helps me understand some whatif-scenarios.

# This script should generate some static content each night
# after the market has closed and the most recent GSPC-closing-price
# is available from Yahoo.

# If you have questions, e-me: bikle101@gmail.com

# I should cd to the right place:
cd ~/reg4us/script/

# I should create a folder to hold CSV data:
mkdir -p ~/reg4us/public/csv/

# debug
# I should get prices from Yahoo:
# /usr/bin/curl http://ichart.finance.yahoo.com/table.csv?s=%5EGSPC > ~/reg4us/public/csv/gspc.csv
# 
# # I should extract two columns and also sort:
# echo cdate,cp                                                              > ~/reg4us/public/csv/gspc2.csv
# sort ~/reg4us/public/csv/gspc.csv|awk -F, '{print $1"," $5}'|grep -v Date >> ~/reg4us/public/csv/gspc2.csv
# debug

for pctchange in -0.4 -0.2 0.0 0.2 0.4
do
    echo $pctchange
    cp ~/reg4us/public/csv/gspc2.csv         ~/reg4us/public/csv/gspc2.csv.bak
    cp ~/reg4us/public/csv/gspc2.csv         ~/reg4us/public/csv/whatif.csv
    tail -1 ~/reg4us/public/csv/gspc2.csv >> ~/reg4us/public/csv/whatif.csv
    echo ~/anaconda3/bin/python whatif.py $pctchange
done
					   


exit

# I should compute features from the prices:
~/anaconda3/bin/python genf.py SLOPES='[2,3,4,5,6,7,8,9]'

# I should learn, test, and report:
~/anaconda3/bin/python learn_tst_rpt.py TRAINSIZE=25 TESTYEAR=2016

exit