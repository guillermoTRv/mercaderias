<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Citas y Recibo</title>
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
                     <a href="#">Citas y Recibo</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form">
                     <!--<div class="_title">Citas y Recibo</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">ORDEN</div>
                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <label for="">Numero de Cita</label>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label for="">Numero de orden</label>
                                 </div>

                                 <div class="_wrappipt col3"></div>
                              </div>

                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="_wrappipt col3">
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="_wrappipt col3">
                                    <button type="button" name="button" class="btnform">Agregar</button>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Proveedor</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label class="col2" for="">Proveedor</label>
                                    <div class="container_ipts col2">
                                       <select class="" name="">
                                          <option value="">Opcion 1</option>
                                       </select>
                                       <input type="text" name="" value="">
                                       <button type="button" name="button">
                                          <i class="fa fa-search"></i>
                                       </button>
                                    </div>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Departamento</label>
                                    <select class="" name="">
                                       <option value="">Opcion 1</option>
                                    </select>
                                 </div>
                              </div>
                           </div>

                           <div class="_ssection">
                              <div class="_title">Fechas de Entrega</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Fecha Inicio</label>
                                    <input type="date" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha Fin</label>
                                    <input type="date" name="" value="">
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Nuevo</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Buscar</button>
                        </div>
                     </div>
                  </form>

                  <hr>

                  <form class="_form">
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
                                       <th>DESTINO ENTREGA</th>
                                       <th>RECIBO PIEZAS</th>
                                       <th>RECIBO CAJAS</th>
                                       <th>CAJAS POR TARIMA</th>
                                       <th>FN</th>
                                    </tr>

                                    <tr>
                                       <td colspan="7"></td>
                                       <td colspan="2">TOTAL CAJAS</td>
                                       <td colspan="2"></td>
                                    </tr>

                                    <tr>
                                       <td colspan="7"></td>
                                       <td colspan="2">TOTAL PIEZAS</td>
                                       <td colspan="2"></td>
                                    </tr>
                                 </table>
                                 <!--<button class="addart" type="button" name="button" onclick="add_lart()" ><i class="fa fa-plus-circle"></i> Agregar Articulo</button>-->
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Guardar</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Recibir</button>
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
