# jkind_ci

A place to dump tools or scripts to test jkind against the jkindRegression.

## jkr.sh
The jkr.sh bash script is intended to build the jkind jar and then run the Python jkind regression test suite. It's meant to provide a semi-automated build and test while waiting for the real CI tool.

This script will either clone or do a pull request on the jkind and jkindRegression repo's from Git-Hub, then attempt to run the Python regression test suite. That's all it does, no e-mail, has to be run manually, and you have to look at the results in the log file yourself.

Currently pulls from:

https://github.com/agacek/jkind.git

https://github.com/pr-martin/jkindRegression.git

### Requirements:
 - Python 3.4.2 or greater and on your system path
 - ant (I'm using 1.9.6) and on your system path
 - Java JDK
