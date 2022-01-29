sudo apt-get update
sudo apt-get install xfce4 xfce4-terminal -y > /dev/null 2>&1
sudo apt install tigtvncserver expect -y
expect -c 'set timeout 3;spawn /usr/bin/vncpasswd;expect "*?assword:*";send -- "123456\r";expect "*?erify:*";send -- "123456\r";expect "*?view-only password*";send -- "n\r";send -- "\r";expect eof' && \

vncserver -depth 32 -geometry 1680x1050
