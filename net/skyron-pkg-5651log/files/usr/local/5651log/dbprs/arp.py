#!/usr/local/bin/python2.7

"""
/*
 * Copyright (c) 2021 M.Demir Heraklet
 * Modified by Mehmet Demir
 * Heraklet Security
 * www.heraklet.com
 * info@heraklet.com
*/
    list arp table
"""
import tempfile
import subprocess
import os
import os.path
import sys
import ujson
import netaddr
import mysql.connector
import datetime

if __name__ == '__main__':
    result = []

    # import dhcp_leases (index by ip address)
    dhcp_leases = {}
    dhcp_leases_filename = '/var/dhcpd/var/db/dhcpd.leases'
    if os.path.isfile(dhcp_leases_filename):
        leases = open(dhcp_leases_filename, 'r').read()
        for lease in leases.split('}'):
            if lease.strip().find('lease') == 0 and lease.find('{') > -1:
                dhcp_ipv4_address = lease.split('{')[0].split('lease')[1].strip()
                if lease.find('client-hostname') > -1:
                    dhcp_leases[dhcp_ipv4_address] = {'hostname': lease.split('client-hostname')[1].strip()[1:-2]}

    # parse arp output
    with tempfile.NamedTemporaryFile() as output_stream:
        subprocess.call(['/usr/sbin/arp', '-an'], stdout=output_stream, stderr=open(os.devnull, 'wb'))
        output_stream.seek(0)
        data = output_stream.read().strip()
        for line in data.split('\n'):
            line_parts = line.split()
            if len(line_parts) > 3 and line_parts[3] != '(incomplete)':
                record = {'mac': line_parts[3],
                          'ip': line_parts[1][1:-1],
                          'intf': line_parts[5],
                          'manufacturer': '',
                          'hostname': ''
                          }
                manufacturer_mac = netaddr.EUI(record['mac'])
                try:
                    record['manufacturer'] = manufacturer_mac.oui.registration().org
                except netaddr.NotRegisteredError:
                    pass
                if record['ip'] in dhcp_leases:
                    record['hostname'] = dhcp_leases[record['ip']]['hostname']
                result.append(record)

now = datetime.datetime.now()
print('%now.month%now.day%now.year')

config = {
  'user': '{MYSQL_ROOT_NAME}',
  'password': '{MYSQL_USER_PASS}',
  'host': 'localhost',
  'database': '{MYSQL_DBNAME}',
  'raise_on_warnings': True,
}
                          
cnx = mysql.connector.connect(**config)

cur = cnx.cursor()

if len(sys.argv) > 1 and sys.argv[1] == 'json':
	print(ujson.dumps(result))
else:
        for record in result:
		mac = "%(mac)s" % record
		print mac
		cur.execute('SELECT count(Mac) FROM CInfo WHERE Ip="%(ip)s" and Mac="%(mac)s"' % record)
            	for row in cur.fetchall():
			print row[0]	
			rc = cur.rowcount-1
			if row[0] < 1:
				cur.execute('INSERT INTO CInfo (Ip,Mac,IfName,HostName,Manufacture) values ("%(ip)s", "%(mac)s", "%(intf)s", "%(hostname)s","%(manufacturer)s")' % record)
				cnx.commit()
			else:
				print row

cnx.close()

