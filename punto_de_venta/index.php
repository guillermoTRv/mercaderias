<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Punto de venta</title>
	<link rel="stylesheet" href="css/estilo_indexxx.css">
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script  type="text/javascript" src="js/fns_ventass.js"></script>

</head>
<body>
	<div class="container div_principal">
		<div class="col-md-12 ">
			<div class="panel panel-default">
			  	<div class="panel-body">
					<form class="form-inline" id="form_codigo" method="POST" enctype="form/data">
					  <div class="form-group">
					    <label>Codigo de producto</label>
					    <input type="text" class="form-control" autofocus tabindex="1">
					  </div>
					  <div class="form-group">
					    <label>Tipo precio</label>
					    <select class="form-control" tabindex="2">
					    	<option value="1">1</option>
					    	<option value="2">2</option>
					    </select>				
					  </div>
					</form>
					<div id="m_v">
						
					</div>

			 	</div>

			</div>
			<div class="panel panel-default">
			    <div class="panel-body">
					<div class="row">
						<div class="col-md-7">
				        	<table class="table table-bordered" id="tabla_vnt">
					        	<thead>
					        		<tr style="font-size:.9em">
					        			<th>
					        				Codigo producto
					        			</th>
					        			<th>
					        				Descripcion
					        			</th>
					        			<th>
					        				Cantidad
					        			</th>
					        			<th>
					        				Precio
					        			</th>
					        			<th>
					        				Importe
					        			</th>
					        		</tr>
					        	</thead>
					        	<tbody>
					        		

					        	</tbody>
					        </table>
				        
				        </div>
			        
				        <div class="col-md-5">
				        	<img src="..." alt="..." class="img-thumbnail">
				        </div>
					</div>

			        <div class="row">
			        	<div class="col-md-1">
			        		<button type="button" class="btn btn-default btn_cobrar">Cobrar <br> Enter</button>	
			        	</div>
			        	<div class="col-md-3" style="margin-left:20px">
			        		<form class="form-horizontal">
								  
								  <div class="form-group" style="margin-bottom:0px">
								    <label class="col-sm-2 control-label label_inv">Subtotal</label>
								    <div class="col-sm-9 div_esp">
								    	<p class="text_et" >&nbsp;</p>
								    </div>
								  </div>

								  <div class="form-group" style="margin-bottom:0px">
								    <label class="col-sm-2 control-label label_inv">Iva</label>
								    <div class="col-sm-9 div_esp">
								    	<p class="text_et" >&nbsp;</p>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-2 control-label label_inv">Total</label>
								    <div class="col-sm-9 div_esp">
								    	<p class="text_et" >&nbsp;</p>
								    </div>
								  </div>
							</form>
			        	</div>
			        	
			        </div>

			        <div class="row">
			        	<div class="col-md-12">
			        		<div class="btn-group btn-group-lg" role="group" aria-label="">
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        		<button type="button" class="btn btn-default">fn</button>
				        	</div>	
			        	</div>
			        </div>
			    </div>
			</div>

		</div>	
	</div>
	
</body>
</html>