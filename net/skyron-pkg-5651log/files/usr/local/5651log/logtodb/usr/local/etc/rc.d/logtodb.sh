#!/usr/bin/env sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

. /etc/rc.subr

name="logtodb"
rcvar="logtodb_enable"
start_cmd="logtodb_start"
stop_cmd="logtodb_stop"

pidfile="/var/run/logtodb.pid"

load_rc_config ${name}

logtodb_start()
{
if checkyesno ${rcvar}; then
    if [ -f $pidfile ]; then
        echo "logtodb already running."
        logtodb_stop
    fi
    echo -n "logtodb starting..."
    /bin/logtodb
    echo " Done."
fi
}

logtodb_stop()
{
if [ -f $pidfile ]; then
        echo -n "logtodb stopping."
        pkill -F $pidfile
        while [ `pgrep -F $pidfile` ]; do
            echo -n "."
            sleep 5
        done
        rm $pidfile
        echo " Done."
    fi
}

run_rc_command "$1"
