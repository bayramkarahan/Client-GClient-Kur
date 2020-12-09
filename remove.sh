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
sudo systemctl stop x11vnc.service
sudo systemctl disable x11vnc.service

sudo dpkg -r client
sudo dpkg -r gclient
sudo dpkg -r myx11vnc
echo "Kurulum Başlatıldı."
sudo apt-get remove vsftpd -y
echo "x11vnc Kurulumu Başlatıldı."
sudo apt-get remove x11vnc -y
echo "vncviewer Kurulumu Başlatıldı."
sudo apt-get remove xtightvncviewer
echo "ssh Kurulumu Başlatıldı."
sudo apt-get remove openssh-server -y
echo "sshpass Kurulumu Başlatıldı."
sudo apt-get remove sshpass
echo "arp Kurulumu Başlatıldı."
sudo apt-get remove net-tools --reinstall
echo "arp Kopyalama Başlatıldı."
sudo cp /usr/sbin/arp /usr/bin/
echo "reboot Kopyalama Başlatıldı."
sudo cp /sbin/reboot /usr/bin/
echo "poweroff Kopyalama Başlatıldı."
sudo cp /sbin/poweroff /usr/bin/
echo "myx11vnc Kurulumu Başlatıldı."
sudo dpkg --force-all -r myx11vnc.deb
#sudo dpkg --force-all -i Client.deb
#sudo dpkg --force-all -i GClient.deb
sudo mkdir /usr/share/E-Ag
sudo chmod 777 /usr/share/E-Ag
echo "xrdp Kurulumu Başlatıldı."
sudo apt-get remove xrdp -y
echo "rdesktop Kurulumu Başlatıldı."
sudo apt-get remove rdesktop -y
echo "Kurulum Tamamlandı.."
#***********************************************
sudo rm -rf /usr/bin/Client
sudo rm -rf /usr/bin/GClient
sudo rm -rf /usr/bin/E-AgRunPrg.sh
sudo rm -rf /usr/bin/E-AgClientxdglink.sh
sudo rm -rf /lib/systemd/system/E-AgClient.service
sudo rm -rf /etc/xdg/autostart/E-AgClientetcxdgautostart.desktop

#************************************************
systemctl systemctl daemon-reload
else
#**********************************************
sudo systemctl stop E-AgClient.service
sudo systemctl disable E-AgClient.service
sudo systemctl stop x11vnc.service
sudo systemctl disable x11vnc.service

sudo apt-get install -f -y
sudo apt-get update
echo "Kurulum Başlatıldı."
sudo dpkg -r client
sudo dpkg -r gclient
sudo dpkg -r myx11vnc
sudo apt-get remove vsftpd -y
echo "x11vnc Kurulumu Başlatıldı."
sudo apt-get remove x11vnc -y
echo "vncviewer Kurulumu Başlatıldı."
sudo apt-get remove xtightvncviewer
echo "ssh Kurulumu Başlatıldı."
sudo apt-get remove openssh-server -y
echo "sshpass Kurulumu Başlatıldı."
sudo apt-get remove sshpass
echo "arp Kurulumu Başlatıldı."
sudo apt-get remove net-tools --reinstall
echo "arp Kopyalama Başlatıldı."
sudo cp /usr/sbin/arp /usr/bin/
echo "reboot Kopyalama Başlatıldı."
sudo cp /sbin/reboot /usr/bin/
echo "poweroff Kopyalama Başlatıldı."
sudo cp /sbin/poweroff /usr/bin/
echo "x11remote Kurulumu Başlatıldı."
sudo dpkg --force-all -r myx11vnc19.deb
sudo systemctl disable E-AgClient.service
sudo systemctl stop E-AgClient.service
#sudo dpkg --force-all -i Client.deb
#sudo dpkg --force-all -i GClient.deb

#sudo ./eagclientekle.sh
#sudo mkdir /etc/lightdm/lightdm.conf.d/
#sudo sh -c 'printf "[Seat:*]\ngreeter-setup-script=/bin/sh -c \"nohup /usr/bin/Client &\"\n" >/etc/lightdm/lightdm.conf.d/50-kb-backlight.conf'
sudo mkdir /usr/share/E-Ag
sudo chmod 777 /usr/share/E-Ag
echo "xrdp Kurulumu Başlatıldı."
sudo apt-get remove xrdp -y
echo "rdesktop Kurulumu Başlatıldı."
sudo apt-get remove rdesktop -y
echo "Kurulum Tamamlandı.."
sudo rm -rf /usr/bin/Client
sudo rm -rf /usr/bin/GClient
sudo rm -rf /usr/bin/E-AgRunPrg.sh
sudo rm -rf /usr/bin/E-AgClientxdglink.sh
sudo rm -rf /lib/systemd/system/E-AgClient.service
sudo rm -rf /etc/xdg/autostart/E-AgClientetcxdgautostart.desktop

sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/#WaylandEnable=true/WaylandEnable=false/' /etc/gdm3/daemon.conf
sudo sed -i 's/WaylandEnable=true/WaylandEnable=false/' /etc/gdm3/daemon.conf
#*****************************************
systemctl systemctl daemon-reload

fi

