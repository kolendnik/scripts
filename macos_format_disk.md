# MacOS format disk using cli

## list avaible disks
```bash
diskutil list
```
## list avaible file system formats
```bash
diskutil listFilesystems
```
## erase disk
```bash
sudo diskutil eraseDisk {format} {diskFriendlyName} {disk}
```
fe. ```sudo diskutil eraseDisk ExFAT PDRV /dev/disk2```
  
