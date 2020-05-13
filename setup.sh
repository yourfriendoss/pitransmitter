#!/bin/bash

# This is a setup script for the Pi FM RDS Transmitter project streamlined by Mundeep Lamport
clear
echo "Welcome to the PiFM installer. This script will help you get up and running."
echo "PiFM currently supports: Pi 1, 2, 3, Zero. The 4 is not yet supported."
echo "For more information about the software or issues, visit https://github.com/mundeeplamport"
echo "WARNING! Your system will restart once completed."
sleep 10
clear
echo "Updating repository" ; sleep 2
sudo apt-get update
echo " "
echo "Installing required tools" ; sleep 2
sudo apt-get install libsndfile1-dev zenity git -y
echo " "
echo "Changing directory -> src" ; sleep 2
cd src
echo " "
echo "Cleaning up" ; sleep 5
make clean
echo " "
echo "Compiling" ; sleep 10
make
echo " "
echo "Editing -> /boot/config.txt" ; sleep 2
echo "gpu_freq=250" | sudo tee -a /boot/config.txt > /dev/null
clear
echo "Adding shortcuts" ; sleep 2
cd /home/pi/PiFM
sudo cp radio.sh /usr/local/bin
sudo mv /usr/local/bin/radio.sh /usr/local/bin/radio
sudo cp /home/pi/PiFM/src/PiFM.desktop /home/pi/Desktop
sudo cp /home/pi/PiFM/src/PiFM.desktop /usr/share/applications
sudo mv /home/pi/PiFM/src/pi_fm_adv /home/pi/PiFM/src/PiFM
echo "Patching xterm" ; sleep 1
sudo cp lxterminal xterm
echo "Assigning permissions" ; sleep 1
chmod +x 777 /home/pi/PiFM/radio.sh
echo "Completed" ; sleep 2
echo " "
echo " "
echo "To start broadcasting, use the start menu/desktop shortcuts, or type "radio" into the terminal" ; sleep 5
echo -ne 'Rebooting in 5\r'
sleep 1
echo -ne 'Rebooting in 4\r'
sleep 1
echo -ne 'Rebooting in 3\r'
sleep 1
echo -ne 'Rebooting in 2\r'
sleep 1
echo -ne 'Rebooting in 1\r'
sleep 1
echo -ne 'Rebooting now \r'
echo -ne '\n'
sudo reboot
