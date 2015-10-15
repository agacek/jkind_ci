#!/bin/bash
# Clones or Pulls from repos as appropriate.
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
   git clone https://github.com/pr-martin/jkind.git jkind --branch small_test
