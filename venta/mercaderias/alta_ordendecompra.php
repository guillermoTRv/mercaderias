<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Orden de compra</title>
      <link rel="stylesheet" href="css/init.css">
      <link rel="stylesheet" href="css/fonts.css">
      <link rel="stylesheet" href="css/faws4.7.0/css/faws.min.css">
      <link rel="stylesheet" href="css/fv2.css">
      <link rel="stylesheet" href="js/jqueryui1.12/jquery-ui.min.css">
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
                     <a href="#">Captura de Orden</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--***************************************-->
                  <!--*********buscador************ onsubmit="search_articulos($(this),event);"-->
                     <form class="buscador">
                        <input placeholder="Ingrese id de Orden" type="text" id="valtosearch">
                        <button type="submit"><i class="fa fa-search"></i></button>
                     </form>
                  <!--*********buscador************ -->
               <!--***************************************-->
               <div class="bodycanvas">
                  <form id="trysave_ordcompra" class="_form" onsubmit="trysave_ordcompra($(this),event);">
                     <!--<div class="_title">Captura de Orden</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">ORDEN</div>
                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <label for="">Numero de Orden</label>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label for="">Estatus</label>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <label for="">Tipo de Orden</label>
                                 </div>
                              </div>

                              <div class="h_content">
                                 <div class="_wrappipt col3">
                                    <input id="oc_id" type="text" disabled>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <input id="oc_status" type="text" disabled>
                                 </div>

                                 <div class="_wrappipt col3">
                                    <select id="oc_tipoorden" name="oc_tipoorden">
                                       <option disabled selected>cargando...</option>
                                    </select>
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
                                       <input id="oc_proveedor" data-idprov type="text" onfocus="loadproviders_onarray();" onkeyup="searchsimilar_prov($(this));">
                                    </div>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Departamento</label>
                                    <select disabled id="oc_depto" name="oc_depto">
                                       <option disabled selected>cargando...</option>
                                    </select>
                                 </div>
                              </div>
                           </div>

                           <div class="_ssection">
                              <div class="_title">Fechas de Entrega</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Fecha Inicio</label>
                                    <input type="date" id="oc_dinit" name="oc_dinit">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha Fin</label>
                                    <input type="date" id="oc_dend" name="oc_dend">
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button type="submit"><i class="fa fa-floppy-o"></i> Guardar</button>
                        </div>
                     </div>
                  </form>
                  <!-- ZONA PARA BUSCAR AETICULOS -->
                  <hr>
                  <form class="_form buscador" onsubmit="search_artordcompra($(this),event);" data-omitids="">
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title"><i>articulos a agregar</i></div>
                              <div class="">
                                 <input type="text" placeholder="Ingrese ID o Descripcion de articulo" id="valtosearch">
                                 <button type="submit" class="shooter">
                                    <i class="fa fa-search"></i>
                                 </button>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <!--<div class="_title"><i>Proveedores a agregar</i></div>-->
                              <div class="ajaxresponses"></div>
                           </div>
                        </div>
                     </div>
                  </form>
                  <!-- ZONA PARA LOS ARTICULOS -->
                  <form class="_form" onsubmit="trysave_ordcompra(event);">
                     <!--<div class="_title">Captura de Orden</div>-->
                     <div class="_content">

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Articulos</div>
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable" class="tractive" >
                                       <th>SKU</th>
                                       <th>UPC</th>
                                       <th>DESCRIPCION</th>
                                       <th>INNER PACK</th>
                                       <th>PEDIDO PIEZAS</th>
                                       <th>PEDIDO CAJAS</th>
                                       <th>DESTINO ENTREGA</th>
                                       <th>COSTO</th>
                                       <th>PIEZAS RECIBIDAS</th>
                                       <th>PIEZAS CANCELADAS</th>
                                       <th>FN</th>
                                    </tr>

                                    <tr class="tractive">
                                       <td colspan="7"></td>
                                       <td colspan="2">Subtotal</td>
                                       <td colspan="2"></td>
                                    </tr>

                                    <tr class="tractive">
                                       <td colspan="7"></td>
                                       <td colspan="2">Total</td>
                                       <td colspan="2"></td>
                                    </tr>
                                 </table>
                                 <!--<button class="addart" type="button" name="button" onclick="add_lart()" ><i class="fa fa-plus-circle"></i> Agregar Articulo</button>-->
                              </div>
                           </div>
                        </div>

                        <div class="_botonera">
                           <button type="submit"><i class="fa fa-floppy-o"></i> Guardar</button>
                           <button type="button"><i class="fa fa-check"></i> Preabrobar</button>
                           <button type="button"><i class="fa fa-check-square"></i> Aprobar</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>

      <!--<footer>
         <img src="imgs/system/imagen2.png" alt="logo de la empresa" height="80">
      </footer>-->
   </body>
</html>
<script type="text/javascript" src="js/jquery3.min.js"></script>
<script type="text/javascript" src="js/jqueryui1.12/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/fns.js"></script>
<script type="text/javascript">
   loadcombos('departamento:oc_depto');
   loadcombotiporden();
</script>
