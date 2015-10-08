#!/bin/bash
clear
echo Simple Build and Test Script

curdir=$PWD
printf '%s\n' $curdir

if [ -d "jkindRegression" ]; then
   cd jkindRegression
   git pull
   cd ..
else
   git clone https://github.com/pr-martin/jkindRegression.git jkindRegression
fi

if [ -d "jkind" ]; then
   cd jkind
   git pull
   cd ..
else
   git clone https://github.com/pr-martin/jkind.git jkind
fi

cd ./jkind
ant clean
ant all
cd ..

echo "Executing jkind Regression Test...Please be patient"
cd ./jkindRegression
python3 jkindtest.py -dir ../jkind/testing -jar ../jkind/build/jkind.jar -logfile ../jkr.log --gui --recur

if [ $? == 0 ]; then
   echo "Test Successful"
else
   echo "Test Failed, see jkr.log"
fi
