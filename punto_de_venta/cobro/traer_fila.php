<?php 
	include("../funciones.php");

	$upc             =  sanitizar("codigo_txt");
	$sentencia_upc   =  "SELECT sku FROM upc where upc='$upc'";
	$array_upc       =  consulta_arrayM($sentencia_upc);
	$sku             =  $array_upc['sku'];

	$consulta_precio = consulta_arrayM("SELECT precio FROM zona_precio WHERE sku='$sku'");
	$precio          = $consulta_precio['precio'];

	$consulta_desc = consulta_arrayM("SELECT desc_corta FROM articulo WHERE sku='$sku'");
	$desc_corta    = $consulta_desc['desc_corta'];

	echo     "<tr class='fila_prd sku_$sku' id='tr-$upc'>
				<td class='dato_codigo'>$sku</td>
				<td class='desc'> $desc_corta </td>
				<td class='cantidad_c'>1</td>
				<td class='precio_c'>$precio</td>
				<td class='total_c'>$precio</td>
		 	  </tr>";


?>