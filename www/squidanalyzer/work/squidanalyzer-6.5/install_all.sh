#!/bin/sh
test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/bin" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/bin
test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport
test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/lang" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/lang
test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport
test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images

test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/share/doc/squidanalyzer" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/share/doc/squidanalyzer

test ! -d "/usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/man/man3" && mkdir -p /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/man/man3

# Copy files that must not be overriden 
for file in squidanalyzer.conf network-aliases user-aliases excluded included; do
if [ -r /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/$file ]; then
	install -m 644 etc/$file /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/$file.sample
else
	install -m 644 etc/$file /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/$file
fi
done
install -m 755 squid-analyzer /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/bin/
install -m 644 resources/sorttable.js /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/
install -m 644 resources/squidanalyzer.css /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/
install -m 644 resources/flotr2.js /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/
install -m 644 resources/images/logo-squidanalyzer.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/cursor.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/domain.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/back-arrow.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/info.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/network.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 resources/images/user.png /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/www/squidreport/images/
install -m 644 lang/* /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/etc/squidreport/lang/
pod2text doc/SquidAnalyzer.pod README
pod2man doc/SquidAnalyzer.pod squid-analyzer.3

	install -m 644 README /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/share/doc/squidanalyzer/
	install -m 644 INSTALL /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/share/doc/squidanalyzer/
	install -m 644 ChangeLog /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/share/doc/squidanalyzer/

	install -m 644 squid-analyzer.3 /usr/home/releng252/FreeBSD-ports/www/squidanalyzer/work/stage/usr/local/man/man3/

echo "
-----------------------------------------------------------------------------
1. Modify your httpd.conf to allow access to HTML output like follow:
        Alias /squidreport /usr/local/www/squidreport
        <Directory /usr/local/www/squidreport>
            Options -Indexes FollowSymLinks MultiViews
	    AllowOverride None
            Order deny,allow
            Deny from all
            Allow from 127.0.0.1
        </Directory>
2. If necessary, give additional host access to SquidAnalyzer in httpd.conf.
   Restart and ensure that httpd is running.
3. Browse to http://my.host.dom/squidreport/ to ensure that things are working
   properly.
4. Setup a cronjob to run squid-analyzer daily:

     # SquidAnalyzer log reporting daily
     0 2 * * * /usr/local/bin/squid-analyzer > /dev/null 2>&1

or run it manually. For more information, see /usr/local/share/doc/squidanalyzer/README file.
-----------------------------------------------------------------------------
"
