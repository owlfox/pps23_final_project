#!/bin/bash

export LD_LIBRARY_PATH="$PWD/klayout/build-release"
echo $LD_LIBRARY_PATH
export TESTTMP="testtmp"
cd klayout/build-release
make
./ut_runner -ne dbA*990 |& tee taskflow.log
./ut_runner -ne dbA*991 |& tee control.log

echo ""
echo "No task level parallelism $(grep "total time" control.log)"
echo "Task flow version: $(grep "total time" taskflow.log)"
