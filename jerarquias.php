<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Proveedor</title>
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
      <!-- **************************************************************** -->
      <!-- ****************form para guardar proveedores******************* -->
      <!-- **************************************************************** -->
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
                     <a href="#">Jerarquias</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--<form class="buscador">
                  <input placeholder="Ingrese id o nombre de proveedor" type="text" id="valtosearch">
                  <button type="submit"><i class="fa fa-search"></i></button>
               </form>-->

               <div class="bodycanvas">
                  <!--<div class="btntowrite">
                     <button type="button" name="button"><i class="fa fa-plus"></i> Nuevo </button>
                  </div>

                  <div class="ajaxresponses">
                     div para las respuestas del ajax
                  </div>-->

                  <div>
                     <!--************************************************************************************************** -->
                     <!--*********************************FORM jerarquias INIT************************************************** -->
                     <!--************************************************************************************************** -->
                     <form class="_form" id="trysave_jerarquia">
                        <div class="_title"></div>
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">Jerarquia</div>
                                 <div class="h_content">
                                    <div class="_wrappipt col3">
                                       <label></label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label></label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label>DESCRIPCION</label>
                                    </div>
                                 </div>

                                 <div class="h_content">
                                    <div class="_wrappipt col3">
                                       <label class="lab_initrow">ID DEPTO</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_depto" name="jer_depto">
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_depdescr" name="jer_depdescr"></textarea>
                                    </div>
                                 </div>

                                 <div class="h_content">
                                    <div class="_wrappipt col3">
                                       <label class="lab_initrow">ID CLASE</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_clase" name="jer_clase">
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_cldescr" name="jer_cldescr">
                                    </div>
                                 </div>

                                 <div class="h_content">
                                    <div class="_wrappipt col3">
                                       <label class="lab_initrow">ID SUBCLASE</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_sclase" name="jer_sclase">
                                    </div>

                                    <div class="_wrappipt col3">
                                       <input type="text" id="jer_scldescr" name="jer_scldescr">
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="_botonera">
                              <button class="btn_go" type="buttgon" name="button" onclick="search_jerarquia(event);"><i class="fa fa-search" ></i> Buscar</button>
                              <button class="btn_deft" type="submit" name="button" onclick="trysave_jerarquia(event);"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>

                        <hr>
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">DETALLE</div>
                                 <div class="h_content" id="targettoresp">
                                    <div class="_wrappipt col3">
                                       <label for="">DEPARTAMENTO</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label for="">CLASE</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label for="">SUBCLASE</label>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </form>
                     <!--************************************************************************************************** -->
                     <!--*********************************FORM jerarquias END************************************************** -->
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
   $(document).ready(function(){
      loadmenu();
   });
</script>
