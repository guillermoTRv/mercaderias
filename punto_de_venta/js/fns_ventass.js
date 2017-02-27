//arreglar las teclas 
$(document).keydown(function(){
		if (event.which == 13) {
			 var url="cobro/process_cobro.php";
	        $.ajax({
	            type:"POST",
	            url:url,
	            data:$("#form_cobro").serialize(),

	            success:function(data){
	                $("#m_v").html(data);     
	              
	            }
	        });
        
        	return false;
		}
		        
});

/**
$(document).keydown(function(){
	if(event.which == 88 ){        
    	$("<tr> <td>asas</td> <td>asas</td> <td>asas</td> <td>asas</td> <td>asasaa</td> </tr>").appendTo("table tbody");   
    }
    if(event.which == 86 ){        
    	$("#tabla tr:last").remove("");   
    }
});

**/