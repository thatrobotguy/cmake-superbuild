#!/bin/bash

#protoc --cpp_out=./ SimpleController.proto
cmake -H. -Bbuild
#cmake -H. -B.
availablethreads=`nproc`
cmake --build build -- -j$availablethreads -l$availablethreads
# This is how I build this project.
# ./clean.sh && ./build.sh
# https://www.cyberciti.biz/faq/linux-get-number-of-cpus-core-command/