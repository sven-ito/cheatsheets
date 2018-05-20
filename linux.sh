#################################################################################
# Basics - How can I interact with my Linux machine using the shell?
#################################################################################

#Commands:
#	- Executables
#	- Shell Builtins
#	- Shell Functions
#	- Aliases

# bash press ESC = hold down ALT ~ META key

type [command]							# which type of command is the command?
which [command]							# where is the executable located?
whereis [command]						# locate the Binary, Sources and Manual Pages 

^mistyped_command^corrected_command		# typo in command -> re-run

history									# Zeigt Bash-History/alle getippten Befehle
!1										# Befehl von History Eintrag 1 ausführen
!!										# letzten Befehl ausführen
history -d [x]							# Delete history entry number x (e.g. in case password was entered in clear text) -> write afterwards
history -c								# Clear the entire history -> write afterwards
history -w								# Write / save (changed) history

uname -r								# (_R_elease) zeigt Linux-Version an (Kernel Build)
uname -v								# (_V_ersion) Linux Kernel version / distribution
uname -m								# shows architecture 32/64 Bit

hotsname								# regular host name of current machine
hostname -f								# fully qualified domain name of host (FQDN)
hostname XYZ							# set the host name of the current machine to XYZ

lsb_release -a							# Linux version / distribution information (only tested on Ubuntu)
cat /etc/debian_version     			# Version/Codename herausfinden

w										# uptime / users (who is logged in?)
uptime									# uptime only

lslogins								# show all users

cal										# displays a calendar (incl. current date / weekdays)
cal 07 2015								# displays a calendar of July 2015
date									# diplay current date + time

clear									# scroll down
ctrl+l									# scroll down
man [command]							# manual pages / help for [command]
apropos [term]							# search manuals for term
whatis [command]						# one line description

printenv								# print all environment variables

# Strg + D								# schließt Terminal
# Strg + L                              # löscht Inhalt des Terminals
# Strg + C								# terminiert Programm
# Shift + Q								# schließt Manpage
# Tabulator								# Auto-Vervollständigung
# Pfeil hoch/runter						# Bash History

# Strg + R								# Rückwärtssuche (Weitersuchen -> erneut drücken)
# Strg + J								# Gefundenes Kommando einfügen

# Strg + L								# Adress-Leiste im Nautilus einblenden -> Pfad pasten
# Strg + Z                              # Programm pausieren/unterbrechen

ctrl+a									# go to "Anfang" / beginning of the command line
ctrl+e									# go to end of the command line
ctrl+r									# reverse history search
ctrl+c									# keyboard interrupt
ctrl+l									# = clear
ctrl+u									# <- kill / cut the rest of the line preceeding the cursor
ctrl+k									# -> kill / cut the rest of the line starting with cursor
ctrl+y									# yank / paste (what has been killed/cut before)

alt+f									# move cursor one word forward
alt+b									# move cursor one word backward
alt+t									# switch two words (Tauschen)
alt+l									# lowercase (cursor position to end of word)
alt+u									# uppercase (cursor position to end of word)

#################################################################################
# Navigation - How to look around the file system
#################################################################################

pwd										# print (my) working directory
ls										# list
ls (path_1) ... (path_n) 				# list (path 1-n) contents
ls -a									# list all (also hidden)
ls -l									# list with attributes
ls -hal									# list human readable all with attributes
ls -li									# list with attributes and inode IDs

tree -ahifgu							# the "better" ls -> prints files/dirs/subdir as tree
										# must be installed first (Lubuntu)


stat [filename]							# display detailed file properties
cd (path)								# change directory to (path)
cd ..									# go up a directory
cd ../..								# go up two directories
cd										# go home
cd ~user								# go to user´s home
cd -									# go to previous directory / back
find . -path "./*.log*"					# Suche von aktuellem Ordner aus folgenden Ausdruck

locate [file name]						# Sucht basierend auf DB
updatedb								# Aktualisiert DB manuell (sonst via cron)

df -h                       			# Freier Speicher (disk free)
file (file)				    			# display file type
										# determine if application / binary is 32 bit or 64 bit

sudo touch /forcefsck					# force file system check at next boot

#################################################################################
# File Operations - How to manipulate (move/copy) files etc.
#################################################################################

touch (file)							# create (file)
> (file)								# overwrite / truncate (file)
rm (file)								# remove (file)
rm -i (files)							# remove (files) interactively (prompt for every file)
rm -r (directory)						# remove (directory) and its contents (recursively)
cat (file)								# print (file)
tac [filename]							# print file in reverse order (lines)
echo "bla" | rev						# reverse string ("alb")
cat -n [file]							# (_n_umbers) print file contents with line numbers
mkdir (directory)						# create directory (directory)
mkdir - (directory path)				# create directory + parents
ln (file) link							# create hard link (indistinguishable from file?)
ln -s (target) (linkname)				# create symbolic link (will be type "l" <-> "d" for directory)
rm -rf /								# destroy your entire system
cp [Datei1] [Datei2]					# Kopieren
mv [Datei1] [Datei2]					# Umbenennen / Verschieben
rm -r [Verzeichnis]						# Rekursives Löschen (Verzeichnisse)
mkdir									# Verzeichnis erstellen
mount /dev/sda1 /media/usbstick			# Mountet USB-Stick (Mountpunkt vorher erstellen)
umount /dev/sda1 /media/usbstick		# Un-mountet USB-Stick
md5sum [filename]						# Calculates the MD5 hash of the file
tar xfv [ARCHIVNAME].tar                # Extract tar
tar xzf meinarchiv.tar.gz				# Extract tar.gz
tar xfvj [ARCHIV].tar.bz2               # Extract tar.bz2
tar czvf myfolder.tar.gz abcfolder/		# Compress
tar -czvPf myfolder.tar.gz abcfolder/   # Compress (nur relativer Pfad

#################################################################################
# Input / Output
#################################################################################

#channels:	stdin = 0, stdout = 1, stderr = 2
echo "test" 1> file.txt					# redirect stdout to a file (no append!)
echo "test" >> file.txt					# append stdout to a file

# Time / Date:	
date +%y_%m_%d_%H-%M-%S     			# Regular
date +%s                    			# Unix Timestamp (Seconds since 1970)

command > file                      	# Schreibe stdout in Datei
command >> file                     	# Schreibe stdout in Datei (append)
command 2> file                     	# Schreibe stderr in Datei
command 2> /dev/null					# Unterdrücke Fehlermeldungen
command &> file                     	# Schreibe stdout und stderr in Datei
command < file                      	# Lies Input von Datei anstatt stdtin
(command1; command2) > file         	# Schreibt stdout von Befehlsequenz in Datei (in selber Shell)

command | tee file                  	# Schreibt stdout in Datei und zeigt Output auf Konsole an (T-Stück)
command1 | command2                 	# Pipe leitet Output von command1 and command2 weiter
command1 && command2                	# command2 wird nur ausgeführt, wenn command1 erfolgreich war (return == 0)
command1 || command2                	# command2 wird nur ausgeführt, wenn command1 NICHT erfolgreich war (return != 0)

# Regex Matching
grep -o -h "attempt_$1_$2_[rm]*_[0-9]*_[0-9]*" *.log* | sort | uniq >> allAttempts.txt
	# -o nur Matches anzeigen
	# -h Dateinamen-Anzeige unterdrücken
	
	# sort sortieren
	# uniq Duplikate mergen (geht nur sortiert!)
    
# Line Count
cat myFile.txt | wc -l

head (file)								# first 10 lines of a file
tail (file)								# last 10 lines of a file
tail -f (file)							# follow the file
cat (file) | cut -d, -f2				# prints 2nd column of ,-delimited file
wc (file)								# word count

#################################################################################
# File System - Where is everything located on Linux?
#################################################################################

# Case-sensitive

# Sharable vs. unsharable
# +---------+-----------------+-------------+
# |         | shareable       | unshareable |
# +---------+-----------------+-------------+
# |static   | /usr            | /etc        |
# |         | /opt            | /boot       |
# +---------+-----------------+-------------+
# |variable | /var/mail       | /var/run    |
# |         | /var/spool/news | /var/lock   |
# +---------+-----------------+-------------+
#
# buffers <-> flush; unmount

man hier					Describes the filesystem hierarchy

# https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

/dev/null					Null / Dummy Device

/boot						Kernel + Bootloader				( ~ MBR )

/etc						Configuration all Programs 		( ~ Registry )
							Editable Text Configuration
/etc/passwd					List of User Accounts
/etc/fstab					Hard Drives
/etc/crontab				Automated (Cron) Jobs
/etc/sudoers/				All commands allowed to perform under another identity
/etc/apt/sources.list				# Repository list for apt(itude); man sources.list
/etc/apt/sources.list.d/*.list		# Custom repository lists for apt(itude); man sources.list

/home						User Folders		# Many systems set the permissions of home directories 
												# to prevent them from being world-readable, 
												# which is a reasonable security measure.

/root						Admin User Folder
/lost+found					Corrupted Files					( ~ Checkdisk )

/bin						General Binaries (also links)   ( ~ Start Menu )		#only files supplied and maintained by the Linux distributor
/sbin						System Binaries (important)		( ~ Control Panel )
/opt						Optional/Extra Software			( ~ Program Files )
/usr						Universal System Resources		( ~ Program Files )
/usr/bin					Non-essential Binaries			( ~ Program Files )		#only files supplied and maintained by the Linux distributor
/usr/sbin					Non-essential System Binaries	( ~ Program Files )
/usr/share/doc				Documentation
/usr/share/man				Documentation
/usr/share/info				Documentation
/usr/src					Source Code
/usr/include				Include Files

/usr/local/bin				public shell scriprts
/usr/local/sbin				root shell scripts
~/bin						private shell scripts

/usr/lib					Librariers						( ~ System32 / DLLs)
/lib						Librariers						( ~ System32 / DLLs)
/lib64						Librariers (64 Bit)				( ~ System32 / DLLs)

/media						Automounted devices				( ~ My Computer)
/misc						Automounted devices				( ~ My Computer)
/mnt						Mounted devices					( ~ My Computer)
/net						Network Drives
/svr						Server (HTTP / FTP)

/dev						Devices							( ~ Device Manager )
/sys						System							( ~ Device Manager )
/proc/cpuinfo				CPU Info						( ~ Device Manager )

/proc						All Processes 					( ~ Task Manager )
/run						Running System Info

/tmp						Temporary Files					( ~ Temp )
/var/tmp					Temporary Files	(perserved)		( ~ Temp )

/var						Variable Files
/var/log					Log Files
/var/log/messages			System Messages
/var/cache					Application Cache
/var/lib					State Information / DBs ?

/selinux					Security?

# Startup Files For Login Shell Sessions

/etc/profile 							# A global configuration script that applies to all users.
~/.bash_profile 						# A user's personal startup file. Can be used to extend or
										# override settings in the global configuration script.
~/.bash_login 							# If ~/.bash_profile is not found, bash attempts to 
										# read this script.
~/.profile 								# If neither ~/.bash_profile nor ~/.bash_login 
										# is found, bash attempts to read this file. This is the
										# default in Debian-based distributions, such as Ubuntu.

# Startup Files For Non-Login Shell Sessions (SSH)

/etc/bash.bashrc 						# A global configuration script that applies to all users.
~/.bashrc 								# A user's personal startup file. Can be used to extend or
										# override settings in the global configuration script.
										
source .bashrc							# Force re-read

#The PATH variable is often (but not always, depending on the distribution) set by the
#/etc/profile startup file: PATH=$PATH:$HOME/bin

# /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
#	Linux: Path separator is ":"

#################################################################################
# Permissions - Who is able to do what?
#################################################################################

# Permissions:  Type of Object|Owner|Group|Everyone else|Alternative acceess

                # Type of Object
                # - regular file
                # d directory
                # l (symbolic) link					ignore rwx attributes
                # c character special device		peripheral devices
                # b block special device			hard disks / CD-ROM
                # p FIFO							named pipes (seldom?)
                # s Socket							"private" file / communication
    
                # r read (dir: read contents)
                # w write (dir: create, delete, rename files within dir)
                
                ##################################################################
                # x execute (dir: access contents, if you know that they exist)
                # s execute as owner/group member (x set)
                    # directories: files+dir created within inherit group ID
                # S execute as owner/group member (x NOT set)
                
                # Only directories:
                
                # t sticky bit (only owner can delete/unlink a file) (x set)
                # T sticky bit (only owner can delete/unlink a file) (x NOT set)
                ##################################################################
                
                # Nummeric:
                # read = 4
                # write = 2
                # execute 1
                # Add those up to: 0,1,2,3,4,5,6,7
				
				#	0	000	---
				#	1	001	--x
				#	2	010	-w-
				#	3	011	-wx
				#	4	100	r--
				#	5	101	r-x
				#	6	110	rw-
				#	7	111	rwx
                
				#	u	user	owner
				#	g	group	group
				#	o	others	everyone else / world
				#	-	remove
				#	+	add
				#	=	set
				#	,	separate u/g/o
				
                # Access Modes / Run As
                # 	u+s	suid = run as owner (=4000)
                # 	g+s	sgid = run as group member (=2000)
                # 	+t	sticky bit = only owner can delete/unlink a file (=1000)
        
# Standard Settings - Defaults in: /etc/login.defs
umask           # which rights are REMOVE / subtracted on standard file creation
umask -S        # which rights are ALLOWED on standard file creation (symbolically)

chmod (bits) (file)	# change file mode for (file) with (bits, e.g. 755)

# Grant:                
chmod ugo+rwx -R mydir/  # u = users, g = group, o = others (everyone else) 
# Remove:
chmod ugo-rwx -R mydir/  # u = users, g = group, o = others (everyone else)
# Define Set:
chmod u=rwx,g=rwx,o=rwx -R mydir/ # u = users, g = group, o = others (everyone else)

chattr +i myfile			# set immutable (even root cannot delete until unset)
chattr -i myfile            # unset immutable

chgrp group file			# Change Group (must be owner + in group)
sudo chown owner:group file	# Change Owner

# Rechte ändern
sudo chown -R user:group folder			# rekursiv (auch Unterverzeichnisse)
sudo chmod 755 myfile					# Datei ausführbar machen

#################################################################################
# User & Group Management
#################################################################################
whoami          			# as who am i logged in ?
id [user]       			# show user ID+name, and all group IDs+names for user
groups [user]   			# show group names for user
cat /etc/group				# Groups (group id, members)
cat /etc/passwd             # Username,Password(X=encrypted -> /etc/shadow),User ID, Group ID, Comment, Home Dir, Shell
sudo cat /etc/shadow		# Hash Passwords (password expiration etc.), * = there is no password, ! = login is not allowed
sudo usermod -L (username)  # lock user account for (username)
sudo usermod -U (username)  # unlock user account for (username)
sudo usermod -Ga (groups)	# adds user to groups
useradd (...)				# adds user
groupadd (...)				# adds a group
ls /etc/skel				# skeleton files for new user folder creation
userdel	(...)				# deletes user (home dir might still be there)
sudo passwd (username)		# set password for (username)
passwd						# change your password
newusers					# mass create new users
id							# user id, group id, group memberships

# if ls cannot resolve GID / UID to a name -> group /user may no longer exist

# Sudoers File editieren
sudo visudo

##################################################################################
#
#	su / sudo
#
# - the use of sudo does not require access to the superuser's password
# - By default, Ubuntu disables logins to the root account 
#		(by failing to set a password for the account)


su -						# Login as Super User / Root incl. environment
su -l [user]				# Login as [user] incl. environment
su [user]					# Login as [user]
sudo visudo 				# /etc/sudoers/ geordnet bearbeiten (incl. Syntax-Check)
sudo -l						# Was darf ich mit sudo ausführen?

# Policy Examples: 

#admin      ALL = NOPASSWD: ALL							
#Der Benutzer admin darf ohne Passwortabfrage alle Programme ausführen.

#%users     ALL = NOPASSWD: /usr/sbin/IRGENDEINSKRIPT	
#Die Gruppe users darf ohne Passwortabfrage den Befehl /usr/sbin/IRGENDEINSKRIPT ausführen.

# Zugriff verweigert 
#sudo echo mem > /sys/power/state

# Abhilfe schafft das Kapseln des Befehls in eine eigene Shell (bash):
#sudo bash -c "echo mem > /sys/power/state" 

# Root Shell
sudo bash
sudo su

#################################################################################
# Processes - Where can I find the "task manager"?
#################################################################################

# http://www.cyberciti.biz/faq/kill-process-in-linux-or-terminate-a-process-in-unix-or-linux-systems/

# packet procps includes top, free, vmstat, ps, and many other tools
# statistics are parsed from /proc/

top 									# zeigt alle Prozesse an
top -u Peter							# shows only the processes of user Peter
top -p 42								# only monitor process with PID 42
h										# Hilfe (in top)
k [Prozess-ID]							# killt Prozess nach ID (in top)
e/E										# (_E_inheiten) switch between memory units -> e.g. MB (more human readable)
c										# (_C_ommand) shows the path of the process / the command it was started with
W										# (_W_rite Config File) saves the configurations made to .toprc in your home dir
F										# (_F_ilter) change columns and how to sort (exit with q)
V										# (_V_erwandtschaft) forrest view: shows relationships between tasks / child-tasks

pkill [Prozessname]						# killt Prozess nach Namen
pgrep (...)								# search for processes

kill [Prozess-ID]						# killt Prozess nach ID = -15
kill -9 [Prozess-ID]                    # killt Prozess nach ID, SIGKILL
kill -15 [Prozess-ID]					# sends SIGTERM (can be blocked)
kill -18 [Prozess-ID]					# STOP
kill -19 [Prozess-ID]					# CONTINUE
kill -l									# Liste Signals auf
killall									# Mehrere Prozesse killen

pstree									# Zeigt Prozess-Baum an

pgrep [Prozessname]     				# findet ID zu Prozess
command &                               # Prozess im Hintergrund starten
bg                                      # Aktuellen Prozess in Hintergrund verschieben ??? funktioniert unter Ubuntu 11.10 nicht ???

# Fancier version of top
sudo apt-get install htop

# Services

sudo /etc/init.d/apache2 start|stop|restart		# Apache2 Service starten etc.
ps aux | less				list all proces / scroll through (page up/down)

# ID, Parent ID, effective UID / GID (de-escalate privileges), Prio (PRI), Niceness (NI)
# 1 = always init (Kernel starts it)
# forking / clone?
# Distributions: init processes ...
# Signals = Messages Processes / Kernel

man signal

# States:
# RUNNABLE  ~ eligible to get scheduled some CPU time
# SLEEPING 	~ waiting on input
# STOPPED 	~ interrupted by STOP signal
# ZOMBIE 	~ finished, waiting to return / to be "killed"

# Niceness towards other processes (sharing CPU time)
nice / renice						# Set / Reset process niceness (-20 ~ blocking; 0 default; 19 very nice)

	#The priority of a process in linux is dynamic: The longer it runs, the lower its priority will be. 
	# A process runs when its acutally using the CPU - most processes on a typical Linux box just wait 
	# for I/O and thus do not count as running.

	#The priority is taken into account when there are more processes running than CPU cores available: 
	# Highest priority wins. 
	# But as the winning process looses its proirity over time, 
	# other processes will take over the CPU at some point.

	#nice and renice will add/remove some "points" from priority. 
	# A process which has a higher nice value will get lesser CPU time. 
	# Root can also set a negative nice value - the process gets more CPU time.
	
# strace -> Deep Dive

#################################################################################
# Hardware - How can I check on my hardware?
#################################################################################

# Debian - Hardware Specs
cat /proc/meminfo                       # RAM
cat /proc/cpuinfo                       # CPU
lspci                                   # PCI (apt-get install pciutils)
lsusb                                   # USB Devices
lscpu									# List CPU
lsblk									# List all block devices (hard drives etc.)

# Big endian machine: 
# -------------------
#	Stores data big-end first. When looking at multiple bytes, the first byte (lowest address) is the biggest.
#
# Little endian machine: 
# ----------------------
#	Stores data little-end first. When looking at multiple bytes, the first byte is smallest.

sudo lshw								# list hardware
sudo lshw -html > lshw.html				# list hardware (output as HTML)

# https://en.wikipedia.org/wiki/File_descriptor

lsof									# list open files
lsof -u [user]							# list open files for user
lsof [my file]							# who has my file opened?

# Change active group of user:
newgrp group

#################################################################################
# Network
#################################################################################

netstat -ie								# Which network cards / interfaces are there? (w/o root rights)

# Ports
#
# 0-1023 – the Well Known Ports, also referred to as System Ports.
# 1024-49151 – the Registered Ports, also known as User Ports.
# 49152-65535 – the Dynamic Ports, also referred to as the Private Ports.
#

cat /etc/services 						# Port <-> Protocol Mappings
cat /etc/services | grep 21				# What is the protocol for port 21?

netstat	-tupan							# what is going on the network? (TCP / UDP only, better readable)

# Offene Ports
lsof -i									# listet Prozesse / Ports

# Netzwerk
ifconfig -a								# IPConfig (alle Interfaces)
route -n								# Alle Routen/Gateways ohne Namensauflösung
ping 127.0.0.1 -c 100					# 100 Pings an localhost

# Netwerk - DHCP Lease besorgen
sudo dhclient eth0						# Ubuntu

# Netzwerk - DNS
sudo nano /etc/hosts					# Ubuntu
#192.168.0.1		peter

# Netzwerk - Statische IPs
sudo nano /etc/network/interfaces		# Ubuntu
#auto eth0
#iface eth0 inet static
#address 192.168.0.1
#netmask 255.255.255.0
#gateway 192.168.0.254

/etc/init.d/networking restart          # Network Restart Debian

# Netzwerk - lokaler NTP-Server

# Server
	sudo apt-get install ntp
	
	sudo nano /etc/ntp.conf
	# Server auskommentieren
	server 127.127.1.0 burst iburst		# sic! 127.127.1.0 ist spezielle NTP Adresse!
	fudge 127.127.1.0 stratum 10

	sudo /etc/init.d/ntp start			# startet NTP Service
	#sudo /etc/init.d/ntp stop			# beendet NTP Service

# Client
	sudo ntpdate [Server-IP]
	sudo ntpdate -d [Server-IP]			# Debug-Modus zeigt Fehler
    
# Screen
screen -dmS [SessionName]               # neue Session aufmachen und detachen
screen -ls                              # listet alle Sessions
screen -r [SessionName]                 # reattach to Session
screen -X -S [SessionName] kill         # Session zerstören
Strg+A c                                # Neues Tab
Strg+A n                                # Nächstes Tab
Strg+A d                                # Detach

# Alternatives to Screen
nohup [command]							# Process will not shut down after SIGHUP (sent at session end)

#################################################################################
# Software Management - How can I install new software?
#################################################################################

#Debian Style (.deb) 		# Debian, Ubuntu, Xandros, Linspire
#Red Hat Style (.rpm) 		# Fedora, CentOS, Red Hat Enterprise Linux, OpenSUSE,
							# Mandriva, PCLinuxOS
							
# upstream provider (the author of the program) 
# -> package maintainer, often (but not always) an employee of the distribution vendor. 

# Distributions 	Low-Level Tools 	High-Level Tools
##########################################################
# Debian-Style 		dpkg 				apt-get, aptitude
##########################################################
# Fedora, Red Hat
# Enterprise Linux, rpm 				yum
# CentOS

#If a package file has been downloaded from a source other than a repository, it can be installed
#directly (though without dependency resolution) using a low-level tool.

#Style 		#Command(s)
#Debian 	dpkg --install package_file
#Red Hat 	rpm -i package_file

# Uninstall

#Style 		#Command(s)
#Debian 	apt-get remove package_name
#Red Hat 	yum erase package_name

# Update

#Style 		#Command(s)
#Debian 	apt-get update; apt-get upgrade
#Red Hat 	yum update

#Debian 	dpkg --install package_file
#Red Hat 	rpm -U package_file

# Finding Which Package Installed A File

#Style 		#Command(s)
#Debian 	dpkg --search file_name
#Red Hat 	rpm -qf file_name

#################################################################################


sudo apt-get update					update repositories
sudo apt-get upgrade				upgrade everything installed with apt-get
sudo apt-get install (package)		install (package)
sudo apt-get remove (package)		remove (package)
sudo apt-cache searcg (package)		search for (package) in cache
cat /etc/apt/sourceslist			browse all repositories

# PPA = personal packaging archives
sudo add-apt-repository ppa:(repo name)		add a personal repository

# Installieren (Debian)
sudo apt-get install [package]
sudo dpkg -i [package]

sudo apt-get remove [package]
sudo apt-get upgrade

# Explanation of the Repository Format (/etc/apt/sources.list)

# deb-src http://ch.archive.ubuntu.com/ubuntu/ saucy main restricted
# [deb|deb-src] [repo URL] [linux release code name] [section name/component... separated by space]

sudo apt-get update		# run after editing sources.list

# Build Essentials 
sudo apt-get install build-essential

# Debian Lenny - Paket-Quellen Fix
# 0. su
# 1. nano /etc/apt/sources.list
#   deb http://ftp.de.debian.org/debian-archive/debian/ lenny main contrib
#   deb-src http://ftp.de.debian.org/debian-archive/debian/ lenny main contrib
# 2. apt-get update

# Sun Java
# 0. su
# 1. nano /etc/apt/sources.list
# 2. Trage deb [URL] lenny main contrib non-free ein
# 3. apt-get update
# 4. apt-get install sun-java6-jdk

# Fedora-based Virtual Box Guest Additions Hack (getestet mit CentOS 5.7)
#   1. sudo yum install gcc
#   2. uname -r
#   3. je angezeigter Kernel-Version RPM-Paket online besorgen bpsw. kernel-devel-2.6.18-274.17.1.el5.x86_64.rpm
#      (http://rpm.pbone.net/index.php3/stat/4/idpl/17517072/dir/scientific_linux_5/com/kernel-devel-2.6.18-274.17.1.el5.x86_64.rpm.html)
#      ggf. aktuellere aber nicht passende kernel-devel Packages deinstallieren mit:
#      sudo yum remove kernel-devel
#   4. VBox Additins ISO mounten
#   5. sudo bash ./VBoxLinuxAdditions.run

#################################################################################
# Comfort & Customizing - How can I configure the system to fit my needs?
#################################################################################

script my_script.txt		Zeichnet Bash Session auf / Exit mit Strg+D

alias newcommand='oldcommand para1 para2'   # ersetze oldcommand mit newcommand
#~/.bash_aliases
#~/.bashrc

# Aliases
alias						show all aliases in environment
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias list='ls -hal'
alias extract='tar xzf'
alias end='sudo kill -9'

# Shell functions make excellent replacements for aliases, and are actually the preferred
# method of creating small commands for personal use.

# Custom prompt
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \[\033[0;31m\][\d \t]: \[\033[0;32m\]"

#################################################################################
# Scheduling & Automation
#################################################################################

shutdown -r	now				# restart (sudo req)
shutdown -h	now				# hold / turn off (sudo req)
shutdown -h +60				# shut down in 1hr (sudo req)
poweroff					# shut down
init 0						# shutdown (run levels)

crontab –u [user] –l
crontab –u [user] –e

#################################################################################
# Bash Scripting - How can I write and read bash / batch scripts ?
#################################################################################

# Variablen	- Achtung: keine Spaces nach = !!!
#			- Achtung: Benutze '' Quotes, sonst wird Expansion-Mechanismus aktiviert

###################################################
# Shebang 
# = call script on console w/o interpreter
# First line in script:
# Python, e.g.
	
#!/usr/bin/env python
	
# Regular Bash:
	
#!/bin/bash

chmod +x myscript.py
chmod 755 myscript.py
./myscript.py

###################################################

variable='hallo'					# Wert setzen	
echo $variable						# verwenden

# Vgl. dagegen:
myVar=42
echo "Test $myVar"                  # Output: Test 42
echo 'Test $myVar'                  # Output: Test $myVar


# Use " \ " for linebreaks - for commands that span multiple lines

#variable names:
# 1. Variable names may consist of alphanumeric characters (letters and numbers) and underscore characters.
# 2. The first character of a variable name must be either a letter or an underscore.
# 3. Spaces and punctuation symbols are not allowed.

# Note that in an assignment, there must be no spaces between the variable name, the equals sign, and the value.
# the shell does not care about the type of data assigned to a variable; it treats them all as strings
# Multiple variable assignments may be done on a single line
# During expansion, variable names may be surrounded by optional curly braces “{}”

# constants - rarely used (declare as read only)
declare -r MY_CONSTANT="Value"

# integer - rarely used
declare -i my_int=1

a=z 					# Assign the string "z" to variable a.
b="a string" 			# Embedded spaces must be within quotes.
c="a string and $b" 	# Other expansions such as variables can be expanded into the assignment.
d=$(ls -l foo.txt) 		# Results of a command.
e=$((5 * 7)) 			# Arithmetic expansion.
f="\t\ta string\n" 		# Escape sequences such as tabs and newlines.

#Note: Ubuntu (and most other Debian-based distributions) automatically adds the
#~/bin directory to the PATH variable if the ~/bin directory exists when the
#user’s .bashrc file is executed

# "Here Document" - It’s mostly the same as echo, except that, by default, 
# single and double quotes within here documents lose their special meaning to the shell.

#command << token
#text
#token

cat << _EOF_
#line 1
#line 2
_EOF_

# Here documents can be used with any command that accepts standard input. In this example,
# we use a here document to pass a series of commands to the ftp program in order
# to retrieve a file from a remote FTP server:

# If we change the redirection operator from “<<” to “<<-”, the shell will ignore leading
# tab characters in the here document:

ftp -n <<- _EOF_
	open $FTP_SERVER
	user anonymous me@linuxbox
	cd $FTP_PATH
	hash
	get $REMOTE_FILE
	bye
	_EOF_
ls -l $REMOTE_FILE

# Shell Functions
# shell function definitions must appear in the script before they are called.

function name {
#commands
return 0		# optional integer -> return status
}

name () {
#commands
return 0		# optional integer -> return status
}

func_with_local_variables () {
	local foo # variable foo local to funct_2
	foo=2
}


# Return Values:
# stdout / e.g. echo output
# return keyword = just filling word / "NOP" / empty functions are not allowed

# Arguments:
# Similarly we can pass arguments to the functions separated with spaces as given below.

func_name $arg_1 $arg_2 $arg_3
# can be accesed with $1, $2 etc.
# also: global variables can be used

# Flow control:

if [ expr ]; then
#commands
elif [ expr ]; then
#commands
else
#commands
fi

# Exit status of previously executed command
echo $?
# true and false command
true	# return code 0
false	# return code 1

test 3 -eq 2	# ~ [ 3 -eq 2 ]

# It is interesting to note that both test and [ are actually commands. In bash they are
# builtins, but they also exist as programs in /usr/bin for use with other shells.
# man test shows all possible operators

[[ expression ]]		# regex support

(( )) 					# is used to perform arithmetic truth tests. An arithmetic truth test results in true if
						# the result of the arithmetic evaluation is non-zero.	
						
Operation 		test 		[[ ]] and (( ))
AND 			-a 			&&
OR 				-o 			||
NOT 			! 			!

command1 || command2	# if command1 fails => do command2
command1 && command2	# only if command1 is successful, execute command2

# while loop
# break, continue -> can be used to exit, skip to next iterationq
counter=1

while [[ $counter -le 5 ]]; do
	echo $counter
	count=$((counter + 1))
done


# until loop
counter=1

until [[ $counter -gt 5 ]]; do
	echo $counter
	count=$((counter + 1))
done


# Input								# Important: You Can’t Pipe read*
read [-options] [variableS...]		# reads one line of input from stdin, if no target variable is specified, shell variable REPLY will be used
read -s password_variable			# silent mode, no character printing
IFS=":"								# set variables separator to ":" instead of " " (space)

read user pw uid gid name home shell <<< "$file_info"	# here document used to compensate *

#################################

# FOR-Schleife
for p in $(cat myFile.txt)			# Für alle Datei-Einträge
	do
		# Anweisungen $p
	done
   
# FOR mit Counter   
for i in $(seq 22 28); do ssh 132.187.230.$i 'sudo /etc/init.d/hadoop-0.20-datanode stop'; done
	
for i in *.log*						# Für alle Dateien nach diesem Muster
	do
		# Anweisungen $i
	done

# Brace Expansion
ls myFile{1,2,3}.txt                # Listet myFile1.txt, myFile2.txt, myFile3.txt auf
echo {1..10}						# "For-Loop" / Range
echo {A..Z}							# Loops over alphabet
echo $(ls)							# command substitution
ls -l `which cp`					# command substitution using backquotes

# Berechnungen
# Calculations (https://www.shell-tips.com/2010/06/14/performing-math-calculation-in-bash/)

myVar=42
myCalc=$[$myVar%2]
myvar=$(expr 1 + 1)
expr $myvar + 1
let myvar+=1
let myvar2=myvar+1
myvar=$((myvar+3))
$((myvar++))

#################################################################################
# Specific Tools 
#################################################################################

#################################################################################
# vim - The best text editor around
#################################################################################

#vim is a substantial improvement over traditional Unix vi and is usually symbolically
#linked (or aliased) to the name “vi” on Linux systems.

# vim .vimrc
syntax on
set nu
set incsearch
set smartcase
set hlsearch
set history=1000         
set undolevels=1000     
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                
set visualbell           
set noerrorbells
# Switch between buffers w/o saving
set hidden


# Modes:
# Insert Mode	insert
# Normal Mode	no changes
# Command Mode	drastically alter the document

# Navigation:
# gg			get to the top of the file
# G				get to the end of the file
# 100G			line 100 -> goto
# 0				zeroth char of line
# $				last char of line
# /				forward search
# ?				backward search
# n/N			next result / previous result
# *				search for next occurence of the word under the cursor
# g*			unbounded search for word under cursor = also as substring
# i				insert mode

# Copy / Paste
# v				(visual) selection / like mouse drag selection
# y				copy character
# yw			copy word
# p				paste below cursor
# P				paste above cursor
# gg v G		select all
# dd			cut line
# yy			copy line
# p 			paste line
# d0			cut/delete from current char until beginning of line
# d$			cut/delete from current char until end of line
# dG			cut/delete from current line until end of file
# dd			cut/delete current line
# 5dd			cut/delete 5 lines
# J				join lines; current and below (=remove new line char from current line)
:r [filename]	inserts [filename]

# Undo / Redo
# Note: Real vi only supports a single level of undo. vim supports multiple levels.
# set history=1000 

# u				undo
# ctrl + r		redo

# m (number)	move current line after line (number)

# syntax on		syntax highlightning
# set number	line numbers

# Speed / Movement Hacks
# 	s				delete one character and enter insert mode
# 	S				delete one line and enter insert mode
#	a				jump to next char + insert mode
#	o				open new line (below cursor)
#	O				open new line (above cursor)
#   A				jump to EOL + insert mode
#	GA				append at end of file
#	w/b				first char of next/last "word"
# 	W/B				first char of next/last real word (whitespace)
# 	e/E				last char of next word/real word (whitespace) 

#	f[char]			find character [char] in current line and move cursor to it

:e [filename] # Open File [filename]

Esc			  				# Main Menu
i			  				# Insert Mode
a			  				# Append Mode

:q!			  				# Quit (force)
:wq			  				# Save and quit
:w [filename] 				# Save as

:n							# Next file
:N							# Previous  file
:buffers					# Show all buffers
:buffer 2					# Jump to buffer 2

# Search & Replace

/ [term]	  				# Search for [term] -> down
/? [term]     				# Search for [term] -> up
n			  				# Find next occurence of [term]
:%s/[term1]/[term2]/gc		# Search and replace (substitute) [term1] with [term2] in the whole file (global) (confirm)

####################################################
# sed
####################################################
# In summary, use sed:
# - To automate editing actions to be performed on one or more files.
# - To simplify the task of performing the same edits on multiple files.
# - To write conversion programs.
####################################################

# Print Zeile 1 bis 20 aus File
sed -n '1,20p' 

####################################################
# awk
####################################################
#- View a text file as a textual database made up of records and fields.
#- Use variables to manipulate the database.
#- Use arithmetic and string operators.
#- Use common programming constructs such as loops and conditionals.
#- Generate formatted reports.
#- Define functions.
#- Execute UNIX commands from a script.
#- Process the result of UNIX commands.
#- Process command-line arguments more gracefully.
#- Work more easily with multiple input streams.

factor [number]					# determines all prime factors of a number