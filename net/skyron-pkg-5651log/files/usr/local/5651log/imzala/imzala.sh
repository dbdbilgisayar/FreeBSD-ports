#!/usr/bin/env sh

#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
#*/

location=$1

_Banner(){
sleep 2
}

echo ${OS_NAME}":"${OS_VERSION}
cd /usr/local/5651log/imzala

#Params
. imzala.inc
. ../language/lang_tr.inc

_Pfsensemi(){
# kullanıcı root mu?
if [ ${USER} != "root" ]; then
        echo "Please login \"root\" user. Not \"admin\" user !"
        exit
fi
# Pfsense  flatformu mu ?
if [ -f /etc/platform ]; then
	if [ `cat /etc/platform` = "pfSense" ]; then
		OS_NAME=pfSense
		OS_VERSION=`cat /etc/version`
		OS_VERSION_MAJOR=`cat /etc/version | awk -F. '{print $1}'`
		OS_VERSION_MINOR=`cat /etc/version | awk -F. '{print $2}'`
		OS_VERSION_REVISION=`cat /etc/version | awk -F. '{print $3}'`

		if [ ${OS_VERSION_MAJOR} != "2" ] || [ ${OS_VERSION_MINOR} -lt "3" ]; then
            echo "Pfsense ile birlikte calisir"
            exit
		fi
		else
		    echo "Lutfen pfsense  sistem ile calistiriniz."
	fi
	else
        echo "Lutfen pfsense ile calistiriniz. Calisan Sistem Pfsense Degil "
        exit
fi
}
# \033c ekranı temizler.
_EkranTemizle(){
	printf "\033c"
}

# zaman bilgisini ntp serverdan update yap
_SuAn(){
 	echo -n ${L_ZAMAN} 1>&3
	/usr/local/sbin/ntpdate time.ume.tubitak.gov.tr
 	echo ${L_OK} 1>&3
}

# başlama mesajım;
_Basla(){
echo ${L_IMZALA_START}
echo " "
}

# sistem log imzalama
_Systemlog(){
if [ "${L_SYSTEM}" = "yes" ]
then
	echo "===> Sistem log imzalaniyor.."
	echo ${L_SYSTEM_LOG} 1>&3
	/bin/sh imzala_log.sh system ${location}
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# portal log imzalama
_Portallog(){
if [ "${L_PORTAL}" = "yes" ]
then
	echo "===> Portal log imzalaniyor.."
	echo ${L_PORTAL_LOG} 1>&3
	/bin/sh imzala_log.sh portal ${location}
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# dhcp log imzalama
_Dhcplog(){
if [ "${L_DHCP}" = "yes" ] 
then
	echo "===> Dhcp log imzalaniyor..."
	echo ${L_DHCP_LOG} 1>&3
	/bin/sh imzala_log.sh dhcp $location
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# proxy log imzalama
_Proxylog(){
if [ "${L_PROXY}" = "yes" ]
then 	
	echo "===> Proxy log imzalaniyor..."
	echo ${L_PROXY_LOG} 1>&3
	/bin/sh imzala_log.sh proxy ${location}
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# syslog imzalama
_Syslog(){
if [ "${L_SYSLOG}" = "yes" ]
then
	echo "===> Syslog log imzalaniyor..."
	echo ${L_SYSLOG_LOG} 1>&3
	/bin/sh imzala_log.sh syslog ${location}
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# trafik imzalama
_Trafik(){
if [ "${L_TRAFIK}" = "yes" ]
then
        echo "===> Trafik log imzalaniyor..."
        echo ${L_TRAFIK_LOG} 1>&3
        /bin/sh imzala_log.sh trafik ${location}
        echo ${L_OK} 1>&3
        echo "===> Imzalama [Tamam]"
fi
}

# herhangi bir log imzalama
_Custom(){
if [ "${L_CUSTOM}" = "yes" ]
then
	echo "===> Custom log imzalaniyor..."
	echo ${L_CUSTOM_LOG} 1>&3
	/bin/sh imzala_log.sh custom ${location}
	echo ${L_OK} 1>&3
	echo "===> Imzalama [Tamam]"
fi
}

# log ayarlama
_LogAc(){
echo "===>Log kaydi yapiliyor..."
echo ${L_LOGK} 1>&3
rm ${IMZA_LOG_FILE}
touch ${IMZA_LOG_FILE}
echo $tarih1 >>${IMZA_LOG_FILE}
echo ${L_OK} 1>&3
}

_trlog(){
  sh /usr/local/5651log/trlog/trlog.sh
}

main(){
_Banner
_Pfsensemi
_SuAn
_EkranTemizle
_Basla

touch ${OUTPUT_IMZA_LOG}
exec 3>&1 1>>${OUTPUT_IMZA_LOG} 2>&1

_LogAc
echo "<========= $tarih1 ==============>" >> ${OUTPUT_IMZA_LOG}
_Dhcplog
_Proxylog
_Portallog
_Systemlog
_Syslog
_Trafik
_Custom
_trlog
}

main
