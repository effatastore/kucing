echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/cobek/limit/vmess/ip`);
for user in "${data[@]}"
do
iplimit=$(cat /etc/cobek/limit/vmess/ip/$user)
ehh=$(cat /var/log/xray/vmess.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
cekcek=$(echo -e "$ehh" | wc -l);
if [[ $cekcek -gt $iplimit ]]; then
disable-vmess  $user $cekcek $iplimit "$ehh"
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 ]]; then
telegram-send --pre "$(log-vmess)" > /dev/null &
systemctl restart vmess-ws-orbit
systemctl restart vmess-ws-orbit1
systemctl restart vmess-ws
systemctl restart vmess-grpc
else
echo > /dev/null
fi
