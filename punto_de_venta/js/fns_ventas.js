
$(document).keydown(function(){
	if(event.which == 88 ){        
    	$("<tr> <td>asas</td> <td>asas</td> <td>asas</td> <td>asas</td> </tr>").appendTo("table tbody");   
    }
    if(event.which == 86 ){        
    	$("#tabla tr:last").remove("");   
    }
});

