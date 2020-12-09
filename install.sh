#!/bin/bash
FILE="$HOME/Masaüstü/E-Ag.desktop"
# init
version=$(uname -a|awk '{print $3}'|cut -c1-1)
#echo $version
ver=3

if [ $ver == $version ]
then
#**********************************************
echo "üç"
sudo apt-get install -f -y
sudo apt-get update
sudo systemctl stop E-AgClient.service
sudo systemctl disable E-AgClient.service
sudo dpkg -r client
sudo dpkg -r gclient
sudo dpkg -r myx11vnc
echo "Kurulum Başlatıldı."
sudo apt-get install vsftpd -y
echo "x11vnc Kurulumu Başlatıldı."
sudo apt-get install x11vnc -y
echo "vncviewer Kurulumu Başlatıldı."
sudo apt-get install xtightvncviewer
echo "ssh Kurulumu Başlatıldı."
sudo apt-get install openssh-server -y
echo "sshpass Kurulumu Başlatıldı."
sudo apt-get install sshpass
echo "arp Kurulumu Başlatıldı."
sudo apt-get install net-tools --reinstall
echo "arp Kopyalama Başlatıldı."
sudo cp /usr/sbin/arp /usr/bin/
echo "reboot Kopyalama Başlatıldı."
sudo cp /sbin/reboot /usr/bin/
echo "poweroff Kopyalama Başlatıldı."
sudo cp /sbin/poweroff /usr/bin/
echo "myx11vnc Kurulumu Başlatıldı."
sudo dpkg --force-all -i myx11vnc.deb
sudo rm /usr/bin/Client
sudo rm /usr/bin/GClient
#sudo dpkg --force-all -i Client.deb
#sudo dpkg --force-all -i GClient.deb
sudo mkdir /usr/share/E-Ag
sudo chmod 777 /usr/share/E-Ag
echo "xrdp Kurulumu Başlatıldı."
sudo apt-get install xrdp -y
echo "rdesktop Kurulumu Başlatıldı."
sudo apt-get install rdesktop -y
echo "Kurulum Tamamlandı.."
#***********************************************
sudo cp ./Client /usr/bin/Client
sudo cp ./GClient /usr/bin/GClient
sudo cp ./E-AgRunPrg.sh /usr/bin/E-AgRunPrg.sh
sudo cp ./E-AgClientxdglink.sh /usr/bin/E-AgClientxdglink.sh
sudo cp ./E-AgClient.service /lib/systemd/system/E-AgClient.service
sudo cp ./E-AgClientetcxdgautostart.desktop /etc/xdg/autostart/E-AgClientetcxdgautostart.desktop

sudo chmod a+x /usr/bin/Client
sudo chmod u+s /usr/bin/Client
sudo chown root /usr/bin/Client
sudo chgrp root /usr/bin/Client
sudo chmod a+x /usr/bin/GClient
sudo chmod u+s /usr/bin/GClient
sudo chown root /usr/bin/GClient
sudo chgrp root /usr/bin/GClient
sudo chmod 777 /usr/bin/E-AgRunPrg.sh

#************************************************
systemctl systemctl daemon-reload
systemctl enable E-AgClient.service
systemctl start E-AgClient.service

else
#**********************************************
sudo systemctl stop E-AgClient.service
sudo systemctl disable E-AgClient.service

sudo apt-get install -f -y
sudo apt-get update
echo "Kurulum Başlatıldı."
sudo dpkg -r client
sudo dpkg -r gclient
sudo dpkg -r myx11vnc
sudo apt-get install vsftpd -y
echo "x11vnc Kurulumu Başlatıldı."
sudo apt-get install x11vnc -y
echo "vncviewer Kurulumu Başlatıldı."
sudo apt-get install xtightvncviewer
echo "ssh Kurulumu Başlatıldı."
sudo apt-get install openssh-server -y
echo "sshpass Kurulumu Başlatıldı."
sudo apt-get install sshpass
echo "arp Kurulumu Başlatıldı."
sudo apt-get install net-tools --reinstall
echo "arp Kopyalama Başlatıldı."
sudo cp /usr/sbin/arp /usr/bin/
echo "reboot Kopyalama Başlatıldı."
sudo cp /sbin/reboot /usr/bin/
echo "poweroff Kopyalama Başlatıldı."
sudo cp /sbin/poweroff /usr/bin/
echo "x11remote Kurulumu Başlatıldı."
sudo dpkg --force-all -i myx11vnc19.deb
sudo systemctl disable E-AgClient.service
sudo systemctl stop E-AgClient.service
sudo rm /usr/bin/Client
sudo rm /usr/bin/GClient
#sudo ./eagclientekle.sh
#sudo mkdir /etc/lightdm/lightdm.conf.d/
#sudo sh -c 'printf "[Seat:*]\ngreeter-setup-script=/bin/sh -c \"nohup /usr/bin/Client &\"\n" >/etc/lightdm/lightdm.conf.d/50-kb-backlight.conf'
sudo mkdir /usr/share/E-Ag
sudo chmod 777 /usr/share/E-Ag
echo "xrdp Kurulumu Başlatıldı."
sudo apt-get install xrdp -y
echo "rdesktop Kurulumu Başlatıldı."
sudo apt-get install rdesktop -y
echo "Kurulum Tamamlandı.."
sudo cp ./Client /usr/bin/Client
sudo cp ./GClient /usr/bin/GClient
sudo cp ./E-AgRunPrg19.sh /usr/bin/E-AgRunPrg.sh
sudo cp ./E-AgClientxdglink.sh /usr/bin/E-AgClientxdglink.sh
sudo cp ./E-AgClient19.service /lib/systemd/system/E-AgClient.service
sudo cp ./E-AgClientetcxdgautostart19.desktop /etc/xdg/autostart/E-AgClientetcxdgautostart.desktop

sudo chmod a+x /usr/bin/Client
sudo chmod u+s /usr/bin/Client
sudo chown root /usr/bin/Client
sudo chgrp root /usr/bin/Client
sudo chmod a+x /usr/bin/GClient
sudo chmod u+s /usr/bin/GClient
sudo chown root /usr/bin/GClient
sudo chgrp root /usr/bin/GClient
sudo chmod 777 /usr/bin/E-AgRunPrg.sh
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/#WaylandEnable=true/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/WaylandEnable=true/WaylandEnable=false/' /etc/gdm3/daemon.conf
#*****************************************
systemctl systemctl daemon-reload
systemctl enable E-AgClient.service
systemctl start E-AgClient.service

fi

