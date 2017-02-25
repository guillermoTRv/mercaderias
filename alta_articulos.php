<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Alta articulos</title>
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
      <!-- ESTE ES UN FORM INVISIBLE, SOLO PARA SUBIR IMGS-->
      <form id="img_art" enctype="multipart/form-data" hidden="hidden" class="none">
         <input type="file" id="up_img_art" name="up_img_art" onchange="vprevia();">
      </form>
      <input type="text" id="new_namefoto" hidden="hidden">

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
                     <a href="#">Articulos</a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <!--***************************************-->
               <!--*********buscador************ -->
                  <form class="buscador" onsubmit="search_articulos($(this),event);">
                     <input placeholder="Ingrese id o nombre de Ciudad" type="text" id="valtosearch">
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

                  <div class="formtowrite"><!-- onsubmit="trysave_articulo(event);" -->
                     <form class="_form" id="trysave_articulo" onsubmit="trysave_articulo(event);">
                        <!--<div class="_title">Alta de Articulos</div>-->
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">Descripcion SKU</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">SKU</label>
                                       <input disabled type="text" id="art_sku">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Descripcion Corta</label>
                                       <input type="text" id="art_desccorta" name="art_desccorta">
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Descripcion larga</label>
                                       <input type="text" id="art_desclarga" name="art_desclarga">
                                    </div>
                                 </div>
                              </div>

                              <div class="_ssection" style="cursor:pointer;" onclick="suplateTypeFile();">
                                 <div class="_title">Imagen</div>
                                 <div class="_content" id="art_vprevia">

                                 </div>
                              </div>

                              <div class="_ssection">
                                 <div class="_title">Jerarquia</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">Depto</label>
                                       <select disabled id="art_depto" name="art_depto" onchange="loadclases($(this));">
                                          <option disabled selected value="null">cargando...</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Clase</label>
                                       <select disabled id="art_clase" name="art_clase" onchange="loadsubclases($(this));"></select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Subclase</label>
                                       <select disabled id="art_subclase" name="art_subclase"></select>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">Precio Venta</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">Zona</label>
                                       <select id="art_zonaprecio" name="art_zonaprecio"></select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Precio</label>
                                       <input type="text" id="art_precio" name="art_precio">
                                    </div>
                                 </div>
                              </div>

                              <div class="_ssection">
                                 <div class="_title">Manejo de Articulo</div>
                                 <div class="_content">
                                    <div class="v_wrappipt">
                                       <label for="">Unidad</label>
                                       <select id="art_unidad" name="art_unidad">
                                          <option disabled selected value="null">--- Seleccione --</option>
                                          <option value="kl">Kilo</option>
                                          <option value="l">Litro</option>
                                          <option value="gr">Gramo</option>
                                          <option value="ml">Mililitro</option>
                                       </select>
                                    </div>

                                    <div class="v_wrappipt">
                                       <label for="">Vendible</label>
                                       <label class="lab_check">
                                          <i class="fa fa-square-o"></i>
                                          <input type="checkbox" id="art_vendible" onchange="togglecheck($(this));">
                                       </label>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="_botonera">
                              <button type="reset"><i class="fa fa-refresh"></i> Limpiar</button>
                              <button type="submit" id="btnsave_arts1"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>
                     </form>

                     <!-- **************************************************************************** -->
                     <!-- **************************************************************************** -->
                     <!-- Guardar upcs =============================================================== -->
                     <!-- **************************************************************************** -->
                     <!-- **************************************************************************** -->
                     <form class="_form" id="trysave_articulo" onsubmit="agrega_upc(event);">
                        <!--<div class="_title">Alta de Articulos</div>-->
                        <div class="_content">

                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title">codigo upc</div>
                                 <button type="button" onclick="addlineupc();">Agregar</button>
                                 <div id="headerupcs" class="h_content">
                                    <div class="_wrappipt col3">
                                       <label for="">UPC</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label for="">TIPO UPC</label>
                                    </div>

                                    <div class="_wrappipt col3">
                                       <label for="">PRIMARIO</label>
                                    </div>
                                 </div>
                              </div>
                           </div>

                           <div class="_botonera">
                              <button type="reset"><i class="fa fa-refresh"></i> Limpiar</button>
                              <button type="submit" id="btnsave_upcs1"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>
                     </form>

                     <!-- **************************************************************************** -->
                     <!-- **************************************************************************** -->
                     <!-- Guardar Tiendas ============================================================ -->
                     <!-- **************************************************************************** -->
                     <!-- **************************************************************************** -->
                     <form class="_form" id="trysave_articulo" onsubmit="agrega_sku_tienda($(this),event);">
                        <!--<div class="_title">Alta de Articulos</div>-->
                        <div class="_content">
                           <div class="w_section">
                              <div class="_ssection">
                                 <div class="_title" id="headertiendas">asignacion de tiendas</div>
                                 <!-- -0- -0-0-0- -0- -->
                              </div>
                           </div>

                           <div class="_botonera">
                              <button type="reset"><i class="fa fa-refresh"></i> Limpiar</button>
                              <button type="submit"><i class="fa fa-floppy-o"></i> Guardar</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
               <!--END .bodycanvas -->
            </div>
         </div>
      </div>

      <!--<footer>
         <img src="imgs/system/imagen2.png" alt="logo de la empresa" height="80">
      </footer>-->
   </body>
</html>
<script type="text/javascript" src="js/jquery3.min.js"></script>
<script type="text/javascript" src="js/fns.js"></script>
<script type="text/javascript">
   loadcombos('departamento:art_depto,zona_precio_enc:art_zonaprecio');
   listtiendas_altaarticulos();
</script>
