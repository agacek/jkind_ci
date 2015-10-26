#!/bin/bash
# Clones or Pulls repos as appropriate. Executes jkind Regression suite.
clear
echo Simple Build and Test Script

if [ $OSTYPE == "linux-gnu" ]; then
   alias python3='/usr/lfs/ssd_v0/opt/Python-3.5.0/python'
   alias ant='bash /usr/lfs/ssd_v0/opt/apache-ant-1.9.6/bin/ant'
   alias java='/usr/lfs/ssd_v0/gacek/jdk1.8.0_60/bin/java'
fi
   
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
   git clone https://github.com/pr-martin/jkind.git jkind --branch small_test
fi

cd ./jkind
ant clean
ant all
cd ..

echo "Executing jkind Regression Test...Please be patient"
cd ./jkindRegression
if [ $OSTYPE == "linux-gnu" ]; then
   python3 jkindtest.py -dir ../jkind/testing -jar ../jkind/build/jkind.jar -logfile ../jkr.log --gui --recur
else
   python jkindtest.py -dir ../jkind/testing -jar ../jkind/build/jkind.jar -logfile ../jkr.log --gui --recur
fi

if [ $? == 0 ]; then
   echo "Test Successful"
else
   echo "Test Failed, see jkr.log"
fi
