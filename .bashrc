if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias usage='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
alias ls="ls --color"

# Powerline
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Linux Lite Custom Terminal
LLVER=$(awk '{print}' /etc/llver)

# " echo -e "Welcome to $LLVER ${USER}"
date "+%A %d %B %Y, %T"
echo -ne "#Architecture:"\\t\\t && uname -a
echo -ne "#CPU physical:"\\t\\t && lscpu | grep -m1 "CPU(s)" | awk '{print $NF}'
echo -ne "#vCPU:"\\t\\t\\t && cat /proc/cpuinfo | grep "processor" | wc -l
echo -ne "#Memory Usage:"\\t\\t && free -m | awk 'NR==2{printf "%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
echo -ne "#Disk Usage:"\\t\\t && df -h | awk '$NF=="/"{printf "%d/%dGB (%s)\n", $3, $2,$5}'
echo -ne "#CPU load:"\\t\\t && top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
echo -ne "#Last Boot:"\\t\\t && who -b | awk '{print $(NF - 1), $NF}'
#echo -ne "#LVM use:"\\t\\t
#if [ $(lvm pvdisplay | grep "Physical" | wc -l) -gt 0 ]; then echo "yes"; else echo "no"; fi
echo -ne "#Connexions TCP:"\\t && netstat -ant | grep "ESTABLISHED" | wc -l | tr -d '\n' && echo " ESTABLISHED"
echo -ne "#User Log:"\\t\\t && who | wc -l
#echo -ne "#Network:"\\t\\t && echo -n "IP " && hostname -I | tr -d '\n' && echo "($(ip addr | grep link/ether | awk '{print $(NF -2)}'))"
#sleep 5; clear

#=====ALIASES=====
alias lsa="ls -goahG" #List all
alias lsad="ls -goahG --sort=time -r" #List by date
alias lsaf="ls -goahG | sort" #List folders first
alias lsw="ls -la" #List who can use
alias rad="rm -rfv"
alias srad="sudo rm -rfv"
alias hl="ln" #Creates hard link
alias sl="ln -s" #Creates symbolic link
#alias daschap="du -sh * | sort -h" #Disabled when ncdu is used
alias rcp="rsync -ahP"
alias dfd="df -HT"
alias bac="xdg-open"
alias top="top -o %CPU"
alias inod="ls -ia | sort"
alias sps="ps -xa --forest"
alias pswho="ps -eo euser | grep -v EUSER | sort | uniq -c | sort -nr" #Shows who is running the processes
alias miacq="netstat -tulanp"
alias nmapos="sudo nmap -O -v"
alias acc="gcc -Wall -Wextra -Werror"

#--Archive management--
	alias tarara="tar -cvf"
	alias tgzara="tar -cvfz"
	alias bz2ara="tar -cvfj"
	alias tarhani="tar -xvf" #To Untar files in specified Directory use '-C': "tarhani file.tar -C /home". To extract a single file from the archive: "tar -xvf test.sh.tar test.sh"
	alias taravel="tar -rvf" #To add the file to the archive: "tar -rvf test.tar xyz.txt"
	alias tarlsa="tar -tvf" #To list the contents of the archive file

#--After installation of the apps--
alias du="ncdu" #AFTER sudo apt install ncdu
alias cdiff="colordiff" #AFTER sudo apt install colordiff
	alias tsh="trash" #AFTER sudo apt install trash-cli
	alias tshl="trash-list" #AFTER sudo apt install trash-cli
	alias tshr="trash-restore" #AFTER sudo apt install trash-cli
alias radtsh="trash-empty" #AFTER sudo apt install trash-cli
alias bat="batcat" #AFTER sudo apt install bat
alias liswifi="sudo iftop -i wlan0" #AFTER sudo apt install iftop

#--Permissions and attributes--
alias sticky="chmod +t" #t Assign sticky bit to existing dir.
	alias blrad="sudo chattr +i" #Blocks file from deletion. List attr-s: lsattr
	alias rerad="sudo chattr -i" #Removes the block to delete the file.
	alias lsat="lsattr" #Shows file's attributes.
alias acl="getfacl" #+ Shows ACL of file/directory. For commands: aclcom
alias radacl="setfacl -b" #Removes all ACl entries. To change settings for "user"
			#setfacl -m "u:user:rwx" filename.txt

#--Computer info--
alias hddinfo="sudo hdparm -I /dev/sda"
alias hddspeed="sudo hdparm -tT /dev/sda"
alias raminfo="sudo dmidecode --type 17"
alias rammax="sudo dmidecode -t 16 | grep 'Maximum'"
alias cpuinfo="lscpu | grep 'Model name' && lscpu | grep 'CPU op'"
alias pcmodel="sudo dmidecode | grep 'SKU Number' | head -1"
alias llver="cat /etc/llver" #Shows the OS version for Linux Lite

alias q="exit"
alias l="clear"
alias h="history"
alias radh="h -c && h -w"
alias u="sudo apt-get update"
alias uu="sudo apt update && sudo apt upgrade -y ; sudo apt autoremove -y"
alias ur="sudo apt autoremove -y"
alias ari="sudo apt install '$1'"
alias gna="sudo apt remove '$1'"

alias panak="sudo thunar"
alias soff="xset dpms force standby"
alias kas="systemctl suspend -i"
alias zxcv="shutdown now" #Another version, in 5 mins: 'shutdown -h +5'
alias dzvir="xbacklight -set 80 && xset dpms force standby" #In case screen's backlight is off.

#--Files--
alias vimrc="vim ~/.vimrc"
alias newvimrc="cd ~ && cp .vimrc .vimrc_old && rm -rfv .vimrc && thunar"
alias bashrc="vim ~/.bashrc"
alias newbashrc="cd ~ && cp .bashrc .bashrc_old && rm -rfv .bashrc && thunar"
alias zshrc="vim ~/.zshrc"
alias bashtozsh="cat ~/.bashrc > ~/.zshrc"
alias zshtobash="cat ~/.zshrc > ~/.bashrc"
alias notes="vim ~/.notes"

#--Directories--
alias het="cd -"
alias ver="cd .. ; pwd"
alias ver2="cd ../../ ; pwd"
alias ver3="cd ../../../ ; pwd"
alias tun="cd ~ ; lsa"
alias d="cd ~/Desktop ; pwd"
alias dw="cd ~/Downloads ; pwd"
alias fd="cd /media/arma/Lex_16GB/ ; pwd"
alias fdl="cd /media/arma/ ; lsa"
alias trashdir="cd ~/.local/share/Trash/files && ls -la"
alias sd="cd /media/arma/GoldSD_16GB ; lsa"
alias usd="sudo umount /media/arma/GoldSD_16GB"
alias proc="ls /proc"

#-----Linux-----
alias userlist="cat /etc/passwd | cut -d: -f1 | sort | less"
alias userlistl="cat /etc/passwd | sort | less"
alias grouplist="cat /etc/group | cut -d: -f1 | sort | less"
alias grouplistl="cat /etc/group | sort | less"

alias repos="cd /etc/apt/sources.list.d ; lsa" #Show the list of repositories
alias recert="sudo apt install --reinstall ca-certificates"

alias lastin="grep ' install ' /var/log/dpkg.log | tail -1"
alias allin="grep ' install ' /var/log/dpkg.log"

#after installing: apt-get install libpam-pwquality
alias pwpol="vim /etc/pam.d/common-password"
alias pwexp="vim /etc/login.defs"
alias sshset="vim /etc/ssh/sshd_config"

#-----IDs-----
alias mainboardid="sudo cat /sys/class/dmi/id/product_uuid" #The main board product UUID, as set by the board manufacturer and encoded in the BIOS DMI information.
alias machineid="cat /var/lib/dbus/machine-id" #An ID identifying a specific Linux/Unix installation. It does not change if hardware is replaced.
#Next two IDs are also shown by using 'hostnamectl' command
	alias bootid="cat /proc/sys/kernel/random/boot_id" #A random ID that is regenerated on each boot.
	alias sessionid="cat /proc/self/sessionid ; echo """ #An ID identifying a specific Linux login session. This ID is maintained by the kernel and part of the auditing logic.
alias genid="cat /proc/sys/kernel/random/uuid" #Linux offers a kernel interface to generate UUIDs on demand, by reading from this file.


#=====CUSTOM COMMANDS=====
nishq () {
	touch "$1"
		chmod "$2" "$1"
}
#Creates a file with given access permissions. Example: nishq test.txt 766

fds () {
	echo "content of: /proc/"$1"/fd"
		sudo ls -goahG /proc/"$1"/fd
}
#Shows file descriptors of a given process. Example: fds 7368

addrepo () {
	sudo add-apt-repository ppa:"$1"
}
#Alias type function to add a new repository

radrepo () {
	sudo add-apt-repository --remove ppa:"$1"
}
#Alias type function to remove a repository

indeb () {
	sudo dpkg -i ./"$1"
	sudo apt-get -f install
	sudo apt-get autoremove -y
}
#Installs .deb package and downloads needed dependencies. Example: indeb vivaldi-stable.deb

aclcom () {
	getfacl $(which "$1");
}
#Displays ACL of a given command

radi () {
	find . -inum "$1" -exec rm -irv {} +
}
#Removes a file using its inod number. 'inod' command should be used beforehand.
#Example: radi 1053515

snet () {
	echo "===== WAIT A LITTLE! ====="
	echo "========== ping -c 5 ==========" > .snet_report.txt
	ping -c 5 "$1" >> .snet_report.txt
	echo -e "\n========== host ==========" >> .snet_report.txt
	host "$1" >> .snet_report.txt
	echo -e "\n========== nslookup ==========" >> .snet_report.txt
	nslookup "$1" >> .snet_report.txt #AFTER sudo apt-get install dnsutils
	echo "========== traceroute ==========" >> .snet_report.txt
	traceroute "$1" >> .snet_report.txt
	echo -e "\n========== dig ==========" >> .snet_report.txt
	dig +trace "$1" >> .snet_report.txt
	batcat .snet_report.txt || cat .snet_report.txt
	rm -rfv .snet_report.txt
}
#supernet - creates a report of 3 commands, opens it and deletes it

mynet () {
	echo "========== MY PUBLIC IP ==========" >> .mynet_report.txt
	curl ifconfig.me >> .mynet_report.txt
	echo -e "\n\n========== MY PRIVATE IP ==========" >> .mynet_report.txt
	ifconfig | grep netmask | tail -1 | sed 's/^[ \t]*//' >> .mynet_report.txt
	#hostname -I >> .mynet_report.txt
	echo -e "\n========== Static or Dynamic ==========" >> .mynet_report.txt
	(ip r | grep dhcp && echo "Dynamic" || echo "Static") >> .mynet_report.txt
	echo -e "\n========== arp ==========" >> .mynet_report.txt
	arp >> .mynet_report.txt
	echo -e "\n========== ifconfig ==========" >> .mynet_report.txt
	ifconfig >> .mynet_report.txt
	batcat .mynet_report.txt || cat .mynet_report.txt
	rm -rfv .mynet_report.txt
}

#-----Hash comparison-----
crc32cmp () {
	crc32 "$1" > .t-1
	echo "$2" > .t-2
	cmp --silent .t-1 .t-2 || echo -e "\033[0;31mDIFFERS\e[0m";
	cmp --silent .t-1 .t-2 && echo -e "\033[0;32mOK\e[0m";
	rm -rf .t-1 .t-2
}
#Compares the crc32 sum of the file with the given checksum.
#Example: crc32 filename 32d70693

md5cmp () {
	md5sum "$1" | grep -o "^\w*\b" > .t-1
	echo "$2" > .t-2
	cmp --silent .t-1 .t-2 || echo -e "\033[0;31mDIFFERS\e[0m";
	cmp --silent .t-1 .t-2 && echo -e "\033[0;32mOK\e[0m";
	rm -rf .t-1 .t-2
}
#Compares the md5 sum of the file with the given checksum.
#Example: md5sum filename 68b329da9893e34099c7d8ad5cb9c940

sha256cmp () {
	sha256sum "$1" | grep -o "^\w*\b" > .t-1
	echo "$2" > .t-2
	cmp --silent .t-1 .t-2 && echo -e "\033[0;32mOK\e[0m" || echo -e "\033[0;31mDIFFERS\e[0m";
	rm -rf .t-1 .t-2
}
#Compares the sha256 sum of the file with the given checksum.
#Example: sha256cmp filename 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b

sha1cmp () {
	sha1sum "$1" | grep -o "^\w*\b" > .t-1
	echo "$2" > .t-2
	if	cmp --silent .t-1 .t-2 
	then
		echo -e "\033[0;32mOK\e[0m";
	else
		echo -e "\033[0;31mDIFFERS\e[0m"; 
	rm -rf .t-1 .t-2
	fi
}

