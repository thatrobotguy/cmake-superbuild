#!/bin/bash

# ./clean.sh && ./build.sh
# https://www.cyberciti.biz/faq/linux-get-number-of-cpus-core-command/

# superbuild or naw?
# Variable sanity check with :? 
# https://bash.cyberciti.biz/guide/Bash_variable_existence_check
super="OFF"
maybesuper=$1

cmake -H. -Bbuild
availablethreads=`nproc`

#if [ -z "$1" ]
if [ -z maybesuper ]
then
    echo "No argument specified. Setting super to OFF."
    # cmake --build build -- -j8 -l8 -- -DUSE_SUPERBUILD=ON
    cmake --build build -- -j$availablethreads -l$availablethreads -- -DUSE_SUPERBUILD=0
else
    # Since the argument is NOT empty, we now check to make sure which we want
    # OFF version
    # the double carrot thing means force to full upper case
    if [ ${maybesuper^^} = "OFF" ]
    then
        echo "Setting super to OFF."
        cmake --build build -- -j$availablethreads -l$availablethreads -- -DUSE_SUPERBUILD=0
    fi
    # On version
    if [ ${maybesuper^^} = "ON" ]
    then
        echo "Setting super to ON."
        cmake --build build -- -j$availablethreads -l$availablethreads -- -DUSE_SUPERBUILD=1
    fi
fi
