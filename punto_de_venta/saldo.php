<?php session_start(); $id_usuario = $_SESSION['id_usuario'];?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Cuenta inicial</title>
	<!-- Optional theme -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/estilo_saldo.css">
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script  type="text/javascript" src="js/fns_saldos.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
				
				<div class="col-md-6 col-md-offset-3 div_center">
					<h3><b>Bienvenido: <?php echo $_SESSION['nombre_us']." ".$_SESSION['apellido_paterno'];  ?></b></h3>
					<hr>
					<form method="post" enctype="multipart/form-data" id="form_fondo">
						<div class="row" style="padding:0px 20px 20px 20px">

							<div class="col-md-6">
								<div class="input-group">
								  <span class="input-group-addon"><b>$500</b></span>
								  <input type="text" class="form-control ipt" id="1" maxlength="3" data-iptval = "500" pattern="[0-9]+" name="500_txt" onkeyup="suma($(this));" autocomplete="off" autofocus >
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$200</b></span>
								  <input type="text" class="form-control ipt" id="2" maxlength="3" data-iptval = "200" pattern="[0-9]+" name="200_txt" onkeyup="suma($(this));" autocomplete="off" >
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$100</b></span>
								  <input type="text" class="form-control ipt" id="3" maxlength="3" data-iptval = "100" pattern="[0-9]+" name="100_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$50 &nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="4" maxlength="3" data-iptval = "50"  pattern="[0-9]+" name="50_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$20 &nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="5" maxlength="3" data-iptval = "20"  pattern="[0-9]+" name="20_txt" onkeyup ="suma($(this));" autocomplete="off">
								</div>
							</div>
							
							<div class="col-md-6">
								<div class="input-group">
								  <span class="input-group-addon"><b>$10&nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="6"  maxlength="4"  data-iptval = "10" pattern="[0-9]+" name="10_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$5 &nbsp;&nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="7" maxlength="4"  data-iptval = "5" pattern="[0-9]+" name="5_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$2 &nbsp;&nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="8" maxlength="4"  data-iptval = "2" pattern="[0-9]+" name="2_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$1 &nbsp;&nbsp;</b></span>
								  <input type="text" class="form-control ipt" id="9" maxlength="4"  data-iptval = "1" pattern="[0-9]+" name="1_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<div class="input-group">
								  <span class="input-group-addon"><b>$.50</b></span>
								  <input type="text" class="form-control ipt" id="10" maxlength="4"  data-iptval = ".5" pattern="[0-9]+" name="50c_txt" onkeyup="suma($(this));" autocomplete="off">
								</div>
								<?php echo "<input type='hidden' value='$id_usuario' name='idusuario_txt'>" ?>

							</div>
						</div>
						<div class="row">
							<p style="text-align:center;">
								<button type="button" class="btn btn-default" style="width:200px">Aceptar</button>
								<button type="button" class="btn btn-default" style="width:200px">Salir</button>
							</p>
						</div>

						<div class="row">
							<center>

								<h4>
									Suma de efectivo 
									<b id="textDiv"></b>
								</h4>
							</center>	
						</div>

					</form>

					
					 
				</div>
		</div>
	</div>

	
</body>
</html>