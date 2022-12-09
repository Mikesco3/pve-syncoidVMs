# pve-syncoidVMs
Sync over zfs virtual disks of a proxmox vm to a backup dataset. <br>

## How to use
1. Download the script 
```bash
wget https://raw.githubusercontent.com/Mikesco3/pve-syncoidVMs/main/pve-syncoidVMs.sh
```
3. Make executable and link to the system path.
```bash
chmod a+x pve-syncoidVMs.sh  && \
ln -s pve-syncoidVMs.sh /usr/sbin/pve-syncoidVMs.sh
```
4. run the command with arguments, <br>
  for ex:
  ```bash
  pve-syncoidVMs.sh tank200/_VMs rpool/_Backup
  ```
  or hardcode the origin and destination  <br>
  by uncommenting and editing the corresponding variables <br>
  around line 19 of the [pve-syncoidVMs.sh](https://github.com/Mikesco3/pve-syncoidVMs/blob/main/pve-syncoidVMs.sh) script
  ```apache
  # origin_Zfs_path=tank200/_VMs
  # destin_Zfs_path=rpool/_Backup
  ```
### Schedule to happen automatically
1. Open add to crontab:  ` crontab -e` and then add the following line <br>
for example to run at 5 minute past every 2nd hour, <br>
sync every virtual disk from **`tank200/VMs`** to **`rpool/_Backup`**:
```apache-conf
5 */2 * * * /usr/sbin/pve-syncoidVMs.sh tank200/_VMs rpool/_Backup
```

## Roadmap
I might need to add a few things <br>
- [ ] make anything after the 2nd argument become a keyboard to exclude certain datasets, <br>
  for example all datasets except for vm id 102 and 203.
  ```bash
  pve-syncoidVMs.sh tank200/_VMs rpool/_Backup vm-102 vm-203
  ```
## v0.1  
- [x] set origin and detination via arguments


