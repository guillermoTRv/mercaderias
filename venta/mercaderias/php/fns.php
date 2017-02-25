<?php

class bdd{

	private $srv="localhost";
	private $usr="mercaderias";
	private $bdd="mercaderias";
	private $psw="O5wHZ4MRiuRelO3E";

	// private $srv="localhost";
	// private $usr="sanjosep_floresf";
	// private $psw="Proyecto1.";
	// private $bdd="sanjosep_mercaderias";

   /*private $srv="mysql.hostinger.mx";
	private $usr="u942721086_merca";
	private $bdd="u942721086_merca";
   private $psw="lalo1989";*/

	public function cnx(){
		$c = mysqli_connect($this->srv,$this->usr,$this->psw,$this->bdd);
		if(mysqli_connect_errno($c)){
			die("Error durante la conexion a ".$this->bdd);
		}else{return $c;}
	}

	public function close(){
		mysqli_close($this->$c);
	}
}

function testphp(){
	$con = new bdd();
   $c = $con->cnx();

	if($c){
		$conn = "Conexion realizada";
	}else{$conn = "Conexion fallida";}

	echo "LLEGO A PHP: ".$conn;
	$c->close();
}

function trysave_prov(){
   $con = new bdd();
   $c = $con->cnx();

   $prov_num = $_POST['prov_num'];
   $prov_name = $_POST['prov_name'];
   $prov_contacto = $_POST['prov_contacto'];
   $prov_tel = $_POST['prov_tel'];
   $prov_mail = $_POST['prov_mail'];
   $prov_status = $_POST['prov_status'];
   $prov_moneda = $_POST['prov_moneda'];
   $prov_imp = $_POST['prov_imp'];
   $prov_dir = $_POST['prov_dir'];
   $prov_estado = $_POST['prov_estado'];
   $prov_delmun = $_POST['prov_delmun'];
   $prov_cp = $_POST['prov_cp'];

   $idprov_exist = val_idprov($prov_num);
   $nameprov_exist = val_nameprov($prov_name);

   if(!$idprov_exist){//validar id de proveedor
      if(!$nameprov_exist){//validar nombre de proveedor
         $q = 'INSERT INTO proveedor(id_proveedor,nombre,contacto,telefono,email,estatus,moneda,impuesto,direccion,id_estado,id_ciudad)
               VALUES(
                  "'.$prov_num.'",
                  "'.$prov_name.'",
                  "'.$prov_contacto.'",
                  "'.$prov_tel.'",
                  "'.$prov_mail.'",
                  "'.$prov_status.'",
                  "'.$prov_moneda.'",
                  "'.$prov_imp.'",
                  "'.$prov_dir.'",
                  "'.$prov_estado.'",
                  "'.$prov_delmun.'"
               )';
         $exe = mysqli_query($c,$q);

         if($exe){
            echo "Se ha agregado el proveedor ".$prov_num;
         }else{echo "No se guardo nada";}
      }else{//cuando se repite el nombre del proveedor
         echo "El nombre de proveedor ".$prov_name.", ya existe, no puede repetir este dato";
      }
   }else{//cuando se repite el numero del proveedor
      echo "El numero de proveedor ".$prov_num.", ya existe, no puede repetir este dato";
   }

   mysqli_close($c);
}

function val_idprov($idprov){
   $con = new bdd();
   $c = $con->cnx();

   $q = 'SELECT id_proveedor FROM proveedor WHERE id_proveedor="'.$idprov.'" LIMIT 1';
   $exe = mysqli_query($c,$q);

   if(mysqli_num_rows($exe)>0){
      return true;
   }else {return false;}

   mysqli_close($c);
}

function val_nameprov($prov_name){
   $con = new bdd();
   $c = $con->cnx();

   $q = 'SELECT id_proveedor FROM proveedor WHERE nombre="'.$prov_name.'" LIMIT 1';
   $exe = mysqli_query($c,$q);

   if(mysqli_num_rows($exe)>0){
      return true;
   }else {return false;}

   mysqli_close($c);
}

function dts_art(){
	sleep(1);
	$con = new bdd();
   $c = $con->cnx();

	$idart = $_POST['idart'];
	$q = 'SELECT sku,desc_corta as nameart FROM articulo WHERE sku = "'.$idart.'" LIMIT 1';
	$exe = mysqli_query($c,$q);

	if (mysqli_num_rows($exe)==1) {
		$art = mysqli_fetch_assoc($exe);
		$nameart = $art['nameart'];
		$q1 ='SELECT ap.* FROM articulo_proveedor ap WHERE ap.sku="'.$idart.'" ';
		$exe1 = mysqli_query($c,$q1);

		$table='<table id="tartsjoinprovs" border="1" width="100%">';
			$table.='
						<tr id="headertable" class="tractive">
							<th>Proveedor</th>
							<th>Costo</th>
							<th>Primario</th>
							<th>Pais Origen</th>
							<th>Piezas en caja</th>
							<th>Piezas caja proveedor</th>
							<th>Cajas en Tramas</th>
							<th>Largo Caja</th>
							<th>Ancho Caja</th>
							<th>Profundidad Caja</th>
							<th>Peso caja</th>
							<th><i class="fa fa-wrench fa-2x"></i></th>
						</tr>';
		if(mysqli_num_rows($exe1)>0){
					while ($dt = mysqli_fetch_assoc($exe1)) {
						$table.='
								<tr data-tridprov="'.$dt['id_proveedor'].'">
									<td>'.$dt['id_proveedor'].'</td>
									<td>'.$dt['costo'].'</td>
									<td>
										<label class="lab_radio">
											<i class="fa fa-circle-thin"></i>
											<input type="radio" name="prov_primario" onchange="selectradio($(this));updateprovprimario($(this));">
										</label>
									</td>
									<td>'.$dt['pais_origen'].'</td>
									<td>'.$dt['inner_pack'].'</td>
									<td>'.$dt['case_pack'].'</td>
									<td>'.$dt['pallet_size'].'</td>
									<td>'.$dt['Largo_caja'].'</td>
									<td>'.$dt['ancho_caja'].'</td>
									<td>'.$dt['profundo_caja'].'</td>
									<td>'.$dt['peso_caja'].'</td>
									<td><button title="desligar"><i class="fa fa-chain-broken"></i></button></td>
								</tr>';
					}
			$table.='</table>';
			$table.='<button data-sku="'.$idart.'" style="display:none;" type="button" id="btn_joinprov" onclick="try_joinprov($(this))" ><i class="fa fa-chain"></i> Ligar</button>';
			$resp = array("st"=>200,"nameart"=>$nameart,"html"=>$table);
		}else{
			$table.='<tr class="dust"><td colspan="12" align="center"><h2>No hay proveedores agregados</h2></td></tr>';
			$table.='</table>';
			$table.='<button data-sku="'.$idart.'" style="display:none;" type="button" id="btn_joinprov" onclick="try_joinprov($(this))"><i class="fa fa-chain"></i> Ligar</button>';
			$resp = array("st"=>200,"nameart"=>$nameart,"html"=>$table);}
		//$resp = array("st"=>200,"html"=>$table);
	}else{$resp = array("st"=>404,"nameart"=>"","html"=>"<p>El id no existe :(</p>");}

	echo json_encode($resp);

	mysqli_close($c);
}

function trysave_jerarquia(){
   $con = new bdd();
   $c = $con->cnx();

   $depto = $_POST['jer_depto'];
   $descdepto = $_POST['jer_depdescr'];
   $clase = $_POST['jer_clase'];
   $descclase = $_POST['jer_cldescr'];
   $sclase = $_POST['jer_sclase'];
   $descscl = $_POST['jer_scldescr'];

   $q = '';

   mysqli_close($c);
}

function ask_depto(){
	$con = new bdd();
   $c = $con->cnx();

	sleep(1);

	$iddepto = $_POST['iddepto'];

	$q = 'SELECT descripcion FROM departamento  WHERE id_dept="'.$iddepto.'" ';
	$exe = mysqli_query($c,$q);
	$descarr = mysqli_fetch_array($exe);
	$desc = $descarr['descripcion'];

	if(mysqli_num_rows($exe)==1){
		$resp = Array("st"=>200,"desc"=>$desc);
	}else{$resp = Array("st"=>404,"desc"=>"");}

	echo json_encode($resp);

	mysqli_close($c);
}

function ask_clase(){
	$con = new bdd();
   $c = $con->cnx();

	sleep(1);

	$idclase = $_POST['idclase'];

	$q = 'SELECT descripcion FROM clase  WHERE id_clase="'.$idclase.'" LIMIT 1';
	$exe = mysqli_query($c,$q);
	$descarr = mysqli_fetch_array($exe);
	$desc = $descarr['descripcion'];

	if(mysqli_num_rows($exe)==1){
		$resp = Array("st"=>200,"desc"=>$desc);
	}else{$resp = Array("st"=>404,"desc"=>"");}

	echo json_encode($resp);

	mysqli_close($c);
}

function savedepto(){
	//'iddepto=descdepto
	$con = new bdd();
   $c = $con->cnx();

	$iddepto = $_POST['iddepto'];
	$descdepto = $_POST['descdepto'];

	$q = 'INSERT INTO departamento(id_dept,descripcion) values("'.$iddepto.'","'.$descdepto.'")';
	$exe = mysqli_query($c,$q);

	if($exe){
		$txt = "Se guardo ".$descdepto." con el ID ".$iddepto;
		$action = "disdescdepto";
	}else{
		$txt = "El ID ".$iddepto." ya existe!!";
		$action = "null";
	}

	$resp = array("txt"=>$txt,"action"=>$action);

	echo json_encode($resp);

	mysqli_close($c);
}

function saveclase(){
	$con = new bdd();
   $c = $con->cnx();

	$iddepto = $_POST['iddepto'];
	$idclase = $_POST['idclase'];
	$cldescr = $_POST['cldescr'];

	$qdep = 'SELECT id_dept FROM departamento WHERE id_dept="'.$iddepto.'" LIMIT 1';
	$qcl = 'SELECT id_clase FROM clase WHERE id_dept="'.$iddepto.'" AND id_clase="'.$idclase.'" ';

	$exedep = mysqli_query($c,$qdep);
	if(mysqli_num_rows($exedep)==1){
		$execlas = mysqli_query($c,$qcl);
		if(mysqli_num_rows($execlas)>0){
			$txt="La clase ".$idclase." ya existe!!";
			$action = "";
		}else{//guardar la clase nueva
			$ins = 'INSERT INTO clase(id_dept,id_clase,descripcion) values("'.$iddepto.'","'.$idclase.'","'.$cldescr.'")';
			$exeins = mysqli_query($c,$ins);
			if($exeins){
				$txt = "Se creo la nueva clase ".$idclase." : ".$cldescr;
				$action = "";
			}else{
				$txt = "Hubo un error";
				$action = "";}
		}
	}else{
		$txt = "Esta intentando guardar en un Departamento que no existe aun";
		$action = "";
	}

	$resp = array("txt"=>$txt,"action"=>$action);

	echo json_encode($resp);

	mysqli_close($c);
}

function savesubclase(){
	$con = new bdd();
   $c = $con->cnx();

	$iddepto = $_POST['iddepto'];
	$idclase = $_POST['idclase'];
	$idsclase = $_POST['idsclase'];
	$scldescr = $_POST['scldescr'];

	$qdep = 'SELECT id_dept FROM departamento WHERE id_dept="'.$iddepto.'" LIMIT 1';
	$qcl = 'SELECT id_clase FROM clase WHERE id_dept="'.$iddepto.'" AND id_clase="'.$idclase.'" ';
	$qscl = 'SELECT id_subclase FROM subclase WHERE id_dept="'.$iddepto.'" AND id_clase="'.$idclase.'" AND id_subclase="'.$idsclase.'" ';

	$exedep = mysqli_query($c,$qdep);
	if(mysqli_num_rows($exedep)==1){
		$execlas = mysqli_query($c,$qcl);
		if(mysqli_num_rows($execlas)>0){
			$exesclas = mysqli_query($c,$qscl);
			if(mysqli_num_rows($exesclas)>0){
				$txt = "El id de subclase ya existe!!";
				$action = "";
			}else{
				$ins = 'INSERT INTO subclase(id_dept,id_clase,id_subclase,descripcion) values("'.$iddepto.'","'.$idclase.'","'.$idsclase.'","'.$scldescr.'")';
				$exeins = mysqli_query($c,$ins);
				if($exeins){
					$txt = "Se creo la nueva subclase ".$idsclase." : ".$scldescr;
					$action = "";
				}else{$txt = "Hubo un error "; $action = "";}
			}
		}else{//guardar la clase nueva
			$txt = "Esta intentando guardar en un Id de Clase que no existe";
			$action = "";
		}
	}else{
		$txt = "Esta intentando guardar en un Departamento que no existe";
		$action = "";
	}

	$resp = array("txt"=>$txt,"action"=>$action);

	echo json_encode($resp);

	mysqli_close($c);
}

function search_jerarquia(){
	$con = new bdd();
   $c = $con->cnx();
	sleep(1);

	$_POST['iddepto']=="" ? $depto = 'null' : $depto = $_POST['iddepto'];
   $_POST['idclase']=="" ? $clase = 'null' : $clase = $_POST['idclase'];
   $_POST['idsubclase']=="" ? $subclase = 'null' : $subclase = $_POST['idsubclase'];

	$q = '
	select d.id_dept,d.descripcion as ddesc,c.id_clase,c.descripcion as cldesc,s.id_subclase,s.descripcion as scldesc
	from departamento d, clase c, subclase s
	where d.id_dept= c.id_dept
	and d.id_dept = '.$depto.'
	and c.id_dept = s.id_dept
	and c.id_clase =ifnull('.$clase.',s.id_clase)
	and s.id_subclase =ifnull('.$subclase.',s.id_subclase);
	';
	$exe = mysqli_query($c,$q);
	$filas = '';
	while($fila = mysqli_fetch_array($exe)){
		$filas.='
		<div class="h_content toremove">
			<div class="_wrappipt col3">
				<p><span>'.$fila['id_dept'].'</span> - <span>'.$fila['ddesc'].'</span></p>
			</div>

			<div class="_wrappipt col3">
				<p><span>'.$fila['id_clase'].'</span> - <span>'.$fila['cldesc'].'</span></p>
			</div>

			<div class="_wrappipt col3">
				<p title="'.$q.'"><span>'.$fila['id_subclase'].'</span> - <span>'.$fila['scldesc'].'</span></p>
			</div>
		</div>
		';
	}

	//$resp = array("html"=>$filas,"query"=>$q);

	echo $filas;

	mysqli_close($c);
}

function add_articulo(){
	$con = new bdd();
   $c = $con->cnx();
	/*
		Falta recibir variables, para poder guardar el articulo
	*/

	$q = 'select agrega_art_prov1(2,1, 3.2,"Y","MX",7,24,24,24,1,1,1,1)';
	$exe = mysqli_query($c,$q);

	if($exe){
		echo "Se guardo el registro";
	}else{echo"error!!!!";}

	mysqli_close($c);
}

/*function trysave_estado(){
	$con = new bdd();
   $c = $con->cnx();

	mysqli_autocommit($c,TRUE);
	mysqli_begin_transaction($c);

	$edoid = $_POST['edo_id'];
	$edodesc = $_POST['edo_desc'];

	$q1 = 'INSERT INTO estado(id_estado,descripcion) values("lll","lll")';
	$q2 = 'INSERT INTO estado(id_estado,descripcion) values("lll","lll")';

	mysqli_query($c,$q1);
	mysqli_query($c,$q2);
	mysqli_commit($c);
	mysqli_rollback($c);

	$c->close();

	$exe = mysqli_query($c,$q2);
	echo mysqli_num_rows($exe);
}*/

function trysave_estado(){
	$con = new bdd();
	$c = $con->cnx();

	mysqli_autocommit($c,FALSE);

	$edoid = $_POST['edo_id'];
	$edodesc = $_POST['edo_desc'];

	$q1 = 'INSERT INTO estado(id_estado,descripcion) values("'.$edoid.'","'.$edodesc.'")';
	$exe = mysqli_query($c,$q1);

	if($exe){
		mysqli_commit($c);
		$resp = array("st"=>10,"msg"=>"Perfect!");
	}else{$resp = array("st"=>13,"msg"=>"Failed!");}

	echo json_encode($resp);

	$c->close();
}

function trysave_ciudad(){
	$con = new bdd();
	$c = $con->cnx();

	$cdoid = $_POST['cd_id'];
	$cddesc = $_POST['cd_desc'];

	$q1 = 'INSERT INTO ciudad(id_ciudad,descripcion) values("'.$cdoid.'","'.$cddesc.'")';
	$exe = mysqli_query($c,$q1);

	if($exe){
		$resp = array("st"=>10,"msg"=>"Perfect!");
	}else{$resp = array("st"=>13,"msg"=>"Failed!");}

	echo json_encode($resp);

	$c->close();
}

function loadcombos(){
	$con = new bdd();
	$c = $con->cnx();
	sleep(1);
	$resp = array();
	$params = $_POST['params'];
	$params1 = explode(",",$params);
	foreach ($params1 as $param) {
		$params2 = explode(":",$param);
		$q = 'SELECT * FROM '.$params2[0].' ';
		$exe = mysqli_query($c,$q);
		$opt="";
		if(mysqli_num_rows($exe)>0){
			$action = false;
			$opt = '<option selected disabled value="null">--- Seleccione ---</option>';
			while($op = mysqli_fetch_array($exe)){
				$opt.='<option value="'.$op[0].'"> '.$op[1].' </option>';
			}
		}else{$opt.='<option selected disabled value="null"> :( </option>';$action = true;}

		$resp[]=array("target"=>$params2[1],"options"=>$opt,"action"=>$action);
		unset($opt);
	}

	echo json_encode($resp);
	$c->close();
}

function loadtipotienda(){
	$con = new bdd();
	$c = $con->cnx();

	$q = 'SELECT valor3 FROM parametros_generales WHERE id_parametro=2 ';
	$exe = mysqli_query($c,$q);

	$ops = '<option value="null" disabled selected>-- Seleccione --</option>';
	while($f = mysqli_fetch_array($exe)){
		$ops.='<option value="'.$f['valor3'].'">'.$f['valor3'].'</option>';
	}

	$resp = array("st"=>10,"ops"=>$ops);

	echo json_encode($resp);

	$c->close();
}

function loadcombotiporden(){
	$con = new bdd();
	$c = $con->cnx();

	$q = 'SELECT valor3 FROM parametros_generales WHERE id_parametro=3 ';
	$exe = mysqli_query($c,$q);

	$ops = '<option value="null" disabled selected>-- Seleccione --</option>';
	while($f = mysqli_fetch_array($exe)){
		$ops.='<option value="'.$f['valor3'].'">'.$f['valor3'].'</option>';
	}

	$resp = array("st"=>10,"ops"=>$ops);

	echo json_encode($resp);

	$c->close();
}

function trysave_tienda(){
	$con = new bdd();
	$c = $con->cnx();

	$dist_tipoubic = $_POST['dist_tipoubic'];
	$dist_num = $_POST['dist_num'];
	$dist_desc = $_POST['dist_desc'];
	$dist_dir = $_POST['dist_dir'];
	$dist_resp = $_POST['dist_resp'];
	$dist_region = $_POST['dist_region'];
	$dist_estado = $_POST['dist_estado'];
	$dist_ciudad = $_POST['dist_ciudad'];
	$dist_finit = $_POST['dist_finit'];
	$dist_fend = $_POST['dist_fend'];
	$dist_tipotienda = $_POST['dist_tipotienda'];
	$dist_atendio = $_POST['dist_atendio'];

	$q = 'INSERT INTO tienda(tienda,nombre,direccion,responsable,region,id_ciudad,id_estado,fecha_apertura,fecha_cierre,
		codigo_postal,tipo_tienda,impuesto,id_cd,moneda,tienda_cd) VALUES(
		"'.$dist_num.'",
		"'.$dist_desc.'",
		"'.$dist_dir.'",
		"'.$dist_resp.'",
		"'.$dist_region.'",
		"'.$dist_ciudad.'",
		"'.$dist_estado.'",
		"'.$dist_finit.'",
		"'.$dist_fend.'",
		"55700",
		"'.$dist_tipotienda.'",
		"100",
		"'.$dist_atendio.'",
		"dolar",
		"'.$dist_tipoubic.'"
	)';
	$exe = mysqli_query($c,$q);
	if($exe){
		$resp = array("st"=>"Perfect!");
	}else{$resp = array("st"=>"Failed!");}
	echo json_encode($resp);
	$c->close();
}

function trysave_ubicaciones(){
	$con = new bdd();
	$c = $con->cnx();

	$ub_ubicacion = $_POST['ub_ubicacion'];
	$ub_tipo = $_POST['ub_tipo'];
	$ub_zona = $_POST['ub_zona'];
	$ub_status = $_POST['ub_status'];
	$ub_multiart = $_POST['ub_multiart'];

	$q = 'INSERT INTO ubicacion(
		id_cd,
		ubicacion,
		tipo,
		fecha_creacion,
		usuario_creacion,
		multi_sku,
		estatus,
		conteo_ciclico,
		fecha_conteo,
		usuario_conteo
	) VALUES(
		"3",
		"'.$ub_ubicacion.'",
		"'.$ub_tipo.'",
		"2017-01-01 00:00:00",
		"comodin",
		"'.$ub_multiart.'",
		"'.$ub_status.'",
		"12345",
		"2017-01-01 00:00:00",
		"comodin"
	)';
	$exe = mysqli_query($c,$q);

	if($exe){
		$resp = array("st"=>10,"txt"=>"Perfect! :)");
	}else{$resp = array("st"=>13,"txt"=>"Failed! :(");}

	echo json_encode($resp);
	$c->close();
}

function trysave_codigo(){
	$con = new bdd();
	$c = $con->cnx();

	$cod_codigo = $_POST['cod_codigo'];
	$cod_desc = $_POST['cod_desc'];
	$codactive = $_POST['codactive'];

	$q = 'INSERT INTO codigo(
		id_codigo,
		descripcion,
		activo
	) VALUES(
		"'.$cod_codigo.'",
		"'.$cod_desc.'",
		"'.$codactive.'"
	)';
	$exe = mysqli_query($c,$q);

	if($exe){
		$resp = array("st"=>10,"txt"=>"PERFECT!");
	}else{$resp = array("st"=>13,"txt"=>"Failed!");}

	echo json_encode($resp);
	$c->close();
}

function search_proveedor(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM proveedor WHERE id_proveedor LIKE "%'.$keyword.'%" OR nombre LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Proveedor</th>
					<th>Nombre</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<td>'.$tr[0].'</td>
						<td>'.$tr[1].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_artordcompra(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM articulo WHERE sku LIKE "%'.$keyword.'%" OR desc_corta LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table id="tarticulosbasket" border=1 width="100%">';
			$table.='
				<tr>
					<th>Imagen</th>
					<th>SKU</th>
					<th>Descripcion</th>
					<th><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr class="_articulo" data-trsku="'.$tr['sku'].'" data-trnameart="'.$tr['desc_corta'].'">
						<td><img src="imgs/articulos/'.$tr['img_articulo'].'" width="50px" ></td>
						<td>'.$tr[0].'</td>
						<td>'.$tr['desc_corta'].'</td>
						<td><button type="button" style="width:100%;" onclick="addonbasket($(this))"><i class="fa fa-plus"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron articulos");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_provtojoinart(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM proveedor WHERE id_proveedor LIKE "%'.$keyword.'%" OR nombre LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table id="tproviders" border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Proveedor</th>
					<th>Nombre</th>
					<th><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr class="_proveedor" data-idprov="'.$tr[0].'" data-nprov="'.$tr[1].'">
						<td>'.$tr[0].'</td>
						<td>'.$tr[1].'</td>
						<td><button type="button" style="width:100%;" onclick="try_joinmosprov($(this))"><i class="fa fa-arrow-circle-down"></i></button></td>
					</tr>';
			}

			/*while ($tr=mysqli_fetch_array($exe)) {
				$mosprov.='
						<div class="mosaico wmos _proveedor" data-idprov="'.$tr[0].'" data-nprov="'.$tr[1].'">
							<div class="dtsprov">
								<div>'.$tr[0].'</div>
								<div>'.$tr[1].'</div>
							</div>
							<div>
								<button type="button" onclick="try_joinmosprov($(this));"><i class="fa fa-arrow-circle-down fa-2x"></i></button>
							</div>
						</div>
					';
			}*/
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_ubicacion(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM ubicacion WHERE id_cd LIKE "%'.$keyword.'%" OR ubicacion LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>id_cd</th>
					<th>ubicacion</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<td>'.$tr['id_cd'].'</td>
						<td>'.$tr['ubicacion'].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_transcode(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM codigo WHERE id_codigo LIKE "%'.$keyword.'%" OR descripcion LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Codigo</th>
					<th>Descripcion</th>
					<th>Activo</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$tr['activo']=='y'?$opact="Si":$opact="No";
				$table.='
					<tr>
						<td>'.$tr['id_codigo'].'</td>
						<td>'.$tr['descripcion'].'</td>
						<td>'.$opact.'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_tiendacd(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM tienda WHERE tienda LIKE "%'.$keyword.'%" OR nombre LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Codigo</th>
					<th>Descripcion</th>
					<th>Responsable</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<td>'.$tr['tienda'].'</td>
						<td>'.$tr['nombre'].'</td>
						<td>'.$tr['responsable'].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_ciudades(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM ciudad WHERE id_ciudad LIKE "%'.$keyword.'%" OR descripcion LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Ciudad</th>
					<th>Descripcion</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<td>'.$tr['id_ciudad'].'</td>
						<td>'.$tr['descripcion'].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_estados(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM estado WHERE id_estado LIKE "%'.$keyword.'%" OR descripcion LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>ID Estado</th>
					<th>Descripcion</th>
					<th colspan=2><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<td>'.$tr['id_estado'].'</td>
						<td>'.$tr['descripcion'].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function search_articulos(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();

	$keyword = $_POST['keyword'];

	$q = 'SELECT * FROM articulo WHERE sku LIKE "%'.$keyword.'%" OR desc_corta LIKE "%'.$keyword.'%"';
	$exe = mysqli_query($c,$q);
	$table = '';
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$table.='<table border=1 width="100%">';
			$table.='
				<tr>
					<th>Imagen</th>
					<th>SKU</th>
					<th>Descripcion Corta</th>
					<th colspan=3><i class="fa fa-wrench"></i></th>
				</tr>';
			while ($tr=mysqli_fetch_array($exe)) {
				$table.='
					<tr>
						<th><img src="imgs/articulos/'.$tr['img_articulo'].'" alt="'.$tr['img_articulo'].'" width=50 /></th>
						<td>'.$tr['sku'].'</td>
						<td>'.$tr['desc_corta'].'</td>
						<td><button><i class="fa fa-pencil"></i></button></td>
						<td><button><i class="fa fa-trash"></i></button></td>
						<td><button value="'.$tr['sku'].'" onclick="add_proveedor($(this));"><i class="fa fa-truck"></i></button></td>
					</tr>';
			}
			$table.='</table>';
			$resp = array("st"=>10,"txt"=>$table);
		}else{$resp = array("st"=>10,"txt"=>"No se encontraron coincidencias");}
	}else{$resp = array("st"=>13,"txt"=>"Error en query!!");}

	echo json_encode($resp);
	$c->close();
}

function loadclases(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();
	$ops = '';
	$iddepto = $_POST['iddepto'];
	$q = 'SELECT id_clase,descripcion FROM clase WHERE id_dept="'.$iddepto.'" ';
	$exe = mysqli_query($c,$q);
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$ops.='<option selected disabled>--- Seleccione ---</option>';
			while ($cl = mysqli_fetch_array($exe)) {
				$ops.='<option value="'.$cl['id_clase'].'">'.$cl['descripcion'].'</option>';
			}
			$resp = array("st"=>10,"txt"=>$ops,"disab"=>false);
		}else{$resp = array("st"=>10,"txt"=>"<option selected disabled> vacio</option>","disab"=>true);}
	}else{$resp = array("st"=>13,"txt"=>"Query failed! :(","disab"=>true);}

	echo json_encode($resp);
	$c->close();
}

function loadsubclases(){
	sleep(1);
	$con = new bdd();
	$c = $con->cnx();
	$ops = '';
	$iddepto = $_POST['iddepto'];
	$idclase = $_POST['idclase'];
	$q = 'SELECT id_subclase,descripcion FROM subclase WHERE id_clase="'.$idclase.'" AND id_dept="'.$iddepto.'"';
	$exe = mysqli_query($c,$q);
	if($exe){
		if(mysqli_num_rows($exe)>0){
			$ops.='<option selected disabled>--- Seleccione ---</option>';
			while ($scl = mysqli_fetch_array($exe)) {
				$ops.='<option value="'.$scl['id_subclase'].'">'.$scl['descripcion'].'</option>';
			}
			$resp = array("st"=>10,"txt"=>$ops,"disab"=>false);
		}else{$resp = array("st"=>10,"txt"=>"<option selected disabled> vacio</option>","disab"=>true);}
	}else{$resp = array("st"=>13,"txt"=>"Query failed! :(","disab"=>true);}

	echo json_encode($resp);
	$c->close();
}

function listtiendas_altaarticulos(){
	$con = new bdd();
	$c = $con->cnx();

	$ops = '';

	$q = 'SELECT * FROM tienda';
	$exe = mysqli_query($c,$q);

	if($exe){
		if(mysqli_num_rows($exe)>0){
			$ops.= '
			<div class="h_content optienda">
				<div class="_wrappipt col2">
					<label>Tienda</label>
				</div>

				<div class="_wrappipt col2">
					<label>Activo</label>
				</div>
			</div>';
			while($tnd = mysqli_fetch_array($exe)){
				$ops.= '
				<div class="h_content optienda">
					<div class="_wrappipt col2">
						<p>'.$tnd['nombre'].'</p>
					</div>

					<div class="_wrappipt col2">
						<label class="lab_check">
							<i class="fa fa-square-o"></i>
							<input type="checkbox" class="addtienda" name="tienda" value="'.$tnd['tienda'].'" onchange="togglecheck($(this));">
						</label>
					</div>
				</div>';
			}
			$resp=array("st"=>10,"txt"=>$ops);
		}else{$resp=array("st"=>10,"txt"=>"No hay tiendas en el catalogo");}
	}else{$resp = array("st"=>13,"txt"=>"Query Failed!");}

	echo json_encode($resp);

	$c->close();
}

function trysave_articulo(){
	$con = new bdd();
	$c = $con->cnx();

	sleep(1);

	date_default_timezone_set("America/Mexico_City");
	$hoy =  date("Y-d-m");

	$art_desclarga=$_POST['art_desclarga'];
	$art_desccorta=$_POST['art_desccorta'];
	$art_depto=$_POST['art_depto'];
	$art_clase=$_POST['art_clase'];
	$art_subclase=$_POST['art_subclase'];
	$art_zonaprecio=$_POST['art_zonaprecio'];
	$art_precio=$_POST['art_precio'];
	$art_unidad=$_POST['art_unidad'];
	$art_vendible=$_POST['art_vendible'];

	$imgn = $_POST['nimgfoto'];

	$qNextSKU = 'SELECT secuencia("sku")';
	$exe_SKU = mysqli_query($c,$qNextSKU);
	if($exe_SKU){
		$sec = mysqli_fetch_array($exe_SKU);
		$art_sku = $sec[0];

		if($imgn==""){
			$nimgfoto="ipd1000.png";//imagen default
		}else{
			$f = explode(".",$imgn);
			$iname = $f[0];
			$iext = $f[1];

			$nimgfoto = $art_sku.".".$iext;
			rename("../imgs/articulos/temp/".$imgn,"../imgs/articulos/temp/".$nimgfoto);
			copy("../imgs/articulos/temp/".$nimgfoto,"../imgs/articulos/".$nimgfoto);
		}

		$wr_sku='INSERT INTO articulo(sku,desc_larga,desc_corta,id_dept,id_clase,id_subclase,zona_precio,unidad_medida,vendible,img_articulo)
					VALUES(
						"'.$art_sku.'",
						"'.$art_desclarga.'",
						"'.$art_desccorta.'",
						"'.$art_depto.'",
						"'.$art_clase.'",
						"'.$art_subclase.'",
						"'.$art_zonaprecio.'",
						"'.$art_unidad.'",
						"'.$art_vendible.'",
						"'.$nimgfoto.'"
					)';
		$exe = mysqli_query($c,$wr_sku);

		$wr_zonaprecioenc='INSERT INTO zona_precio(id_zona,sku,precio,usuario_creacion) VALUES(
									"'.$art_zonaprecio.'",
									"'.$art_sku.'",
									"'.$art_precio.'",
									"userdeft"
								)';
		$exe2 = mysqli_query($c,$wr_zonaprecioenc);
		if($exe&&$exe2){
			$resp = array("st"=>10,"msg"=>"El articulo se guardo correctamente, puede agregar upc y/o tiendas","sku"=>$art_sku);
		}else{$resp = array("st"=>13,"msg"=>"Error al guardar!","sku"=>"null");}
	}

	echo json_encode($resp);

	$c->close();
}

function agrega_upc(){
	$con = new bdd();
	$c = $con->cnx();

	$sku = $_POST['sku'];
	$upc = $_POST['upc'];
	$tipo = $_POST['tipo'];
	$prim = $_POST['prim'];

	// sku | upc | primario | tipo_upc
	$q = 'SELECT agrega_upc("'.$sku.'","'.$upc.'","'.$prim.'","'.$tipo.'")';
	$exe = mysqli_query($c,$q);
	$row = mysqli_fetch_array($exe);

	$r = $row[0];
	$resp = array("st"=>10,"upc"=>$upc,"msg"=>$r);

	echo json_encode($resp);

	$c->close();
}

function agrega_sku_tienda(){
	$con = new bdd();
	$c = $con->cnx();

	$tienda = $_POST['tienda'];
	$sku = $_POST['sku'];
	$activo = $_POST['activo'];

	// sku | upc | primario | tipo_upc
	$q = 'SELECT agrega_sku_tda("'.$tienda.'","'.$sku.'","'.$activo.'")';
	$exe = mysqli_query($c,$q);
	$row = mysqli_fetch_array($exe);

	$r = $row[0];
	$resp = array("st"=>10,"tda"=>$tienda,"msg"=>$r);

	echo json_encode($resp);

	$c->close();
}

function try_joinprov(){
	$con = new bdd();
	$c = $con->cnx();

	$sku = $_POST['sku'];
	$prov = $_POST['idprov'];
	$costo = $_POST['costo'];
	$pais = $_POST['pais'];
	$pzscaja = $_POST['pzscaja'];
	$pzsprov = $_POST['pzsprov'];
	$cajastarima = $_POST['cajastarima'];
	$cajalargo = $_POST['cajalargo'];
	$cajaancho = $_POST['cajaancho'];
	$cajaprof = $_POST['cajaprof'];
	$cajapeso = $_POST['cajapeso'];

	//echo "Saludos desde PHP ".$cajapeso." <==> ".$cajaprof;
	// SKU | idproveedor | costo | primario | pais
	// tiempollegada | innerpack | casepack | palletsize
	// largocaja | anchocaja | profundocaja | pesocaja

	// 	[15:47, 16/2/2017] Felipe Work: El primero es piezas por caja
	// 	[15:48, 16/2/2017] Felipe Work: Segundo piezas por caja de proveedores
	// 	[15:48, 16/2/2017] Felipe Work: Y tercero cajas por tarima
	$q = 'SELECT liga_art_prov(
		"'.$sku.'",
		"'.$prov.'",
		"'.$costo.'",
		"n",
		"'.$pais.'",
		"10",
		"'.$pzscaja.'",
		"'.$pzsprov.'",
		"'.$cajastarima.'",
		"'.$cajalargo.'",
		"'.$cajaancho.'",
		"'.$cajaprof.'",
		"'.$cajapeso.'"
	);';

	$exe = mysqli_query($c,$q);
	if($exe){
		$col = mysqli_fetch_array($exe);
		echo $col[0];
	}else{
		echo"Query Failed!!";
	}
	$c->close();
}

function loadproviders_onarray(){
	$con = new bdd();
	$c = $con->cnx();

	$provs = array();
	$q='SELECT id_proveedor,nombre FROM proveedor';
	$exe = mysqli_query($c,$q);

	if(mysqli_num_rows($exe)>0){
      while($result = mysqli_fetch_array($exe)){
         $provs[]=array(
						"label"=>$result['id_proveedor']." - ".$result['nombre'],
						"idp"=>$result['id_proveedor']
					);
      }
   }else{$provs[] = "";}

	echo json_encode($provs);

	$c->close();
}

function trysave_ordcompra(){
	$con = new bdd();
	$c = $con->cnx();

	$tipoorden=$_POST['oc_tipoorden'];
	$proveedor=$_POST['oc_proveedor'];
	$depto=$_POST['oc_depto'];
	$dinit=$_POST['oc_dinit'];
	$dend=$_POST['oc_dend'];

	$sec = 'SELECT secuencia("orden")';
	$exe_sec = mysqli_query($c,$sec);

	$row = mysqli_fetch_array($exe_sec);
	$idord = $row[0];

	$q='INSERT INTO orden(
		id_orden,
		id_dept,
		id_proveedor,
		fecha_ini_entrega,
		fecha_creacion,
		usuario_creacion,
		fecha_cierre,
		estatus,
		tipo_orden)
	VALUES(
		"'.$idord.'",
		"'.$depto.'",
		"'.$proveedor.'",
		"'.$dinit.'",
		current_timestamp,
		"userdeft",
		"'.$dend.'",
		"C",
		"'.$tipoorden.'"
	)';

	$exe = mysqli_query($c,$q);
	if($exe){
		$resp = array("st"=>10,"msg"=>"Elemento insertado","idord"=>$idord);
	}else{$resp = array("st"=>13,"msg"=>"Error en query! :(","idord"=>"");}

	echo json_encode($resp);

	$c->close();
}

?>
