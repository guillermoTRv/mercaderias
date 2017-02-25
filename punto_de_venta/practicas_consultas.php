<?php 
   include("cfg.php");
   $consulta  = mysqli_query($q_merc, "SELECT desc_larga FROM articulo WHERE sku = 39");
   $aray_c    = mysqli_fetch_array($consulta);
   echo $articulos = $aray_c[0];

?>