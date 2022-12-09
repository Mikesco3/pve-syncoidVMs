#!/usr/bin/bash

####
# this software is licensed for use under the Free Software Foundation's GPL v3.0 license, 
# as retrieved from http://www.gnu.org/licenses/gpl-3.0.html on 2014-11-17. 
# A copy should also be available in this project's Git repository at
# https://github.com/Mikesco3/pve-syncoidVMs/blob/main/LICENSE
####

#  Set the origin and destination
orig=tank200/_VMs
dest=rpool/_Backup

# this will sync every dataset in the origin to the destination.
zfs list $orig -r -o name \
  | cut -d/ -f3 | grep -v -e '^$' |grep -v -e 'NAME' \
  | xargs -I{}  /usr/sbin/syncoid  --force-delete $orig/"{}"  $dest/"{}"
