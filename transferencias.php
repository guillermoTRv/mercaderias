<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Transferencias</title>
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
                     <a href="#">Transferencias</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form">
                     <!--<div class="_title">Transferencias</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Encabezado</div>
                              <div class="h_content">
                                 <div class="_wrappipt col2">
                                    <label for="">No. de Transfer</label>
                                 </div>

                                 <div class="_wrappipt col2">
                                    <label for="">Estatus</label>
                                 </div>
                              </div>

                              <div class="h_content">
                                 <div class="_wrappipt col2">
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="_wrappipt col2">
                                    <select class="" name="">
                                       <option value=""></option>
                                    </select>
                                 </div>
                              </div>

                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label class="col2" for="">Origen</label>
                                    <div class="container_ipts col2">
                                       <input type="text" name="" value="">
                                       <input type="text" name="" value="">
                                    </div>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Destino</label>
                                    <div class="container_ipts col2">
                                       <input type="text" name="" value="">
                                       <input type="text" name="" value="">
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Nuevo</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Buscar</button>
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                     </div>
                  </form>

                  <hr>

                  <form class="_form">
                     <!-- ********************************************************************************** -->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Detalle</div>
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>SKU</th>
                                       <th>UPC</th>
                                       <th>DESCRIPCION</th>
                                       <th>INNER PACK</th>
                                       <th>PEDIDO PIEZAS</th>
                                       <th>PEDIDO CAJAS</th>
                                    </tr>
                                 </table>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Guardar</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Aprobar</button>
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
