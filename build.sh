#!/usr/bin/env bash
# Handle to many files on osx
if [ "$TRAVIS_OS_NAME" == "osx" ] || [ `uname` == "Darwin" ]; then
  ulimit -n 4096
fi

if [ "$TRAVIS_OS_NAME" == "osx" ] || [ `uname` == "Darwin" ]; then
  export SQLTOOLSSERVICE_PACKAGE_OSNAME=osx-x64
else
  export SQLTOOLSSERVICE_PACKAGE_OSNAME=linux-x64
fi
bash ./scripts/cake-bootstrap.sh "$@"
