#!/bin/bash

	##Written by Plombly#5139,

	##CEO of Nodecade.IT

	##Message me on Discord for and questions you may have.

	##Please make changes at your own will, and branch them to support others!
	
	
clear
echo "$(tput setaf 0)$(tput setab 7)You are about to deploy a minecraft vanilla server!$(tput sgr 0)"
    sleep 5s
    clear
    ##Variables
    read -p "$(tput setaf 0)$(tput setab 7)Enter the order id of server. I.E. orderid:$(tput sgr 0)" orderid
    read -p "Is minecraft-$orderid correct? (Y or N)" answer1
    if [ "$answer1" != "${answer1#[Yy]}" ] ;then
    clear

    ##Where your jar file is
    minecraftjar="/home/executables/minecraft/minecraft_server.1.13.jar"

    ##Jar file name
    jar="minecraft_server.1.13.jar"

    ##Install directory and directory creation
    installdir="/home/minecraft-$orderid"
    echo "$(tput setaf 1)$(tput setab 7)WARNING: You are passing the point of no return, PLEASE do not Ctrl+C$(tput sgr 0)"
    sleep 3s
    mkdir $installdir
    cd $installdir
    cp $minecraftjar $installdir
    sleep 1s
    clear
    echo "#/.bin/bash" > $installdir/run.sh
    echo " " >> $installdir/run.sh

    ##This is where it askes for RAM
    read -p "How many Gigabytes of ram is the server? (2-4-8)" answerram
    if [ "$answerram" != "${answerram#[2]}" ] ;then
      echo "java -Xms2048M -Xmx2565M -jar $jar -o true" >> $installdir/run.sh
      echo "2 Gigabytes"
    fi
    if [ "$answerram" != "${answerram#[4]}" ] ;then
      echo "java -Xms4086M -Xmx4589M -jar $jar -o true" >> $installdir/run.sh
      echo "4 Gigabytes"
    fi
    if [ "$answerram" != "${answerram#[8]}" ] ;then
      echo "java -Xms1024M -Xmx8046M -jar $jar -o true" >> $installdir/run.sh
      echo "8 Gigabytes"
    fi
    clear

    ##First time server startup
    echo "$(tput setaf 0)$(tput setab 7)The new server is about to run.$(tput sgr 0)"
    sh run.sh
    clear

    ##EULA Stuff
    echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eul$
    echo "#" >> eula.txt
    echo "eula=true" >> eula.txt

    ##Second server start
    echo "$(tput setaf 0)$(tput setab 7)the server is about to start again, please type STOP after it is loaded!$(tput sgr 0)"
    sh run.sh
    clear

    ##More run.sh changes
    if [ "$answerram" != "${answerram#[2]}" ] ;then
      echo "#!/bin/bash" > $installdir/run.sh
      echo " " >> $installdir/run.sh
      echo "screen -dmS "minecraft-$orderid" java -Xms512M -Xmx2565M -jar $jar -o true" >> $installdir/run.sh
    fi
    if [ "$answerram" != "${answerram#[4]}" ] ;then
      echo "#!/bin/bash" > $installdir/run.sh
      echo " " >> $installdir/run.sh
      echo "screen -dmS "minecraft-$orderid" java -Xms512M -Xmx4589M -jar $jar -o true" >> $installdir/run.sh
    fi
    if [ "$answerram" != "${answerram#[8]}" ] ;then
      echo "#!/bin/bash" > $installdir/run.sh
      echo " " >> $installdir/run.sh
      echo "screen -dmS "minecraft-$orderid" java -Xms512M -Xmx8046M -jar $jar -o true" >> $installdir/run.sh
    fi

    ##Server.properties changes
    read -p "$(tput setaf 0)$(tput setab 7)What is the port of the Server?$(tput sgr 0)" answerport
    read -p "$(tput setaf 0)$(tput setab 7)What is the rcon port of the Server? (Useually the server port +1, I,E, serverport: 25565 rconport 25566)$(tput sgr 0)" answerrconport
    read -p "$(tput setaf 0)$(tput setab 7)What is the rcon password of the Server?$(tput sgr 0)" answerrconpass
      clear
   ##Reinstalling server.properties
      echo "#Minecraft server properties
	#Wed Mar 13 17:33:43 CST 2019
	spawn-protection=16
	generator-settings=
	force-gamemode=false
	allow-nether=true
	enforce-whitelist=false
	gamemode=0
	broadcast-console-to-ops=true
	enable-query=false
	player-idle-timeout=0
	difficulty=1
	spawn-monsters=true
	broadcast-rcon-to-ops=true
	op-permission-level=3
	pvp=true
	snooper-enabled=true
	level-type=DEFAULT
	hardcore=false
	enable-command-block=false
	max-players=20
	network-compression-threshold=256
	resource-pack-sha1=
	max-world-size=29999984
	rcon.port=$answerrconport
	server-port=$answerport
	debug=false
	server-ip=
	spawn-npcs=true
	allow-flight=false
	level-name=world
	view-distance=10
	resource-pack=
	spawn-animals=true
	white-list=false
	rcon.password=$answerrconpass
	generate-structures=true
	max-build-height=256
	online-mode=true
	level-seed=
	prevent-proxy-connections=false
	use-native-transport=true
	enable-rcon=true
	motd=Minecraft server for $orderid" > server.properties

        sleep 2s

      ##Auto Moderation

      chmod 777 $installdir
      chmod +x run.sh
      clear

      ##The End

      echo "$(tput setaf 0)$(tput setab 7)The server is now deployed/running at $installdir$(tput sgr 0)"
      sh run.sh
      sleep 2
      screen -list
       sleep 5s

      else

	echo "no changes were made!"
fi
