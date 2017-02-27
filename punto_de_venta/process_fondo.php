<?php
	/**
	session_start();
	include("funciones.php");

	$den1  = sanitizar("500_txt");
	$den2  = sanitizar("200_txt");
    $den3  = sanitizar("100_txt");
	$den4  = sanitizar("50_txt");
	$den5  = sanitizar("20_txt");

	$den6  = sanitizar("10_txt");
	$den7  = sanitizar("5_txt");
	$den8  = sanitizar("2_txt");
	$den9  = sanitizar("1_txt");
	$den10 = sanitizar("50c_txt");

	$fondo = (500*$billetes_500)+(200*$billetes_200)+(100*$billetes_100)+(50*$billetes_50)+(20*$billetes_20)+(10*$monedas_10)+(5*$monedas_5)+(2*$monedas_2)+(1*$monedas_1)+(.5*$monedas_50c);

    echo $_SESSION['fondo']   =  $fondo;
	**/
	
?>
