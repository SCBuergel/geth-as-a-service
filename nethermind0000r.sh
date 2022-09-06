sudo adduser --disabled-password --home /home/nethermind --shell /bin/bash --gecos "" nethermind
wget -O- https://api.github.com/repos/NethermindEth/nethermind/releases/latest | grep nethermind-linux-amd64 | grep browser_download_url | sed "/\"browser_download_url\": \"/s///" | sed "/\"/s///" | xargs wget
sudo unzip *.zip -d /home/nethermind
sudo echo '
NETHERMIND_CONFIG="mainnet_pruned"
NETHERMIND_JSONRPCCONFIG_ENABLED=true
NETHERMIND_JSONRPCCONFIG_HOST="0.0.0.0"
NETHERMIND_HEALTHCHECKSCONFIG_ENABLED="true"
' | sudo tee /home/nethermind/.env
sudo bash -c 'echo "nethermind soft nofile 1000000" > /etc/security/limits.d/nethermind.conf'
sudo bash -c 'echo "nethermind hard nofile 1000000" >> /etc/security/limits.d/nethermind.conf'
wget https://raw.githubusercontent.com/SCBuergel/geth-as-a-service/main/nethermind.service
sudo mv nethermind.service /etc/systemd/system/
sudo systemctl enable nethermind
sudo systemctl start nethermind
