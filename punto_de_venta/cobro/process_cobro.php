<?php 
	include("../funciones.php");
	echo "El script de las teclas funciona";

	echo $upc           =  sanitizar("codigo_txt");
	$sentencia_upc =  "SELECT sku FROM upc where upc='$upc'";
	

	$validacion_upc  =  consulta_valM($sentencia_upc);
	if ($validacion_upc == 0) {
		echo "El articulo no existe";
	}
	else{
		$array_upc   = consulta_arrayM($sentencia_upc);
		echo "<br>".$sku         = $array_upc['sku'];

		$consulta_precio    = consulta_arrayM("SELECT precio FROM zona_precio WHERE sku='$sku'");
		echo "<br>".$precio = $consulta_precio['precio'];

	}


?>