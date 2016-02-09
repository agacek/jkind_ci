# jkind_ci

A place to dump tools or scripts to test jkind against the jkindRegression.

## jkr_all.sh
The jkr_all.sh bash script is intended to build the jkind jar and then run the Python jkind regression test suite. It's meant to provide a semi-automated build and test while waiting for the real CI tool. If running on Windows it does assume that you have Cygwin installed to run the scripts.

This script will either clone or do a pull request on the jkind and jkindRegression repo's from Git-Hub, then attempt to run the Python regression test suite. That's all it does, no e-mail, has to be run manually, and you have to look at the results in the log file yourself.

Note that this will launch the simple tk GUI after the build. You will have to click the Execute button yourself to actually start the tests. 

Currently pulls from:

https://github.com/agacek/jkind.git

https://github.com/pr-martin/jkindRegression.git

## jkr_clone.sh
This script simply clones the JKind and JKindRegression repositories. Use this if you want to manually run files. The JKindRegression documentation describes how to manually run tests from the command line or from the tk GUI.

### Requirements:
 - Python 3.4.2 or greater and on your system path
 - ant (I'm using 1.9.6) and on your system path
 - Java JDK
