#!/usr/bin/env sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
#*/

tarih1=`date "+%Y%m%d"`
tarih2=`date "+%Y%m%d%H%M"`

LOGS=/usr/local/5651log/logs
mkdir -p ${LOGS}
OUTPUT_IMZA_LOG=${LOGS}/install_$tarih1.log
touch ${OUTPUT_IMZA_LOG}

LANG_DEFAULT="tr"
L_STARTING="Kurulum basliyor..."

#Params
#. ../imzala/imzala.inc

_logtutinstall(){
echo "logtodb kuruluyor..."
echo ${L_LOGTODB} 1>&3
echo "logtodb_enable="YES"" >>/etc/rc.conf
cp /usr/local/5651log/logtodb/usr/local/etc/rc.d/logtodb.sh /usr/local/etc/rc.d
chmod 777 /usr/local/etc/rc.d/logtodb.sh 
cp /usr/local/5651log/logtodb/bin/logtodb /bin
chmod 777 /bin/logtodb
echo ${L_OK} 1>&3
echo "logtodb kurulum [Tamam]..."
}

_Hazirlik(){
echo "<=== Log aciliyor..."
if [ -d "$LOGS" ]; then
  echo "${LOGS} var. zaten Açık..." 
else
 mkdir -p ${LOGS}
 echo "${LOGS} yok. açılıyor..."
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
            . /usr/local/5651log/language/lang_en.inc
            ;;
            [tT][rR])
            . /usr/local/5651log/language/lang_tr.inc
            ;;
    esac
}

_pfSenseSettings() {
    echo ${L_PFSETTINGS} 1>&3
    cp /usr/local/5651log/logtodb/usr/local/5651log/mysql/install/logtodbadd.php /etc/phpshellsessions/pfsenseconfig
    /usr/local/sbin/pfSsh.php playback pfsenseconfig
    echo ${L_OK} 1>&3

}

_Basla(){
echo
echo ${L_STARTING}
echo
}


main(){
_EkranTemizle
_Basla
_DilSec
exec 3>&1 1>>${OUTPUT_IMZA_LOG} 2>&1
_Hazirlik
_logtutinstall
_pfSenseSettings
}

main
