<?php 
	/**Datos de conexion a la base de datos---------------------------------------**/

	$servidor  = "localhost";
	$usuario   = "root";
	$password  = "";
	$bd_m      = "mercaderias";
	$bd_v      = "sanjosep_ventas";

	global $q_merc;
	$q_merc = mysqli_connect($servidor,$usuario,$password,$bd_m);


	global $q_vent;
	$q_vent = mysqli_connect($servidor,$usuario,$password,$bd_v);


	/**Control de errores en el sistema-------------------------------------------**/

	error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
	$mens_error = "Surgió un error interno; si esto persiste contactar a sistemas";


	/**Sentencias prehechas-------------------------------------------------------**/

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

	function insertar($sentencia){
		global $q_vent;
		global $mens_error;
		return $consulta_bd = mysqli_query($q_vent,$sentencia) or die($mens_error);
		mysqli_close($q_vent);
	}

	function consulta_gen($sentencia){
		global $q_vent;
		global $mens_error;
		return $consulta_bd = mysqli_query($q_vent,$sentencia) or die($mens_error);
		mysqli_close($q_vent);
	}

	/**Control de horario-----------------------------------------------------------**/

	date_default_timezone_set('America/Mexico_City');
    $fecha                =  date("Y-m-d H:i:s");


    /**Funcion para sanitizar variables de entrada-----------------------------------**/

    function sanitizar($var_sn){
		$var_sn = addslashes(htmlspecialchars(strip_tags(trim($_POST[$var_sn]))));
		return $var_sn;
	}


	/**Sentencias prehechas para usarse en mercaderias-------------------------------**/

	function consulta_valM($sentencia){
		global $q_merc;
		global $mens_error;
		$consulta_bd = mysqli_query($q_merc,$sentencia) or die($mens_error);
		return $consulta_bd = mysqli_num_rows($consulta_bd);
		mysqli_close($q_merc);
	}

	function consulta_arrayM($sentencia){
		global $q_merc;
		global $mens_error;
		$consulta_bd = mysqli_query($q_merc,$sentencia) or die($mens_error);
		return $consulta_bd = mysqli_fetch_array($consulta_bd);
		mysqli_close($q_merc);	
	}

	function insertarM($sentencia){
		global $q_merc;
		global $mens_error;
		return $consulta_bd = mysqli_query($q_merc,$sentencia) or die($mens_error);
		mysqli_close($q_merc);
	}

	function consulta_genM($sentencia){
		global $q_merc;
		global $mens_error;
		return $consulta_bd = mysqli_query($q_merc,$sentencia) or die($mens_error);
		mysqli_close($q_merc);
	}
	
?>