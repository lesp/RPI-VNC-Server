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
touch boot.sh
#Here we add two lines of config to boot.sh 
echo "#! /bin/bash" >> boot.sh
echo "sudo tightvncserver" >> boot.sh
#We change the permissions for the file
chmod 755 boot.sh


#Update local repositories with list from remote server...ensures we will download the latest software
sudo su
apt-get update
apt-get install tightvncserver
exit
echo "We shall now run the tightvncserver for the first time it will ask you to create a password, raspberry is a good one"

sleep 3
tightvncserver

ip=hostname -I
echo "Please write the IP address down and add :1 to the end for the first VNC connection"
echo $ip
crontab -l >> pi-crontab
echo "@reboot /home/pi/boot.sh" >> pi-crontab
#Need to change permission of xauthority file from root to user
read -p "Ok, everything done, I'll reboot the Pi in 5 seconds if you press Y"
if [ "$RESPONSE" == "Y" ] || [ "$RESPONSE" == "y" ]; then
	echo "Rebooting in 5"
	break
fi
echo "Not rebooting just yet"
done


