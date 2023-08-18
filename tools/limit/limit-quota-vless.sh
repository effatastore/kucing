#!/bin/bash
data=( `ls /etc/cobek/limit/vless/quota`);
for user in "${data[@]}"
do
vlimit=$(cat /etc/cobek/limit/vless/quota/$user)
vasli=$(cat /etc/cobek/vless/$user)
if [[ $vasli -gt $vlimit ]]; then
sed -i "/$user/d" /etc/xray/vless*
rm /etc/cobek/vless/$user
rm /etc/cobek/cache/*/$user
rm /etc/cobek/limit/vless/quota/$user
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
systemctl restart vless-ws
systemctl restart vless-grpc
else
echo > /dev/null
fi