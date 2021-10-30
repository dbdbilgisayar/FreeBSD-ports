#!/bin/sh env
set -x
signfolder = /var/log/e2guardian2
echo ${signfolder}

if [ ! -d ${signfolder} ]
then
	mkdir -p ${signfolder}
fi

cp /var/log/e2guardian/access.log.3 /var/log/e2guardian2/access.log
date 202110282355
sh imzala_loge.sh proxy

cp /var/log/e2guardian/access.log.2 /var/log/e2guardian2/access.log
date 202110292355
sh imzala_loge.sh proxy

cp /var/log/e2guardian/access.log.1 /var/log/e2guardian2/access.log
date 202110302355
sh imzala_loge.sh proxy

date 202110312355
sh imzala_loge.sh proxy
cp /var/log/e2guardian/access.log /var/log/e2guardian2/access.log
ntpdate time.ume.tubitak.gov.tr
