#!/bin/bash
#CRSe7en2nd

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }


# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
BURIQ () {
    curl -sS https://raw.githubusercontent.com/effatastore/taikucing/main/mek > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/effatastore/taikucing/main/mek | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/effatastore/taikucing/main/mek | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear
domain=$(cat /etc/xray/domain)
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│              CREATE TROJAN ACCOUNT              │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
read -p "Username         : " user
read -p "Quota (GB)       : " quota
read -p "Max Ip login     : " iplimit
read -p "Masaaktif        : " masaaktif
#QUOTA
if [[ $quota -gt 0 ]]; then
echo -e "$[$quota * 1024 * 1024 * 1024]" > /etc/cobek/limit/trojan/quota/$user
else
echo > /dev/null
fi

#IPLIMIT
if [[ $iplimit -gt 0 ]]; then
echo -e "$iplimit" > /etc/cobek/limit/trojan/ip/$user
else
echo > /dev/null
fi

		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)
		
		if [[ ${user_EXISTS} == '1' ]]; then
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│              CREATE TROJAN ACCOUNT              │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
			read -n 1 -s -r -p "Press any key to back on menu"
			trojan-menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  TROJAN ACCOUNT                 │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat                  
echo -e ""                
echo -e "Username     : $user"
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : ${domain}" 
echo -e "Port         : 443" 
echo -e "Key          : ${uuid}" 
echo -e "Path         : /trojan-ws"
echo -e "ServiceName  : trojan-grpc" 
echo -e ""  
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                
echo -e "Link Ws  => ${trojanlink}"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                 
echo -e "Link Grpc => ${trojanlink1}"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"                
echo -e "Expired => $exp"
echo -e "${BIBlue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}" 
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                EFFATA ID STORE                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e ""              
read -n 1 -s -r -p "Press any key to back on menu"
menu
