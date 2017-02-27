<?php 
	include("funciones.php");
	session_start(); 

	$usr_ventas   = sanitizar("usr_txt");
	$pass_ventas  = sanitizar("pass_txt");
	$sentencia    = "SELECT id_usuario,Nombre,apellido_paterno FROM usuario WHERE Nombre = '$usr_ventas' and password = '$pass_ventas'";

	$validacion_1 = consulta_val($sentencia);


	if ($usr_ventas=='' or $pass_ventas =='') {
			
	}
	else{
		if ($validacion_1 == 0) {
		    echo "Error de logeo, usuario o contraseña invalidos";
		}
		if ($validacion_1 == 1) {
			

			#echo "El usuario si existe";
			#Recogemos la id del usuario de la bd
			
			$array_user    = consulta_array($sentencia);
			$id_usuario    =  $array_user['id_usuario'];
			
			$consulta_fondo = consulta_val("SELECT estatus FROM inicio_sesion WHERE usuario_inicio='$id_usuario' AND estatus='A'");

			
			/*$insertSes  = mysqli_query($q_vent,"INSERT INTO inicio_sesion(id_inicio_user,usuario_inicio,estatus,fecha_inicio) VALUES(1,'$id_usuario','I','$fecha')") or die("--");*/

			if ($consulta_fondo == 1) {
				$array_fondo = mysqli_fetch_array($cons_fondo);
				//saber si tiene cuenta pendiente
				echo "<br>Checar tickets";
			} 
			if ($consulta_fondo == 0) {
				#echo "<br>Mandar a pantalla";
				$_SESSION["id_usuario"]           =  $id_usuario;
				$_SESSION['nombre_us']         =  $array_user['Nombre'];
				$_SESSION['apellido_paterno']  =  $array_user['apellido_paterno']; 
				?><script>window.location.href = "../punto_de_venta/fondo.php";</script> <?php
			}



		}
	}
	
?>