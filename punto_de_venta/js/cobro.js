$(document).keydown(function(){
	var fila_id = $("table tbody #fila_id").length;
	if (event.which == 13){
		input_codigo = $("#input_codigo").val();
		
		var url="js/segundo_cobro.php";
		$.ajax({
			type:"POST",
			url:url,
			data:$("#form_cobro").serialize(),
			success:function(data){
				var respuesta = data;
				if (respuesta == "nulo") {
				   	$("#mensaje_nulo").html("<strong style='color:#a94442'>No se encontro el árticulo</strong>");
				}

				else{
					 var num_fila_sku = $("tbody tr.sku_"+data+"").length;
					 var sku_valor    = data;
					 //alert(num_fila_sku + sku_valor);

					 if (num_fila_sku == 0) {

					 	var url = "cobro/traer_fila.php";
					 	$.ajax({
							type:"POST",
							url:url,
							data:$("#form_cobro").serialize(),
							success:function(data_f){
							$("table tbody").append(data_f);
							var sku_img = $("#tr-"+input_codigo+" td:eq(0)").html();

							$("#mensaje_nulo").html("");
							$("#img_art").html("<img src='../imgs/articulos/"+sku_img+".jpg' style='width:180px'>");
						}
							
						});	

						return false;

					 }
					 if (num_fila_sku == 1) {

					 	var tr_desc     = $("tr.sku_"+sku_valor+" td:eq(1)").html();
			 			var tr_cantidad_i = parseInt($("tr.sku_"+sku_valor+" td:eq(2)").html());
			 			//alert(tr_cantidad_i);
			 			var tr_precio     = parseFloat($("tr.sku_"+sku_valor+" td:eq(3)").html());
			 						
			 			var tr_cantidad = parseFloat(tr_cantidad_i + 1);
			 			var tr_total    = parseFloat(tr_cantidad * tr_precio);
			 			


			 			$("tr.sku_"+sku_valor).html("<td class='dato_codigo'>"+sku_valor+"</td><td>"+tr_desc+"</td><td>"+tr_cantidad+"</td><td>"+tr_precio+"</td><td>"+tr_total+"</td>");
			 			$("#mensaje_nulo").html("");
			 			$("#img_art").html("<img src='../imgs/articulos/"+sku_valor+".jpg' style='width:180px'>");


					 }




				}



			}
		});
		
		return false;



	}
	if (fila_id == 0) {
		if (event.which == 107) {
		//$("#contenido_tabla:last").append("<tr><td>asd</td> <td>asd</td></tr>");
		var trs_sku        = $("#contenido_tabla tr:last td:eq(0)").html();
		
		var trs_desc       = $("#contenido_tabla tr:last td:eq(1)").html();
		
		var trs_cantidad_i = parseFloat($("#contenido_tabla tr:last td:eq(2)").html());


		var trs_precio     = parseFloat($("#contenido_tabla tr:last td:eq(3)").html());
		

		var trs_cantidad   = trs_cantidad_i + 1;
		
		var trs_total      = trs_cantidad * trs_precio;

		$("#contenido_tabla tr:last").html("<td class='dato_codigo'>"+trs_sku+"</td><td>"+trs_desc+"</td><td>"+trs_cantidad+"</td><td>"+trs_precio+"</td><td>"+trs_total+"</td>");
		}
		if (event.which == 109) {
		//$("#contenido_tabla:last").append("<tr><td>asd</td> <td>asd</td></tr>");
		var trr_upc        = $("#contenido_tabla tr:last td:eq(0)").html();
		
		var trr_desc       = $("#contenido_tabla tr:last td:eq(1)").html();
		
		var trr_cantidad_i = parseFloat($("#contenido_tabla tr:last td:eq(2)").html());

		var trr_precio     = parseFloat($("#contenido_tabla tr:last td:eq(3)").html());
		

		var trr_cantidad   = trr_cantidad_i - 1;
		var trr_total      = trr_cantidad * trr_precio;
		
		if (trr_cantidad == 0) {
			
			var control_resta;
		    var r = confirm("Desea eliminar este articulo de esta compra");
		    if (r == true) {
		    	$("tr").remove("#contenido_tabla tr:last");    
		    } else {
		        
		    }
		}
		if (trr_cantidad > 0) {
			$("#contenido_tabla tr:last").html("<td class='dato_codigo'>"+trr_upc+"</td><td>"+trr_desc+"</td><td>"+trr_cantidad+"</td><td>"+trr_precio+"</td><td>"+trr_total+"</td>");	
		}	
		}
	}


	if (event.which == 40) {

		if (fila_id == 0) {
			$("#contenido_tabla tr:first").css("background-color","#dff0d8");
			var trn_desc       = $("#contenido_tabla tr:first td:eq(1)").html();
			$("#contenido_tabla tr:first td:eq(1)").html(""+trn_desc+" <b id='fila_id'></b>");
		}
		else{
			var padre     = $("#fila_id").parent().parent();

			var siguiente = $("#fila_id").parent().parent().next();
			var mames     = $("#fila_id").parent().parent().next();

			var siguiente_td = $("#fila_id").parent().parent().next().children("td:eq(1)");
			padre.css("background-color","#FFFFFF");
			
			//eliminamos la etiqueta b
			$("b").remove("#fila_id");

			var trn_desc = siguiente_td.html();
			siguiente_td.html(trn_desc+" <b id='fila_id'></b>");
			//le llevamos la b a la siguiente fila
			
			
			//pintamos la siguiente fila//
			siguiente.css("background-color","#dff0d8");
			

		}


	}


	if (event.which == 38) {

		if (fila_id == 0) {
			$("#contenido_tabla tr:last").css("background-color","#dff0d8");
			var trn_desc       = $("#contenido_tabla tr:last td:eq(1)").html();
			$("#contenido_tabla tr:last td:eq(1)").html(""+trn_desc+" <b id='fila_id'></b>");
		}
		else{
			var padre     = $("#fila_id").parent().parent();

			var siguiente = $("#fila_id").parent().parent().prev();
			var mames     = $("#fila_id").parent().parent().prev();

			var siguiente_td = $("#fila_id").parent().parent().prev().children("td:eq(1)");
			padre.css("background-color","#FFFFFF");
			
			//eliminamos la etiqueta b
			$("b").remove("#fila_id");

			var trn_desc = siguiente_td.html();
			siguiente_td.html(trn_desc+" <b id='fila_id'></b>");
			//le llevamos la b a la siguiente fila
			
			
			//pintamos la siguiente fila//
			siguiente.css("background-color","#dff0d8");
			

		}

	}




});