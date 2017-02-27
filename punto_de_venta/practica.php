<?php 
	include("cfg.php");
	$mens_error = "error_interno en el sistema";

	function consulta_val($sentencia){
		global $q_vent;
		global $mens_error;
		$consulta_bd = mysqli_query($q_vent,$sentencia) or die($mens_error);
		return $consulta_bd = mysqli_num_rows($consulta_bd);
		mysqli_close($q_vent);
	}

	function consulta_array($sentencia){
		global $q_vent;
		global $mens_error;
		$consulta_bd = mysqli_query($q_vent,$sentencia) or die($mens_error);
		return $consulta_bd = mysqli_fetch_array($consulta_bd);
		mysqli_close($q_vent);	
	}

	echo $numero = consulta_val("SELECT id_usuario,Nombre FROM usuario WHERE Nombre='Jose'");
	     $array = consulta_array("SELECT id_usuario,Nombre FROM usuario WHERE id_usuario=1");
		 echo $nombre = $array['Nombre'];
?>