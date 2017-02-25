<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Ubicaciones</title>
      <link rel="stylesheet" href="css/init.css">
      <link rel="stylesheet" href="css/fonts.css">
      <link rel="stylesheet" href="css/faws4.7.0/css/faws.min.css">
      <link rel="stylesheet" href="css/fv2.css">
   </head>
   <body>
      <!-- **************************************************************** -->
      <!-- ****************form para guardar proveedores******************* -->
      <!-- **************************************************************** -->
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
                     <a href="#">Ubicaciones</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>

               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_ubicacion($(this),event);">
                     <input placeholder="Ingrese id_cd o nombre de Ubicacion" type="text" id="valtosearch">
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
                     <!--************************************************************************************************** -->
                     <!--*********************************FORM Ubicaciones INIT************************************************** -->
                     <!--************************************************************************************************** -->
                     <form class="_form" id="trysave_ubicaciones" onsubmit="trysave_ubicaciones(event);">
                        <!--<div class="_title">Alta de Ubicaciones</div>-->
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">Ubicaciones</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">Ubicacion</label>
                                       <input type="text" id="ub_ubicacion" name="ub_ubicacion">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Tipo</label>
                                       <select id="ub_tipo" name="ub_tipo">
                                          <option disabled value="null">--- Seleccione ---</option>
                                          <option value="a">A</option>
                                          <option value="b">B</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Zona</label>
                                       <input type="text" id="ub_zona" name="ub_zona">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Estatus</label>
                                       <select id="ub_status" name="ub_status">
                                          <option disabled value="null">--- Seleccione ---</option>
                                          <option value="a">A</option>
                                          <option value="b">B</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Multiarticulos</label>
                                       <label class="lab_check">
                                          <i class="fa fa-square-o"></i>
                                          <input type="checkbox" id="ub_multiart" onchange="togglecheck($(this));">
                                       </label>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="_botonera">
                              <button type="reset"><i class="fa fa-trash"></i> Limpiar</button>
                              <button type="submit"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>
                     </form>
                     <!--************************************************************************************************** -->
                     <!--*********************************FORM Ubicaciones END************************************************** -->
                     <!--************************************************************************************************** -->
                  </div>
               </div>
               <!--END .bodycanvas -->
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
   // poner aqu funciones que se ejecutan solo para este archivo
</script>
