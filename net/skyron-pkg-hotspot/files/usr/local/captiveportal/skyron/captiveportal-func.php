<?php
function HTTPPoster($prmPostAddress,$prmSendData){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL,$prmPostAddress); 
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1); 
	curl_setopt($ch, CURLOPT_TIMEOUT, 30); 
	curl_setopt($ch, CURLOPT_POSTFIELDS, $prmSendData); 
	$result = curl_exec($ch);
	return $result;
}
	
function rand_string( $length ) {
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    return substr(str_shuffle($chars),0,$length);
}

function rand_numstring( $length ) {
    $chars = "0123456789";
    return substr(str_shuffle($chars),0,$length);
}

function karakter_duzeltme($gelen){
    $karakterler = array("ç","ğ","ı","i","ö","ş","ü");
    $degistir = array("Ç","Ğ","I","İ","Ö","Ş","Ü");
    return str_replace($karakterler, $degistir, $gelen);
}

function karakter_duzeltme2($gelen){
    $karakterler = array("ç","Ç","ğ","Ğ","ı","İ","ö","Ö","ş","Ş","ü","Ü");
    $degistir = array("c","c","g","g","i","i","o","o","s","s","u","u");
    return str_replace($karakterler, $degistir, strtolower($gelen));
}


function CheckTcKimlikNo($veriler) { 
try { 

$baglan = new SoapClient("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL");
$sonuc = $baglan->TCKimlikNoDogrula($veriler);

	if ($sonuc->TCKimlikNoDogrulaResult) { 
		return true; 
	} else { 
		echo "TC Kimlik Nosu Hatalı..."; 
		return false; 
	} 
	} 
catch (Exception $exp) { 
	print_r($exp); 
	return false;
 	} 
}

function CheckYabanciKimlikNo($veriler) { 
try { 

$con = new SoapClient("https://tckimlik.nvi.gov.tr/Service/KPSPublicYabanciDogrula.asmx?WSDL"); 
$result = $con->YabanciKimlikNoDogrula($veriler); 

	if ($result->YabanciKimlikNoDogrulaResult) { 
		return true; 
		} else { 
		echo "Yabancı Kimlik Nosu Hatalı..."; 
		return false; 
		} 
	} 
catch (Exception $exp) { 
	print_r($exp); 
	return false;
 	} 
}

?>