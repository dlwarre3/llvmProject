#!/bin/sh

while getopts "dh?" opt ; do
  case "$opt" in
    h|\?)
      printf "usage: %s -e KEY=VALUE prog [args...]\n" $(basename $0)
      exit 0
      ;;
    d)
      gdb=1
      ;;
  esac
done

shift $(expr $OPTIND - 1)

if [ $# -lt 2 ]; then 
    echo "Usage $0 [-d] program inputfile"
    exit
fi

if [ $2 != "input" ]; then
    cp $2 input
fi

prog=$(readlink -f $1)


shift
if [ -n "$gdb" ] ; then
    exec env - $env TERM=screen PWD=$PWD gdb --args $prog 
else
    exec env - $env TERM=screen PWD=$PWD $prog 
fi
