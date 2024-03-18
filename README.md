# Perry Drivers
This repository contains drivers used by Perry to synthesize hardware models.

## Tested Environment
* Ubuntu 20.04
* LLVM-13

## Build
* requirements
    * [Perry](https://github.com/VoodooChild99/perry)
    * [Perry Clang plugin](https://github.com/VoodooChild99/perry-clang-plugin)
    * LLVM/Clang

* command:
```shell
PERRY_DIR=/path/to/perry PERRY_CLANG_PATH=/path/to/perry-clang-plugin/build/compiler LLVM_CONFIG=llvm-config-<version> ./build_all.sh
```