<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Mercaderias</title>
      <link rel="stylesheet" href="css/init.css">
      <link rel="stylesheet" href="css/fonts.css">
      <link rel="stylesheet" href="css/faws4.7.0/css/faws.min.css">
      <link rel="stylesheet" href="css/fv2.css">
   </head>
   <body>
      <form class="_form">
         <div class="_title">Alta de Articulos</div>
         <div class="_content">
            <div class="_section">
               <div class="_title">Descripcion SKU</div>
               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">SKU</label>
                     <input type="text" name="" value="">
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Descripcion larga</label>
                     <textarea name="" value=""></textarea>
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Descripcion corta</label>
                     <textarea name="" value=""></textarea>
                  </div>
               </div>
            </div>

            <div class="_section">
               <div class="_title">Imagen</div>
               <div class="_content">
                  Arrastre archivos
               </div>
            </div>

            <div class="_section">
               <div class="_title">Jerarquia</div>
               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Departamento</label>
                     <input type="text" name="" value="">
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Clase</label>
                     <input type="text" name="" value="">
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Subclase</label>
                     <input type="text" name="" value="">
                  </div>
               </div>
            </div>
         </div>
         <!--***************************** END content 1 *****************************-->

         <div class="_content">
            <div class="_section">
               <div class="_title">Precio Venta</div>
               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Zona</label>
                     <select class="" name="">
                        <option disabled selected>Seleccione zona</option>
                        <option value="">Kilo</option>
                        <option value="">Litro</option>
                     </select>
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Precio</label>
                     <input type="text" name="" value="">
                  </div>
               </div>
            </div>

            <div class="_section">
               <div class="_title">Manejo de Articulo</div>
               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Unidad de Medida</label>
                     <select class="" name="">
                        <option disabled selected>Seleccione unidad</option>
                        <option value="">Kilo</option>
                        <option value="">Litro</option>
                     </select>
                  </div>
               </div>

               <div class="_content">
                  <div class="v_wrappipt">
                     <label for="">Vendible</label>
                     <input type="text" name="" value="">
                  </div>
               </div>
            </div>
         </div>
         <!--***************************** END content 2 *****************************-->

         <div class="_content">
            <div class="_section">
               <div class="_title">Código UPC</div>
               <div class="_content">
                  <div class="h_wrappipt col3">
                     <label class="hhw">UPC</label>
                  </div>

                  <div class="h_wrappipt col3">
                     <label class="hhw">TIPO UPC</label>
                  </div>

                  <div class="h_wrappipt col3">
                     <label class="hhw">PRIMARIO</label>
                  </div>
               </div>
               <!-- *********** END Cabecera ***********-->

               <div class="_content">
                  <div class="h_wrappipt col3">
                     <input type="text" name="" value="">
                  </div>

                  <div class="h_wrappipt col3">
                     <select class="" name="">
                        <option value=""></option>
                        <option value=""></option>
                        <option value=""></option>
                     </select>
                  </div>

                  <div class="h_wrappipt col3">
                     <input type="checkbox" name="">
                  </div>
               </div>

               <div class="_content">
                  <div class="h_wrappipt col3">
                     <input type="text" name="" value="">
                  </div>

                  <div class="h_wrappipt col3">
                     <select class="" name="">
                        <option value=""></option>
                        <option value=""></option>
                        <option value=""></option>
                     </select>
                  </div>

                  <div class="h_wrappipt col3">
                     <input type="checkbox" name="">
                  </div>
               </div>
            </div>
            <!-- *********** END codigo UPC ***********-->

            <div class="_section">
               <div class="_title">Asignacion de Tiendas</div>
               <div class="_content">
                  <div class="h_wrappipt col2">
                     <label class="hhw">Tienda</label>
                  </div>

                  <div class="h_wrappipt col2">
                     <label class="hhw">activo</label>
                  </div>
               </div>

               <div class="_content">
                  <div class="h_wrappipt col3">
                     <select class="" name="">
                        <option value=""></option>
                        <option value=""></option>
                        <option value=""></option>
                     </select>
                  </div>

                  <div class="h_wrappipt col3">
                     <input type="checkbox" name="">
                  </div>
               </div>

               <div class="_content">
                  <div class="h_wrappipt col3">
                     <select class="" name="">
                        <option value=""></option>
                        <option value=""></option>
                        <option value=""></option>
                     </select>
                  </div>

                  <div class="h_wrappipt col3">
                     <input type="checkbox" name="">
                  </div>
               </div>
            </div>
            <!-- *********** END Asignacion de tiendas ***********-->
         </div>
         <!--***************************** END content 3 *****************************-->

         <div class="_content _botonera">
            <button class="btn_deft" type="reset" name="button"><i class="fa fa-refresh"></i> Limpiar</button>
            <button class="btn_go" type="submit" name="button"><i class="fa fa-floppy-o"></i> Guardar</button>
         </div>
      </form>
   </body>
</html>
