<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Distribucion de pedidos</title>
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
                     <a href="index.php">Distribucion de Pedidos</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form">
                     <!--<div class="_title">Distribucion de Pedidos</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">No pedido inicia</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">No pedido final</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Destino</label>
                                    <input type="text" name="" value="">
                                 </div>
                              </div>
                           </div>

                           <div class="_ssection">
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Fecha inicia</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha final</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for=""></label>
                                    <button type="button" name="button" class="btnform">
                                       <i class="fa fa-search"></i> Buscar
                                    </button>
                                 </div>
                              </div>
                           </div>

                        </div>
                     </div>
                  </form>
                  <hr>
                  <form class="_form">
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>No pedido</th>
                                       <th>SKU</th>
                                       <th>UPC</th>
                                       <th>Descripcion</th>
                                       <th>Destino</th>
                                       <th>Destino</th>
                                       <th>INNER PACK</th>
                                       <th>Piezas pedidas</th>
                                       <th>Cajas pedidas</th>
                                       <th>Piezas distribuidas</th>
                                    </tr>
                                 </table>
                                 <button class="addart" type="button" name="button">Seleccion para distribucion</button>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>No pedido</th>
                                       <th>SKU</th>
                                       <th>UPC</th>
                                       <th colspan="2">Descripcion</th>
                                       <th>Destino</th>
                                       <th>Destino</th>
                                       <th>INNER PACK</th>
                                       <th>Piezas a distribuir</th>
                                    </tr>
                                 </table>
                                 <button class="addart" type="button" name="button">Distribucion</button>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Nuevo</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Buscar</button>
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-trash"></i> Eliminar</button>
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
