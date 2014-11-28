#!/bin/bash

# 


echo Verifying that Packer has been installed to the application cache...
if [ ! -d ${SNAP_CACHE_DIR}/packer ]; then
    echo Packer was missing from the cache. Installing...
    wget --no-verbose https://dl.bintray.com/mitchellh/packer/0.7.2_linux_amd64.zip -O ${SNAP_CACHE_DIR}/packer.zip
    unzip ${SNAP_CACHE_DIR}/packer.zip -d ${SNAP_CACHE_DIR}/packer
    echo Packer installation complete
fi




${SNAP_CACHE_DIR}/packer/packer-packer build deployment/digital_ocean_packer_config.json

