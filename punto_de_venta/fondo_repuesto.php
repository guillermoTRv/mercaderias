<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/estilo_fondo.css">
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script  type="text/javascript" src="js/funciones.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-md-5">
			<form id="form_fondo" method="post" enctype="multipart/form-data" >
				<input type="text" class="form-control ipt" data-iptval = "500" onkeyup="suma($(this));" name="500_txt">
				<input type="text" class="form-control ipt" data-iptval = "500" onkeyup="suma($(this));" name="200_txt">
				<input type="text" class="form-control ipt" data-iptval = "500" onkeyup="suma($(this));" name="100_txt">
				<input type="text" class="form-control ipt" data-iptval = "500" onkeyup="suma($(this));" name="50_txt">
				<button type="button" class="btn btn-default" id="button_aceptar" style="width:200px">Aceptar</button>
			</form>		
		</div>
		<div id="m_v"></div>
	</div>
	
</body>
</html>