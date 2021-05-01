global $config;
$config = parse_config(true);

if ($s_logtodb == false) {
    $config['installedpackages']['service'][] = array(
        'name' => 'logtodb',
        'rcfile' => 'logtodb.sh',
        'executable' => 'logtodb',
        'description' => 'Log to Mysql Db'
    );
}

if ($s_mysql == false) {
    $config['installedpackages']['service'][] = array(
        'name' => 'mysql-server',
        'rcfile' => 'mysql-server.sh',
        'executable' => 'mysqld',
        'description' => 'MySQL Database Server'
    );
}


write_config("Mysql Settings added.");
