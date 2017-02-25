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
                     <a href="#">Proveedor</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_proveedor($(this),event);">
                     <input placeholder="Ingrese id o nombre de proveedor" type="text" id="valtosearch">
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
                     <!--*********************************FORM Proveedor INIT************************************************** -->
                     <!--************************************************************************************************** -->
                     <form class="_form" id="trysave_prov" onsubmit="trysave_prov(event);">
                        <!--<div class="_title">Alta de Proveedor</div>-->
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">Proveedor</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">Numero de Proveedor</label>
                                       <input type="text" id="prov_num" name="prov_num">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Nombre</label>
                                       <input type="text" id="prov_name" name="prov_name">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Contacto</label>
                                       <input type="text" id="prov_contacto" name="prov_contacto">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Telefono</label>
                                       <input type="text" id="prov_tel" name="prov_tel">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Correo</label>
                                       <input type="text" id="prov_mail" name="prov_mail">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Status</label>
                                       <select id="prov_status" name="prov_status">
                                          <option disabled selected>-- Seleccione --</option>
                                          <option value="a">A</option>
                                          <option value="c">C</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Moneda</label>
                                       <select id="prov_moneda" name="prov_moneda">
                                          <option disabled selected>-- Seleccione --</option>
                                          <option value="mxn">Pesos</option>
                                          <option value="dlr">Dolar</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Impuesto</label>
                                       <input type="text" id="prov_imp" name="prov_imp">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Direccion</label>
                                       <textarea id="prov_dir" name="prov_dir"></textarea>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Estado</label>
                                       <select disabled id="prov_estado" name="prov_estado">
                                          <option disabled selected>cargando..</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Municipio</label>
                                       <select disabled id="prov_delmun" name="prov_delmun">
                                          <option disabled selected>cargando...</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Codigo postal</label>
                                       <input type="text" id="prov_cp" name="prov_cp">
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="_botonera">
                              <button type="reset"><i class="fa fa-refresh"></i> Limpiar</button>
                              <button type="submit"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>
                     </form>
                     <!--************************************************************************************************** -->
                     <!--*********************************FORM Proveedor END************************************************** -->
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
      loadcombos('estado:prov_estado,ciudad:prov_delmun');
   });
</script>
