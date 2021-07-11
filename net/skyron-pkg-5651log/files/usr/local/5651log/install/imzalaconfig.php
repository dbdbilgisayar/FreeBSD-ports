global $config;
$config = parse_config(true);

// pfsense Menu 5651 log ekleme

$s_menu = false;
foreach ($config['installedpackages']['menu'] as $item) {
    if ('5651 Log' == $item['name']) {
        $s_menu = true;
        break;
    }
}
if ($s_menu == false) {
    $config['installedpackages']['menu'][] = array(
        'name' => '5651 Log',
        'section' => 'Services',
        'url' => '/imzalar',
        'description' => '5651 Log Server'
    );
}

// Cron Ekleme
if (!array_search("/bin/sh /usr/local/5651log/imzala/imzala.sh", array_column($config['cron']['item'], "command"))) {
    $config['cron']['item'][] = array(
        "minute" => "55",
        "hour" => "23",
        "mday" => "*",
        "month" => "*",
        "wday" => "*",
        "who" => "root",
        "command" => "/bin/sh /usr/local/5651log/imzala/imzala.sh"
    );
    write_config("5651 Imzala added.");
}

if (!array_search("/usr/local/bin/python2.7 /usr/local/5651log/tools/ipgetter.py", array_column($config['cron']['item'], "command"))) {
    $config['cron']['item'][] = array(
        "minute" => "*/5",
        "hour" => "*",
        "mday" => "*",
        "month" => "*",
        "wday" => "*",
        "who" => "root",
        "command" => "/usr/local/bin/python2.7 /usr/local/5651log/tools/ipgetter.py"
    );
    write_config("5651 Imzala added.");
}

if (!array_search("killall tail", array_column($config['cron']['item'], "command"))) {
    $config['cron']['item'][] = array(
        "minute" => "*/5",
        "hour" => "*",
        "mday" => "*",
        "month" => "*",
        "wday" => "*",
        "who" => "root",
        "command" => "killall tail"
    );
    write_config("Tail kill added.");
}

if (!array_search("/usr/bin/nice -n20 /usr/local/bin/php -f /usr/local/5651log/dbprs/dhcplog.php", array_column($config['cron']['item'], "command"))) {
    $config['cron']['item'][] = array(
        "minute" => "55",
        "hour" => "23",
        "mday" => "*",
        "month" => "*",
        "wday" => "*",
        "who" => "root",
        "command" => "/usr/bin/nice -n20 /usr/local/bin/php -f /usr/local/5651log/dbprs/dhcplog.php"
    );
    write_config("Dhcp log  added.");
}


write_config("Eratsec Settings added.");
