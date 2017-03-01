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

	if (event.which == 107) {
		//$("#contenido_tabla:last").append("<tr><td>asd</td> <td>asd</td></tr>");
		var trs_upc        = $("#contenido_tabla tr:last td:eq(0)").html();
		
		var trs_desc       = $("#contenido_tabla tr:last td:eq(1)").html();
		
		var trs_cantidad_i = parseFloat($("#contenido_tabla tr:last td:eq(2)").html());

		var trs_precio     = parseFloat($("#contenido_tabla tr:last td:eq(3)").html());
		

		trs_cantidad       = trs_cantidad_i + 1;
		var trs_total      = trs_cantidad * trs_precio;

		
		$("#contenido_tabla tr#tr-"+trs_upc+"").html("<td class='dato_codigo'>"+trs_upc+"</td><td>"+trs_desc+"</td><td>"+trs_cantidad+"</td><td>"+trs_precio+"</td><td>"+trs_total+"</td>");
	}

	if (event.which == 109) {
		//$("#contenido_tabla:last").append("<tr><td>asd</td> <td>asd</td></tr>");
		var trr_upc        = $("#contenido_tabla tr:last td:eq(0)").html();
		
		var trr_desc       = $("#contenido_tabla tr:last td:eq(1)").html();
		
		var trr_cantidad_i = parseFloat($("#contenido_tabla tr:last td:eq(2)").html());

		var trr_precio     = parseFloat($("#contenido_tabla tr:last td:eq(3)").html());
		

		var trr_cantidad       = trr_cantidad_i - 1;
		var trr_total      = trr_cantidad * trr_precio;
		
		if (trr_cantidad == 0) {
			confirm("Se borrara por completo el articulo");
			$("tr").remove("#contenido_tabla tr#tr-"+trr_upc+"")

		}
		if (trr_cantidad > 0) {
			$("#contenido_tabla tr#tr-"+trr_upc+"").html("<td class='dato_codigo'>"+trr_upc+"</td><td>"+trr_desc+"</td><td>"+trr_cantidad+"</td><td>"+trr_precio+"</td><td>"+trr_total+"</td>");	
		}
		
	}

});


