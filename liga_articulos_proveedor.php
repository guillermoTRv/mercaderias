<?php
   if(isset($_GET['art'])&&$_GET['art']!=""){
?>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Liga de proveedores y Articulos</title>
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
                     <a href="#">Liga de proveedores y Articulos: <b id="nameart"></b></a>
                  </div>

                  <div class="">
                     ...
                  </div>
               </div>
               <div class="bodycanvas">
                  <form class="_form buscador" onsubmit="search_provtojoinart($(this),event);" data-omitids="">
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title"><i>Proveedores a agregar</i></div>
                              <div class="">
                                 <input type="text" placeholder="Ingrese ID o Nombre de proveedor" id="valtosearch">
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
                  <hr>
                  <form class="_form">
                     <div class="_content">
                        <div class="w_section">
                           <div class="_ssection">
                              <div class="_title">Detalle</div>

                                 <div id="table_proveedores" class="_content">
                                    <p><i class="fa fa-spinner fa-pulse fa-3x"></i></p>
                                 </div>
                           </div>
                        </div>

                        <!--<div class="_botonera">
                           <button class="btn_deft" type="reset" name="button"><i class="fa fa-plus-circle"></i> Nuevo</button>
                           <button class="btn_go" type="submit" name="button"><i class="fa fa-search"></i> Guardar</button>
                        </div>-->
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
   $(document).ready(function(){
      load_dtsart(<?php echo $_GET['art'] ?>);
   });
</script>
<?php
   }else{
      echo "<p>Missing Id articulo :( </p>";
   }
?>
