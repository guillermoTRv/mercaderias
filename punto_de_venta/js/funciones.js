function suma ($valor){
  var suma = 0;
  var operacion = $valor.val();
  $("#form_fondo").find(".ipt").each(function(idx,obj){

    var billete = $(this).data("iptval");
    $(this).val()==""?val=0:val=$(this).val() 
    var multiplicacion = val * billete;
            
            suma = suma + multiplicacion;
            $("#textDiv").html("$"+suma);  
        
        
  });

};

$(document).keydown(function(){
        var resultado = parseInt(document.activeElement.id);
        if(event.which == 13 || event.which == 40){        
            var cambio = resultado + 1; 
            $("#"+cambio).focus(); 
        }
        if(event.which == 38){        
            var cambio = resultado -1; 
            $("#"+cambio).focus(); 
        }/*
        if(event.which == 37){        
            var cambio = resultado - 5; 
            $("#"+cambio).focus(); 
        }
        if(event.which == 39){        
            var cambio = resultado + 5; 
            $("#"+cambio).focus(); 
        }*/
        if (event.which == 27) {
          window.location.href = "../punto_de_venta";
        }
});

$(document).ready(function(){
   
   $(this).on("keydown",function(e){

      e.cancelBubble = true;
      console.log(e.keyCode);

      if(e.ctrlKey && e.keyCode==13){
         e.preventDefault();
          var url="process_fondo.php";
          $.ajax({
            type:"POST",
            url:url,
            data:$("#form_fondo").serialize(),

            success:function(data){
                $("#m_v").html(data);                
            }

          });
         //window.location.href = "../punto_de_venta/";
         return false;
      }
   });
});