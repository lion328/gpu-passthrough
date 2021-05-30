#!/bin/bash

EDK2_HOME="$PWD/edk2"
SRC_PATH="$EDK2_HOME/OvmfPkg/AcpiPlatformDxe"
SSDT_PATH="$PWD/ssdt.asl"

cd "$SRC_PATH"

iasl -f -p Ssdt "ssdt.asl"
xxd -c1 Ssdt.aml | tail -n +37 | cut -f2 -d' ' | paste -sd' ' | sed 's/ //g' | xxd -r -p > vrom_table.aml
xxd -i vrom_table.aml | sed 's/vrom_table_aml/vrom_table/g' > vrom_table.h

