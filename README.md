# nvidia-xrun for Debian Tested on Lenovo Yoga

So this is just a fork of the original script, Adapted So that it works for Debian 9. 
I've only tested this on my machine. Which is a Lenovo YOGA.
This Readme describes a step process of how to get this working. and some scripts

My nvidia card is NVIDIA Corporation GP107M [GeForce GTX 1050 Mobile] 

## Add Debian Stretch backports: 
 1. `sudo echo "deb http://httpredir.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list`
 1. `sudo apt-get update`
 
## Install the Kernel sources for your kernel
 
`apt-get install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//')`

Or if you are using a backports kernel as i am (needed for my touchpad)

`apt-get install -t stretch-backports linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//')`

## Install the nvidia-driver

`apt-get install -t stretch-backports nvidia-driver`
   
## Install bumblebee and Ia32 support

`sudo apt-get install bumblebee-nvidia primus`

`sudo dpkg --add-architecture i386 && sudo apt-get update && sudo apt-get install -t stretch-backports bumblebee-nvidia primus primus-libs:i386 libgl1-nvidia-glx:i386`

## Add your user to bumblebee

`sudo gpasswd -a $USER bumblebee`

## Run just-copy Script

run the `./just-copy.sh` script. Or follow the steps in the script

## Reboot and Sanity Checking
If everything went well reboot. After the computer boots you should be able to use X with your normal Intel driver. but you need to check if bumblebee works as expected. On a console type
`optirun glxgears -info`

That should run glxgears using your nvidia card. With a poor performance, but in a way confirms you are on the right track
`lsmod | grep nvidia` should show the nvidia kernel module is there as well

## Testing installation
CTRL+SHIFT+F2 Will take you to another tty. We want to disable display manager (Asuming you are using sddm)
So stop your display manager `systemctl stop sddm`

if using kde you want the script to start kde when runned so
`echo startkde > ~/.nvidia-xinitrc`
That will start kde when running the nvidia script. Anyway lets test it :
Typing `nvidia-xrun` Should run X with your drivers enabled.

## Finalizing Installation
If everything works run `glxgears -info` You should see much much better performance than before.
exit X by logging out and run `systemctl disable sddm` So that sddm does not start at boottime.

## Summary
To run with the intel card run `startx`
To run with the nvidia card run `nvidia-xrun`

Hope this helps someone. If you run into any issues look at the original project. 
https://github.com/Witko/nvidia-xrun

