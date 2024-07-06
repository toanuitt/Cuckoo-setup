# Cuckoo-setup
```bash
RELEASE=$(lsb_release -c | awk '{print $2}')

sudo echo deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $RELEASE contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```
# Install pip for python2.7
```bash
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
```
## get python2.7
```bash
sudo apt-add-repository universe

sudo apt update

sudo apt install python2-minimal
```
# Check Python2 version
```bash
python2 -V
```
# get pip
```bash
sudo python2.7 get-pip.py

sudo rm get-pip.py
```
# Update repos
```bash
sudo apt-get update && sudo apt-get upgrade -y

echo "[+] Installing dependencies"

sudo apt-get install unzip python2.7 python-setuptools python-dev libffi-dev libssl-dev libjpeg-dev zlib1g-dev swig mongodb postgresql libpq-dev tcpdump apparmor-utils libcap2-bin git vim tmux curl virtualbox-6.0 mlocate -y
```
# tcpdump specific configuration
```bash
sudo aa-disable /usr/sbin/tcpdump
```
# Add cuckoo user
```bash
sudo adduser cuckoo

sudo groupadd pcap

sudo usermod -a -G pcap cuckoo

sudo usermod -a -G vboxusers cuckoo
```
# Configure necessary capabilities for tcpdump binary
```bash
sudo chgrp pcap /usr/sbin/tcpdump

sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump

echo "[+] Installing mitmproxy"

wget https://snapshots.mitmproxy.org/6.0.2/mitmproxy-6.0.2-linux.tar.gz

gunzip -d mitmproxy-6.0.2-linux.tar.gz

tar -xvf mitmproxy-6.0.2-linux.tar

sudo mv mitmproxy /usr/bin/mitmproxy

sudo mv mitmweb /usr/bin/mitmweb

sudo mv mitmdump /usr/bin/mitmdump

sudo rm mitmproxy-6.0.2-linux.tar

echo "[+] Installing volatility"

wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip

unzip volatility_2.6_lin64_standalone.zip

sudo mv volatility_2.6_lin64_standalone/volatility_2.6_lin64_standalone /usr/bin/volatility

sudo rm -rf volatility_2.6_lin64_standalone*

echo "[+] Installing cucko..."

sudo pip2.7 install -U cuckoo
```
# Run cuckoo
```bash
cuckoo -d
```
# Modified 
Do the following changes in the conf files.
## cuckoo.conf
```bash
sudo nano ~/.cuckoo/conf/cuckoo.conf
```
![My Image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*gRa__SqaSJ5_ff_nEO6IqQ.png)
## auxiliary.conf
```bash
sudo nano ~/.cuckoo/conf/auxiliary.conf
```
![My Image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*geqlZv8WhRyNCvq6sI3xmA.png)
## virtualbox.conf
```bash
sudo nano ~/.cuckoo/conf/virtualbox.conf
```
![My Image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*rVuPBTp27H_-fCYmqvHGpw.png)
## processing.conf
```bash
sudo nano ~/.cuckoo/conf/processing.conf
```
![My Image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*geqlZv8WhRyNCvq6sI3xmA.png)
## reporting.conf
```bash
sudo nano ~/.cuckoo/conf/reporting.conf
```
![My Image](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*ht9rRc_1H345ta7EZzYzrw.png)

# Run web
```bash
cuckoo web
```


