#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

# imzala.sh icin tarih
tarih1=`date "+%Y%m%d"`
tarih2=`date "+%Y%m%d%H%M"`
TaSa=`date "+%Y%m%d-%H%M%S"`
LANG_DEFAULT=tr
L_KURUM={L_KURUM}

L_DHCP=yes
L_PROXY=yes
L_PORTAL=yes
L_SYSTEM=yes
L_SYSLOG=yes
L_TRAFIK=yes
L_CUSTOM=no

botid=733959670:AAFzYo-2UwTOJlqCYAKihEbMHF5BBGPhBME
chatid=-494355129

# imzalama dizini path

START_PATH=${PWD}
imzala_path=/usr/local/5651log
# rm -r ../logs/*
IMZA_LOG_FILE=${imzala_path}/logs/imzala_$tarih1.log
OUTPUT_IMZA_LOG=${imzala_path}/logs/event_$tarih1.log
wwwpath=/usr/local/www/imzalar/imzali_kayitlar

calisma_dizini=${imzala_path}/tmp
saklama_dizini=${wwwpath}

CAPublicKEY=${imzala_path}/CA/cacert.pem
TSAPublicKEY=${imzala_path}/CA/tsacert.pem

openssl=/usr/local/5651log/bin/openssl
openssl_conf=/usr/local/5651log/conf/openssl.cnf

#echo "pfsense" >../CA/password.txt
#password=$(<../CA/password.txt)
#echo "$password"
password="pfsense"

eposta_adresi=info@dbdbilgisayar.com

#ftp sunucu

ftpserver={L_FTP_SERVER}
ftpusername={L_FTP_USER}
ftppassword={L_FTP_PASS}

sshserver=213.74.142.100
sshport=2221
sshpass=VGFsYXNCbGQyMDIwCg==
