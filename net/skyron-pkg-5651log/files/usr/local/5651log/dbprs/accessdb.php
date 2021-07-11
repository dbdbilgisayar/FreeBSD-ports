<?php
/*
 * Copyright (c) 2021 M.Demir Heraklet
 * Modified by Mehmet Demir
 * Heraklet Security
 * www.heraklet.com
 * info@heraklet.com
*/

header("Content-type: text/html; charset=utf-8");
include ("config.php");
date_default_timezone_set('Europe/Istanbul');
$ayirici=" ";
$handle = popen("tail -f /var/squid/logs/access.log 2>&1", 'r');
while(!feof($handle)) {
    $buffer = fgets($handle);
    //echo "$buffer\n";
	$line = "$buffer";
	$md5hash= md5("$line");
    $hashmd= hash("sha256","$line");
    $temizle = preg_replace('/\s+/',' ',$line);
	$strdizi = explode($ayirici,$temizle);
	//echo $strdizi[2];
	$t=date('Y-m-d', $strdizi[0]);
	$z=date('H:i:s', $strdizi[0]);
	$mac = system("arp -an|grep $strdizi[2]");
	$smac = explode($ayirici,$mac);
	if (strlen($line) > 1 ){
	if(isset($buffer)) {
	$result =  mysqli_query($GLOBALS["___mysqli_ston"],"INSERT INTO Access_Details (Tarih,Saat,duration,ClIpAddr,ClMac,ClResutCode,ClSize,RequestMethod,Url,UrlO,MD5Hash,Hash) values ('".$t."','".$z."','".$strdizi[1]."','".$strdizi[2]."','".$smac[3]."','".$strdizi[3]."','".$strdizi[4]."','".$strdizi[5]."','".$strdizi[6]."','".$line."','".$md5hash."','".$hashmd."')");
    //echo $result ;
	}
   }
    ob_flush();
    flush();
}
pclose($handle);

?>
