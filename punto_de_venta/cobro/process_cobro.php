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

		$consulta_precio    = consulta_arrayM("SELECT precio FROM zona_precio WHERE sku='$sku'");
		$precio             = $consulta_precio['precio'];

		$consulta_desc = consulta_arrayM("SELECT desc_corta FROM articulo WHERE sku='$sku'");
		$desc_corta    = $consulta_desc['desc_corta'];

		echo "<tr class='fila_prd' id='tr-$upc'>
				<td class='dato_codigo'>$upc</td>
				<td class='desc'> $desc_corta </td>
				<td class='cantidad_c'> 1 </td>
				<td class='precio_c'> $precio </td>
				<td class='total_c'> $precio</td>
		 	  </tr>";


	}


?>