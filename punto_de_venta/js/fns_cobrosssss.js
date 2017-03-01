var control = "no";
$(document).keydown(function(){
	if (event.which == 13) {
		input_codigo = $("#input_codigo").val();
		var url="cobro/process_cobro.php";
		 	$.ajax({
				type:"POST",
				url:url,
				data:$("#form_cobro").serialize(),

				success:function(data){
				var respuesta = data;
					if (respuesta == "nulo") {
					   	$("#mensaje_nulo").html("<strong style='color:#a94442'>No se encontro el articulo</strong>");
					}
					else{
					   	var filas        = $(".fila_prd");
						var num_filas    = filas.length; 
						if (num_filas == 0) {
							$("table tbody").append(data);
		            		$("#mensaje_nulo").html("");
						}
						else{
							
							$("#contenido_tabla tr .dato_codigo").each(function(){
								var obtenido = $(this).text();	
 								//alert("El valor obtenido es"+obtenido);
 								//alert("Lo que viene en el input es"+input_codigo);
 								if (obtenido == input_codigo) {
 									var tr_desc     = $("#tr-"+obtenido+" td:eq(1)").html();
			 						var tr_cantidad_i = parseInt($("#tr-"+obtenido+" td:eq(2)").html());
			 						var tr_precio   = $("#tr-"+obtenido+" td:eq(3)").html();
			 						
			 					    tr_cantidad     = tr_cantidad_i + 1;
			 						var tr_total    = tr_cantidad * tr_precio;
			 						
			 						$("#tr-"+obtenido).html("<td class='dato_codigo'>"+obtenido+"</td><td>"+tr_desc+"</td><td>"+tr_cantidad+"</td><td>"+tr_precio+"</td><td>"+tr_total+"</td>");
			 						$("#mensaje_nulo").html("");
			 						//alert("me inserta desde el if");
 								}
 								if (obtenido!=input_codigo) {
 									//alert("No queda");
 									var mas =  $("#tr-"+input_codigo).length;
 									//alert(mas);
 									if (mas == 0) {
 										$("table tbody").append(data);
		            					$("#mensaje_nulo").html("");
 									}	
 									if (mas == 1) {
 										//alert("tranquilo");
 									} 									
 								}

							});
						}
					   	
					}

				}
			});
			return false;
	}
	
});


