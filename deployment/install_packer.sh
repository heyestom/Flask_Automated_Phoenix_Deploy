#!/bin/bash

# 


echo Verifying that Packer has been installed to the application cache...
if [ ! -d ${SNAP_CACHE_DIR}/packer ]; then
    echo Packer was missing from the cache. Installing...
    wget --no-verbose https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_386.zip -O ${SNAP_CACHE_DIR}/packer.zip

    echo download complete

    unzip ${SNAP_CACHE_DIR}/packer.zip -d ${SNAP_CACHE_DIR}/packer
    echo Packer installation complete
fi



${SNAP_CACHE_DIR}/packer/packer build deployment/digital_ocean_packer_config.json
