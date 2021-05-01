#!/usr/bin/env sh

#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
#*/


echo ${OS_NAME}":"${OS_VERSION}
LOGS=/usr/local/5651log/logs

#Params
. ../imzala/imzala.inc

_logtutinstall(){
echo "logtut_enable="YES"" >>/etc/rc.conf
cp logtut.sh /usr/local/etc/rc.d
chmod 777 /usr/local/etc/rc.d/logtut.sh 
}

_Hazirlik(){
echo "<=== Log aciliyor..."
if [ -d "$LOGS" ]; then
  echo "${LOGS} var. zaten Açık..." 
else
 mkdir -p ${LOGS}
 echo "${LOGS} yok. açılıyor..."
fi

echo "<=== openssl sembolik linki olusturuluyor."
mkdir -p /usr/local/5651log/bin/
rm /usr/local/5651log/bin/openssl
ln -s /usr/bin/openssl /usr/local/5651log/bin/openssl

echo "<=== Web yonetim paneli hazirlaniyor..."
mkdir -p /usr/local/www/imzalar
cp index.php /usr/local/www/imzalar
echo "<=== Servisler hazırlanıyor..."
cp accessdb.sh /usr/local/etc/rc.d
}

D_PROXY=yes
D_DHCP=yes
D_PORTAL=yes
D_SYSTEM=yes
D_SYSLOG=yes
D_TRAFIK=yes
D_CUSTOM=no
D_LOCATION=Sube1

D_SSL_CN="www.dbdsecurity.com"
D_SSL_EMAIL="info@dbdsecurity.com"
D_SSL_O="DBDSec"
D_SSL_C="Tr"
D_SSL_ST="Turkiye"
D_SSL_L="Kayseri"

D_SSH_SERVER="127.0.0.1"
D_SSH_PORT="22"
D_SSH_PASS="test"

_UserInputs() {
    echo "imzalanacak loglari seciniz [yes][no]"
    read -p "PROXY [$D_PROXY]: " QH_PPROXY
    QH_PROXY="${QH_PROXY:-$D_PROXY}"
    
    read -p "DHCP [$D_DHCP]: " QH_DHCP
    QH_DHCP="${QH_DHCP:-$D_DHCP}"
    
    read -p "PORTAL [$D_PORTAL]: " QH_PORTAL
    QH_PORTAL="${QH_PORTAL:-$D_PORTAL}"
    
    read -p "SYSTEM [$D_SYSTEM]: " QH_SYSTEM
    QH_SYSTEM="${QH_SYSTEM:-$D_SYSTEM}"
    
    read -p "SYSLOG [$D_SYSLOG]: " QH_SYSLOG
    QH_SYSLOG="${QH_SYSLOG:-$D_SYSLOG}"
 
    read -p "TRAFIK [$D_TRAFIK]: " QH_TRAFIK
    QH_SYSLOG="${QH_TRAFIK:-$D_TRAFIK}"
 
    read -p "CUSTOM [$D_CUSTOM]: " QH_CUSTOM
    QH_SYSLOG="${QH_CUSTOM:-$D_CUSTOM}"
    
	echo "Sube Adi " 
    read -p "LOCATION [$D_LOCATION]: " QH_LOCATION
    QH_SYSLOG="${QH_LOCATION:-$D_LOCATION}"
	echo "ssh server parametreleri" 

    read -p "SSH_SERVER[$D_SSH_SERVER]: " QH_SSH_SERVER
    QH_SYSLOG="${QH_SSH_SERVER:-$D_SSH_SERVER}"

    read -p "SSH_PORT [$D_SSH_PORT: " QH_SSH_PORT
    QH_SYSLOG="${QH_SSH_PORT:-$D_SSH_PORT}"

    read -p "SSH_PASS [$D_PASS]: " QH_SSH_PASS
    QH_SYSLOG="${QH_SSH_PASS:-$D_SSH_PASS}"

 	
    echo
    echo "Imza Sertifika Bilgileri"
    echo
    read -p "$L_SSL_CN [$D_SSL_CN]: " QH_SSL_CN 
    export QH_SSL_CN="${QH_SSL_CN:-$D_SSL_CN}"  
    read -p "$L_SSL_EMAIL [$D_SSL_EMAIL]: " QH_SSL_EMAIL
    export QH_SSL_EMAIL="${QH_SSL_EMAIL:-$D_SSL_EMAIL}"
    read -p "$L_SSL_O [$D_SSL_O]: " QH_SSL_O
    export QH_SSL_O="${QH_SSL_O:-$D_SSL_O}"
    read -p "$L_SSL_C [$D_SSL_C]: " QH_SSL_C
    export QH_SSL_C="${QH_SSL_C:-$D_SSL_C}"
    read -p "$L_SSL_ST [$D_SSL_ST]: " QH_SSL_ST
    export QH_SSL_ST="${QH_SSL_ST:-$D_SSL_ST}"
    read -p "$L_SSL_L [$D_SSL_L]: " QH_SSL_L
    export QH_SSL_L="${QH_SSL_L:-$D_SSL_L}" 

    echo ${L_PFSETTINGS} 1>&3
    echo "log tutma ayarlari yapiliyor..."
    sed -i .bak -e "s/{L_PROXY}/${QH_PROXY}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_DHCP}/${QH_DHCP}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_PORTAL}/${QH_PORTAL}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_SYSTEM}/${QH_SYSTEM}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_SYSLOG}/${QH_SYSLOG}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_TRAFIK}/${QH_TRAFIK}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_CUSTOM}/${QH_CUSTOM}/g" /usr/local/5651log/imzala/imzala.inc

    sed -i .bak -e "s/{L_SSH_SERVER}/${QH_SSH_SERVER}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_SSH_PORT}/${QH_SSH_PORT}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_SSH_PASS}/${QH_SSH_PASS}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_KURUM}/${QH_SSL_CN}/g" /usr/local/5651log/imzala/imzala.inc
    sed -i .bak -e "s/{L_LOCATION}/${QH_LOCATION}/g" /usr/local/5651log/imzala/imzala.inc
    
    
    echo "log tutma ayarlari [Tamam]"

    echo "Sertifika ayarlari yapiliyor.."
    sed -i .bak -e "s/{L_SSL_CN}/${QH_SSL_CN}/g" /usr/local/5651log/install/creatcer.sh
    sed -i .bak -e "s/{L_SSL_EMAIL}/${QH_SSL_EMAIL}/g" /usr/local/5651log/install/creatcer.sh
    sed -i .bak -e "s/{L_SSL_O}/${QH_SSL_O}/g" /usr/local/5651log/install/creatcer.sh
    sed -i .bak -e "s/{L_SSL_C}/${QH_SSL_C}/g" /usr/local/5651log/install/creatcer.sh
    sed -i .bak -e "s/{L_SSL_ST}/${QH_SSL_ST}/g" /usr/local/5651log/install/creatcer.sh
    sed -i .bak -e "s/{L_SSL_L}/${QH_SSL_L}/g" /usr/local/5651log/install/creatcer.sh
    echo "Sertifika ayarlari [Tamam]"
    echo ${L_OK} 1>&3

}

Pfsensemi(){
if [ ${USER} != "root" ]; then
        echo "Please login \"root\" user. Not \"admin\" user !"
        exit
fi

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

_EkranTemizle(){
printf "\033c"
}


_DilSec() {
    read -p "Kurulum Dili (en/tr) [$LANG_DEFAULT]: " Q_LANG
    Q_LANG="${Q_LANG:-$LANG_DEFAULT}"
    case "${Q_LANG}" in
            [eE][nN])
            . ../language/lang_en.inc
            ;;
            [tT][rR])
            . ../language/lang_tr.inc
            ;;
    esac
}

_activeRepos() {
    echo -n ${L_ACTIVEREPOS} 1>&3
    tar xv -C / -f /usr/local/share/pfSense/base.txz ./usr/bin/install
    if [ ${OS_VERSION_MINOR} -lt "4" ]; then
        sed -i .bak -e "s/FreeBSD: { enabled: no/FreeBSD: { enabled: yes/g" /usr/local/etc/pkg/repos/pfSense.conf
    else
        sed -i .bak -e "s/FreeBSD: { enabled: no/FreeBSD: { enabled: yes/g" /usr/local/share/pfSense/pkg/repos/pfSense-repo.conf
    fi
    sed -i .bak -e "s/FreeBSD: { enabled: no/FreeBSD: { enabled: yes/g" /usr/local/etc/pkg/repos/FreeBSD.conf
    env ASSUME_ALWAYS_YES=YES /usr/sbin/pkg update
    echo ${L_OK} 1>&3
}

_deactiveRepos() {
    echo -n ${L_DEACTIVEREPOS} 1>&3
    if [ ${OS_VERSION_MINOR} -lt "4" ]; then
        sed -i .bak -e "s/FreeBSD: { enabled: yes/FreeBSD: { enabled: no/g" /usr/local/etc/pkg/repos/pfSense.conf
    else
        sed -i .bak -e "s/FreeBSD: { enabled: yes/FreeBSD: { enabled: no/g" /usr/local/share/pfSense/pkg/repos/pfSense-repo.conf
    fi
    sed -i .bak -e 's/FreeBSD: { enabled: yes/FreeBSD: { enabled: no/g' /usr/local/etc/pkg/repos/FreeBSD.conf
    echo ${L_OK} 1>&3
}

_pfSenseSettings() {
    echo ${L_PFSETTINGS} 1>&3
    cp imzalaconfig.php /etc/phpshellsessions/pfsenseconfig
    /usr/local/sbin/pfSsh.php playback pfsenseconfig
    echo ${L_OK} 1>&3

}

_cronInstall() {
if [ -f /etc/platform ]; then
    if [ `cat /etc/platform` = "pfSense" ]; then
    /usr/local/sbin/pfSsh.php playback listpkg | grep "cron"
    if [ $? == 0 ]
    then
    	echo -n ${L_CRONALREADYINSTALLED} 1>&3
    else
    	echo -n ${L_CRONINSTALL} 1>&3
    	/usr/local/sbin/pfSsh.php playback installpkg "cron"
    	hash -r
    fi
    	echo ${L_OK} 1>&3
    fi
else
        echo 1>&3 "Lutfen pfsense  sistem ile calistiriniz."
fi
}

_Basla(){
echo
echo ${L_STARTING}
echo
}


_ImzaInstall(){
echo "Sertifika Olusturuluyor.."
sh creatcer.sh
}

_TestIslemi(){
echo "Sertifika Test islemi.."
echo -n ${L_TESTCREATCER} 1>&3
cd ../imzala  && sh imzala.sh
cd ../install
echo ${L_OK} 1>&3
}

main(){
_Pfsensemi
_EkranTemizle
_Basla
_DilSec
_UserInputs
_Hazirlik
_ImzaInstall
exec 3>&1 1>>${OUTPUT_IMZA_LOG} 2>&1
#_logtutinstall
_pfSenseSettings
_cronInstall
_TestIslemi
}

main
