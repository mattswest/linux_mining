# Basic setup guide for AMD R9 390 (290?) cards

Flash ubuntu-18.04.5-live-server-amd64.iso to USB with UUI
https://releases.ubuntu.com/18.04/ubuntu-18.04.5-live-server-amd64.iso

Boot and follow on-screen instructions to install

```
#Upgrade Kernel
sudo apt update
sudo apt install -y linux-image-5.4.0-54-generic linux-headers-5.4.0-54-generic linux-modules-extra-5.4.0-54-generic
sudo apt remove linux-image-4.15.0-136-generic linux-image-unsigned-4.15.0-136-generic linux-headers-4.15.0-136 linux-modules-extra-4.15.0-136-generic
sudo apt autoremove
sudo shutdown -r now

#Install drivers
wget --referer support.amd.com https://drivers.amd.com/drivers/linux/amdgpu-pro-20.20-1089974-ubuntu-18.04.tar.xz 
tar -xf amdgpu-pro-20.20-1089974-ubuntu-18.04.tar.xz
cd amdgpu-pro-20.20-1089974-ubuntu-18.04
sudo ./amdgpu-pro-install -y --opencl=pal,legacy,rocm --headless
sudo usermod -a -G video $LOGNAME
sudo vi /etc/default/grub  ##change GRUB_CMDLINE_LINUX=""
                           ##    to GRUB_CMDLINE_LINUX="amdgpu.ppfeaturemask=0xffffffff"
sudo update-grub
sudo shutdown -r now


##THEN##


#Download PhoenixMiner
wget "https://github.com/mattswest/linux_mining/raw/master/PhoenixMiner_5.5c_Linux.tar.gz"
tar -xf PhoenixMiner_5.5c_Linux.tar.gz

##OR##

#Install RainbowMiner
sudo apt-get update
sudo apt-get install git
git clone https://github.com/rainbowminer/RainbowMiner
cd RainbowMiner
chmod +x *.sh
sudo ./install.sh
./start.sh
```
