sudo apt-get update
sudo apt-get install xfce4 xfce4-terminal
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer -y

echo -e "123456" >>  ~/.vnc/
vncserver -depth 32 -geometry 1680x1050
