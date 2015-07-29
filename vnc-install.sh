#! /bin/bash
# Automated VNC install and setup tool
# Les Pounder July 14th 2015
# Released under a Creative Commons CC-BY-SA Licence


#Gain super powers
#echo "You will be prompted for your password"
#sleep 3
#sudo su
#Create a file called boot.sh that will contain instructions to be ran at boot
cd /home/pi/
mv boot.sh boot.sh.old
touch boot.sh
#Here we add two lines of config to boot.sh 
echo "#! /bin/bash" >> boot.sh
echo "sudo tightvncserver" >> boot.sh
#We change the permissions for the file
chmod 755 boot.sh


#Update local repositories with list from remote server...ensures we will download the latest software
sudo apt-get update
sudo apt-get install tightvncserver
echo "We shall now run the tightvncserver for the first time it will ask you to create a password, raspberry is a good one"

sleep 3
tightvncserver

echo "Please write the IP address down and add :1 to the end for the first VNC connection"
hostname -I

echo "We next need to update a file called crontab so that it contains the code to boot with the"
echo "VNC server running at boot"
echo "Once this script is complete, you will return to the terminal"
echo "In the terminal type the following and press Enter to run"
echo "crontab -e"
echo "In the next screen navigate to the last line"
echo "On the last line type"
echo "@reboot /home/pi/boot.sh"
echo "Now press"
echo "To Save"
echo "CTRL + O"
echo "To exit"
echo "CTRL + X"
echo "Your Pi will now run the VNC server everytime it is started"


#crontab -l >> pi-crontab
#echo "@reboot /home/pi/boot.sh" >> pi-crontab
#Need to change permission of xauthority file from root to user
#read -p "Ok, everything done, I'll reboot the Pi in 5 seconds if you press Y"
#if [ "$RESPONSE" == "Y" ] || [ "$RESPONSE" == "y" ]; then
#	echo "Rebooting in 5"
#	break
#fi
#echo "Not rebooting just yet"
#done


