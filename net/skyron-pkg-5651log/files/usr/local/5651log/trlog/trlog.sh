#!/bin/env sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

#Degiskenler...


TaSa=`date "+%Y%m%d-%H%M%S"`
Tarih=`date "+%Y%m%d"`
Saat=`date "+%H%M%S"`
location=$1
logdizin=/var/log/trlog

echo "-                  PARAMETRELER                             -"
echo "-------------------------------------------------------------"
echo "Saat          :$Saat"
echo "Tarih         :$Tarih"
echo "Tarih Saat    :$TaSa"
echo "Sube          :$location"
echo "-------------------------------------------------------------"

_temizlik(){
killall -9 tcpdump
rm -rf /var/log/trlog/
}

_hazirlik(){

        if [ ! -d ${logdizin} ]
        then
                mkdir -p ${logdizin}
        fi
}

_logla(){
for i in em0 em1 em2 em3 em4 em5
do
	/usr/sbin/tcpdump -nn -tttt -e -i $i -G 10 dst port 443 or dst port 80 and greater 100 >> ${logdizin}/trafik-$TaSa-$i.log &
done
}

main (){
_temizlik
_hazirlik
_logla

}
main
