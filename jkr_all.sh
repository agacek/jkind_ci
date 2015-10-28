#!/bin/bash
# Please run this as $ source jkr_all.sh
# Clones or Pulls repos as appropriate. Executes jkind Regression suite.
clear
echo Simple Build and Test Script

if [ $OSTYPE == "linux-gnu" ]; then
   export JAVA_HOME=/usr/lfs/ssd_v0/opt/jdk1.8.0_60
   export YICES_HOME=/usr/lfs/ssd_v0/opt/yices-1.0.40
   export YICES2_HOME=/usr/lfs/ssd_v0/opt/yices-2.4.1
   export CVC4_HOME=/usr/lfs/ssd_v0/opt/cvc4
   export Z3_HOME=/usr/lfs/ssd_v0/opt/z3/build
   export PATH=${JAVA_HOME}/bin:${YICES_HOME}/bin:${YICES2_HOME}/bin:${CVC4_HOME}:${Z3_HOME}:${PATH}
   alias ant='/usr/lfs/ssd_v0/opt/apache-ant-1.9.6/bin/ant'
   python3=/usr/lfs/ssd_v0/opt/Python-3.5.0/python
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
   git clone https://github.com/agacek/jkind.git jkind --branch master
fi

cd ./jkind
ant clean
ant all
cd ..

echo "Executing jkind Regression Test...Please be patient"
cd ./jkindRegression
if [ $OSTYPE == "linux-gnu" ]; then   
   $python3 jkindtest.py -dir ../jkind/testing -jkind ../jkind/build/jkind.jar -logfile ../jkr.log -java ${JAVA_HOME}/bin/java --recur --quiet
else
   python jkindtest.py -dir ../jkind/testing -jar ../jkind/build/jkind.jar -logfile ../jkr.log --gui --recur
fi

if [ $? == 0 ]; then
   echo "Test Successful"
else
   echo "Test Failed, see jkr.log"
fi
