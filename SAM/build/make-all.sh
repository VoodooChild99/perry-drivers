export PATH="$PATH:/home/ray/perry-clang-plugin/build/compiler"

# target_array=(SAM4E-Xplained-Pro SAM4L-EK SAM4S-Xplained SAME70-Xplained SAMV71-Xplained-Ultra SAMD20-Xplained-Pro)
target_array=(SAM3X8E SAM4E-Xplained-Pro SAM4L-EK SAM4S-Xplained SAME70-Xplained SAMV71-Xplained-Ultra)
# target_array=(SAM3X8E)

for target in ${target_array[@]}
do
    if [ "$1" = "clean" ]; then
        cd $target && make clean && rm -rf klee-out-* && rm -f api.yaml succ-ret.yaml loops.yaml periph-struct.yaml && cd ..
    elif [ "$1" = "clean-klee" ]; then
        cd $target && rm -rf klee-out-* && cd ..
    elif [ "$1" = "build" ]; then
        cd $target && bear make -j && cp loops.yaml succ-ret.yaml periph-struct.yaml /home/ray/perry/synthesizer/example/$target && cd ..
    elif [ "$1" = "only-build" ]; then
        cd $target && bear make -j && cd ..
    elif [ "$1" = "only-clean" ]; then
        cd $target && make clean && cd ..
    else
        cd $target && make clean && rm -rf klee-out-* && rm -f api.yaml succ-ret.yaml loops.yaml periph-struct.yaml && bear make -j && cp loops.yaml succ-ret.yaml periph-struct.yaml /home/ray/perry/synthesizer/example/$target && cd ..
    fi
done
