<?php 
	$servidor  = "localhost";
	$usuario   = "root";
	$password  = "";
	$bd_m      = "mercaderias";
	$bd_v      = "sanjosep_ventas";

	global $q_merc;
	$q_merc = mysqli_connect($servidor,$usuario,$password,$bd_m);


	global $q_vent;
	$q_vent = mysqli_connect($servidor,$usuario,$password,$bd_v);
?>