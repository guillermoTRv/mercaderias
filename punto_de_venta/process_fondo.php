<?php
	session_start();

	include("sanitizar.php");
	$billetes_500 = sanitizar("500_txt");
	$billetes_200 = sanitizar("200_txt");
    $billetes_100 = sanitizar("100_txt");
	$billetes_50  = sanitizar("50_txt");
	$billetes_20  = sanitizar("20_txt");

	$monedas_10   = sanitizar("10_txt");
	$monedas_5    = sanitizar("5_txt");
	$monedas_2    = sanitizar("2_txt");
	$monedas_1    = sanitizar("1_txt");
	$monedas_50c  = sanitizar("50c_txt");

	$fondo = (500*$billetes_500)+(200*$billetes_200)+(100*$billetes_100)+(50*$billetes_50)+(20*$billetes_20)+(10*$monedas_10)+(5*$monedas_5)+(2*$monedas_2)+(1*$monedas_1)+(.5*$monedas_50c);

    $_SESSION['fondo']   =  $fondo;

?>
