<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Tiendas y Centros de Distribucion</title>
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
                     <a href="index.php">Tiendas y Centros de Distribucion</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_tiendacd($(this),event);">
                     <input placeholder="Ingrese nombre o id de tienda" type="text" id="valtosearch">
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
                     <form class="_form" id="trysave_tienda" onsubmit="trysave_tienda(event);">
                     <!--<div class="_title">Alta de Tiendas y Centros de Distribucion</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Tiendas y Centros de Distribucion</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Tienda o CD</label>
                                    <select id="dist_tipoubic" name="dist_tipoubic" onchange="compruebatipotienda($(this));">
                                       <option value="null" selected disabled>--- Seleccione ---</option>
                                       <option value="TIENDA">TIENDA</option>
                                       <option value="CD">CD</option>
                                    </select>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Numero de Tienda</label>
                                    <input type="text" id="dist_num" name="dist_num">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Descripcion</label>
                                    <input type="text" id="dist_desc" name="dist_desc">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Direccion</label>
                                    <input type="text" id="dist_dir" name="dist_dir">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Responsable</label>
                                    <input type="text" name="dist_resp" name="dist_resp">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Region</label>
                                    <input type="text" id="dist_region" name="dist_region" value="10">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Estado</label>
                                    <select disabled id="dist_estado" name="dist_estado">
                                       <option>cargando...</option>
                                    </select>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Delegacion / Municipio</label>
                                    <select disabled id="dist_ciudad" name="dist_ciudad">
                                       <option>cargando...</option>
                                    </select>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha de apertura</label>
                                    <input type="date" id="dist_finit" name="dist_finit" value="2017-03-02">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha de cierre</label>
                                    <input type="date" id="dist_fend" name="dist_fend" value="2017-03-02">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Tipo tienda</label>
                                    <select id="dist_tipotienda" name="dist_tipotienda"></select>
                                 </div>

                                 <div id="cdatiende" class="v_wrappipt" style="display:none;">
                                    <label for="">CD Atiende</label>
                                    <input type="text" id="dist_atendio" name="dist_atendio">
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_go" type="button" name="button"><i class="fa fa-search"></i> Buscar</button>
                           <button class="btn_deft" type="submit" onclick="trysave_tienda(event);" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                     </div>
                  </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- **************************************************************** -->
      <!-- ****************form para guardar proveedores******************* -->
      <!-- **************************************************************** -->

      <!--<footer>
         <img src="imgs/system/imagen2.png" alt="logo de la empresa" height="80">
      </footer>-->
   </body>
</html>
<script type="text/javascript" src="js/jquery3.min.js"></script>
<script type="text/javascript" src="js/fns.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      loadcombos('estado:dist_estado,ciudad:dist_ciudad');
      loadtipotienda();
   });
</script>
