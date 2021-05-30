#!/bin/bash

EDK2_HOME="$PWD/edk2"
SRC_PATH="$EDK2_HOME/OvmfPkg/AcpiPlatformDxe"

xxd -i "$1" "$SRC_PATH/vrom.h"
sed -i 's/\(char \).*\[\]/\1VROM_BIN\[\]/g; s/\(int \)[^= ]*/\1VROM_BIN_LEN/g' "$SRC_PATH/vrom.h"

