#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0  source_llvm.ll  destination_llvm.ll"
    exit
fi

$LLVM_DIR/bin/opt -load-pass-plugin ./pass/build/lib/libInstrumentFunctions.so --passes="cs8395-hw2" $1 -S -o $2
