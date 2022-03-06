#!/bin/bash

log=$PWD/ssh-log.log
touch $log
GREEN='\033[1;32m'
clear='\033[0m'

function installing(){
	sudo apt install sshguard ufw > $log
}

function setting_ufw(){
	sudo ufw limit 22/tcp
	sudo ufw allow 80/tcp
	sudo ufw allow 443/tcp
	sudo ufw allow 3306/tcp
	sudo ufw enable

}

function adding_rules(){
	echo -e ':sshguard - [0:0]\n -A ufw-before-input -p tcp --dport 22 -j sshguard' > /etc/ufw/before.rules
}

echo -e "${GREEN}Installing sshguard and ufw ${clear}!"
installing
echo -e "${GREEN}OPENING PORTS: \n22: ssh\n80: HTTP\n443: HTTPS\n3306: MYSQL${clear}!"
echo -e "${GREEN}SETTING UP FIREWALL TO BLOCK ALL OTHER PORTS !${clear}!"
setting_ufw
echo -e "${GREEN}ADDING SSHGUARD TO /etc/ufw/before.rules${clear}!"
adding_rules
echo -e "${GREEN}SUCCESSFULLY SETUP THE SSHGUARD: ${clear}!"
sudo systemctl status sshguard
