# pve-syncoidVMs
Sync over zfs virtual disks of a proxmox vm to a backup dataset. <br>

## How to use
1. Download the script 
2. Make executable.
3. Change the variables for the origin and destination (lines 11 and 12)
4. Run or schedule on crontab -e

## Roadmap
I might need to add a few things
- set origin and detination via arguments
- set an exclude string to exclude certain datasets, based on a keyword <br>
  for example all datasets except for vm id 102.



