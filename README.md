# xenserver-scripts

In this repo I'll try to collect the scripts I create to be able to be an effective XenServer administrator

## reset-vm-power-state.sh
syntax:
```bash
reset-vm-power-state.sh [name of vm]
```
This script will force shutdown a VM that is in a state where it does not respond to commands from XenCeter to reboot, poweroff, force reboot of force poweroff
I have on multiple occasions experinced that running the xe-toolstack-reset command which is often reffered on Citrix forums, will bring the XenServer to a halt and beeing unresponsive it self.

This script will kill the VM thats unresponsive and leave the rest of the system intact. I have not experienced data loss so far. But I suspect there is a fair chance that it will happend.
