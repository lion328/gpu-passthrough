#!/bin/bash

cd edk2
. edksetup.sh BaseTools
build -DSECURE_BOOT_ENABLE=TRUE
