#!/bin/bash
IP_ADDRESS=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')

cat >/etc/sysconfig/variables <<EOL
IP_ADDRESS=${IP_ADDRESS}
PUID=$(id brad)
PGID=$(id -g brad)
DOCKER_PUID=$(id docker)
DOCKER_PGID=$(id -g docker)
TZ="Europe/London"
DOMAIN="bcornford.co.uk"
PROVIDER=godaddy
GODADDY_API_KEY=dKi6zrrYrfbm_7b4Hs5j3XpamFwqL4MX1zA
GODADDY_API_SECRET=7b4nRm8bo1GYVXTfznBQHg
EOL

cat >/etc/sysconfig/credentials <<EOL
username=coreos
password=H2ov&c19Y@OB
domain=localdomain
EOL

cat >/etc/sysconfig/users <<EOL
admin:\$apr1\$ygiHLLqM\$uBpkXRPV8/dX2P9MWduX8/
EOL

systemctl daemon-reload
systemctl restart docker.service
