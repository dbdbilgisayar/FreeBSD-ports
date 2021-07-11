#!/bin/env sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

set +e
usage() {
        echo "Usage $0 [options]"
        echo "  [ options ]: "
		echo "		dhcp"
		echo "		proxy"
		echo "		portal"
		echo "		system"
		echo "		syslog"
		echo "		trafik"
		echo "		custom"
		echo "      location"
        exit 1
}
  
islem1=$1
location=$2

main(){

#Parametreler
. imzala.inc

    case "${islem1}" in
        dhcp)
	    paths=/dhcp/dhcp$tarih1
        dosya_adi=dhcp.log
        yol=/var/log
        _DosyaKontrol1  # normal lease dosyasi pars ediliyor.
        _DosyaKontrol2  # satic ip pars ediliyor.
        ;;
        proxy)
        paths=/proxy/proxy$tarih1
        dosya_adi=access.log
        yol=/var/squid/logs
	    ;;
        portal)
	    paths=/portal/portal$tarih1
	    dosya_adi=portalauth.log
        yol=/var/log
	    ;;
	    system)
	    paths=/system/system$tarih1
        dosya_adi=system.log
        yol=/var/log
	    ;;
	    syslog)
	    paths=/syslog/syslog$tarih1
        dosya_adi=syslogs.log
        yol=/var/syslogs
	    ;;
        dhcp_ms)
        #ftp den ms dhcp loglarini cekecegiz. burada. microsoft dhcp gunluk logu
        #yada bu islemden once dhcp loglarini hazirlayacagiz.
        gun=`date -v-1d | cut -f1 -d ' '`
        paths=/dhcp/dhcp_ms$tarih1
        dosya_adi=DhcpSrvLog-${gun}.log
        yol=/var/log/	    
  	    ;;
        dhcp_msbtk)
        #ftp den ms dhcp loglarini cekecegiz. burada. microsoft dhcp btk format logu
        #yada bu islemden once dhcp loglarini hazirlayacagiz.
        paths=/dhcp/dhcp_msbtk$tarih1
        dosya_adi=Dhcp_msbtk.log
        yol=/var/log/
        ;;

        trafik)
        paths=/trafik/trafik$tarih1
        dosya_adi=trafik-$TaSa.tar.gz
        yol=/var/log/trlog
	    cd $yol
	    tar cvfz $dosya_adi $yol
        ;;


	    custom)
        paths=/custom/custom$tarih1
        dosya_adi=5651log.log
        yol=/5651log
	    ;;
            
        *)
	    usage
            
    esac

echo "file path: "${paths}
echo "file name: "${dosya_adi}
mkdir -p ${wwwpath}${paths}

if [ -d ${yol}/${dosya_adi} ]; then
        echo "${islem1} dosyasibulundu [Tamam]"
else

echo "<==> Dosya : "${yol}/${dosya_adi} 
if [ -f ${yol}/${dosya_adi} ]; then
        echo "${islem1} dosyası bulundu [Tamam]"
else
        echo "${islem1} dosyası bulunamadı."
        exit
fi
fi

saklama_dizini=${saklama_dizini}${paths}
hatali_imzalar=${saklama_dizini}/hatali-${islem1}-imzasi-$tarih1

_CpCalisma
_Imzala
_Dogrula
_Sakla
#_ftp

}

_DosyaKontrol1(){
echo "<== hdcpd.leases dosyasi kontrol ediliyor..."
if [ -f "/var/dhcpd/var/db/dhcpd.leases" ]; then
	echo "file var. [Tamam]"
	rm -r /var/log/dhcp.log
	echo "<== dhcp.log Dosya Parse ediliyor..."
	awk -f /usr/local/5651log/imzala/dhcpparse0.awk < /var/dhcpd/var/db/dhcpd.leases 2>&1 | tee ${yol}/${dosya_adi}
	echo "Dhcp lease Parse edildi...  [Tamam]"
else
	echo "file yok: dhcpd.leases; lütfen dhcp ayarlarını kontrol ediniz."
	exit
fi

}

_DosyaKontrol2(){
echo "<== Verilen static ipler kontrol ediliyor..."
if [ -f "/var/dhcpd/etc/dhcpd.conf" ]; then
	echo "file var. [Tamam]"
	#rm -r ${yol}${dosya_adi}
	echo "<== dhcp.log Dosya Parse ediliyor..."
	awk -f /usr/local/5651log/imzala/dhcpparse1.awk < /var/dhcpd/etc/dhcpd.conf 2>&1 |tee -a ${yol}/${dosya_adi}
	echo "Dhcp Static Parse ...  [Tamam]"
else
    echo "file yok: dhcpd.conf; lütfen dhcp ayarlarini kontrol ediniz."
    exit
fi

}

_CpCalisma(){
if [ ! -d ${calisma_dizini} ]
then
	mkdir ${calisma_dizini}		
fi
cp ${yol}/${dosya_adi} ${calisma_dizini}
cd ${calisma_dizini}
}

_Imzala(){
${openssl} ts -query -data ${dosya_adi} -no_nonce -out ${dosya_adi}.tsq			
${openssl} ts -reply -queryfile ${dosya_adi}.tsq -out ${dosya_adi}.der -token_out -config ${openssl_conf} -passin pass:${password}
}

_Dogrula(){
COMMAND=`${openssl} ts -verify -data ${dosya_adi} -in ${dosya_adi}.der -token_in -CAfile  ${CAPublicKEY} -untrusted ${TSAPublicKEY}`
if [ "${COMMAND}" = "Verification: OK" ]
    then
	/usr/local/bin/bash /usr/local/5651log/imzala/telegram.sh -t $botid -c $chatid "$location:Imzalama Tamam:${dosya_adi}.$tarih2.tar.gz"
	echo "Dogrulandi. [Tamam]"
    else
	/usr/local/bin/bash /usr/local/5651log/imzala/telegram.sh -t $botid -c -$chatid "$location:DIKKAT! ... Imzalanmadi.:${dosya_adi}.$tarih2.tar.gz"	
	echo "Dogrulamadi. Islemler geri aliniyor. [Tamam]"
				
    if [ ! -d ${hatali_imzalar} ]
	then
	    mkdir ${hatali_imzalar}
    fi
						
    mv ${calisma_dizini}/${dosya_adi}* ${hatali_imzalar}
    echo "===> DIKKAT ${dosya_adi} isimli dosya imzalandi, dogrulama islemi saglanamadi.
        Hatali dosyalari ${hatali-imzalar}-{$tarih} arsiv dizininde bulabilirsiniz." | mail -s "Log Imzalayici" "${eposta_adresi}"
    exit
fi

}

_Sakla(){
if [ ! -d ${saklama_dizini} ]
then
	mkdir ${saklama_dizini}
fi
	tar cvfz ${saklama_dizini}/${dosya_adi}.$tarih2.tar.gz ${dosya_adi}*
	pwd
	
	# ssh servra gondermek icin acilacak...
	#_gonder 
 	
 	rm  ${calisma_dizini}/${dosya_adi}*

}

_gonder(){
echo ${wwwpath}/${location}
echo ${saklama_dizini}/
echo ${saklama_dizini}/${dosya_adi}.$tarih2.tar.gz

sshpass=$(echo $sshpass | /usr/local/bin/base64 -d)

export SSHPASS=$sshpass
/usr/local/bin/sshpass -e  sftp -P$sshport root@$sshserver << !
   mkdir ${wwwpath}/${location}
   mkdir ${wwwpath}/${location}/${islem1}
   mkdir ${wwwpath}/${location}${paths}
   cd ${wwwpath}/${location}${paths}
   put ${saklama_dizini}/${dosya_adi}.$tarih2.tar.gz
   bye
!
}

_ftp(){
	tarih=`date "+%Y%m%d"`
	cd ${saklama_dizini}
	logger `ftp -n -v ${ftp_server} << EOT
	user ${ftpuser} ${ftppass}
	prompt
	mkdir -p ${saklama_dizini}
	cd ${saklama_dizini}
	binary
	mput *.tar.gz
	bye
	EOT`
}

main
