$(document).keydown(function(){
		if (event.which == 13) {
			var input_codigo = $("#input_codigo").val();
			var filas        = $(".fila_prd");
			var num_filas    = filas.length; 
			//alert(num_filas);
			if (num_filas == 0) {
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
		            		 $("table tbody").append(data);
		            		 $("#mensaje_nulo").html("");
		            	}

		            }
		        });
	        	//alert("estssamos en incio");
	        	return false;	
			} //**Vamo por partes aqui me busca si ya tenia un registro previo subido**//
			else
			{
				//alert($("#contenido_tabla").html());
				//alert($("#contenido_tabla tr td:eq(0)").html());
				$("#contenido_tabla tr .dato_codigo").each(function(){
 					
 					var obtenido = $(this).text();	
 					alert("El valor obtenido es"+obtenido);
 					alert("Lo que viene en el input es"+input_codigo);
 					if (input_codigo == obtenido) {
 						var tr_desc     = $("#tr-"+obtenido+" td:eq(1)").html();
 						var tr_cantidad_i = parseInt($("#tr-"+obtenido+" td:eq(2)").html());
 						var tr_precio   = $("#tr-"+obtenido+" td:eq(3)").html();
 						
 					    tr_cantidad     = tr_cantidad_i + 1;
 						var tr_total    = tr_cantidad * tr_precio;
 						
 						$("#tr-"+obtenido).html("<td class='dato_codigo'>"+obtenido+"</td><td>"+tr_desc+"</td><td>"+tr_cantidad+"</td><td>"+tr_precio+"</td><td>"+tr_total+"</td>");
 						alert("me inserta desde el each if");
 						$("#mensaje_nulo").html("");
 						
 						return false;
 						
 					}
 					else{
 						
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
				            		 alert("me inserta desde el each else");
				            		 $("table tbody").append(data);
				            	}

				            }
				        });
 						
 					}
 						
 				});
 				//alert("estamos en el pre");
 				return false;	
			}
			//alert("no se metio en nada");

		}
});


/**$(document).keydown(function(){
		if(event.which == 88 ){        
	      var filas = $(".fila");
	      alert ("Hay " + filas.length + " filas");
	    
	      var v_input =  $("#nombre").val();
	      alert(v_input);
	      $("#contenido tr #dato").each(function(){
	            alert($(this).text())
	            if(v_input == $(this).text()){
	              //$("tr :contains("+v_input+")").html("seleccionado");
	              $("tr :contains("+v_input+")").parent().html("<td>--</td><td>+++</td><td>....</td>");
	              alert("detengamos el ciclo");
	              return false;
	            } 
	      });
	    }  
});**/




//arreglar las teclas 
/**
$(document).keydown(function(){
	if(event.which == 88 ){        
    	$("<tr> <td>asas</td> <td>asas</td> <td>asas</td> <td>asas</td> <td>asasaa</td> </tr>").appendTo("table tbody");   
    }
    
});

$(document).keydown(function(){
	if(event.which == 88 ){        
    	alert("hola");
    }
    
});**/


