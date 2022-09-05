# geth-as-a-service
This is a minimal ubuntu service to run [go-ethereum](https://github.com/ethereum/go-ethereum) on a server. Please install the latest version of geth first. Alternative, the geth installation and all below steps are included when running the `geth0000r.sh` script.

1. Create `geth` user, for security purposes this user will run geth without admin priviledges) and it has no password
```
sudo adduser --disabled-password --home /home/geth --shell /bin/bash --gecos "" geth
```

2. Copy the `geth.service` file into `/etc/systemd/system/geth.service`. This will start geth on system boot automatially, it has the http server enabled but is only accepting requests from within the VPN (to be configured separately), increases cache to 8GB for a faster sync and has cors enabled so that you can use the endpoint e.g. from Metamask on Firefox on your remote laptop.

3. Enable and start geth service
```
sudo systemctl enable geth
sudo systemctl start geth
```

4. Check if the geth service is running in list of services
```
systemctl list-units --all --type=service --no-pager
```

5. Check output of geth:
```
journalctl -u geth.service
```
