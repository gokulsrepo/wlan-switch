#!/bin/bash
sudo apt install figlet -y
figlet -f slant wlan-switch
echo "A WLAN mode switcher by G"
echo "Available adaptors on your machine:"
netstat -i | awk '{print $1}' | sed -e '1,2d'
read -p "Choose the adaptor for switching:" adaptor

case $1 in
begin)
echo "Monitor mode - Start"
sudo airmon-ng start $adaptor
#sudo airmon-ng check kill
echo "Down"
sudo ifconfig $adaptor down
echo "Changing MAC"
sudo macchanger -br 
echo "Up"
sudo ifconfig $adaptor up
sudo ifconfig
;;

end)
echo "Monitor mode - Stop"
sudo airmon-ng stop $adaptor
echo "Down"
sudo ifconfig $adaptor down
echo "Changing MAC"
sudo macchanger -p $adaptor
echo "Up"
sudo ifconfig $adaptor up
sudo ifconfig
;;

-h | --help)
echo "Usage: ./wlan.sh begin|end "
;;

*)
echo "Usage: ./wlan.sh begin|end "
;;
esac
