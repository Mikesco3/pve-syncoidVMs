#!/usr/bin/bash

####
# this software is licensed for use under the Free Software Foundation's GPL v3.0 license, 
# as retrieved from http://www.gnu.org/licenses/gpl-3.0.html on 2014-11-17. 
# A copy should also be available in this project's Git repository at
# https://github.com/Mikesco3/pve-syncoidVMs/blob/main/LICENSE
####

# Variables
origin_Zfs_path=${1%/}
destin_Zfs_path=${2%/}
cmd=/usr/sbin/syncoid
cmd_arg1=--force-delete
ERROR0="No Arguments passed"
ERROR1="Please provide a Second Argument"

## To Manually override path and set and uncomment the following variables:
# origin_Zfs_path=tank200/_VMs
# destin_Zfs_path=rpool/_Backup


## first Test if user provided any arguments
  if [ "$#" -eq 0 ]
    then
      echo "
  ####################
  # Licensing:
  # This program is free software: you can redistribute it and/or modify
  # it under the terms of the Free Software Foundation's GPL v3.0 license, 
  # as retrieved from http://www.gnu.org/licenses/gpl-3.0.html on 2014-11-17.
  ####################

  This script is using syncoid for backing up zfs datasets
  for example, of virtual drives of Proxmox VE VM's
  to another ZFS dataset, whether on the same machine or a destination                      

  for questions or feedback check out: 
  https://github.com/Mikesco3/pve-syncoidVMs
  https://github.com/jimsalterjrs/sanoid/blob/master/syncoid 
      "   
      echo "  ERROR0:" $ERROR0 ;
  
      echo "
  usage, run followed by these arguments: 
  1st argument: /path/to/Origin_ZfsDataset,
  for ex: /tank200/_VMs
  
  2nd argument: /path/to/Destination_ZfsDataset,
  for ex: /rpool/_Backup
        " ;

      echo "  for Example: ";
      echo "       pve-syncoidVMs /tank200/VMs rpool/_Backup vm-101 
      " ;
 
      exit 1
    fi

### Tests if an second argument
  if [ "$#" -eq 1 ]
    then
      echo "

      Please provide a second Argument
      the destination ZFS pool or dataset
      ";     
      echo "  ERROR1" $ERROR1 ;
      echo " ";
    exit 1
  fi

  # this will sync every dataset in the origin to the destination.

  zfs list $origin_Zfs_path -r -o name \
    | cut -d/ -f3 | grep -v -e '^$' |grep -v -e 'NAME' \
    | xargs -I{}  $cmd $cmd_arg1 \
        $origin_Zfs_path/"{}"  \
        $destin_Zfs_path/"{}"
##  
#wget https://raw.githubusercontent.com/Mikesco3/pve-syncoidVMs/main/pve-syncoidVMs.sh
