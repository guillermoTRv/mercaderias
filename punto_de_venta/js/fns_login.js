$(function(){
    $("#btn_aceptar").click(function(){
        var url="process_login.php";
        $.ajax({
            type:"POST",
            url:url,
            data:$("#fr_login").serialize(),

            success:function(data){
                $("#mens").html(data);     
              
            }
        });
        return false;
    });
});

$(document).keydown(function(){
        var resultado = parseInt(document.activeElement.id);
        if(event.which == 13 || event.which == 40){        
            var cambio = resultado + 1; 
            $("#"+cambio).focus(); 
        }
        if(event.which == 38){        
            var cambio = resultado -1; 
            $("#"+cambio).focus(); 
        }

});