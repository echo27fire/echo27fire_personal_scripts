#!/bin/bash
sudo -is
cd /etc/wireguard
umask 077
wg genkey | tee server.key | wg pubkey > server.pub
sudo nano /etc/wireguard/wg0.conf


echo "PrivateKey = $(cat server.key)" >> /etc/wireguard/wg0.conf

sudo systemctl enable wg-quick@wg0.service
sudo systemctl daemon-reload
sudo systemctl start wg-quick@wg0


cd /etc/wireguard
umask 077
name="MyPhone"
wg genkey | tee "${name}.key" | wg pubkey > "${name}.pub"

wg genpsk > "${name}.psk"

echo "[Peer]" >> /etc/wireguard/wg0.conf
echo "PublicKey = $(cat "${name}.pub")" >> /etc/wireguard/wg0.conf
echo "PresharedKey = $(cat "${name}.psk")" >> /etc/wireguard/wg0.conf
echo "AllowedIPs = 10.100.0.2/32, fd08:4711::2/128" >> /etc/wireguard/wg0.conf

systemctl restart wg-quick@wg0

echo "[Interface]" > "${name}.conf"
echo "Address = 10.100.0.2/32, fd08:4711::2/128" >> "${name}.conf" # May need editing
echo "DNS = 45.56.107.53" >> "${name}.conf"                          # Your Pi-hole's IP

echo "PrivateKey = $(cat "${name}.key")" >> "${name}.conf"

echo "PublicKey = $(cat server.pub)" >> "${name}.conf"
echo "PresharedKey = $(cat "${name}.psk")" >> "${name}.conf"
