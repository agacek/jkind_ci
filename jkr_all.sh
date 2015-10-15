#!/bin/bash
# Clones or Pulls repos as appropriate. Executes jkind Regression suite.
clear
echo Simple Build and Test Script

curdir=$PWD
printf '%s\n' $curdir

if [ -d "jkindRegression" ]; then
   cd jkindRegression
   git pull
   cd ..
else
   git clone https://github.com/pr-martin/jkindRegression.git jkindRegression --branch master
fi

if [ -d "jkind" ]; then
   cd jkind
   git pull
   cd ..
else
   git clone https://github.com/agacek/jkind.git jkind --branch master
fi

cd ./jkind
ant clean
ant all
cd ..

echo "Executing jkind Regression Test...Please be patient"
cd ./jkindRegression
python jkindtest.py -dir ../jkind/testing -jar ../jkind/build/jkind.jar -logfile ../jkr.log --gui --recur

if [ $? == 0 ]; then
   echo "Test Successful"
else
   echo "Test Failed, see jkr.log"
fi
