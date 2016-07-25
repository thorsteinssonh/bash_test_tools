#! /usr/bin/python

# These is a custom assert test written in python.
# Posix shells are not ideal for performing granual detailed asserts 
# on output from executables. Therefore we have added this simple
# option to develop a detailed assert in the language of your choice.
# All that is necessary is that the test retun 0 for success or 
# !=0 for fail as exit code.

import sys

argument = sys.argv[1]

if argument == "foobar":
    sys.exit(0)
else:
    sys.exit(1)

