<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	
	$(document).keydown(function(){
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
	});

</script>
<form action="">
    <input type="text" placeholder="escribe" id="nombre">
</form>
<table>
	<thead>
		<tr>
			<th>columna 1</th>
			<th>columna 2</th>
			<th>columna 3</th>
		</tr>		
	</thead>
	<tbody id="contenido">
		<tr class="fila">
			<td id="dato">articulo 1</td>
			<td>312</td>
			<td>312</td>
		</tr>
		<tr class="fila">
			<td id="dato">articulo 2</td>
			<td>312qwe</td>
			<td>312123</td>
		</tr>
		<tr class="fila">
			<td id="dato">articulo 3</td>
			<td>123312</td>
			<td>312</td>
		</tr>
	</body>
</table>

