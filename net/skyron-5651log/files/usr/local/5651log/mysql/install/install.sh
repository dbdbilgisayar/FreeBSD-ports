#!/usr/bin/env sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

#echo "/usr/local/bin/mysql_secure_installation"
VERSION="2.4.4"
echo ${OS_NAME}":"${OS_VERSION}
START_PATH=${PWD}
touch ${START_PATH}/event.log
OUTPUTLOG=${START_PATH}/event.log

# Defaults
QH_LANG_DEFAULT="tr"
QH_MYSQL_ROOT_NAME="root"
QH_MYSQL_ROOT_PASS_DEFAULT="rootpass123"
QH_MYSQL_DBNAME_DEFAULT="radius"
QH_MYSQL_RADIUS_USERNAME_DEFAULT="radius"
QH_MYSQL_RADIUS_USERPASS_DEAFULT="@@rad2018pass@@"

. lang_tr.inc

_activeRepos() {
    echo -n ${L_ACTIVEREPOS} 1>&3
    #tar xv -C / -f /usr/local/share/pfSense/base.txz ./usr/bin/install
    echo ${OS_VERSION_MINOR}
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
_userInputs() {
    read -p "${L_QROOTPASS} [$QH_MYSQL_ROOT_PASS_DEFAULT]: " QH_MYSQL_ROOT_PASS
    QH_MYSQL_ROOT_PASS="${QH_MYSQL_ROOT_PASS:-$QH_MYSQL_ROOT_PASS_DEFAULT}"

    read -p "${L_QRADIUSDBNAME} [$QH_MYSQL_DBNAME_DEFAULT]: " QH_MYSQL_DBNAME
    QH_MYSQL_DBNAME="${QH_MYSQL_DBNAME:-$QH_MYSQL_DBNAME_DEFAULT}"
    echo

    read -p "${L_QRADIUSUSERNAME} [$QH_MYSQL_RADIUS_USERNAME_DEFAULT]: " QH_MYSQL_RADIUS_USERNAME
    QH_MYSQL_RADIUS_USERNAME="${QH_MYSQL_RADIUS_USERNAME:-$QH_MYSQL_RADIUS_USERNAME_DEFAULT}"

    read -p "${L_QRADIUSPASSWORD} [$QH_MYSQL_RADIUS_USERPASS_DEFAULT]: " QH_MYSQL_RADIUS_USERPASS
    QH_MYSQL_RADIUS_USERPASS="${QH_MYSQL_RADIUS_USERPASS:-$QH_MYSQL_RADIUS_USERPASS_DEFAULT}"
    echo
}

_installPackages() {

if [ ! -f ${PWD}/restarted ]; then
    exec 3>&1 1>>${OUTPUTLOG} 2>&1

    echo -n ${L_INSTALLPACKAGES} 1>&3
    ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
    if [ ${ARCH} == "amd64" ]
    then
    env ASSUME_ALWAYS_YES=YES /usr/sbin/pkg install git wget nano mc htop mysql56-server compat8x-amd64 php72-mysqli-7.2.10 php72-pdo_mysql php72-soap py27-ujson-1.35 py27-netaddr-0.7.19 py27-mysql-connector-python2-2.2.2
    else
    env ASSUME_ALWAYS_YES=YES /usr/sbin/pkg install git wget nano mc htop mysql56-server compat8x-i386 php72-mysqli php72-pdo_mysql php72-soap py27-ujson-1.35 py27-netaddr-0.7.19 py27-mysql-connector-python2-2.2.2
    fi
    hash -r
    echo ${L_OK} 1>&3

    touch ${PWD}/restarted
    echo -e ${L_RESTARTMESSAGE} 1>&3
    echo ${L_PRESSANYKEY} 1>&3
    read -p "restart" answer
    /sbin/reboot

fi
}
_clonehotspot(){
    echo -n ${L_CLONEHOTSPOT} 1>&3
    mv .env.example .env
    echo ${L_OK} 1>&3

}

_mysqlSettings() {
    echo -n ${L_MYSQLINSTALL} 1>&3
    if [ ! -f /etc/rc.conf.local ] || [ $(grep -c mysql_enable /etc/rc.conf.local) -eq 0 ]; then
        echo 'mysql_enable="YES"' >> /etc/rc.conf.local
    fi
    mv /usr/local/etc/rc.d/mysql-server /usr/local/etc/rc.d/mysql-server.sh
    sed -i .bak -e 's/mysql_enable="NO"/mysql_enable="YES"/g' /usr/local/etc/rc.d/mysql-server.sh
    service mysql-server.sh start
    echo ${L_OK} 1>&3

    # MySQL root kullanicisi tanimlaniyor.
    echo -n ${L_MYSQLROOT} 1>&3
    mysqladmin -u root password "${QH_MYSQL_ROOT_PASS}"
    echo ${L_OK} 1>&3

    # MySQL veritabani yukleniyor
    echo -n ${L_MYSQLINSERTS} 1>&3
    cat <<EOF > /usr/local/5651log/mysql/install/client.cnf
[client]
user = ${QH_MYSQL_ROOT_NAME}
password = ${QH_MYSQL_ROOT_PASS}
host = localhost
EOF
    sed -i .bak -e "s/{MYSQL_ROOT_NAME}/$QH_MYSQL_ROOT_NAME/g" /usr/local/5651log/mysql/install/mysqllog.sql
    sed -i .bak -e "s/{MYSQL_ROOT_PASS}/$QH_MYSQL_ROOT_PASS/g" /usr/local/5651log/mysql/install/mysqllog.sql
    sed -i .bak -e "s/{MYSQL_DBNAME}/$QH_MYSQL_DBNAME/g" /usr/local/5651log/mysql/install/mysqllog.sql
    sed -i .bak -e "s/{MYSQL_RADIUS_USERNAME}/$QH_MYSQL_RADIUS_USERNAME/g" /usr/local/5651log/mysql/install/mysqllog.sql
    sed -i .bak -e "s/{MYSQL_RADIUS_USERPASS}/$QH_MYSQL_RADIUS_USERPASS/g" /usr/local/5651log/mysql/install/mysqllog.sql

    sed -i .bak -e "s/{MYSQL_ROOT_NAME}/$QH_MYSQL_ROOT_NAME/g" /usr/local/5651log/dbprs/config.php
    sed -i .bak -e "s/{MYSQL_ROOT_PASS}/$QH_MYSQL_ROOT_PASS/g" /usr/local/5651log/dbprs/config.php
    sed -i .bak -e "s/{MYSQL_DBNAME}/$QH_MYSQL_DBNAME/g" /usr/local/5651log/dbprs/config.php

    sed -i .bak -e "s/{MYSQL_ROOT_NAME}/$QH_MYSQL_ROOT_NAME/g" /usr/local/5651log/dbprs/arp.py
    sed -i .bak -e "s/{MYSQL_USER_PASS}/$QH_MYSQL_ROOT_PASS/g" /usr/local/5651log/dbprs/arp.py          
    sed -i .bak -e "s/{MYSQL_DBNAME}/$QH_MYSQL_DBNAME/g" /usr/local/5651log/dbprs/arp.py        


    mysql --defaults-extra-file=/usr/local/5651log/mysql/install/client.cnf < /usr/local/5651log/mysql/install/mysqllog.sql
    echo ${L_OK} 1>&3

    # MySQL icin watchdog scripti olusturuluyor.
    echo -n ${L_MYSQLWATCHDOG} 1>&3
    cat <<EOF > /usr/local/bin/mysql_check.sh
#!/usr/bin/env sh
service mysql-server.sh status
if [ \$? != 0 ]; then
service mysql-server.sh start
sleep 5
fi
EOF
    chmod +x /usr/local/bin/mysql_check.sh
    echo ${L_OK} 1>&3
}

_clean() {
    #rm -rf ${START_PATH}/lang_*
    #rm -rf /usr/local/5651log/mysql/install/client.cnf*
}

YesOrNo() {
    while :
    do
        echo -n "$1 (yes/no?): " 1>&3
        read -p "$1 (yes/no?): " answer
        case "${answer}" in
            [yY]|[yY][eE][sS]) exit 0 ;;
                [nN]|[nN][oO]) exit 1 ;;
        esac
    done
}

main() {

printf "\033c"

echo -e ${L_WELCOME}
echo
_userInputs
echo
echo ${L_STARTING}
echo

exec 3>&1 1>>${OUTPUTLOG} 2>&1

printf "\033c"

_activeRepos
_installPackages
_deactiveRepos
_mysqlSettings
_clean
}

main
