<?php 
	include("../funciones.php");

	$upc             =  sanitizar("codigo_txt");
	$sentencia_upc   =  "SELECT sku FROM upc where upc='$upc'";
	

	$validacion_upc  =  consulta_valM($sentencia_upc);
	if ($validacion_upc == 0) {
		echo "nulo";
	}
	else{
		$array_upc   = consulta_arrayM($sentencia_upc);
		$sku         = $array_upc['sku'];
		echo $sku;

	}

?>