<?php 
// php72-mysqli ve php72-soap yüklemeyi unutma.

$kullaniciadi="{MYSQL_RADIUS_USERNAME}"; 
$sifre= "{MYSQL_RADIUS_USERPASS}"; 
$host="localhost"; 
$veritabani="{MYSQL_DB_NAME}"; 
 
//MYSQL BAĞLANTISI

$baglan=($GLOBALS["___mysqli_ston"] = mysqli_connect($host, $kullaniciadi, $sifre))or die("Veritabanı bağlantısı yapılamadı !");
((bool)mysqli_query($baglan, "USE " . $veritabani))or die("Veritabanı bağlantısı yapılamadı !");

mysqli_query($GLOBALS["___mysqli_ston"], "SET NAMES utf8"); 
mysqli_query($GLOBALS["___mysqli_ston"], "SET CHARACTER SET utf8"); 
mysqli_query($GLOBALS["___mysqli_ston"], "SET COLLATION_CONNECTION='utf8_general_ci'");  


$inj = array ('select', 'insert', 'delete', 'update', 'drop table', 'union', 'null', 'SELECT', 'INSERT', 'DELETE', 'UPDATE', 'DROP TABLE', 'UNION', 'NULL','order by','order  by');
for ($i = 0; $i < sizeof ($_GET); ++$i){
for ($j = 0; $j < sizeof ($inj); ++$j){
foreach($_GET as $gets){
if(preg_match ('/' . $inj[$j] . '/', $gets)){
$temp = key ($_GET);
$_GET[$temp] = '';
exit('<iframe title="YouTube video player" width="800" height="600" src="http://www.youtube.com/embed/bzen6iORGIk" frameborder="0" allowfullscreen></iframe>');
continue;
}
}
}
}



?>
