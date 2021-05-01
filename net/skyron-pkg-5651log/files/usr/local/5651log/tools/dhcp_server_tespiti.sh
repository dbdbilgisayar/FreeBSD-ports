#!/bin/sh
#/*
# * Copyright (c) 2021 M.Demir Heraklet
# * Modified by Mehmet Demir
# * Heraklet Security
# * www.heraklet.com
# * info@heraklet.com
# */

echo "tcpdump dhcp server tespiti."
tcpdump  -l  udp src port 67 and udp dst port 68
