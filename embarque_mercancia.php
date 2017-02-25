<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Embarque de mercancia</title>
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
                     <a href="index.php">Embarque de Mercancia</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form">
                     <!--<div class="_title">Embarque de Mercancia</div>-->
                     <div class="_content">

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Envio</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label class="col2" for="">Tienda</label>
                                    <div class="container_ipts col2">
                                       <input type="text" name="" value="">
                                       <input type="text" name="" value="">
                                    </div>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Numero de envio</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Estatus</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Numero transporte</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <button type="button" name="button">GUARDAR</button>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Tarimas a Embarcar</div>
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>TARIMA</th>
                                       <th>ESTATUS</th>
                                       <th>DESCRIPCION</th>
                                    </tr>
                                 </table>

                                 <div class="_botonera">
                                    <button class="addart" type="button" name="button"><i class="fa fa-plus-circle"></i> Guardar</button>
                                    <button class="addart" type="button" name="button"><i class="fa fa-plus-circle"></i> Aprobar Envio</button>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Detalle de tarimas</div>
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>SKU</th>
                                       <th>UPC</th>
                                       <th>Descripcion</th>
                                       <th>Peazas</th>
                                       <th>Cajas</th>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                        </div>
                     </div>
                  </form>
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
