#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 .c-file"
    exit
fi

clang -emit-llvm -S -fno-stack-protector -static -m32 -g $1


