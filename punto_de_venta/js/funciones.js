/**$(document).ready(function(){
   
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
});**/
 $(function(){
            $(document).on("click","#button_aceptar",function(){

                var formData = new FormData($("#form_fondo")[0]);

                var ruta = "process_fondo.php";

                $.ajax({

                    url: ruta,

                    type: "POST",

                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(data)
                    {
                        $("#m_v").html(data);
                    }
                });
            });
         });