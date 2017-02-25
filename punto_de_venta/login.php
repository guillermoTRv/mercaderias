<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
	<link rel="stylesheet" href="css/estilo_login.css">
	<link rel="stylesheet" href="css/btp_login.css">	
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script  src="js/fns_login.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-6 col-md-offset-3 div_esp">
			
			<form id="fr_login" method="POST" method="multipart/form-data">
				<p>Porfavor ingrese su usuario y su contraseña para acceder al punto de venta</p>
				<br>
				<div class="row">
					<div class="col-md-2"><label>Usuario</label></div>
					<div class="col-md-2"><input type="text" name="usr_txt" id="1" autofocus></div>
					
				</div>
				<br>
				<div class="row">
					<div class="col-md-2"><label>Contraseña</label></div>
					<div class="col-md-2"><input type="password" id=2 name="pass_txt"></div>	
				</div>
				<div class="row" style="margin-top:15px">
					<div class="col-md-3 col-md-offset-2">
						<button id="btn_aceptar">Aceptar</button>
					</div>
					<div class="col-md-2">
						<button>Cancelar</button>
					</div>
				</div>	
				<div class="row">
					<div class="col-md-7 col-md-offset-2">
						<div id="mens"></div>			
					</div>
				</div>
			</form>
			
		</div>
		


	</div>
</body>
</html>