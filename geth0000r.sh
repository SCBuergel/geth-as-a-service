sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt update
sudo apt install ethereum -y
sudo adduser --disabled-password --home /home/geth --shell /bin/bash --gecos "" geth
wget https://raw.githubusercontent.com/SCBuergel/geth-as-a-service/main/geth.service
sudo mv geth.service /etc/systemd/system/
sudo systemctl enable geth
sudo systemctl start geth
