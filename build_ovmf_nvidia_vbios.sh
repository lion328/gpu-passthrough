#!/bin/bash

EDK2_HOME="$PWD/edk2"
SRC_PATH="$EDK2_HOME/OvmfPkg/AcpiPlatformDxe"
ROM_PATH="$PWD/$1"
SSDT_PATH="$PWD/ssdt.asl"

cd "$SRC_PATH"

xxd -i "$ROM_PATH" vrom.h
sed -i 's/\(char \).*\[\]/\1VROM_BIN\[\]/g; s/\(int \)[^= ]*/\1VROM_BIN_LEN/g' vrom.h

iasl -f -p Ssdt "$SSDT_PATH"
xxd -c1 Ssdt.aml | tail -n +37 | cut -f2 -d' ' | paste -sd' ' | sed 's/ //g' | xxd -r -p > vrom_table.aml
xxd -i vrom_table.aml | sed 's/vrom_table_aml/vrom_table/g' > vrom_table.h

cd "$EDK2_HOME"
. edksetup.sh BaseTools
build

