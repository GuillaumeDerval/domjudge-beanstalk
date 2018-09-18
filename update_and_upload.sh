#! /bin/bash

cd domjudge
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH" DOC_BUILD_ENABLED="no" make distclean
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/coreutils/libexec/gnubin:$PATH" DOC_BUILD_ENABLED="no" make dist
cd ..
eb deploy
