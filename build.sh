#!/bin/bash

cd edk2
. edksetup.sh BaseTools

build \
    -D SECURE_BOOT_ENABLE \
    -D SMM_REQUIRE \
    -D TPM_ENABLE \
    -D TPM_CONFIG_ENABLE \
    -D NETWORK_TLS_ENABLE \
    -D NETWORK_IP6_ENABLE \
    -D NETWORK_HTTP_BOOT_ENABLE
