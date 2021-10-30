<?php
header("Content-type: text/html; charset=utf-8");
date_default_timezone_set('Europe/Istanbul');

include ("captiveportal-config.php");
include ("captiveportal-sms.php");
include ("captiveportal-func.php");

$sorgu1=mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"], "select * from Systems"));
$prm1 =  $sorgu1['Prm1']; /* sms var yok*/
$prm2 =  $sorgu1['Prm2']; /* surem*/
$prm3 =  $sorgu1['Prm3']; /* gun sayisi*/
$prm4 =  $sorgu1['Prm4']; /* sms username*/
$prm5 =  $sorgu1['Prm5']; /* sms sifre*/
$prm6 =  $sorgu1['Prm6']; /* sms server url*/
$prm7 =  $sorgu1['Prm7']; /* sms icin tc db sorgu var mi*/

$prm8 =  $sorgu1['Prm8']; /* kota*/
settype($prm8, "double");
$prm8 =  $prm8 * 1024 * 1024;

$prm9 =  $sorgu1['Prm9']; /* sessiontimeout*/
settype($prm9, "double");
$prm9 =  $prm9 * 60;

$prm10 =  $sorgu1['Prm10']; /* idletimeout*/
settype($prm10, "double");
$prm10 =  $prm10 * 60;


if(isset($_POST["tcno"])) && if(isset($_POST["telefon"])) {
/*if(isset($argv[1])){İ*/
    try
    { 	
 	$telefon = trim($_POST["telefon"]);
	//$telefon = $argv[1];
	$telefon = substr($telefon, 0, 13); //+905365227616
	//settype($telefon, "double");
	$telboy = strlen($telefon);
	
 	$tcno = trim($_POST["tcno"]);
	//$telefon = $argv[1];
	$tcno = substr($tcno, 0, 13); //+905365227616
	//settype($telefon, "double");
	$tcboy = strlen($tcno);

	 
	if (($telboy = 13) && ($tcboy = 10))
	{
		$sorgu2 = mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"],"select * from Abone Where TcNo='".$tcno."' AND CepTel='".$telefon."' AND BitisT > '".$baslamat." ORDER BY CId DESC'"));
		$kontrol =  $sorgu2['CepTel']; 

		if (($_POST["tcno"] = $sorgu2['TcNo'])) && (($_POST["telefon"] = $sorgu2['CepTel'])) 
		{
		$user =  $sorgu2['Kullaniciadi']; 
		$pass =  $sorgu2['Sifre']; 
			
		} else 
		{
			
	        $bugun = date("Y-m-d") + 5;
	        $yenitarih = strtotime($prm3.' day',strtotime($bugun));
	        $tarih = date('j M Y' ,$yenitarih ); // 15 Apr 2015
	        $surem = $prm2; //sn cinsinden süre
	        $kaydeden = 'web';
	        $today = date("Y-m-d H:i:s");  
	        $baslamat = date('Y.m.d');
	        $bitist = date('Y.m.d' ,$yenitarih );
				
	        $user = $telefon;
	        $pass = rand(1000, 9999); //rand_numstring(5);

	        $result1 = mysqli_query($GLOBALS["___mysqli_ston"],"CALL SP_USER_EKLE1('".$user."','".$pass."','".$baslamat."','".$bitist."','".$tarih."','".$surem."','".$prm8."','".$prm9."','".$prm10."','".$telefon."','".$telefon."','".$telefon."','".$telefon."','".$strXML."','".$smsm."','".$geridonus."','2015','".$dogum_yili."','".$kaydeden."','".$today."','prg','".$today."')");
		}

			if ( $prm1 = 1 ) {
	        $strMSG = "Sayın internet kullanıcısı giriş için Kullanıcı adı: ".$user." ve Şifre: ".$pass." dir. Lütfen girşinizde bu şifreyi kullanınız. Şifre ".$prm3." gün geçerlidir. ";
	        $instance = new SMS_Api($prm4, $prm5);
   	        echo $instance->submit($prm6, $strMSG, array($telefon));
			}
			
	        echo ','.$user.','.$pass;
	    
	} else {
	    echo "0".",0".",0";
	}
      }catch(Exception $hata){
	 echo $hata->getMessage(); //hata çıktısı üretilir
      }
}
else 
echo "Cep Tel yok";
?>
