#!/bin/bash

# Set / Reset
BOLD='\e[1m'
DIM='\e[2m'
UNDERLINE='\e[4m'
BLINK='\e[5m'
REVERSE='\e[7m'
HIDDEN='\e[8m'

RESETALL='\e[0m'
RESETBOLDBRIGHT='\e[21m'
RESETDIM='\e[22m'
RESETUNDERLINE='\e[24m'
RESETREVERSE='\e[27m'
RESETHIDDEN='\e[28m'

# Foreground Color
FG_DEFAULT='\e[39m'
FG_BLACK='\e[30m'
FG_RED='\e[31m'
FG_GREEN='\e[32m'
FG_YELLOW='\e[33m'
FG_BLUE='\e[34m'
FG_MAGENTA='\e[35m'
FG_CYAN='\e[36m'
FG_LIGHTGRAY='\e[37'
FG_DARKGRAY='\e[90m'
FG_LIGHTRED='\e[91m'
FG_LIGHTGREEN='\e[92m'
FG_LIGHTYELLOW='\e[93m'
FG_LIGHTBLUE='\e[94m'
FG_LIGHTMAGENTA='\e[95m'
FG_LIGHTCYAN='\e[96m'
FG_WHITE='\e[97m'

# Background Color
DEAFULT='\e[49m'
BK_BLACK='\e[40m'
BK_RED='\e[41m'
BK_GREEN='\e[42m'
BK_YELLOW='\e[43m'
BK_BLUE='\e[44m'
BK_MAGENTA='\e[45m'
BK_CYAN='\e[46m'
BK_LIGHTGRAY='\e[47m'
BK_DARKGRAY='\e[100m'
BK_LIGHTRED='\e[101m'
BK_LIGHTGREEN='\e[102m'
BK_LIGHTYELLOW='\e[103m'
BK_LIGHTBLUE='\e[104m'
BK_LIGHTMAGENTA='\e[105m'
BK_LIGHTCYAN='\e[106m'
BK_WHITE='\e[107m'

# Clean
#yum clean all

# Update
#update () {
#	printf "\n# Update\n" >> bs.log # &> /dev/null
#	if yum update | tee -a bs.log; then
#		echo -e "${FG_GREEN}Update Successful${RESETALL}"
#	else
#		echo -e "${FG_RED}Update Unsuccessful${RESETALL}"
#	fi
#}


# Development Tools
#install_development_tools () {
#	printf "\n# Install Development Tools\n" >> bs.log # &> /dev/null
#	# Install
#	if yum groupinstall "Development Tools"  | tee -a bs.log; then
#		echo -e "${FG_GREEN}Installed Development Tools Successful${RESETALL}"
#	else
#		echo -e "${FG_RED}Installation of Development Tools Unuccessful${RESETALL}"
#	fi
#}

# tmux
#install_tmux () {
#	printf "\n# Install tmux\n" >> bs.log # &> /dev/null
#	if ! rpm -qa | grep tmux; then
#		if yum -y install tmux  | tee -a bs.log; then
#			echo -e "${FG_GREEN}Installed tmux Successful${RESETALL}"
#		else
#			echo -e "${FG_RED}Installation of tmux Unuccessful${RESETALL}"
#		fi
#	else
#		echo -e "${FG_GREEN}tmux Already Installed${RESETALL}"
#	fi
#}

# SSH Key
#add_ssh_key () {
#	# Create authorized_keys if needed
#	if [ ! -f ~/.ssh/authorized_keys ]; then
#		touch ~/.ssh/authorized_keys
#		echo -e "${FG_GREEN}authorized_keys File Created${RESETALL}"
#	else
#		echo -e "${FG_YELLOW}authorized_keys File Already Exist${RESETALL}"
#	fi
#
#	# Add SSH key if needed
#	if ! grep -Fxq "${YK_SSH_KEY}" ~/.ssh/authorized_keys; then
#		echo "${YK_SSH_KEY}" >> ~/.ssh/authorized_keys
#		echo -e "${FG_GREEN}SSH Key Added${RESETALL}"
#	else
#		echo -e "${FG_YELLOW}SSH Key Already Exist${RESETALL}"
#	fi
#}

#update
#install_development_tools
#install_tmux
#add_ssh_key

exit $?