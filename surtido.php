<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Surtido</title>
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
                     <a href="index.php">Surtido</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form">
                     <!--<div class="_title">Surtido</div>-->
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Busqueda</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Tienda</label>
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
                                    <label for="">No distribucion</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Tarima asignacion</label>
                                    <input type="text" name="" value="">
                                 </div>
                              </div>
                           </div>

                           <div class="_ssection">
                              <div class="_title">Asignacion</div>
                              <div class="_content">
                                 <div class="v_wrappipt">
                                    <label for="">Tienda</label>
                                    <div class="container_ipts col2">
                                       <select class="" name="">
                                          <option value="">Opcion 1</option>
                                       </select>
                                       <input type="text" name="" value="">
                                       <button type="button" name="button">
                                          asignar
                                       </button>
                                    </div>
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Usuario Asignado</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Tarima Asignacion</label>
                                    <input type="text" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <label for="">Fecha Asignacion</label>
                                    <input type="date" name="" value="">
                                 </div>

                                 <div class="v_wrappipt">
                                    <button type="button" name="button">Reporte Asignacion</button>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Precio Venta</div>
                              <div class="_content">
                                 <table id="tarts" border="1" width="100%">
                                    <tr id="headertable">
                                       <th>Tarima</th>
                                       <th>Ubicacion</th>
                                       <th>SKU</th>
                                       <th>Descripcion</th>
                                       <th>Piezas pedidas</th>
                                       <th>Cajas pedidas</th>
                                       <th>Tarima Asignada</th>
                                       <th>Cajas Surtidas</th>
                                    </tr>
                                 </table>
                                 <button class="addart" type="button" name="button">Fin de Surtido</button>
                              </div>
                           </div>
                        </div>

                        <!--<div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Nuevo</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Buscar</button>
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-trash"></i> Eliminar</button>
                        </div>-->
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
