#!/bin/bash
sudo apt install figlet
figlet -f slant wlan-switch
echo "A WLAN mode switcher by bi66y"

case $1 in
begin)
echo "Monitor mode - Start"
sudo airmon-ng start wlan0
sudo airmon-ng check kill
echo "Down"
sudo ifconfig wlan0 down
echo "Changing MAC"
sudo macchanger -br wlan0
echo "Up"
sudo ifconfig wlan0 up
sudo ifconfig
;;

end)
echo "Monitor mode - Stop"
sudo airmon-ng stop wlan0
echo "Down"
sudo ifconfig wlan0 down
echo "Changing MAC"
sudo macchanger -p wlan0
echo "Up"
sudo ifconfig wlan0 up
sudo ifconfig
;;

-h | --help)
echo "Usage: ./wl4n.sh begin|end "
;;

*)
echo "Usage: ./wl4n.sh begin|end "
;;
esac
