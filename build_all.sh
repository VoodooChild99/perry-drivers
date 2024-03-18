#!/bin/bash

if [ -z "$PERRY_DIR" ]; then
    echo "[*] You must specify PERRY_DIR to build drivers"
    exit 1
fi

if [ -z "$PERRY_CLANG_PATH" ]; then
    echo "[*] You must specify PERRY_CLANG_PATH to build drivers"
    exit 1
fi

if [ -z "$LLVM_CONFIG" ]; then
    echo "[*] LLVM_CONFIG is not set, default to llvm-config"
    LLVM_CONFIG=llvm-config
fi
$LLVM_CONFIG --version &> /dev/null || { echo "[x] Unable to execute $LLVM_CONFIG."; exit 1; }
LLVM_BIN_DIR=$($LLVM_CONFIG --bindir 2> /dev/null)

export PATH=$PATH:$PERRY_CLANG_PATH:$LLVM_BIN_DIR

# ST
cd STM || exit 1
target_array=(STM32F072 STM32F103 STM32F407 STM32F769 STM32L073)
for target in "${target_array[@]}"
do
    pwd
    cd "$target" || exit 1
    make clean && \
    rm -f api.yaml succ-ret.yaml loops.yaml periph-struct.yaml && \
    make -j"$(nproc)" && \
    cp loops.yaml periph-struct.yaml "$PERRY_DIR"/synthesizer/example/"$target"
    cd ..
done
cd ..

# NXP
cd NXP || exit 1
target_array=(FRDM-K22F FRDM-K64F FRDM-K82F FRDM-KL25Z LPCXpresso51U68)
for target in "${target_array[@]}"
do
    cd "$target"/perry-build || exit 1
    ./clean.sh && \
    rm -f api.yaml succ-ret.yaml loops.yaml periph-struct.yaml && \
    ./build.sh && \
    cp loops.yaml succ-ret.yaml periph-struct.yaml "$PERRY_DIR"/synthesizer/example/NXP-"$target"
    cd ../..
done
cd ..

# SAM
cd SAM/build || exit 1
target_array=(SAM3X8E SAM4E-Xplained-Pro SAM4L-EK SAM4S-Xplained SAME70-Xplained SAMV71-Xplained-Ultra)
for target in "${target_array[@]}"
do
    cd "$target" || exit 1
    make clean || :
    rm -rf klee-out-* && \
    rm -f api.yaml succ-ret.yaml loops.yaml periph-struct.yaml && \
    make -j"$(nproc)" && \
    cp loops.yaml succ-ret.yaml periph-struct.yaml "$PERRY_DIR"/synthesizer/example/"$target"
    cd ..
done
cd ../..