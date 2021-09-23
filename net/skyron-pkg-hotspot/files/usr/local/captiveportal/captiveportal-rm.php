<?php
header("Content-type: text/html; charset=utf-8");
date_default_timezone_set('Europe/Istanbul');

include ("captiveportal-config.php");
include ("captiveportal-func.php");

date_default_timezone_set('Europe/Istanbul');

$sorgu1=mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"], "select * from Systems"));
//$sorgu1 = mysql_fetch_array(mysql_query("select * from Systems"));
$prm1 =  $sorgu1['Prm1']; /* sms var yok*/
$prm2 =  $sorgu1['Prm2']; /* surem*/
$prm3 =  $sorgu1['Prm3']; /* gün sayısı*/
$prm4 =  $sorgu1['Prm4']; /* sms username*/
$prm5 =  $sorgu1['Prm5']; /* sms şifre*/
$prm6 =  $sorgu1['Prm6']; /* sms server url*/
$prm7 =  $sorgu1['Prm7']; /* sms için tc db sorgu var mı*/
$prm8 =  $sorgu1['Prm8']; /* kota*/
$prm9 =  $sorgu1['Prm9']; /* sessiontimeout*/
$prm10 =  $sorgu1['Prm10']; /* idletimeout*/
$prm11 = 0;

if(isset($_POST["tc"])){
    $ad = strtoupper(karakter_duzeltme(trim($_POST["ad"])));
    $soyad = strtoupper(karakter_duzeltme(trim($_POST["soyad"])));
    $dogum_yili = trim($_POST["dogum"]);
	$telefon = trim($_POST["telefon"]);
	$smsal = trim($_POST["sms"]);
	$telefon = substr($telefon, 0, 11); //05365227616
    $tc_no = trim($_POST["tc"]);
    settype($tc_no, "double");
	
	$bugun = date("Y-m-d") + 5;
	$yenitarih = strtotime($prm3.' day',strtotime($bugun));
	$tarih = date('j M Y' ,$yenitarih ); // 15 Apr 2015
	$surem = $prm2; //sn cinsinden süre
	$kaydeden= 'web';
	$today = date("Y-m-d H:i:s");  
	$baslamat= date('Y.m.d');
	$bitist= date('Y.m.d' ,$yenitarih );

	try {
		$sorgu2 = mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"],"select * from Abone Where TcNo='".$tc_no."' AND BitisT > '".$baslamat." ORDER BY CId DESC'"));
		$kontrol =  $sorgu2['TcNo']; 
		$user =  $sorgu2['Kullaniciadi']; 
		$pass =  $sorgu2['Sifre']; 
		
		if ($_POST["tc"] = $sorgu2['TcNo']) {
		
		$strXML = "<MainmsgBody><UserName>".$prm4."</UserName><PassWord>".$prm5."</PassWord><Action>0</Action>
						   <Mesgbody>Sayın internet kullanıcısı giriş için Kullanıcı adı: ".$user." ve Şifre: ".$pass." dir. Lütfen girşinizde bu şifreyi kullanınız.</Mesgbody><Numbers>".$telefon."</Numbers> <Originator></Originator><SDate></SDate></MainmsgBody>";
			if ($prm11 = 1) {
			/*	$geridonus = HTTPPoster("http://gateway.mobilus.net/com.mobilus",$strXML);*/
			}
		echo $user.','.$pass;
		}

	}catch (Exception $hata){
		$errs=0;
		echo $errs.','.$tc_no.', T.C Kimlik Numarasi Dogrulanmadı.';

	}
}

?>
