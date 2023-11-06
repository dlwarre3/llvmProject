#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Need .c file."
    exit
fi

clang -fno-stack-protector -static -m32 -g   $1
