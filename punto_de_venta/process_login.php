<?php 
	include("cfg.php");
	include("sanitizar.php");
	include("tiempo.php");
	include("errores.php");
	session_start(); 

	$usr_ventas  = sanitizar("usr_txt");
	$pass_ventas = sanitizar("pass_txt");

	$consulta_u = mysqli_query($q_vent,"SELECT id_usuario,Nombre,apellido_paterno FROM usuario WHERE Nombre = '$usr_ventas' and password = '$pass_ventas'");
	$validacion = mysqli_num_rows($consulta_u);

	if ($usr_ventas=='' or $pass_ventas =='') {
			
	}

	else{
		if ($validacion == 0) {
		    echo "Error de logeo";
		}
		if ($validacion == 1) {
			

			#echo "El usuario si existe";
			#Recogemos la id del usuario de la bd
			$array_user = mysqli_fetch_array($consulta_u);
			$id_usuario = $array_user['id_usuario'];
			
			$cons_fondo   = mysqli_query($q_vent,"SELECT estatus FROM inicio_sesion WHERE usuario_inicio='$id_usuario' AND estatus='A' ");
			$cons_fondo_v = mysqli_num_rows($cons_fondo);


			$insertSes  = mysqli_query($q_vent,"INSERT INTO inicio_sesion(id_inicio_user,usuario_inicio,estatus,fecha_inicio) VALUES(1,'$id_usuario','I','$fecha')") or die("--");



			if ($cons_fondo_v == 1) {
				$array_fondo = mysqli_fetch_array($cons_fondo);
				//saber si tiene cuenta pendiente
				#echo "<br>Checar tickets";
			} 
			if ($cons_fondo_v == 0) {
				#echo "<br>Mandar a pantalla";
				$_SESSION["id_usuario"]           =  $id_usuario;
				$_SESSION['nombre_us']         =  $array_user['Nombre'];
				$_SESSION['apellido_paterno']  =  $array_user['apellido_paterno']; 
				?><script>window.location.href = "../punto_de_venta/saldo.php";</script> <?php
			}



		}
	}
	
?>