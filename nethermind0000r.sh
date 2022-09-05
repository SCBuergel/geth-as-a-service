sudo add-apt-repository ppa:nethermindeth/nethermind -y
sudo apt update
sudo apt install nethermind -y
sudo adduser --disabled-password --home /home/nethermind --shell /bin/bash --gecos "" nethermind
echo '
NETHERMIND_CONFIG="mainnet_pruned"
NETHERMIND_JSONRPCCONFIG_ENABLED=true
NETHERMIND_JSONRPCCONFIG_HOST="0.0.0.0"
NETHERMIND_HEALTHCHECKSCONFIG_ENABLED="true"
' >> /home/nethermind/.env
sudo bash -c 'echo "nethermind soft nofile 1000000" > /etc/security/limits.d/nethermind.conf'
sudo bash -c 'echo "nethermind hard nofile 1000000" >> /etc/security/limits.d/nethermind.conf'
wget https://raw.githubusercontent.com/SCBuergel/geth-as-a-service/main/nethermind.service
sudo mv nethermind.service /etc/systemd/system/
sudo systemctl enable nethermind
sudo systemctl start nethermind
