#!/bin/bash

# Copyright (c) 2022 Mohamed Morsi
# 
# This file is part of Mohamed Morsi's Omicron Repository.
#
# Omicron is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Omicron is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Omicron. If not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

############################################################################################################
############################################################################################################
# 							Main program                                       #
############################################################################################################
############################################################################################################
echo -e '
\033[1;94m
	  ____  __  __ _____ _____ _____   ____  _   _ 
	 / __ \|  \/  |_   _/ ____|  __ \ / __ \| \ | |
	| |  | | \  / | | || |    | |__) | |  | |  \| |
	| |  | | |\/| | | || |    |  _  /| |  | | . ` |
	| |__| | |  | |_| || |____| | \ \| |__| | |\  |
	 \____/|_|  |_|_____\_____|_|  \_\\____/ |_| \_|
\033[0m
'
############################################################################################################
# 							Repeat Function                                    #
############################################################################################################
repeat() {
	
	while true; do
		read -p  $'\033[1;94mDo you want to continue? [Y/n]\033[0m ' choice
		case "$choice" in 
			y|Y|yes|Yes ) read -p $'Enter the name of a country: ' input; tracker "$input";;
			n|N|no|No ) exit 0;;
			* ) echo "invalid";;
		esac
	done
}


############################################################################################################
# 							Tracker Function                                   #
############################################################################################################
tracker (){
	
	URL="https://www.worldometers.info/coronavirus/country"
	/bin/echo -n "The total number of COVID-19 cases in $1 is: $search" 
	search= curl -s -dump "$URL/$1" | \
	grep -i '<span style="color:#aaa">' | \
	cut -d\> -f2 | cut -d\< -f1
	echo $search 
	repeat 
}
read -p $'Enter the name of a country: ' var
tracker "$var"
exit 0

