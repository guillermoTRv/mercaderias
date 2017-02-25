<?php

if(isset($_FILES["up_img_art"]))
{
	//require_once("../fns.php");
	$file=$_FILES['up_img_art'];
	$nombre=$file['name'];
	$tipo=$file['type'];
	$ruta_provisional=$file['tmp_name'];
	$size=filesize($ruta_provisional);//$file['size'];
	$dimensiones=getimagesize($ruta_provisional);
	$width=$dimensiones[0];
	$height=$dimensiones[1];
	$carpeta="../imgs/articulos/temp/";

	$src = $carpeta.$nombre;

	if($tipo!= 'image/jpg' && $tipo !='image/jpeg' && $tipo!='image/png' && $tipo!='image/gif')
	 {
		echo "isnt_image";
	 }
	 else if(($size/1024)>1024)//para qeu la imagen no pese mas de un mega
		  {
			  echo round(($size/1024)/1024,1);//para convertir a megas
		  }
	/*
	 else if (file_exists($src))
		  {
			 echo "Error, nombre del archivo muy largo, cambie el nombre!";
		  }*/

		  else{

		  $movido=move_uploaded_file($ruta_provisional,$src);

				  if($movido)
				  {
					 /*$consulta='select us_foto from users where iduser="'.$usr.'"';
					  $exe2=mysqli_query($c,$consulta);
					  $fila=mysqli_fetch_assoc($exe2);
					  $anterior=$fila['us_foto'];

					  if($anterior!='user.png')
					  unlink($carpeta.$anterior);

					  $actualizacion='update users set us_foto="'.$nombre.'" where iduser="'.$usr.'"';
					  $exe=mysqli_query($c,$actualizacion);

					  if($exe)*/
					 echo $nombre;

				 }//if, si si se movió
				  else{echo "error el archivo no se subio";}
		  }//else si todo sale bien
}else{
   echo"no entro al scriptssss";
}// if principal
