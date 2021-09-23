<?php
header("Content-type: text/html; charset=utf-8");
include ("captiveportal-func.php");
include ("captiveportal-config.php");

date_default_timezone_set('Europe/Istanbul');

$sorgu1 = mysqli_fetch_array(mysqli_query($GLOBALS["___mysqli_ston"],"select * from Systems"));
$prm1 =  $sorgu1['Prm1']; /* sms var yok*/
$prm2 =  $sorgu1['Prm2']; /* surem*/
$prm3 =  $sorgu1['Prm3']; /* gün sayısı*/
$prm4 =  $sorgu1['Prm4']; /* sms username*/
$prm5 =  $sorgu1['Prm5']; /* sms şifre*/
$prm6 =  $sorgu1['Prm6']; /* sms baslik*/
$prm7 =  $sorgu1['Prm7']; /* sms için tc db sorgu var mı*/
$prm8 =  $sorgu1['Prm8']; settype($prm8, "double"); $prm8 =  $prm8 * 1024 * 1024; /* kota*/
$prm9 =  $sorgu1['Prm9']; settype($prm9, "double"); $prm9 =  $prm9 * 60; /* sessiontimeout*/
$prm10 =  $sorgu1['Prm10']; settype($prm10, "double"); $prm10 =  $prm10 * 60; /* idletimeout*/

$ip_adr = $_SERVER['REMOTE_ADDR'];
$mac_adr = `arp -an | grep -w $ip_adr | head -n 1 | cut -d" " -f4`;

if(isset($_POST["tc"])){
    $ad = tr_strtoupper(trim($_POST["ad"]));
    $soyad = tr_strtoupper(trim($_POST["soyad"]));
    $dogum_gunu = trim($_POST["gun"]);
    $dogum_ayi = trim($_POST["ay"]);
    $dogum_yili = trim($_POST["dogum"]);
    $dtarihi = $dogum_gunu.".".$dogum_ay.".".$dogum_yili;
	$telefon = trim($_POST["telefon"]);
	$smsal = trim($_POST["sms"]);
	$telefon = substr($telefon, 0, 13);  settype($telefon, "double"); //05365227616
    $tc_no = trim($_POST["tc"]); settype($tc_no, "double");
	$bugun = date("Y-m-d") + 5;
	$yenitarih = strtotime($prm3.' day',strtotime($bugun));
	$tarih = date('j M Y' ,$yenitarih ); // 15 Apr 2015
	$surem = $prm2; //sn cinsinden süre
	$kaydeden= 'web';
	$today = date("Y-m-d H:i:s");  
	$baslamat= date('Y.m.d');
	$bitist= date('Y.m.d' ,$yenitarih );
	
try {

    $veriler = array(
        "TCKimlikNo" => $tc_no,
        "Ad" => $ad,
        "Soyad" => $soyad,
        "DogumYili" => $dogum_yili
    );
    

	// 1. işlem kimlik bilgileri dogru mu?
 	if (CheckTcKimlikNo($veriler)) { 
		//2. işlem veritanabında bu kişi var mı ?
		$sorgu2 = mysqli_query($GLOBALS["___mysqli_ston"],"select * from Abone Where CepTel='".$telefon."' AND TcNo='".$tc_no."' AND BitisT > '".$baslamat." ORDER BY CId DESC'");
		$num_rowsh = mysqli_num_rows($sorgu2);

		if ($num_rowsh >= 1) {
		$sorgu3=mysqli_fetch_array($sorgu2);
			$user =  $sorgu3['Kullaniciadi']; 
	    	$pass = $sorgu3['Sifre'];
	    	$telefon = $sorgu3['CepTel'];			
				// eger islem basariliysa sms gönder -->
				$strXML = "<MainmsgBody><UserName>".$prm4."</UserName><PassWord>".$prm5."</PassWord><Action>0</Action>
						   <Mesgbody>Sayın internet kullanıcısı giriş için Kullanıcı adı: ".$user." ve Şifre: ".$pass." dir. Lütfen girşinizde bu şifreyi kullanınız. Şifre ".$prm3." gün geçerlidir. </Mesgbody><Numbers>".$telefon."</Numbers> <Originator></Originator><SDate></SDate></MainmsgBody>";
            logtofile($result1,"geridonus.log");
	    } else {
	    	$user =  substr(karakter_duzeltme2($ad),0,1).karakter_duzeltme2($soyad).rand_numstring(3); //$pass =  rand_string(5);
			$pass =   rand(1000, 9999); //rand_numstring(5);
				// eger islem basariliysa sms gönder -->
				$strXML = "<MainmsgBody><UserName>".$prm4."</UserName><PassWord>".$prm5."</PassWord><Action>0</Action>
						   <Mesgbody>Sayın internet kullanıcısı giriş için Kullanıcı adı: ".$user." ve Şifre: ".$pass." dir. Lütfen girşinizde bu şifreyi kullanınız. Şifre ".$prm3." gün geçerlidir. </Mesgbody><Numbers>".$telefon."</Numbers> <Originator></Originator><SDate></SDate></MainmsgBody>";

			$result1= mysqli_query($GLOBALS["___mysqli_ston"],"CALL SP_USER_EKLE1a(2,'".$ip_adr."','".$mac_adr."','".$user."','".$pass."','".$baslamat."','".$bitist."','".$tarih."','".$surem."','".$prm8."','".$prm9."','".$prm10."','".$telefon."','".$tc_no."','".$ad."','".$soyad."','".$strXML."','".$smsm."','".$geridonus."','".$dtarihi."','".$dogum_yili."','".$kaydeden."','".$today."','tc_no','".$today."')");
            logtofile($result1,"geridonus.log");
	    }
	    		

				if ($telefon !='') {$geridonus = HTTPPoster("http://gateway.mobilus.net/com.mobilus",$strXML);}
			
				$pass="hadiordan";
				echo $user.','.$pass;
				shell_exec("bash telegram.sh -t 955394922:AAESgbKgapI6lFDxWkm9J51Fexsgp6fIJCs -c -358454701 KBB:$baslamat:$user");

	 }else {
			echo 0.", T.C Kimlik Numarasi Dogrulanmadı."; 	
	 }

}catch (Exception $hata){
	echo "0".','.$tc_no.', Hata oluştu...';
}
	
}
?>
