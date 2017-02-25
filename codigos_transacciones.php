<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Codigos de Transacciones</title>
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
                     <a href="#">Codigos de Transacciones</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>

               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_transcode($(this),event);">
                     <input placeholder="Ingrese id o descripcion de codigo" type="text" id="valtosearch">
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

                     <form class="_form" id="trysave_codigo" onsubmit="trysave_codigo(event);">
                     <!--<div class="_title">Codigos de Transacciones</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <label for="">CODIGO</label>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label for="">DESCRIPCION</label>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label for="">ACTIVO</label>
                                 </div>
                              </div>

                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <input type="text" id="cod_codigo" name="cod_codigo">
                                 </div>

                                 <div class="_wrappipt col3">
                                    <input type="text" id="cod_desc" name="cod_desc">
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label class="lab_check">
                                       <i class="fa fa-square-o"></i>
                                       <input type="checkbox" id="cod_active" onchange="togglecheck($(this));">
                                    </label>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Eliminar</button>
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
