#!/bin/bash
# -*- ENCODING: UTF-8 -*-

arg=$1
id=$2
lin2="·┉┅━━━━━━━━━━━━━━━━━━┅┉··"
lin="════════════════════════" && tit="[✓]│█▓▒░ 𝙏𝙞𝙚𝙣𝙙𝙖𝙎𝙎𝙃 ░▒▓█▕[✓]" && fin="• ────────────────── •\n"
#HORA Y FECHA
hora_fecha(){
	unset _hora
	unset _fecha
	_hora=$(printf '%(%H:%M:%S)T') 
	_fecha=$(printf '%(%D)T')
}

#PROCESSADOR
cpu(){
		unset _core
		unset _usop
		_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
		_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
}

#MEMORIA RAM
ram(){
		unset ram1
		unset ram2
		unset ram3
		ram1=$(free -h | grep -i mem | awk {'print $2'})
		ram2=$(free -h | grep -i mem | awk {'print $4'})
		ram3=$(free -h | grep -i mem | awk {'print $3'})

		unset _ram
		unset _usor
		_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
		_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
}

#SISTEMA
sistema(){
		unset os_sys
		os_sys=$(echo $(cat -n /etc/issue |grep 1 |cut -d' ' -f6,7,8 |sed 's/1//' |sed 's/      //')) && echo $system|awk '{print $1, $2}'
}

meu_ip () {
		MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
		MIP2=$(wget -qO- ipv4.icanhazip.com)
		[[ "$MIP" != "$MIP2" ]] && echo "$MIP2" || echo "$MIP"
}
clave_latam(){
clave=$(echo "$(openssl rand -hex 6)-$(openssl rand -hex 4)-$(openssl rand -hex 4)-$(openssl rand -hex 6)")
key=$clave && h=$(printf '%(%H%M%S)T') && dirA="/var/www/html/"
 dwsn(){
 echo "${key}"
 mkdir -p /var/www/html/LATAM/${key}
 echo "clave_valida" > /var/www/html/LATAM/${key}/key
 }
dwsn
}
clave_casita(){
clave=$(echo "$(openssl rand -hex 6)-$(openssl rand -hex 4)-$(openssl rand -hex 4)-$(openssl rand -hex 6)")
key=$clave && h=$(printf '%(%H%M%S)T') && dirA="/var/www/html/"
 dwsn(){
 echo "${key}"
 mkdir -p /var/www/html/LATAM/${key}
 echo "clave_valida" > /var/www/html/LATAM/${key}/key
 }
dwsn

}
#https://gist.githubusercontent.com/drowkid-1/0a1d399aa7edde7b3d837eb6098f95cc/raw/3dad3a06e8f05cde8667bcf4f4ff8aaa2
clave_chumo(){
clave=$(echo "$(openssl rand -hex 6)-$(openssl rand -hex 4)-$(openssl rand -hex 4)-$(openssl rand -hex 6)")
key=$clave && h=$(printf '%(%H%M%S)T') && dirA="/var/www/html/"
 dwsn(){
 echo "${key}"
 mkdir -p /var/www/html/CHUMO/${key}
 echo "clave_valida" > /var/www/html/CHUMO/${key}/key
 }
dwsn
}
menu_fun(){
	       hora_fecha
	       cpu
	       ram
	       sistema

	       unset PID_GEN
		   PID_GEN=$(ps x|grep -v grep|grep "http-server.sh")
		   [[ ! $PID_GEN ]] && PID_GEN='(Offlin2) ❌' || PID_GEN='(Onlin2) ✅'

		   unset usadas
		   usadas="$(cat /etc/http-instas)"
		   [[ ! $usadas ]] && k_used="0" || k_used="$usadas"
		  
	       bot_retorno="$lin2\n"
	       bot_retorno+="𝙁𝙚𝙘𝙝𝙖:$_fecha ┋┋𝙃𝙤𝙧𝙖:$_hora \n"
	       bot_retorno+="$lin2\n"
	       bot_retorno+="𝙄𝙋: $(wget -qO- ipv4.icanhazip.com)\n"
	       bot_retorno+="$lin2\n"
	       bot_retorno+="[𝙍𝘼𝙈: $ram1 ┋┋ 𝙀𝙉 𝙐𝙎𝙊: $_usor]\n"
	       bot_retorno+="[𝙐𝙎𝘼𝘿𝘼: $ram3┋┋𝙇𝙄𝘽𝙍𝙀: $ram2]\n"
	       bot_retorno+="$lin2\n"
	       bot_retorno+="𝘾𝙋𝙐: $_core ┋┋ En Uso: $_usop\n"
	       bot_retorno+="$lin2\n"
	       bot_retorno+="ℙ𝕒𝕣𝕒 𝕘𝕖𝕟𝕖𝕣𝕒𝕣 𝕜𝕖𝕪𝕤 𝕦𝕤𝕖:\n"
	       bot_retorno+="/keychumo | /keylatam | /keycasita | /keyrufus"
	       bot_retorno+="$lin2"
}

case $arg in
	admin)
		   menu_fun
		;;
	 user)
		   hora_fecha

	       bot_retorno="$lin2\n"
	       bot_retorno+="/menu (menu principal)\n"
	       bot_retorno+="	𝐊𝐄𝐘𝐒𝐆𝐄𝐍:\n"
	       bot_retorno+="/keylatam"
	       bot_retorno+="/keychumo"
	       bot_retorno+="/keycasita"
		;;
  no_user)
	       bot_retorno="━━━━━━━ COMANDOS ━━━━━━━\n"
	       bot_retorno+="/ask (Pedir autorización)\n"
	       bot_retorno+="$lin2"
		;;
	 on/off)

		   unset PIDGEN
		   PIDGEN=$(ps aux|grep -v grep|grep "http-server.sh")
		   if [[ ! $PIDGEN ]]; then
		   screen -dmS generador /bin/http-server.sh -start
		   else
		   killall http-server.sh
		   fi

		   menu_fun
		;;
	refresh)
		   sync
		   sysctl -w vm.drop_caches=3 &>/dev/null

		   ram

		   bot_retorno="<u>Ram refrescada.</u>\n\n"
		   bot_retorno+="━━━━━ Estado  actual ━━━━━\n"
		   bot_retorno+="  Ram: $ram1 || EN Uso: $_usor\n"
		   bot_retorno+="  USADA: $ram3 || LIBRE: $ram2\n"
		   bot_retorno+="━━━━━━━━━━━━━━━━━━━━━"
		;;

     keycasita)
		   [[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="cabecalho menu_credito ferramentas menu_inst PPub.py usercodes payloads PDirect.py v-local.log PGet.py ultrahost menu POpen.py shadowsocks.sh fai2ban PPriv.py"
		   SCPT_DIR="/etc/SCRIPT"
		   [[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
		   DIR="/etc/http-shell"
		   LIST="$(echo 'drowk-' | rev)"

		   valuekey="$(date | md5sum | head -c10)"
		   valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
		   fun_list "$valuekey"
		   keyfinal=$(ofus "$(meu_ip):8888/$valuekey/$LIST")


		   bot_retorno+="$tit\n$lin2\n"
		   bot_retorno+="       | 𝕽𝖊𝖘𝖘 : <tg-spoiler> @tiendasshgen_BOT</tg-spoiler> |\n"
#		   bot_retorno+="🔑<pre>$(clave_latam)</pre>🔑\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="🔑<pre>qra-atsil/04D52eD1f15944c/8888:01C1@CD41C521</pre>🔑\n"
#		   bot_retorno+="<pre>$(source $(pwd)/keycasi)</pre>\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="🚀 𝐋𝐢𝐧𝐤 𝐕𝟑.𝟎: 🚀\n"
	 	   bot_retorno+='<pre>apt-get update -y;apt-get upgrade -y && wget https://raw.githubusercontent.com/tiendasshgen_BOT/LACASITA/main/LACASITA.sh && chmod +x LACASITA.sh && ./LACASITA.sh</pre>\n'
		   bot_retorno+="$lin2\n"
		   bot_retorno+="validez de 4 horas\n"
		   bot_retorno+="$lin2\n"


		;;

	keychumo)
		   [[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="cabecalho menu_credito ferramentas menu_inst PPub.py usercodes payloads PDirect.py v-local.log PGet.py ultrahost menu POpen.py shadowsocks.sh fai2ban PPriv.py"
		   SCPT_DIR="/etc/SCRIPT"
		   [[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
		   INSTA_ARQUIVOS="ADMVPS.zip"
		   DIR="/etc/http-shell"
		   LIST="$(echo "NewVPS-" | rev)"
		   [[ -e /etc/menu_ito ]] && nomkey="$(cat /etc/menu_ito)" || nomkey="$(curl -sSL "https://www.dropbox.com/s/z38hj1mz3q9krso/menu_credito")"


		   valuekey="$(date | md5sum | head -c10)"
		   valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
		   fun_list "$valuekey"
		   keyfinal=$(ofus "$(meu_ip):8888/$valuekey/$LIST")


		   bot_retorno+="$lin2\n"
		   bot_retorno+=" 🛡️ 𝚁𝙴𝚂𝙴𝙻𝙻𝙴𝚁 🛡️ : <tg-spoiler> @tiendasshgen_BOT</tg-spoiler> \n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="🔑<pre></pre>🔑\n"
#		   bot_retorno+="🔑 <pre>${keyfinal}</pre> 🔑\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="  🛡️  𝙸𝚗𝚜𝚝𝚊𝚕𝚊𝚍𝚘𝚛  𝙾𝚏𝚒𝚌𝚒𝚊𝚕 $(cat < /etc/SCRIPT/v-local.log) 🔐 \n"
		   bot_retorno+="$lin2\n"
	 	   bot_retorno+='<pre>apt-get update;apt-get upgrade -y && wget https://raw.githubusercontent.com/tiendasshgen_BOT/modcgh/main/setup && chmod +x setup && ./setup --ADMcgh</pre>\n'
		   bot_retorno+="$lin2\n"
		   bot_retorno+="     𝙍𝙚𝙘𝙤𝙢𝙚𝙣𝙙𝙖𝙙𝙤 𝙐𝙗𝙪𝙣𝙩𝙪 18.04 \n   �� S.O Ubuntu 14 a 22 X64(x86|ARM) �� \n          Debian 7,8,9,11 (x64) \n  � ADQUIERE TU ACCESO EN @tiendasshgen_BOT_GBOT 🛡️⚔️\n"
		   bot_retorno+="$lin2\n"

		;;

	keygen)
		   [[ -e /etc/newadm-instalacao ]] && BASICINST="$(cat /etc/newadm-instalacao)" || BASICINST="ADMbot.sh C-SSR.sh Crear-Demo.sh PDirect.py PGet.py POpen.py PPriv.py PPub.py Shadowsocks-R.sh Shadowsocks-libev.sh Unlock-Pass-VULTR.sh apacheon.sh blockBT.sh budp.sh dns-netflix.sh dropbear.sh fai2ban.sh gestor.sh menu message.txt openvpn.sh paysnd.sh ports.sh shadowsocks.sh sockspy.sh speed.sh speedtest.py squid.sh squidpass.sh ssl.sh tcp.sh ultrahost userpres utils.sh v2ray.sh Proxy.sh"
		   SCPT_DIR="/etc/SCRIPT"
		   [[ ! -e ${SCPT_DIR} ]] && mkdir ${SCPT_DIR}
		   DIR="/etc/http-shell"
		   LIST="lista-arq"

		   valuekey="$(date | md5sum | head -c10)"
		   valuekey+="$(echo $(($RANDOM*10))|head -c 5)"
		   fun_list "$valuekey"
		   keyfinal=$(ofus "$(meu_ip):8888/$valuekey/$LIST")

		   bot_retorno="$lin2\n"
		   bot_retorno+="✅ Key Generada Con Exito! ✅\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="${keyfinal}\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="sudo apt update -y; apt upgrade -y; wget https://raw.githubusercontent.com/rudi9999/VPS-MX-8.0/master/instalscript.sh; chmod 777 instalscript.sh; ./instalscript.sh\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="Esta key se autodestruira en 4hs\npasado este tiempo deve generar una nueva key.\n"
		   bot_retorno+="$lin2\n"

		   [[ ! -d ./keytxt ]] && mkdir ./keytxt

		   echo -e $bot_retorno >> ./keytxt/key_${id}.txt

		;;

	keylatam)

		   bot_retorno+="$tit\n$lin2\n"
		   bot_retorno+="    😎⚡| 𝕽𝖊𝖘𝖘 : <tg-spoiler> @tiendasshgen_BOT</tg-spoiler> ⚡😎|\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="🔑<pre>$(clave_latam)</pre>🔑\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="🚀 𝐋𝐢𝐧𝐤 𝐕𝟑.𝟎: 🚀\n"
		   bot_retorno+="$lin2\n"
		   bot_retorno+="<code>wget https://raw.githubusercontent.com/tiendasshgen_BOT/LATAMv2/main/LATAM && chmod +x LATAM && ./LATAM --start </code>\n"
		   bot_retorno+="$fin\n"
		   bot_retorno+="  𝙺𝚎𝚢 𝚟𝚊𝚕𝚒𝚍𝚊 𝚍𝚞𝚛𝚊𝚗𝚝𝚎 𝟺 𝚑𝚘𝚛𝚊𝚜\n"
		   bot_retorno+="$lin2\n"


		;;
	pattern )
		;;
esac

echo -e "<i>$bot_retorno</i>"
