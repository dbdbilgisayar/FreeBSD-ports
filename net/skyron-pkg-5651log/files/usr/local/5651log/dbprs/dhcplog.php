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

$myfile = fopen("/var/log/dhcp.log", "r") or die("Dosya açılamadı.!");
$ayirici=" ";
$zayirici="-";

echo "islem devam ediyor lüfen beklieyiniz.<br>";
while(!feof($myfile)) {
	 $line = fgets($myfile);
	 $Md5Hash= md5("$line");
     $Sha256Hash= hash("sha256","$line");

	 $temizle = preg_replace('/\s+/',' ',$line);
	 $dhcp = explode($ayirici,$temizle);
	 
	 $dhcpst = explode($zayirici,$dhcp[1]);
	 $st=$dhcpt[0];
	 $sz=$dhcpt[1];
	 
	 $dhcpt = explode($zayirici,$dhcp[2]);
	 $at=$dhcpt[0];
	 $az=$dhcpt[1];
	 echo $st."<->".$sz."<->".$at."<->".$az;	 
	 $result =  mysqli_query($GLOBALS["___mysqli_ston"],"INSERT INTO 5651dhcp (IpAddr,ScopSDate,ScopSTime,ScopADate,ScopATime,Mac,Dhcplog,Md5Hash,Sha256Hash) values ('".$dhcp[0]."','".$st."','".$sz."','".$at."','".$az."','".$dhcp[3]."','".$line."','".$Md5Hash."','".$Sha256Hash."')");
	 #echo $result ;
	 echo "<=>\n";
	 #echo "'".$dhcp[0]."','".$st."','".$sz."','".$at."','".$az."','".$dhcp[3]."','".$line."','".$Md5Hash."','".$Sha256Hash."'";	 
}
fclose($myfile);
echo "islem bitti kayıtları kontrol ediniz.";
?> 
