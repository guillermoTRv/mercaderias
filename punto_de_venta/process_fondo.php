<?php
	session_start();
	include("funciones.php");
	$billetes_500 = sanitizar("500_txt");  
	$billetes_200 = sanitizar("200_txt"); 
    $billetes_100 = sanitizar("100_txt"); 
	$billetes_50  = sanitizar("50_txt");  
	$billetes_20  = sanitizar("20_txt");
	$monedas_10   = sanitizar("10_txt");
	$monedas_5    = sanitizar("5_txt");
	$monedas_2    = sanitizar("2_txt");
	$monedas_1    = sanitizar("1_txt");
	$monedas_50c  = sanitizar("50c_txt");
	$fondo = (500*$billetes_500)+(200*$billetes_200)+(100*$billetes_100)+(50*$billetes_50)+(20*$billetes_20)+(10*$monedas_10)+(5*$monedas_5)+(2*$monedas_2)+(1*$monedas_1)+(.5*$monedas_50c);
    
    $id_usuario   = sanitizar("usuario_txt");
    $_SESSION['fondo']   =  $fondo;

    


   	#1-Guardar el hecho de que el usuario a iniciado sesion "Datos de inicializacion"
	#2-Puede que con ajax se hagan dos consultas consecutivas asi que aqui controlaremos el insert
    
	$validacion  = consulta_val("SELECT usuario_inicio FROM inicio_sesion WHERE usuario_inicio='$id_usuario' AND estatus='A'");
	if ($validacion == 0) {
		$secuencia    = consulta_gen("SELECT secuencia('id_inicio_user')");
	    $consulta_sec = consulta_array("SELECT seq_val FROM _sequence WHERE seq_name = 'id_inicio_user'");
	    $num_sec      = $consulta_sec['seq_val'];

	    $insertar     = insertar("INSERT INTO inicio_sesion(id_inicio_user,usuario_inicio,estatus,fecha_inicio) VALUES('$num_sec','$id_usuario','A','$fecha')");


	    #3 Guardar los datos de fondo $$$$
	    $denominaciones = array(500=>$billetes_500, 200=>$billetes_200, 100=>$billetes_100, 50=>$billetes_50, 20=>$billetes_20, 10=>$monedas_10, 5=>$monedas_5, 2=>$monedas_2, 1=>$monedas_1, ".5"=>$monedas_50c);
	    foreach($denominaciones as $billete=>$cantidad)
		{
			#echo "El " . $billete . " es " . $cantidad;
			#echo "<br>";
			$monto_total = $billete * $cantidad;
			#echo "<br>";
			if ($cantidad == '') {
				$cantidad = 0;
			}
			$inser_fondo = insertar("INSERT INTO fondo(id_inicio_user,denominacion,total,monto_total) values('$num_sec','$billete','$cantidad','$monto_total')");
			?><script>window.location.href = "../punto_de_venta/";</script> <?php
		}



	}
	else{
		echo "ey stop";
	}

?>