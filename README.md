# jkind_ci

JKind Continuous Integration. Provides two scripts, one to clone-build-test and a second to clone only. The repositories cloned are the JKind and jkindRegression. 

## jkr_all.sh
The jkr_all.sh bash script is intended to build the jkind jar and then run the Python jkind regression test suite. It's meant to provide a semi-automated build and test while waiting for the real CI tool. If running on Windows it does assume that you have Cygwin installed to run the scripts.

This script will either clone or do a pull request on the jkind and jkindRegression repo's from Git-Hub, then attempt to run the Python regression test suite. That's all it does, no e-mail, has to be run manually, and you have to look at the results in the log file yourself.

If running on Windows or OSX, a simple tk GUI will launch after the build. You must click the Execute button to start the tests. 

If running linux, then the test starts immediately without the GUI. Note that you DO NOT want the GUI on linux as this will interfere with the Jenkins build.

Currently pulls from:

https://github.com/agacek/jkind.git

https://github.com/pr-martin/jkindRegression.git

This has been run on Windows 7, RHEL 6, and Mac OSX El Capitan. Note that I think the $OSTYPE changed with El Capitan so I don't know if it will launch cleanly on older versions of OSX. (Check the if-then-else at the end of the script if something goofy happens).

Special Note for OSX: My default Python installation is still whatever comes with the OS (some 2.x). I have a separate Python 3 installation and use a "python3" alias. This script tries to run Python with that python3 alias.

## jkr_clone.sh
This script simply clones the JKind and JKindRegression repositories. Use this if you want to manually run files. The JKindRegression documentation describes how to manually run tests from the command line or from the tk GUI.

### Requirements:
 - Python 3.4.2 or greater and on your system path
 - ant (I'm using 1.9.6) and on your system path
 - Java JDK
