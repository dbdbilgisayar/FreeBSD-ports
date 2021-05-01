#!/bin/sh

#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

# 

SERVICE='php -f /usr/local/5651log/dbprs/accessdb.php'
while [ 1=1 ];
do
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "Calisiyor"
else
    echo "Calismiyor"
    cd /usr/local/5651log && php -f /usr/local/5651log/dbprs/accessdb.php
    echo "Baslatildi"
fi
# 30 saniye uyu
sleep 30
done

