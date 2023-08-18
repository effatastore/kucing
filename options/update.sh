#!/bin/bash
#wget https://github.com/${GitUser}/
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
GitUser="effatastore"
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
                echo "OpenVZ is not supported"
                exit 1
fi
echo ""
version=$(cat /opt/.ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/kucing/main/version )
clear
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="$BIWhite($version)${Font_color_suffix}"
Info2="$BIWhite(LATEST VERSION)${Font_color_suffix}"
Error="Version $BIWhite[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /opt/.ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/kucing/main/newversion | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo ""
echo -e ""
echo -e " ┌─────────────────────────────────────────────────┐" | lolcat
echo -e " │                  MENU UPDATE                    │" | lolcat
echo -e " └─────────────────────────────────────────────────┘" | lolcat
echo -e "     VERSION NOW >> $Info1                   "
echo -e "     STATUS UPDATE >> $sts                   "
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "       ${BIRed}WOULD YOU LIKE TO PROCEED ?${NC}"
echo ""
echo -e "    $BIWhite[              SELECT OPTION                 ]${NC}"
echo -e ""
echo -e "    [1] CHECK UPDATE NOW${NC}"
echo -e "    [x] BACK TO MENU${NC}"
echo -e ""
echo -e "${BICyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e " ┌─────────────────────────────────────────────────┐" | lolcat
echo -e " │              EFFATA ID STORE                 │" | lolcat
echo -e " └─────────────────────────────────────────────────┘" | lolcat
echo -e ""
echo -e ""
read -p "      PLEASE CHOOSE 1 or x : " option2
case $option2 in
1)
version=$(cat /opt/.ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/kucing/main/newversion | grep $version )
if [ $version = $new_version ]; then
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[1;31mUpdate Not Available\e[m"
echo ""
sleep 1
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 2
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                  MENU UPDATE                    │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""
# UPDATE RUN-UPDATE
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/${GitUser}/kucing/main/options/update.sh"
chmod +x run-update
# RUN UPDATE
echo ""
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 3
cd /usr/bin
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/effatastore/kucing/main/add-ws.sh"
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/effatastore/kucing/main/add-ssws.sh"
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/effatastore/kucing/main/add-vless.sh"
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/effatastore/kucing/main/add-tr.sh"
wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/effatastore/kucing/main/usernew.sh"
wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/effatastore/kucing/main/options/autoreboot.sh"
wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/effatastore/kucing/main/options/restart.sh"
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/effatastore/kucing/main/options/tendang.sh"
wget -q -O /usr/bin/clearlog "https://raw.githubusercontent.com/effatastore/kucing/main/options/clearlog.sh"
wget -q -O /usr/bin/running "https://raw.githubusercontent.com/effatastore/kucing/main/options/running.sh"
#wget -q -O /usr/bin/cek-trafik "https://raw.githubusercontent.com/effatastore/kucing2/main/options/cek-trafik.sh"
wget -q -O /usr/bin/cek-bandwidth "https://raw.githubusercontent.com/effatastore/kucing/main/options/cek-bandwidth.sh"
wget -q -O /usr/bin/limitspeed "https://raw.githubusercontent.com/effatastore/kucing/main/options/limitspeed.sh"
wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-vless.sh"
wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-vmess.sh"
wget -q -O /usr/bin/menu-ss "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-ss.sh"
wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-trojan.sh"
wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-ssh.sh"
wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-backup.sh"
wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu.sh"
wget -q -O /usr/bin/webmin "https://raw.githubusercontent.com/effatastore/kucing/main/options/webmin.sh"
wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/effatastore/kucing/main/xp.sh"
wget -q -O /usr/bin/update "https://raw.githubusercontent.com/effatastore/kucing/main/options/update.sh"
#wget -q -O /usr/bin/menu-theme "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-theme.sh"
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/effatastore/kucing/main/options/info.sh"
wget -q -O /usr/bin/infoserv "https://raw.githubusercontent.com/effatastore/kucing/main/options/infoserv.sh"
wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/effatastore/kucing/main/menu/menu-set.sh"
wget -q -O /usr/bin/about "https://raw.githubusercontent.com/effatastore/kucing/main/options/about.sh"
chmod +x /usr/bin/add-ws
chmod +x /usr/bin/add-ssws
chmod +x /usr/bin/add-vless
chmod +x /usr/bin/add-tr
chmod +x /usr/bin/usernew
chmod +x /usr/bin/autoreboot
chmod +x /usr/bin/restart
chmod +x /usr/bin/tendang
chmod +x /usr/bin/clearlog
chmod +x /usr/bin/running
#chmod +x /usr/bin/cek-trafik
chmod +x /usr/bin/cek-speed
chmod +x /usr/bin/cek-bandwidth
chmod +x /usr/bin/limitspeed
chmod +x /usr/bin/menu-vless
chmod +x /usr/bin/menu-vmess
chmod +x /usr/bin/menu-ss
chmod +x /usr/bin/menu-trojan
chmod +x /usr/bin/menu-ssh
chmod +x /usr/bin/menu-backup
chmod +x /usr/bin/menu
chmod +x /usr/bin/webmin
chmod +x /usr/bin/xp
chmod +x /usr/bin/update
#chmod +x /usr/bin/menu-theme
chmod +x /usr/bin/info
chmod +x /usr/bin/infoserv
chmod +x /usr/bin/menu-set
chmod +x /usr/bin/about
clear
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/${GitUser}/kucing/main/version )
sleep 1
clear
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
clear
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
clear
echo -e ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 PROSES UPDATE                   │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /opt/.ver
rm -f update.sh
clear
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│                 SCRIPT UPDATED                  │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo ""
echo -e "┌─────────────────────────────────────────────────┐" | lolcat
echo -e "│              EFFATA ID STORE                 │" | lolcat
echo -e "└─────────────────────────────────────────────────┘" | lolcat
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
x)
clear
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
;;
esac
