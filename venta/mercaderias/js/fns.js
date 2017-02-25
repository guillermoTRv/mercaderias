$(document).ready(function(){
   console.log("jquery esta jalando");
   loadconfigpage();
   loadmenu();
});

function loadconfigpage(){
   var hheader = $("header").css("height");
   console.log("alto del header: "+hheader);
   $("#mainwrapper").css({
      "padding-top":hheader
   });
}

function togglecheck(ipt){
   if(ipt.is(':checked')){
      ipt.parent().toggleClass('ischeck');
      ipt.siblings('i').toggleClass('fa-square-o fa-check-square-o');
   }else{
      ipt.parent().toggleClass('ischeck');
      ipt.siblings('i').toggleClass('fa-square-o fa-check-square-o');
   }
}

function selectradio(radio){
   var nm_radios = radio.attr("name");
   $('input[type="radio"][name="'+nm_radios+'"]').parent().removeClass('ischeck');
   $('input[type="radio"][name="'+nm_radios+'"]').siblings('i').removeClass('fa-circle').addClass('fa-circle-thin');
   $('input[type="radio"][name="'+nm_radios+'"]:checked').parent().addClass('ischeck');
   $('input[type="radio"][name="'+nm_radios+'"]:checked').siblings('i').removeClass('fa-circle-thin').addClass('fa-circle');
}

function loadcombos(params){
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadcombos'+'&params='+params
   }).done(function(resp){

      var objjson = JSON.parse(resp);
      for (var i = 0; i < objjson.length; i++) {
         var target = objjson[i]['target'];
         $("#"+target).html(objjson[i]['options']).attr("disabled",objjson[i]['action']);
      }
   });
}

function loadmenu(){
   var pathname = window.location.pathname;
   var arrpath =  pathname.split("/");
   //alert(arrpath);
   $("#menuleft").load("menuleft.html",function(){
      $('nav a[href="'+arrpath[2]+'"]').addClass('ahere');
   });
}

function testjs(){
   alert("test corriendo")
}

function trysave_prov(evt){
   evt.preventDefault();
   var dts = $("#trysave_prov").serialize()+'&fn=trysave_prov';

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_jerarquia(evt){
   evt.preventDefault();

   var iddepto = $("#jer_depto");
   var idclase = $("#jer_clase");
   var idsclase = $("#jer_sclase");
   var ajax = false;

   //para guardar un depto
   if(iddepto.val()!=""&&idclase.val()==""&&idsclase.val()==""){
      var opc = 1;
   }else if (iddepto.val()!=""&&idclase.val()!=""&&idsclase.val()=="") {
      var opc = 2;
   }else if (iddepto.val()!=""&&idclase.val()!=""&&idsclase.val()!="") {
      var opc = 3;
   }

   switch(opc){
      case 1://guardando depto
         var descdepto = $("#jer_depdescr").val();
         var dts = 'iddepto='+iddepto.val()+'&descdepto='+descdepto+'&fn=savedepto';
         var ajax = true;
      break;

      case 2://guardando clase
         var cldescr = $("#jer_cldescr").val();
         var dts = 'iddepto='+iddepto.val()+'&idclase='+idclase.val()+'&cldescr='+cldescr+'&fn=saveclase';
         var ajax = true;
      break;

      case 3://guardando subclase
      var scldescr = $("#jer_scldescr").val();
      var dts = 'iddepto='+iddepto.val()+'&idclase='+idclase.val()+'&idsclase='+idsclase.val()+'&scldescr='+scldescr+'&fn=savesubclase';
      var ajax = true;
      break;

      default:
         alert("No puede hacer eso");
      break;
   }

   if(ajax){
      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:dts
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         //"txt"=>$txt="action"=>$action
         alert(objjson['txt'])
         /*switch (objjson['action']) {
            case 'disdescdepto':
                  $("#jer_depdescr").attr("disabled",true);
               break;
            default:

            case 'enabdescdepto':
               $("#jer_depdescr").attr("disabled",false);
            break;

            case 'null': break;
         }*/
      });
   }
}

function ask_depto(valdepto){
   var iddepto = valdepto.val();
   var target = $("#jer_depdescr");

      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:'iddepto='+iddepto+'&fn=ask_depto',
         beforeSend:function(){
            target.val("Espere...").attr("disabled",true);
         }
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         switch(objjson['st']){
            case 200:
               target.val(objjson['desc']);
            break;

            case 404:
               target.val("").attr({
                  "disabled":false,
                  "placeholder":"Ingrese Descrpcion"
               }).focus();
            break;
         }
      });
}

function ask_clase(valclase){
   var idclase = valclase.val();
   var target = $("#jer_cldescr");

      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:'idclase='+idclase+'&fn=ask_clase',
         beforeSend:function(){
            target.val("Espere...").attr("disabled",true);
         }
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         switch(objjson['st']){
            case 200:
               target.val(objjson['desc']);
            break;

            case 404:
               target.val("").attr({
                  "disabled":false,
                  "placeholder":"Ingrese Descrpcion"
               }).focus();
            break;
         }
      });
}

function search_jerarquia(evt){
   evt.preventDefault();
   target = $("#targettoresp");
   var depto = $("#jer_depto").val();
   var clase = $("#jer_clase").val();
   var subclase = $("#jer_sclase").val();
   var dts = 'fn=search_jerarquia'+'&iddepto='+depto+'&idclase='+clase+'&idsubclase='+subclase;
   alert(dts)

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts,
      beforeSend:function(){
         $(".toremove").remove();
         target.after('<p class="toremove" style="text-align:center;padding-top:20px;"><i class="fa fa-spinner fa-pulse fa-5x fa-fw" aria-hidden="true"></i></p>');
      }
   }).done(function(resp){
      $(".toremove").remove();
      target.after(resp);
   });
}

function add_lart(){
   var target = $("#headertable");

   var tr =
   '<tr>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td><input type="text" name="" value=""></td>'+
      '<td>'+
         '<button onclick="removetr($(this));" type="button" name="button"><i class="fa fa-trash fa-2x"></i></button>'+
      '</td>'+
   '</tr>';

   target.after(tr);
}

function removetr(fila){
   alert("entro a la funcion de remover TR, repara esto porfavor!!");
}
function add_articulo(){
   alert("Entro a la funcion");
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=add_articulo'
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_estado(evt){
   evt.preventDefault();
   var dts = $("#fw_estado").serialize()+'&fn=trysave_estado';
   console.log(dts);
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_ciudad(evt){
   evt.preventDefault();
   var dts = $("#fw_ciudad").serialize()+'&fn=trysave_ciudad';
   console.log(dts);
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_tienda(evt){
   evt.preventDefault();
   var form = $("#trysave_tienda");
   var dts = form.serialize()+'&fn=trysave_tienda';

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_ubicaciones(evt){
   evt.preventDefault();

   $("#ub_multiart").is(':checked')?multiart=0:multiart=1;

   var dts = $("#trysave_ubicaciones").serialize()+'&ub_multiart='+multiart+'&fn=trysave_ubicaciones';
   alert(dts);
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function trysave_codigo(evt){
   evt.preventDefault();

   $("#cod_active").is(':checked')?codactive='n':codactive='y';

   var dts = $("#trysave_codigo").serialize()+'&codactive='+codactive+'&fn=trysave_codigo';
   alert(dts);
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts
   }).done(function(resp){
      alert(resp);
   });
}

function togglewriter(target,btn){
   var htmlinit = '<i class="fa fa-plus"></i> Nuevo';
   var cancel = '<i class="fa fa-times"></i> Cancelar';
   $("."+target).slideToggle({
      start:function(){
         btn.attr("disabled",true);
         /*if($(".ajaxresponses").css("display")=="block"){
            $(".ajaxresponses").hide();
         }*/
      },
      complete:function(){
         if($(this).css("display")=='block'){
            btn.html(cancel);
         }else{btn.html(htmlinit);}
      },
      done:function(){
         btn.attr("disabled",false);
      }
   });
}

/*
**********************************************************************
**********************************************************************
**********************************************************************
   AQUI INICIAN LAS FUNCIONES PARA BUSCAR
**********************************************************************
**********************************************************************
**********************************************************************
*/

function search_proveedor(fm,evt){ //buscar proveedor
   evt.preventDefault();
   var target = $(".ajaxresponses");
   var keyword = fm.children("#valtosearch").val();
   fm.children('button').attr("disabled",true);
   fm.children('#valtosearch').attr("disabled",true);

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_proveedor'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);
      fm.children('#valtosearch').attr("disabled",false);
   });

}

function search_ubicacion(fm,evt){ //buscar ubicacion
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_ubicacion'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

function search_transcode(fm,evt){ // buscar codigo de transaccion
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_transcode'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

function search_tiendacd(fm,evt){ // buscar tienda
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_tiendacd'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

function search_ciudades(fm,evt){ // buscar tienda
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_ciudades'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

function search_estados(fm,evt){ // buscar tienda
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_estados'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

function search_articulos(fm,evt){ // buscar tienda
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.children("#valtosearch").val();// palabra a buscar
   fm.children('button').attr("disabled",true);//desabilitar boton
   fm.children('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_articulos'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.children('button').attr("disabled",false);//habilitar boton
      fm.children('#valtosearch').attr("disabled",false);//habilitar textbox
   });
}

/*
**********************************************************************
**********************************************************************
**********************************************************************
************   AQUI INICIAN LAS FUNCIONES PARA BUSCAR    *************
**********************************************************************
**********************************************************************
**********************************************************************
*/


function loadclases(sel){
   var target = $("#art_clase");
   var iddepto = sel.val();

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadclases'+'&iddepto='+iddepto,
      beforeSend:function(){
         target.html('<option selected>cargando...</option>').attr("disabled",true);
         $("#art_subclase").attr("disabled",true).html("");
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']).attr("disabled",objjson['disab']);
   });
}

function loadsubclases(sel){
   var target = $("#art_subclase");
   var iddepto = $("#art_depto").val();
   var idclase = sel.val();

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadsubclases'+'&iddepto='+iddepto+'&idclase='+idclase,
      beforeSend:function(){
         target.html('<option selected>cargando...</option>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']).attr("disabled",objjson['disab']);
   });
}

function addlineupc(){
   var target = $("#headerupcs");

   var lineupc =
   '<div class="h_content lineupc">'+
      '<div class="_wrappipt col3">'+
         '<input type="text" class="upc_upc">'+
      '</div>'+

      '<div class="_wrappipt col3">'+
         '<select class="upc_tipo">'+
            '<option value="null" selected disabled>--- Seleccione ---</option>'+
            '<option value="EAN13">EAN13</option>'+
            '<option value="EAN8">EAN8</option>'+
            '<option value="CO128">CO128</option>'+
            '<option value="ISBN1">ISBN1</option>'+
         '</select>'+
      '</div>'+

      '<div class="_wrappipt col3">'+
         '<label class="lab_radio">'+
            '<i class="fa fa-circle-thin" aria-hidden="true"></i>'+
            '<input class="upc_primario" type="radio" name="art_upcprimario" onchange="selectradio($(this));">'+
         '</label>'+
      '</div>'+

      '<button type="button" onclick="$(this).parent().remove();">'+
         '<i class="fa fa-window-close-o"></i>'+
      '</button>'+
   '</div>';
   target.after(lineupc);
}

function listtiendas_altaarticulos(){
   var target = $("#headertiendas");

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=listtiendas_altaarticulos'
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      var tiendas = objjson['txt'];
      target.after(tiendas);
   });
}

function trysave_articulo(evt){
   evt.preventDefault();
   var nimgart = $("#new_namefoto").val();
   $("#art_vendible").is(':checked')?vendible=1:vendible=0;
   var dts = $("#trysave_articulo").serialize()+'&art_vendible='+vendible+'&nimgfoto='+nimgart+'&fn=trysave_articulo';

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:dts,
      beforeSend:function(){
         $("#btnsave_arts1").attr("disabled",true);
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      $("#art_sku").val(objjson['sku']);
      alert(objjson['msg']);
      $("#btnsave_arts1").attr("disabled",false);
   });
}

function liga_art_prov(evt){
   evt.preventDefault();
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=liga_art_prov'
   }).done(function(resp){
      alert(resp);
   });
}

function add_proveedor(btn){
   var idart = btn.val();
   window.location="liga_articulos_proveedor.php?art="+idart;
}

function load_dtsart(idart){
   var target = $("#table_proveedores");

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=dts_art&idart='+idart,
      timeout:8000
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      $("#nameart").html(objjson["nameart"]);
      target.html(objjson["html"]);
   }).fail(function(aa,bb,cc){
      target.html("<i>La peticion ha tardado demasiado, intente mas tarde</i>");
   });
}

function search_provtojoinart(fm,evt){
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.find("#valtosearch").val();// palabra a buscar
   fm.find('.shooter').attr("disabled",true);//desabilitar boton
   fm.find('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_provtojoinart'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.find('.shooter').attr("disabled",false);//habilitar boton
      fm.find('#valtosearch').attr("disabled",false);//habilitar textbox
      /*$("#tproviders").sortable({
         items:".trdropable"
      });*/
   });
}

function search_artordcompra(fm,evt){
   evt.preventDefault();
   var target = $(".ajaxresponses");//elemento donde se pinta la respuesta
   var keyword = fm.find("#valtosearch").val();// palabra a buscar
   fm.find('.shooter').attr("disabled",true);//desabilitar boton
   fm.find('#valtosearch').attr("disabled",true);//desabilitar textbox

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=search_artordcompra'+'&keyword='+keyword,
      beforeSend:function(){
         target.html('<i class="fa fa-spinner fa-pulse fa-3x"></i>');
      }
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['txt']);
      fm.find('.shooter').attr("disabled",false);//habilitar boton
      fm.find('#valtosearch').attr("disabled",false);//habilitar textbox
      /*$("#tproviders").sortable({
         items:".trdropable"
      });*/
   });
}

function try_joinmosprov(btn){
   var wrapp = btn.closest('._proveedor');//se busca al padre tr del btn clicado
   var idprov = wrapp.data("idprov");//se toma el id del proveedor del padre a travez de atributo data
   var nprov = wrapp.data("nprov");//se toma el nombre de la empresa del padre
   //se busca el elemento en la tabla de ligar proveedores
   var trexist = $("#tartsjoinprovs").find('tr[data-tridprov="'+idprov+'"]').length;

   var table_target = $("#headertable");//elemento donde se pintara el resultado
   //variable que contiene la estruvtura del elemento tr que se agregara abajo
   //con los datos tomados arriba (id y nombre de proveedor)
   var tr =
   '<tr data-idprov="'+idprov+'" class="tractive" data-trsave>'+
      '<td>'+idprov+' '+nprov+'</td>'+
      '<td><input type="text" name="jprov_costo" class="jprov_costo"></td>'+
      '<td>disabled</td>'+
      '<td><input type="text" name="jprov_pais" class="jprov_pais"></td>'+
      '<td><input type="text" name="jprov_pzscaja" class="jprov_pzscaja"></td>'+
      '<td><input type="text" name="jprov_pzsprov" class="jprov_pzsprov"></td>'+
      '<td><input type="text" name="jprov_cajastrama" class="jprov_cajastarima"></td>'+
      '<td><input type="text" name="jprov_cajalar" class="jprov_cajalargo"></td>'+
      '<td><input type="text" name="jprov_cajaanc" class="jprov_cajaancho"></td>'+
      '<td><input type="text" name="jprov_cajaprof" class="jprov_cajaprof"></td>'+
      '<td><input type="text" name="jprov_cajapeso" class="jprov_cajapeso"></td>'+
      '<td>'+
         '<button onclick="cancel_tryjoinprov($(this));" type="button"><i class="fa fa-times-circle-o"></i></button>'+
      '</td>'+
   '</tr>';
   //se comprueba que no exista el elemento en la tabla de ligar proveedor
   if(trexist==0){//si no existe
      wrapp.hide('fade',function(){//se oculta el tr de la tabla de proveedores clicado
         table_target.after(tr);//se agrega el tr en la tabla de liga de proveedores
         //se ocultan los trs actuales de la tabla estos ya tienen a
         //los proveedores actuales que estan ligados al articulo
         $("#tartsjoinprovs").find('tr:not(.tractive)').hide('fast');
         $("#btn_joinprov").show('slow');//se muestra el boton para ejecutar el ligue
         $(".dust").remove();//se remueven las alertas por default de la tabla
      });
   }else{//si elelemnto ya existe en la tabla de ligue, se mandara la siguiente alerta
      alert("No piuede agregar este elemento porque ya esta enla tabla!!")
   }
}

function try_joinprov(btn){
   var sku = btn.data('sku');
   $("tr[data-trsave]").each(function(idx){
      var trid = $(this).data('idprov');
      var costo = $(this).find('.jprov_costo').val();
      var pais = $(this).find('.jprov_pais').val();
      var pzscaja = $(this).find('.jprov_pzscaja').val();
      var pzsprov = $(this).find('.jprov_pzsprov').val();
      var cajastarima = $(this).find('.jprov_cajastarima').val();
      var cajalargo = $(this).find('.jprov_cajalargo').val();
      var cajaancho = $(this).find('.jprov_cajaancho').val();
      var cajaprof = $(this).find('.jprov_cajaprof').val();
      var cajapeso = $(this).find('.jprov_cajapeso').val();

      var dts ='fn=try_joinprov'+
               '&sku='+sku+
               '&idprov='+trid+
               '&costo='+costo+
               '&pais='+pais+
               '&pzscaja='+pzscaja+
               '&pzsprov='+pzsprov+
               '&cajastarima='+cajastarima+
               '&cajalargo='+cajalargo+
               '&cajaancho='+cajaancho+
               '&cajaprof='+cajaprof+
               '&cajapeso='+cajapeso;

      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:dts,
         beforeSend:function(){

         }
      }).done(function(resp){
         alert(resp);
      });

   });
}

function cancel_tryjoinprov(btn){
   //tomar el idproveedor del elemento que se quitara de la lista de ligue
   var trtoview = btn.closest('tr').data('idprov');
   btn.closest('tr').remove();//se remueve el elemento de la tabla

   //consultar cuantos elementos activos hay en la tabla de ligue
   //un elemento activo es un tr que tiene inputs a llenar
   var size = $("#tartsjoinprovs").find('tr[class="tractive"]').length;

   if(size==1){//cuando solo hay un elemento, (que es la cabecera de la tabla)
      //se buscara a los tr que no tengan la clase .active y se mostraranb
      $("#tartsjoinprovs").find('tr:not(.tractive)').show('fast');
      $("#btn_joinprov").hide('slow');//se oculta el boton de ligue de proveedores
   }else{}

   //se muestra el tr oculto de la tabla de proveedores que corresponde
   //al elemento que se removio de la tabla de ligue
   $("#tproviders").find('tr[data-idprov="'+trtoview+'"]').show('fast');
}

function updateprovprimario(){
   var val = $('input[type="radio"][name="prov_primario"]:checked').closest('tr').data('tridprov');

   alert("Se actualizo al proveedor "+val+" como proveedor primario!");
}


/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/
/********************************************************************/

function suplateTypeFile(){
	$('#up_img_art').trigger('click');
   //alert("ok");
}

function vprevia(){
      var formData = new FormData($("#img_art")[0]);
		var ruta = "php/up_imgart.php";
		var img_name = $("#up_img_art").val();

		//se valida que se haya cambiado imagen
		/**/if(img_name!=""){
			$.ajax({
				url:ruta,
				type: "POST",
				data:formData,
				contentType:false,
				processData:false,
				cache:false
			}).done(function(datos){
            //$(".description_post textarea").val(datos);
            if(datos>1||datos=="isnt_image"){
               var peso = datos;
               $("#art_vprevia").html(datos);
               $("#new_namefoto").val('');
            }
            else{
               $("#art_vprevia").html('<center><img src="imgs/articulos/temp/'+datos+'" width="200px"></center>');
               $("#new_namefoto").val(datos);//agregamos el nombre de la imagen en el input
            }
         });

		}//si no se cambia la imagen no, pasa nada
}

function vpreviaFile(div,btn){
	var previa = $("#"+div);//div donde se pinta la imagen
	previa.html('');
	var archivo = document.getElementById(btn).files;
	var navegador=window.URL||window.webkitURL;

	var rutaerror="recursos/imagenerror.png";
	var xls = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
	var doc = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
	var pdf = 'application/pdf';
	var jpg = 'image/jpg';
	var jpeg = 'image/jpeg';
	var gif = 'image/gif';
	var png = 'image/png';

	for(x=0; x<archivo.length; x++)
	{
		var size = archivo[x].size;
		var tipo = archivo[x].type;
		var nombre = archivo[x].name;

		if(tipo!=pdf  && tipo!=xls && tipo!=doc && tipo!=jpg && tipo!=jpeg && tipo!=gif && tipo!=png)
		{
			previa.append("<center><img src="+rutaerror+" width='310px' height='215px'></center>");
		}
			else {
				if(tipo==pdf){previa.append("<center><img src='recursos/pdficon.png' width='150px' height='150px'></center>");}
				if(tipo==xls){previa.append("<center><img src='recursos/iconexcel.png' width='150px' height='150px'></center>");}
				if(tipo==doc){previa.append("<center><img src='recursos/iconword.png' width='150px' height='150px'></center>");}
				if(tipo==jpg || tipo==gif || tipo==png || tipo==jpeg){
						var objeto_url= navegador.createObjectURL(archivo[x]);
						previa.append("<img src="+objeto_url+" width='310' height='180' >");
					}
			}
	}
}

function agrega_upc(evt){
   evt.preventDefault();

   var sku = $("#art_sku").val();

   $(".lineupc").each(function(idx){
      var upc = $(this).find('.upc_upc').val();
      var tipo = $(this).find('.upc_tipo').val();
      $(this).find('.upc_primario').is(':checked')?primario="Y":primario="N";

      console.log("SKU: "+sku+" "+upc+" - "+tipo+" - "+primario);
      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:'fn=agrega_upc'+
               '&sku='+sku+
               '&upc='+upc+
               '&tipo='+tipo+
               '&prim='+primario,
         beforeSend:function(){
            $("#btnsave_upcs1").attr("disabled",true);
         }
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         console.log(objjson['upc']+": "+objjson['msg']);
         $("#btnsave_upcs1").attr("disabled",false);
      });
   });
}

function agrega_sku_tienda(fm,evt){
   evt.preventDefault();

   var sku = $("#art_sku").val();

   fm.find('.addtienda').each(function(){
      if($(this).is(':checked')){
         var tienda = $(this).val();
         $.ajax({
            url:'php/controller.php',
            type:'POST',
            data: 'fn=agrega_sku_tienda'+
                  '&tienda='+tienda+
                  '&sku='+sku+
                  '&activo=Y',
            beforeSend:function(){
               console.log("SKU: "+sku+" - "+tienda);
            }
         }).done(function(resp){
            var objjson = JSON.parse(resp);
            console.log(objjson['upc']+": "+objjson['msg']);
         });
      }
   });

   /*$(".lineupc").each(function(idx){
      var upc = $(this).find('.upc_upc').val();
      var tipo = $(this).find('.upc_tipo').val();
      $(this).find('.upc_primario').is(':checked')?primario="Y":primario="N";

      console.log("SKU: "+sku+" "+upc+" - "+tipo+" - "+primario);
      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:'fn=agrega_upc'+
               '&sku='+sku+
               '&upc='+upc+
               '&tipo='+tipo+
               '&prim='+primario,
         beforeSend:function(){
            $("#btnsave_upcs1").attr("disabled",true);
         }
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         console.log(objjson['upc']+": "+objjson['msg']);
         $("#btnsave_upcs1").attr("disabled",false);
      });
   });*/
}

function trysave_ordcompra(fm,evt){
   evt.preventDefault();
   var btnfm = fm.find("button[type=submit]");
   btnfm.attr("disabled",true);
   var idp = $("#oc_proveedor").data("idp");

   if(idp==null){
      alert("Debe seleccionar un PROVEEDOR");
   }else{
      var dts = $("#trysave_ordcompra").serialize()+"&oc_proveedor="+idp+"&fn=trysave_ordcompra";

      $.ajax({
         url:'php/controller.php',
         type:'POST',
         data:dts,
         beforeSend:function(){
            console.log("Enviando solicitud...");
         },
         timeout:5000
      }).done(function(resp){
         var objjson = JSON.parse(resp);
         if(objjson['st']==10){
            $("#oc_id").val(objjson['idord']);
            $("#oc_status").val("C");
            alert("La orden se guardo en el ID: "+objjson['idord']);
            btnfm.attr("disabled",false);
         }
      }).fail(function(){
         alert("El servidor no responde.. intente nuevamente");
         btnfm.attr("disabled",false);
      });
   }
}

function loadproviders_onarray(ipt){

   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadproviders_onarray'
   }).done(function(resp){
      localStorage.setItem("json_proveedores",resp);
   });
}

function searchsimilar_prov(ipt){
   var current_jsongnl1 = JSON.parse(localStorage.getItem("json_proveedores"));

   ipt.autocomplete({
      minLength:1,
      source: current_jsongnl1,
      autoFocus: true,
      select:function(event,ui){
         //console.log(ui.item.id);
         ipt.attr("data-idp",ui.item.idp);

      }
   });
}

function loadtipotienda(){
   var target = $("#dist_tipotienda");
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadtipotienda'
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['ops']);
   });
}

function loadcombotiporden(){
   var target = $("#oc_tipoorden");
   $.ajax({
      url:'php/controller.php',
      type:'POST',
      data:'fn=loadcombotiporden'
   }).done(function(resp){
      var objjson = JSON.parse(resp);
      target.html(objjson['ops']);
   });
}

function compruebatipotienda(sel){
   var tipo = sel.val();

   switch (tipo) {
      case 'TIENDA':
         $("#cdatiende").show();
      break;

      case 'CD':
         $("#cdatiende").hide().val("");
      break;
      default:

   }
}

function addonbasket(btn){
   var wrapp = btn.closest('._articulo');//se busca al padre tr del btn clicado
   var sku = wrapp.data("trsku");//se toma el id del proveedor del padre a travez de atributo data
   var nameart = wrapp.data("trnameart");//se toma el nombre de la empresa del padre

   var trexist = $("#tarts").find('tr[data-trsku="'+sku+'"]');
   var table_target = $("#headertable");

      var tr =
      '<tr data-trsku="'+sku+'" class="tractive" data-trsave>'+
         '<td>'+sku+'</td>'+
         '<td><input type="text" name="jprov_costo" class="jprov_costo"></td>'+
         '<td>'+nameart+'</td>'+
         '<td><input type="text" name="jprov_pais" class="jprov_pais"></td>'+
         '<td><input type="text" name="jprov_pzscaja" class="jprov_pzscaja"></td>'+
         '<td><input type="text" name="jprov_pzsprov" class="jprov_pzsprov"></td>'+
         '<td><input type="text" name="jprov_cajastrama" class="jprov_cajastarima"></td>'+
         '<td><input type="text" name="jprov_cajalar" class="jprov_cajalargo"></td>'+
         '<td><input type="text" name="jprov_cajaanc" class="jprov_cajaancho"></td>'+
         '<td><input type="text" name="jprov_cajaprof" class="jprov_cajaprof"></td>'+
         '<td>'+
            '<button onclick="cancel_tryjoinprov($(this));" type="button"><i class="fa fa-times-circle-o"></i></button>'+
         '</td>'+
      '</tr>';

      if(trexist.length==0){//si no existe
         wrapp.hide('fade',function(){//se oculta el tr de la tabla de proveedores clicado
            table_target.after(tr);//se agrega el tr en la tabla de liga de proveedores
            //se ocultan los trs actuales de la tabla estos ya tienen a
            //los proveedores actuales que estan ligados al articulo
            $("#tarts").find('tr:not(.tractive)').hide('fast');
            //$("#btn_joinprov").show('slow');//se muestra el boton para ejecutar el ligue
            $(".dust").remove();//se remueven las alertas por default de la tabla
         });
      }else{//si elelemnto ya existe en la tabla de ligue, se mandara la siguiente alerta
         alert("Ya se ha agregado este elemento...")
      }

}
