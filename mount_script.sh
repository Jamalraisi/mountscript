#!/bin/bash

# Define variables
mount_point="/mnt/myfileshare"
storage_account_name="mystorageaccount"
file_share_name="myfileshare"

# Retrieve storage account key
storage_account_key=$(az storage account keys list --resource-group $resource_group --account-name $storage_account_name --query '[0].value' --output tsv)

# Create mount point directory
sudo mkdir -p $mount_point

# Mount the file share (make sure cifs-utils is installed)
sudo mount -t cifs //${storage_account_name}.file.core.windows.net/${file_share_name} $mount_point \
  -o vers=3.0,username=${storage_account_name},password=${storage_account_key},dir_mode=0777,file_mode=0777
