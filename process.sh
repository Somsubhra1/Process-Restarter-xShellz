#!/bin/bash

# Process Restarter provision script, written by Som
set -e
set -u

_author="Som / somsubhra1 [at] xshellz.com"
_package="Process Re-starter"
_version="1.5"

echo "Running provision for package $_package version: $_version by $_author"

cd ~

#ZNC

if [[ $pname == "znc" ]]
then

 if pgrep znc >/dev/null 2>&1
 then
 echo "ZNC is already running. Aborting startup"
 exit 
 fi 

 if [ -d ".znc" ] || [ -d *ZNC* ] ;
 then
 echo "ZNC Directory found. Starting ZNC"
 znc 

 if pgrep znc >/dev/null 2>&1
 then
 echo "ZNC started successfully"
 else
 echo "ZNC startup failed. Exiting"
 exit
 fi

 else
 echo "ZNC directory not found in $HOME. Aborting startup."
 exit
 fi

 #Eggdrop

elif [[ $pname == "eggdrop" ]]
then

 if pgrep eggdrop >/dev/null 2>&1
 then
 echo "Eggdrop is already running. Aborting startup"
 exit 
 fi

 if [ -f $filename ]
 then
 echo "Eggdrop Configuration file found. Starting Eggdrop"
 ./eggdrop $filename

 if pgrep eggdrop >/dev/null 2>&1
 then
 echo "Eggdrop started successfully"
 else
 echo "Eggdrop startup failed. Exiting"
 exit
 fi
 
 else
 echo "Eggdrop Confuguration file not found in $HOME. Aborting startup."
 exit
 fi

 #Unreal

elif [[ $pname == "unreal" ]]
then

 if pgrep unrealircd >/dev/null 2>&1
 then
 echo "UnrealIRCd is already running. Aborting startup"
 exit 
 fi

 if [ -d "Unreal3.2.10.4" ]
 then
 echo "UnrealIRCd directory found. Starting UnrealIRCd"
 cd 'Unreal3.2.10.4'
 ./unreal start
 
 if pgrep unrealircd >/dev/null 2>&1
 then
 echo "UnrealIRCd started successfully"
 else
 echo "UnrealIRCd startup failed. Exiting"
 exit
 fi

 else
 echo "UnrealIRCd directory not found in $HOME. Aborting startup."
 exit
 fi

 #psybnc

elif [[ $pname == "psybnc" ]]
then

 if pgrep psybnc >/dev/null 2>&1
 then
 echo "psyBNC is already running. Aborting startup"
 exit 
 fi

 if [ -d "psybnc" ]
 then
 echo "psyBNC directory found. Starting psyBNC"
 cd 'psybnc'
 ./psybnc
 
 if pgrep psybnc >/dev/null 2>&1
 then
 echo "psyBNC started successfully"
 else
 echo "psyBNC startup failed. Exiting"
 exit
 fi

 else
 echo "psyBNC directory not found in $HOME. Aborting startup."
 exit
 fi
 
 #anope

 elif [[ $pname == "anope" ]]
then

 if pgrep services >/dev/null 2>&1
 then
 echo "Anope is already running. Aborting startup"
 exit 
 fi

 if [ -d "services" ]
 then
 echo "Anope directory found. Starting Anope"
 cd 'services'
 ./services
 
 if pgrep services >/dev/null 2>&1
 then
 echo "services started successfully"
 else
 echo "services startup failed. Exiting"
 exit
 fi

 else
 echo "Anope directory not found in $HOME. Aborting startup."
 exit
 fi

 #BOPM

 elif [[ $pname == "bopm" ]]
then

 if pgrep bopm >/dev/null 2>&1
 then
 echo "BOPM is already running. Aborting startup"
 exit 
 fi

 if [ -d "bopm" ]
 then
 echo "BOPM directory found. Starting BOPM"
 cd bopm/bin
 ./bopm
 
 if pgrep bopm >/dev/null 2>&1
 then
 echo "BOPM started successfully"
 else
 echo "BOPM startup failed. Exiting"
 exit
 fi

 else
 echo "BOPM directory not found in $HOME. Aborting startup."
 exit
 fi

 #sBNC

 elif [[ $pname == "sbnc" ]]
then

 if pgrep sbnc >/dev/null 2>&1
 then
 echo "sBNC is already running. Aborting startup"
 exit 
 fi

 if [ -d "bnc" ]
 then
 echo "sBNC directory found. Starting sBNC"
 cd bnc/bin
 ./sbnc --config $HOME/bnc
 
 if pgrep sbnc >/dev/null 2>&1
 then
 echo "sBNC started successfully"
 else
 echo "sBNC startup failed. Exiting"
 exit
 fi

 #InspIRCd

 elif [[ $pname == "inspircd" ]]
then

 if pgrep inspircd >/dev/null 2>&1
 then
 echo "InspIRCd is already running. Aborting startup"
 exit 
 fi

 if [ -d "inspircd-2.0.24" ]
 then
 echo "InspIRCd directory found. Starting InspIRCd"
 cd 'inspircd-2.0.24'
 ./inspircd start
 
 if pgrep inspircd >/dev/null 2>&1
 then
 echo "InspIRCd started successfully"
 else
 echo "InspIRCd startup failed. Exiting"
 exit
 fi

 else
 echo "InspIRCd directory not found in $HOME. Aborting startup."
 exit
 fi
 
 #help

elif [[ $pname == "help" ]]
then
 echo "Help commands:"
 echo "Type znc in process name to start znc"
 echo "Type eggdrop in process name to start eggdrop. Also provide the filename of eggdrop"
 echo "Type unreal in process name to start UnrealIRCd"
 echo "Type psybnc in process name to start psyBNC"
 echo "Type anope in process name to start Anope"
 echo "Type bopm in process name to start BOPM"
 echo "Type sbnc in process name to start shroudBNC"
 echo "Type inspircd in process name to start InspIRCd"
 echo "More processes will be added soon"
 exit

 #default

elif [[ $pname == * ]]
then
 echo "Wrong process name. Please type help in process name field to get the process names. Also please note that process names are CASE SENSITIVE!"
 exit
fi

echo "Provision done, successfully."
			