#!/bin/env sh
/*
 * Copyright (c) 2021 M.Demir Heraklet
 * Modified by Mehmet Demir
 * Heraklet Security
 * www.heraklet.com
 * info@heraklet.com
*/

echo "________ __________________    _________              "
echo "\______ \\______   \______ \  /   _____/ ____   ____  "
echo " |    |  \|    |  _/|    |  \ \_____  \_/ __ \_/ ___\ "
echo " |        \    |   \|        \/        \  ___/\  \___ "
echo "/_______  /______  /_______  /_______  /\___  >\___  >"
echo "        \/       \/        \/        \/     \/     \/ "
sleep 2

#SSL_CN="dbdsecurity.com"
#SSL_EMAIL="info@dbdsecurity.com"
#SSL_O="DBDSEC"
#SSL_C="tr"
#SSL_ST="turkiye"
#SSL_L="kayseri"

SSL_CN={L_SSL_CN}
SSL_EMAIL={L_SSL_EMAIL}
SSL_O={L_SSL_O}
SSL_C={L_SSL_C}
SSL_ST={L_SSL_ST}
SSL_L={L_SSL_L}


CA_PATH=/usr/local/5651log/CA
CONF=/usr/local/5651log/conf/openssl.cnf
PASSWORD=/usr/local/5651log/CA/password.txt
SUBJ=/CN=$SSL_CN/emailAddress=$SSL_EMAIL/O=$SSL_O/C=$SSL_C/ST=$SSL_ST/L=$SSL_L

main(){
_Clear
_Passwd
_CaFileCreate
_CaCreate
_TsaCreate
}

_Clear(){
echo "==>Temizlik yapiliyor..."
# Imza sifirla
rm -rf ${CA_PATH}
mkdir ${CA_PATH}
echo "==>[TAMAM]"
}

_Passwd(){
echo "==>Password olusturma.." 
# Sertifika icin rasgele sifre olusturuyoruz
touch ${CA_PATH}/password.txt
#openssl rand -base64 32 > ${CA_PATH}/password.txt
echo "pfsense">../CA/password.txt
echo "paassword.txt:"
cat ${CA_PATH}/password.txt
echo "==>[TAMAM]"
}

_CaFileCreate(){
echo "==> Dosya Olusturma..."
# Gerekli klasor ve dosyalari olustur
mkdir -p ${CA_PATH}/ssl
mkdir -p ${CA_PATH}/private
mkdir -p ${CA_PATH}/newcerts

touch ${CA_PATH}/index.txt
touch ${CA_PATH}/serial
echo 010F > ${CA_PATH}/serial
touch ${CA_PATH}/tsaserial
echo 010F > ${CA_PATH}/tsaserial
echo "==> [TAMAM]"

}

_CaCreate(){
echo "==> CA olusturma..."
# CA olusturma
cd ${CA_PATH}/ssl
openssl req -config ${CONF} -passout file:${PASSWORD} -subj "${SUBJ}" -days 3650 -x509 -newkey rsa:2048 -out ${CA_PATH}/ssl/cacert.pem -outform PEM
cp ${CA_PATH}/ssl/cacert.pem ${CA_PATH}
cp ${CA_PATH}/ssl/privkey.pem ${CA_PATH}/private/cakey.pem
echo "==> [TAMAM]"
}

_TsaCreate(){
echo "==>TSA Create..."
# TSA icin Sertifika olustur
openssl genrsa -aes256 -passout file:${PASSWORD} -out ${CA_PATH}/ssl/tsakey.pem 2048
openssl req -config ${CONF} -new -key ${CA_PATH}/ssl/tsakey.pem -passin file:${PASSWORD} -subj "${SUBJ}" -out ${CA_PATH}/ssl/tsareq.csr
openssl ca -config ${CONF} -passin file:${PASSWORD}  -in ${CA_PATH}/ssl/tsareq.csr -subj "${SUBJ}" -out ${CA_PATH}/ssl/tsacert.pem
cp ${CA_PATH}/ssl/tsacert.pem ${CA_PATH}
cp ${CA_PATH}/ssl/tsakey.pem ${CA_PATH}/private/
echo "==>[TAMAM]"
}

main
