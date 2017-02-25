<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Estados</title>
      <link rel="stylesheet" href="css/init.css">
      <link rel="stylesheet" href="css/fonts.css">
      <link rel="stylesheet" href="css/faws4.7.0/css/faws.min.css">
      <link rel="stylesheet" href="css/fv2.css">
   </head>
   <body>
      <header>
         <div class="sectionheader logo">
            <img src="imgs/system/imagen1.png" alt="logo de la empresa" height="60">
         </div>

         <div class="sectionheader items">
            <a href="#">opcion</a>

            <a href="#">opcion</a>

            <a href="#">opcion</a>

            <a href="#">opcion</a>
         </div>
      </header>

      <div id="mainwrapper" class="">
         <nav id="menuleft"></nav>

         <div class="bodywrapper">
            <div class="wrapercanvas">
               <div class="headercanvas">
                  <span class="username">Bienvenido Usuario</span>
               </div>
               <div class="menucanvas">
                  <div class="">
                     <a href="index.php"><i class="fa fa-home"></i></a>
                     <a href="#">Estados</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_estados($(this),event);">
                     <input placeholder="Ingrese id o nombre de Estado" type="text" id="valtosearch">
                     <button type="submit"><i class="fa fa-search"></i></button>
                  </form>
               <!--*********buscador************ -->
               <!--***************************************-->
               <div class="bodycanvas">
                  <div class="btntowrite">
                     <button type="button" name="button" onclick="togglewriter('formtowrite',$(this))"><i class="fa fa-plus"></i> Nuevo </button>
                  </div>

                  <div class="ajaxresponses">
                     <!-- div para las respuestas del ajax -->
                  </div>

                  <div class="formtowrite">
                     <form class="_form" id="fw_estado" onsubmit="trysave_estado(event);">
                     <!--<div class="_title">Estados y ciudades</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Estados</div>
                              <div class="h_content">
                                 <div class="_wrappipt col2">
                                    <label for="">Id Estado</label>
                                 </div>

                                 <div class="_wrappipt col2">
                                    <label for="">Descripcion</label>
                                 </div>
                              </div>

                              <div class="h_content">
                                 <div class="_wrappipt col2">
                                    <input type="text" id="edo_id" name="edo_id" value="">
                                 </div>

                                 <div class="_wrappipt col2">
                                    <input type="text" id="edo_desc" name="edo_desc" value="">
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-search"></i> Buscar</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                     </div>
                  </form>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <footer>
         <img src="imgs/system/imagen2.png" alt="logo de la empresa" height="80">
      </footer>
   </body>
</html>
<script type="text/javascript" src="js/jquery3.min.js"></script>
<script type="text/javascript" src="js/fns.js"></script>
<script type="text/javascript">
   // aqui se cargaran las funciones especificas para esta pagina
</script>
