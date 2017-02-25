-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2017 a las 19:28:02
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mercaderias`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `agrega_sku_tda` (`l_tienda` INT, `l_sku` INT, `l_activo` VARCHAR(1)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN

declare done int default 0;
declare l_return varchar(100);
declare ll_tda int(10);
declare ll_sku int(10);
declare ll_zona_precio int(10);
declare ll_proveedor int(10);
declare ll_costo float(10,4);
declare ll_vendible varchar(1);
declare ll_precio float(10,4);
declare ll_tipo varchar(10);


declare g_error int(10);

declare c_tda cursor for
select tienda 
from tienda
where tienda=l_tienda;

declare c_art cursor for
select sku,zona_precio,vendible
from articulo
where sku=l_sku;

declare c_costo cursor  for 
 select costo,id_proveedor
 from articulo_proveedor
 where sku=l_sku 
 and primario='Y';
 
 
declare c_precio cursor  for 
select precio
from zona_precio
where id_zona=ll_zona_precio 
and sku=ll_sku ;

 

DECLARE CONTINUE HANDLER FOR SQLSTATE '23000'
begin
insert into error_log (id_error,error_log,fecha,programa)
values(1, 'manual' ,current_date,'sqlstate'); 

set l_return:='El registro ya existe'; return l_return ; 

end;

DECLARE continue HANDLER FOR NOT FOUND SET @hecho = TRUE; 
 
DECLARE CONTINUE HANDLER FOR SQLWARNING 
BEGIN
END;

DECLARE exit HANDLER FOR SQLEXCEPTION 
BEGIN
insert into error_log (id_error,error_log,fecha,programa)
values(1, 'manual',current_date,'art_prov'); 

set l_return:='exception'; return l_return ;
END;set ll_tda :=0;


 
 open c_tda;
loop1: LOOP
 
fetch c_tda into ll_tda,ll_tipo;

if ll_tda =0 then 




set l_return:= 'El numero de tienda no existe';
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;

END LOOP loop1;
close c_tda; 
 
 

set ll_sku:=0;
open c_art;
loop1: LOOP
fetch c_art into ll_sku,ll_zona_precio,ll_vendible;

if ll_sku =0 then 
set l_return:= 'El sku no existe';
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;
END LOOP loop1;
close c_art;


if (l_activo !='N' or l_activo !='Y') then
set l_return:='El valor de primario no es valido';
RETURN l_return;
end if;

open c_costo;
loop1: LOOP
fetch c_costo into ll_costo,ll_proveedor;

if ll_proveedor =0 then 
set l_return:= 'No existe costo para el articulo';
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;
END LOOP loop1;
close c_costo;



set ll_precio:=-1;
open c_precio;
loop1: LOOP
fetch c_precio into ll_precio;

if ll_precio =-1 then 
set l_return:= 'No existe precio para el articulo';
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;
END LOOP loop1;
close c_precio;


if ll_tipo='TIENDA' then 

		INSERT INTO `sanjosep_mercaderias`.`inv_tienda`
		(`tienda`,
		`sku`,
		`proveedor`,
		`costo_unitario`,
		`costo_promedio`,
		`precio_venta`,
		`inventario`,
		`transito`,
		`reservado`,
		`esperado`,
		`vendible`,
		`estatus`,
		`fecha_creacion`)
		VALUES
		(l_tienda,
		l_sku,
		ll_proveedor,
		ll_costo,
		0,
		ll_precio,
		0,
		0,
		0,
		0,
		ll_vendible,
		l_activo,
		current_date);
else 

		INSERT INTO `sanjosep_mercaderias`.`inv_cd`
		(`cd`,
		`sku`,
		`proveedor`,
		`costo_unitario`,
		`costo_promedio`,
		`precio_venta`,
		`inventario`,
		`transito`,
		`reservado`,
		`esperado`,
		`vendible`,
		`estatus`,
		`fecha_creacion`)
		VALUES
		(l_tienda,
		l_sku,
		ll_proveedor,
		ll_costo,
		0,
		ll_precio,
		0,
		0,
		0,
		0,
		ll_vendible,
		l_activo,
		current_date);



end if;

set l_return:='El proceso termino bien';

RETURN l_return;

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `agrega_upc` (`l_SKU` INT, `l_UPC` VARCHAR(15), `l_PRIMARIO` VARCHAR(1), `l_tipo` VARCHAR(20)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN



declare done int default 0;
declare l_return varchar(100);
declare ll_upc_sku int(15);
declare ll_sku int(11);
declare g_error int(10);

declare c_upc cursor for
select sku
from upc
where upc=l_upc;


declare c_art cursor for
select sku
from articulo
where sku=l_sku;


DECLARE CONTINUE HANDLER FOR SQLSTATE '23000'
begin
insert into error_log (id_error,error_log,fecha,programa)
values(1, 'manual' ,current_date,'sqlstate'); 

set l_return:='El registro ya existe'; return l_return ; 

end;

DECLARE continue HANDLER FOR NOT FOUND SET @hecho = TRUE; 
 
DECLARE CONTINUE HANDLER FOR SQLWARNING 
BEGIN
END;

DECLARE exit HANDLER FOR SQLEXCEPTION 
BEGIN
insert into error_log (id_error,error_log,fecha,programa)
values(1, 'manual',current_date,'art_prov'); 

set l_return:='exception'; return l_return ;
END;
set ll_upc_sku :=0;


 
open c_upc;
 loop1: LOOP
 
fetch c_upc into ll_upc_sku;

if ll_upc_sku !=0 then 
set l_return:= concat('El upc ya existe para el sku ',ll_upc_sku) ;
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;

END LOOP loop1;
close c_upc; 
  
  
set ll_sku:=0;
open c_art;
loop1: LOOP
fetch c_art into ll_sku;


if ll_sku =0 then 
set l_return:= 'El sku no existe';
return l_return;

end if;

IF @hecho THEN
LEAVE loop1;
END IF;
END LOOP loop1;
close c_art;

  

  if (l_primario !='N' ) then
	  if (l_primario !='Y' ) then
		set l_return:='El valor de primario no es valido';
		 RETURN l_return;
	  end if;
end if;



   
 INSERT INTO upc
(`sku`,
`upc`,
`primario`,
`tipo_upc`)
VALUES(l_sku,
l_upc,
l_primario,
l_tipo);

set l_return:='El upc se agrego de forma correcta';
 RETURN l_return;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `liga_art_prov` (`_sku` INT(10), `_idproveedor` INT(10), `_costo` FLOAT(10), `_primario` VARCHAR(1), `_pais` VARCHAR(6), `_tiempollegada` INT(3), `_innerpack` INT(4), `_casepack` INT(4), `_palletsize` FLOAT(10), `_largocaja` FLOAT(10), `_anchocaja` FLOAT(10), `_profundocaja` FLOAT(10), `_pesocaja` FLOAT(10)) RETURNS VARCHAR(150) CHARSET ascii BEGIN

    DECLARE art BOOLEAN;
    DECLARE prov BOOLEAN;
    
	
    
	
    
	IF _sku="" OR _sku IS NULL THEN
		RETURN 'No ingreso SKU!';
        
        ELSEIF EXISTS (SELECT sku FROM articulo WHERE sku = _sku LIMIT 1) THEN
			SET art = TRUE;
        ELSE RETURN 'EL SKU que intenta ligar no existe!';
	END IF;
    
	IF _idproveedor="" OR _idproveedor IS NULL THEN
		RETURN 'No ingreso ID de proveedor!';
        
        ELSEIF EXISTS (SELECT id_proveedor FROM proveedor WHERE id_proveedor = _idproveedor LIMIT 1) THEN
			SET prov = TRUE;
        ELSE RETURN 'EL proveedor que intenta ligar no existe!';
	END IF;    
    
	IF _costo="" OR _costo IS NULL AND _costo>0 THEN
		RETURN 'El costo debe ser mayor a 0.00';
	END IF;
    
	IF _primario="" OR _primario IS NULL THEN
		RETURN 'No ha indicado al proveedor primario!';
	END IF;
    
    IF _pais="" OR _pais IS NULL THEN
		RETURN 'Debe ingresar un pais!';
	END IF;
	
    
    
    IF _innerpack="" OR _innerpack IS NULL THEN
		RETURN 'Indique INNER PACK!';
	END IF;
    
    IF _casepack="" OR _casepack IS NULL THEN
		RETURN 'Indique CASE PACK!';
	END IF;
    
    
	IF art AND prov THEN
		IF NOT EXISTS (SELECT sku FROM articulo_proveedor WHERE sku=_sku AND id_proveedor=_idproveedor) THEN
			INSERT INTO articulo_proveedor(id_proveedor,sku,costo,primario,pais_origen,tiempo_llegada,
				inner_pack,case_pack,pallet_size,largo_caja,ancho_caja,profundo_caja,peso_caja)
			VALUES(_idproveedor,_sku,_costo,_primario,_pais,_tiempollegada,_innerpack,
				_casepack,_palletsize,_largocaja,_anchocaja,_profundocaja,_pesocaja);
			RETURN 'La liga se creo correctamente';
		ELSE RETURN 'Ya existe una liga entre este articulo y este proveedor, no pueden duplicarse!!';
        END IF;
    ELSE
		RETURN'Error inesperado en las tablas articulo y/o proveedor!';
    END IF;

END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `secuencia` (`sSeqName` VARCHAR(50) CHARSET ascii) RETURNS INT(11) READS SQL DATA
    DETERMINISTIC
begin 
declare nLast_val INT(11);

 select seq_val 
into nLast_val
from _sequence
 where seq_name = sSeqName;
    
    if nLast_val is null then
        set nLast_val = 1;
        insert into _sequence (seq_name,seq_val) 
        values (sSeqName,nLast_Val);
    else
        set nLast_val = nLast_val + 1;
        update _sequence set seq_val = nLast_val 
        where seq_name = sSeqName;
    end if;


RETURN nLast_val;
end$$

CREATE DEFINER=`root`@`localhost` FUNCTION `upcprimario` (`_sku` VARCHAR(15)) RETURNS VARCHAR(100) CHARSET latin1 BEGIN
		DECLARE res VARCHAR(10);
        DECLARE upccurrent VARCHAR(10);
        
		SELECT upc INTO upccurrent FROM upc WHERE sku=_sku AND primario="Y" LIMIT 1;
		SET res = upccurrent;
		
        RETURN res;
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `sku` int(11) NOT NULL,
  `desc_larga` varchar(100) NOT NULL COMMENT 'sku\\nDesc_larga\\nDesc_corta\\nid_dept\\nid_clase\\nid_subclase\\nzona_precio\\nUnidad_medida\\nvendible\\nPrimer_recibo \\nultimo_recibo \\n',
  `desc_corta` varchar(50) DEFAULT NULL,
  `id_dept` int(4) DEFAULT NULL,
  `id_clase` int(4) DEFAULT NULL,
  `id_subclase` int(4) DEFAULT NULL,
  `zona_precio` int(4) DEFAULT NULL,
  `unidad_medida` varchar(6) NOT NULL,
  `vendible` varchar(1) DEFAULT NULL,
  `img_articulo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`sku`, `desc_larga`, `desc_corta`, `id_dept`, `id_clase`, `id_subclase`, `zona_precio`, `unidad_medida`, `vendible`, `img_articulo`) VALUES
(39, 'de 2 lts', 'Refresco', 1, 1, 2, 1, 'l', '1', '39.jpg'),
(40, 'dfgdfg', 'sfg', 2, 1, 1, 1, 'l', '1', 'ipd1000.png'),
(42, 'bolsa de cheetos de 250mgrs', 'Cheetos bola', 1, 1, 1, 1, 'kl', '0', '42.jpg'),
(43, 'Bolsa de papas fritas de 500mgrs', 'Sabritas saladas', 1, 1, 1, 1, 'kl', '1', '43.jpg'),
(44, 'Bolsa de papas fritas de 500mgrs', 'Sabritas saladas', 1, 1, 1, 1, 'kl', '1', '44.jpg'),
(45, 'kjserhglkdhbvkjhbfgkbj hfdlkgn', 'Pepsi 500ml', 1, 1, 1, 1, 'l', '1', 'ipd1000.png'),
(46, 'Pelota para ninios de 12 anios en adelante', 'Pelota', 1, 1, 1, 1, 'ml', '1', '46.png'),
(47, 'Vaso de Elotes y patitas de 500ml', 'Patitas y Esquites', 2, 1, 2, 1, 'l', '1', '47.jpg'),
(48, 'skfjgyisudhgklerjg', 'Papas Fritas', 1, 1, 1, 1, 'gr', '1', '48.jpg'),
(49, 'srdhrdth', 'sargsfdz', 1, 3, 3, 1, 'l', '1', 'ipd1000.png'),
(50, 'irhgoeth', 'isdfughvk', 1, 1, 4, 1, 'gr', '1', '50.jpg'),
(53, 'ieurgfh', 'iw73tyrid', 1, 1, 1, 1, 'gr', '1', '53.JPG'),
(54, 'sielrudfh', 'ps9t8ugdo', 3, 1, 1, 2, 'kl', '1', 'ipd1000.png'),
(55, 'srgsdfg', 'dfgdfg', 1, 1, 1, 1, 'kl', '1', 'ipd1000.png'),
(56, '87iyh', '87yiu', 1, 1, 1, 1, 'kl', '1', 'ipd1000.png'),
(57, '87ty', 'o87tiu', 1, 1, 1, 1, 'kl', '1', 'ipd1000.png'),
(58, '98yukj', 'o87tiu', 1, 1, 1, 1, 'gr', '1', 'ipd1000.png'),
(59, '87yhj', '8i7gyi', 1, 1, 1, 1, 'gr', '1', 'ipd1000.png'),
(60, '96yijk', '78iuj', 1, 1, 1, 1, 'ml', '1', 'ipd1000.png'),
(61, '908up', 'kjh', 1, 1, 1, 1, 'gr', '1', '61.gif'),
(62, 'Computadora de escritorio marca lenovo, incluye CPU, teclado, mouse y monitor de 24 pulgadas', 'Computadora Lenovo', 1, 1, 4, 1, 'kl', '1', 'ipd1000.png'),
(63, 'Mopchila con carrito de tortugas', 'Mochila con carrito', 1, 1, 1, 1, 'kl', '1', 'ipd1000.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_proveedor`
--

CREATE TABLE `articulo_proveedor` (
  `id_proveedor` int(11) NOT NULL COMMENT 'sku\\nid_proveedor\\ncosto\\nprimario\\npais_origen\\ntiempo_llegada\\ninner_pack\\ncase_pack\\npallet_size\\nLargo_caja\\nancho_caja\\nprofundo_caja\\npeso_caja\\n',
  `sku` int(11) NOT NULL,
  `costo` decimal(10,4) NOT NULL,
  `primario` varchar(1) NOT NULL,
  `pais_origen` varchar(6) NOT NULL,
  `tiempo_llegada` int(3) DEFAULT NULL,
  `inner_pack` int(4) NOT NULL,
  `case_pack` int(4) NOT NULL,
  `pallet_size` int(4) DEFAULT NULL,
  `Largo_caja` decimal(10,4) DEFAULT NULL,
  `ancho_caja` decimal(10,4) DEFAULT NULL,
  `profundo_caja` decimal(10,4) DEFAULT NULL,
  `peso_caja` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articulo_proveedor`
--

INSERT INTO `articulo_proveedor` (`id_proveedor`, `sku`, `costo`, `primario`, `pais_origen`, `tiempo_llegada`, `inner_pack`, `case_pack`, `pallet_size`, `Largo_caja`, `ancho_caja`, `profundo_caja`, `peso_caja`) VALUES
(7654, 39, '78.0000', 'n', 'MX', 10, 578, 678, 678, '678.0000', '678.0000', '65.0000', '56.0000'),
(7654, 42, '45.0000', 'n', 'klj', 10, 345, 345, 345, '345.0000', '345.0000', '345.0000', '345.0000'),
(7989, 39, '12.0000', 'n', '46', 10, 78, 78, 78, '78.0000', '78.0000', '78.0000', '78.0000'),
(9876, 62, '7500.0000', 'n', 'mx', 10, 1, 10, 10, '100.0000', '100.0000', '100.0000', '55.0000'),
(9876, 63, '1200.0000', 'n', 'mx', 10, 4, 2, 10, '10.0000', '10.0000', '10.0000', '10.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignacion`
--

CREATE TABLE `assignacion` (
  `id_cd` int(4) NOT NULL COMMENT 'asignacion \\nid_cd\\nid_asignacion \\ndestino\\nid_distribucion\\nsurtido_contenedor\\nasignado_contenedor\\nsku\\npiezas\\ntipo\\nfecha_creacion\\norden_surtido\\nubicación \\n',
  `id_asignacion` int(11) NOT NULL,
  `destino` int(4) NOT NULL,
  `id_distribucion` int(11) NOT NULL,
  `surtido_contenedor` varchar(20) NOT NULL,
  `asignacion_contenedor` varchar(20) NOT NULL,
  `sku` int(11) NOT NULL,
  `piezas` decimal(10,4) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `orden_surtido` int(11) NOT NULL,
  `ubicacion_ini` varchar(20) DEFAULT NULL,
  `ubicacion_fin` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cd` int(4) NOT NULL COMMENT 'cita\\nid_cd\\nid_cita\\nfecha_creacion\\nusuario_creacion \\npuerta\\nestatus\\ninicio_cita\\nfin_cita\\ntrailer\\nchofer\\nimprimir_etiqueta\\n',
  `id_cita` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `puerta` varchar(10) DEFAULT NULL,
  `estatus` varchar(6) NOT NULL,
  `inicio_cita` datetime DEFAULT NULL,
  `fin_cita` datetime DEFAULT NULL,
  `trailer` varchar(20) DEFAULT NULL,
  `chofer` varchar(50) DEFAULT NULL,
  `imprimir_etiqueta` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_detalle`
--

CREATE TABLE `cita_detalle` (
  `id_cd` int(4) NOT NULL COMMENT 'cita_detalle\\nid_cd\\nid_cita\\nid_orden\\nsku\\ninner_pack\\ncantidad_pedida\\ncantidad_recibida \\ncajas_pedidas\\ncajas_recibidas \\n',
  `id_cita` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `inner_pack` int(4) NOT NULL,
  `cantidad_pedida` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) DEFAULT NULL,
  `cajas_pedidas` decimal(10,4) NOT NULL,
  `cajas_recibidas` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `descripcion`) VALUES
('CCO', 'Coacalco'),
('ECT', 'Ecatepec'),
('GAM', 'Gustavo madero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_dept` int(4) NOT NULL,
  `id_clase` int(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_dept`, `id_clase`, `descripcion`) VALUES
(1, 1, 'carros'),
(1, 2, 'Munecas'),
(1, 3, 'Canicas'),
(2, 1, 'Arboles'),
(2, 2, 'Adornos'),
(3, 1, 'opcion 1'),
(3, 2, 'opcion 2'),
(3, 3, 'opcion 3'),
(10, 1, 'Lavadoras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo`
--

CREATE TABLE `codigo` (
  `id_codigo` int(3) NOT NULL COMMENT 'id_codigo\\ndescripcion \\nactivo \\n',
  `descripcion` varchar(50) NOT NULL,
  `activo` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `codigo`
--

INSERT INTO `codigo` (`id_codigo`, `descripcion`, `activo`) VALUES
(1, '67890', 'y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor`
--

CREATE TABLE `contenedor` (
  `id_cd` int(4) NOT NULL COMMENT 'contenedor\\nid_cd\\nid_contenedor\\nubicación \\nagrupado_contenedor\\nid_cita\\nid_orden\\nalto\\nancho\\nprofundo\\nusuario_recibo\\nfecha_recibo\\nestatus\\ndestino\\nenvio\\nsurtir_contenedor\\nid_asignacion\\nfecha_envio\\nsiguiente_ubicacion\\nfinal_ubicacion\\n',
  `id_contenedor` varchar(20) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `agrupado_contenedor` varchar(20) DEFAULT NULL,
  `id_cita` int(11) DEFAULT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `alto` decimal(10,4) DEFAULT NULL,
  `ancho` decimal(10,4) DEFAULT NULL,
  `profundo` decimal(10,4) DEFAULT NULL,
  `peso` decimal(10,4) DEFAULT NULL,
  `usuario_recibo` varchar(20) NOT NULL,
  `fecha_recibo` date NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `destino` int(4) NOT NULL,
  `id_envio` int(11) DEFAULT NULL,
  `surtir_contenedor` varchar(20) DEFAULT NULL,
  `id_asignacion` int(11) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `siguiente_ubicacion` varchar(20) DEFAULT NULL,
  `final_ubicacion` varchar(20) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_mofificacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor_historia`
--

CREATE TABLE `contenedor_historia` (
  `id_cd` int(4) NOT NULL COMMENT 'id_cd\\nid_contenedor\\nsku\\nid_distribucion\\ncajas\\npiezas\\ndistribuido\\nconteo_pzas\\nusuario_conteo\\nfecha_conteo\\naccion\\nfecha_modificacion\\nusuario_modificacion\\nubicación_inicial\\nubicacio_final\\n',
  `id_contenedor` varchar(20) NOT NULL,
  `sku` int(11) DEFAULT NULL,
  `id_distribucion` int(11) DEFAULT NULL,
  `cajas` decimal(10,4) DEFAULT NULL,
  `piezas` decimal(10,4) DEFAULT NULL,
  `distribuido` decimal(10,4) DEFAULT NULL,
  `conteo_piezas` decimal(10,4) DEFAULT NULL,
  `conteo_cajas` decimal(10,4) DEFAULT NULL,
  `accion` varchar(3) NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `usuario_modificacion` varchar(20) NOT NULL,
  `ubicacion_inicial` varchar(20) DEFAULT NULL,
  `ubicacion_final` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_dept` int(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id_dept`, `descripcion`) VALUES
(1, 'juguetes'),
(2, 'Navidad'),
(3, 'Regreso a Clases'),
(4, 'Paraguas'),
(5, 'Paraguas'),
(7, 'Motos'),
(8, 'chamarras'),
(9, 'Drones'),
(10, 'Linea Blanca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion`
--

CREATE TABLE `distribucion` (
  `id_cd` int(4) NOT NULL COMMENT 'id_cd\\nid_distribucion\\nfecha_inicio\\nfecha_fin\\ntipo_distribucion\\nid_orden\\ndescripcion\\nvalor_1\\nvalor_2\\nvalor_3\\nfecha_creacion\\nusuario_creacion\\n',
  `id_distribucion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo_distribucion` varchar(10) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `valor_1` varchar(20) DEFAULT NULL,
  `valor_2` int(11) DEFAULT NULL,
  `valor_3` varchar(20) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_detalle`
--

CREATE TABLE `distribucion_detalle` (
  `id_cd` int(4) NOT NULL COMMENT 'id_cd\\nid_distribucion \\nsku\\ndestino\\nid_orden\\ndistribuido\\nid_asignacion\\nusuario_asignacio\\nfecha_asignacion\\ntipo_asignacion\\n',
  `id_distribucion` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `pedido` decimal(10,4) NOT NULL,
  `distribuido` decimal(10,4) NOT NULL,
  `id_asignacion` int(11) DEFAULT NULL,
  `usuario_asignacion` varchar(20) DEFAULT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `tipo_asignacion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque`
--

CREATE TABLE `embarque` (
  `id_embarque` int(11) NOT NULL COMMENT 'id_embarque\\nid_orden\\nid_transfer\\nfecha_embarque\\nfecha_recibo\\npago\\ndestino\\ntipo_ubicacion\\nfecha_pago\\nestatus\\nestatus_pago\\n',
  `id_orden` int(11) NOT NULL,
  `id_transfer` int(11) NOT NULL,
  `fecha_embarque` datetime DEFAULT NULL,
  `fecha_recibo` datetime DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `pago` int(11) DEFAULT NULL,
  `destino` int(11) NOT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  `estatus_pago` varchar(10) DEFAULT NULL,
  `embarquecol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque_detalle`
--

CREATE TABLE `embarque_detalle` (
  `id_embarque` int(11) NOT NULL COMMENT 'id_embarque\\nsku\\nupc\\ncontenedor\\ncantidad_esperada\\ncantidad_recibida\\ncosto_unitario\\nprecio\\n',
  `sku` int(11) NOT NULL,
  `upc` varchar(20) DEFAULT NULL,
  `contenedor` varchar(20) NOT NULL,
  `cantidad_esperada` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) NOT NULL,
  `costo_unitario` decimal(10,4) DEFAULT NULL,
  `precio` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `id_envio` int(11) NOT NULL COMMENT 'envio\\nid_envio\\ntipo_origen\\norigen \\ntipo_destino\\ndestino \\nfecha_creacion \\nusuario\\n',
  `origen` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_cd`
--

CREATE TABLE `envio_cd` (
  `id_cd` int(4) NOT NULL COMMENT 'id_cd\\nid_envio \\ndestino\\npuerta\\nusuario_envio\\nfecha_envio \\nfecha_carga\\nestatus\\nusuario_recibe\\ntransporte\\n',
  `id_envio` int(11) NOT NULL,
  `destino` int(4) NOT NULL,
  `puerta` varchar(20) DEFAULT NULL,
  `usuario_envio` varchar(20) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `usuario_recibe` varchar(20) DEFAULT NULL,
  `fecha_recibe` datetime DEFAULT NULL,
  `transporte` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_detalle`
--

CREATE TABLE `envio_detalle` (
  `id_envio` int(4) NOT NULL COMMENT 'envio_detalle\\nid_envio\\nsku \\nid_transfer\\npiezas_emb\\n',
  `sku` int(11) NOT NULL,
  `id_embarque` int(11) NOT NULL,
  `piezas_emb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `error_log`
--

CREATE TABLE `error_log` (
  `id_error` int(6) NOT NULL,
  `error_log` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `programa` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `error_log`
--

INSERT INTO `error_log` (`id_error`, `error_log`, `fecha`, `programa`) VALUES
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-17 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-21 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-21 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-21 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov'),
(1, 'manual', '2017-02-22 00:00:00', 'art_prov');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
('BCN', 'Bajacalifornia'),
('BCS', 'Bajacalifornia Sur'),
('DF', 'Distrito Federal'),
('DGO', 'Durango'),
('GDL', 'Guadalajara'),
('lll', 'lll'),
('MX', 'Estado de mexico'),
('TJ', 'Tijuana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_cd`
--

CREATE TABLE `inv_cd` (
  `cd` int(4) NOT NULL COMMENT 'id_tienda \\nsku\\nproveedor\\ncosto_unitario\\ncosto_promedio\\nprecio_venta\\ninventario \\ntransito\\nreservado\\nesperado\\nvendible\\nestatus\\nfecha_creacion\\n',
  `sku` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `costo_unitario` decimal(10,4) NOT NULL,
  `costo_promedio` decimal(10,4) NOT NULL,
  `precio_venta` decimal(10,4) NOT NULL,
  `inventario` decimal(10,4) NOT NULL,
  `transito` decimal(10,4) NOT NULL,
  `reservado` decimal(10,4) NOT NULL,
  `esperado` decimal(10,4) NOT NULL,
  `vendible` varchar(1) DEFAULT NULL,
  `estatus` varchar(1) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_tienda`
--

CREATE TABLE `inv_tienda` (
  `tienda` int(4) NOT NULL COMMENT 'id_tienda \\nsku\\nproveedor\\ncosto_unitario\\ncosto_promedio\\nprecio_venta\\ninventario \\ntransito\\nreservado\\nesperado\\nvendible\\nestatus\\nfecha_creacion\\n',
  `sku` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `costo_unitario` decimal(10,4) NOT NULL,
  `costo_promedio` decimal(10,4) NOT NULL,
  `precio_venta` decimal(10,4) NOT NULL,
  `inventario` decimal(10,4) NOT NULL,
  `transito` decimal(10,4) NOT NULL,
  `reservado` decimal(10,4) NOT NULL,
  `esperado` decimal(10,4) NOT NULL,
  `vendible` varchar(1) DEFAULT NULL,
  `estatus` varchar(1) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id_orden` int(11) NOT NULL,
  `id_dept` int(4) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL COMMENT 'id_orden\\nid_dept\\nid_proveedor\\nfecha_creacion \\nusuario_creacion \\nfecha_inicial_entrega\\nfecha_final_entrega\\nfecha_cierre\\ntermino_pago\\nestatus\\nfecha_aprobacion \\nusuario_aprobacion \\nMoneda\\ntipo_orden \\n',
  `fecha_ini_entrega` datetime DEFAULT NULL,
  `fecha_fin_entrega` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `termino_pago` varchar(10) DEFAULT NULL,
  `estatus` varchar(6) NOT NULL,
  `fecha_aprobacion` datetime DEFAULT NULL,
  `usuario_aprobacion` varchar(20) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `tipo_orden` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id_orden`, `id_dept`, `id_proveedor`, `fecha_ini_entrega`, `fecha_fin_entrega`, `fecha_creacion`, `usuario_creacion`, `fecha_cierre`, `termino_pago`, `estatus`, `fecha_aprobacion`, `usuario_aprobacion`, `moneda`, `tipo_orden`) VALUES
(17, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 17:43:45', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(19, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 17:45:00', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(20, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 18:14:47', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(21, 1, 7866, '2017-02-03 00:00:00', NULL, '2017-02-21 18:15:38', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(22, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 18:17:44', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(23, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 18:22:27', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(24, 1, 7655, '2017-02-03 00:00:00', NULL, '2017-02-21 19:07:46', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(25, 3, 9876, '2017-02-03 00:00:00', NULL, '2017-02-21 19:10:27', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(26, 1, 9876, '2017-02-03 00:00:00', NULL, '2017-02-21 19:13:39', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(27, 2, 9876, '2017-02-03 00:00:00', NULL, '2017-02-21 19:16:05', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(28, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-21 19:18:33', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(31, 3, 7655, '2017-02-03 00:00:00', NULL, '2017-02-22 09:23:48', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(32, 3, 7989, '2017-02-03 00:00:00', NULL, '2017-02-22 10:00:36', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(33, 2, 7989, '2017-02-03 00:00:00', NULL, '2017-02-22 10:03:18', 'userdeft', '2017-02-10 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible'),
(36, 1, 7654, '2017-02-02 00:00:00', NULL, '2017-02-22 13:56:52', 'userdeft', '2017-02-19 00:00:00', NULL, 'C', NULL, NULL, NULL, 'Resurtible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_cd`
--

CREATE TABLE `orden_cd` (
  `id_cd` int(4) NOT NULL,
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nid_dept\\nid_proveedor\\nfecha_creacion \\nusuario_creacion \\nfecha_inicial_entrega\\nfecha_final_entrega\\nfecha_cierre\\ntermino_pago\\nestatus\\nfecha_aprobacion \\nusuario_aprobacion \\nMoneda\\ntipo_orden \\n',
  `id_dept` int(11) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_ini_entrega` datetime DEFAULT NULL,
  `fecha_fin_entrega` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` int(11) DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `estatus` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE `orden_detalle` (
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nsku \\ndestino\\nprecio\\ncantidad_ordenada\\ncantidad_original\\ncantidad_recibida \\ncantidad_cancelada\\ncodigo_cancelacion\\nfecha_cancelacion\\nusuario_cancelacion\\n',
  `sku` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `destino` int(4) NOT NULL,
  `costo` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) DEFAULT NULL,
  `cantidad_ordenada` decimal(10,4) NOT NULL,
  `cantidad_original` decimal(10,4) DEFAULT NULL,
  `cantidad_cancelada` decimal(10,4) DEFAULT NULL,
  `fecha_cancelacion` decimal(10,4) DEFAULT NULL,
  `codigo_cancelacion` decimal(10,4) DEFAULT NULL,
  `usuario_cancelacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle_cd`
--

CREATE TABLE `orden_detalle_cd` (
  `id_cd` int(4) NOT NULL,
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nsku \\ndestino\\nprecio\\ncantidad_ordenada\\ncantidad_original\\ncantidad_recibida \\ncantidad_cancelada\\ncodigo_cancelacion\\nfecha_cancelacion\\nusuario_cancelacion\\n',
  `sku` int(11) NOT NULL,
  `destino` int(4) NOT NULL,
  `cantidad_ordenada` decimal(10,4) NOT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `usuario_carga` varchar(20) DEFAULT NULL,
  `inner_pack` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros_generales`
--

CREATE TABLE `parametros_generales` (
  `id_parametro` varchar(10) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `valor` int(10) DEFAULT NULL,
  `valor1` float(12,4) DEFAULT NULL,
  `valor2` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `valor3` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `parametros_generales`
--

INSERT INTO `parametros_generales` (`id_parametro`, `descripcion`, `valor`, `valor1`, `valor2`, `fecha_creacion`, `usuario_creacion`, `valor3`) VALUES
('2', 'tipo tienda', 0, NULL, NULL, '2017-02-17 00:00:00', 'FFR', 'GRANDE'),
('1', 'Unidad de medida', NULL, NULL, NULL, '2017-02-11 00:00:00', 'FFR', 'Piezas'),
('1', 'Unidad de medida', NULL, NULL, NULL, '2017-02-11 00:00:00', 'FFR', 'Cajas'),
('1', 'Unidad de medida', NULL, NULL, NULL, '2017-02-11 00:00:00', 'FFR', 'Kilos'),
('1', 'Unidad de medida', NULL, NULL, NULL, '2017-02-11 00:00:00', 'FFR', 'Litros'),
('1', 'Unidad de medida', NULL, NULL, NULL, '2017-02-11 00:00:00', 'FFR', 'Tarimas'),
('2', 'tipo tienda', 0, NULL, NULL, '2017-02-17 00:00:00', 'FFR', 'MEDIANA'),
('2', 'tipo tienda', 0, NULL, NULL, '2017-02-17 00:00:00', 'FFR', 'CHICA'),
('3', 'tipo orden', NULL, NULL, NULL, '2017-02-18 00:00:00', 'userdefault', 'Resurtible'),
('3', 'tipo orden', NULL, NULL, NULL, '2017-02-18 00:00:00', 'userdefault', 'Temporada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL COMMENT 'id_proveedor\\nnombre\\ncontacto\\ntelefono\\nemail\\nestatus\\nmoneda\\nimpuesto\\nDireccion\\nEstado\\nMunicipio\\n',
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  `moneda` varchar(4) DEFAULT NULL,
  `impuesto` int(2) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_estado` varchar(6) DEFAULT NULL,
  `id_ciudad` varchar(6) DEFAULT NULL,
  `proveedorcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `contacto`, `telefono`, `email`, `estatus`, `moneda`, `impuesto`, `direccion`, `id_estado`, `id_ciudad`, `proveedorcol`) VALUES
(10, 'Proveedor 1', 'Guadalupe Ruiz', '55 6789 0000', 'gperuiz@mail.com', 'c', 'mxn', 12000, 'Av San Fernando', 'DF', 'ECT', NULL),
(7654, 'Distribuidora de juguetes SA. de CV', 'felipe Flores Ramirez', '58950734', 'flores@hotmail.com', 'a', 'mxn', 16, 'Col los morales interceccion con lazaro cardenas', 'df', 'gam', NULL),
(7655, 'Comercializaddora de utiles escolares', 'Luis Angel Loez', '55346785', 'Agnel_luis@hotmail.com', 'a', 'mxn', 16, 'San jose del rincon estado de Mexico', 'df', 'gam', NULL),
(7866, 'lluvia y calor accesorios', 'Pedro Morales Rios', '98765332', 'rios7@hotmail.com', 'a', 'mxn', 16, 'Centro HistÃ³rico de MÃ©xico ', 'df', 'gam', NULL),
(7989, 'Comercializadora de plasticos', 'Roman Rodriguez Rosas', '54679887', 'romanjun@hotmail.com', 'a', 'mxn', 16, 'av central 34 esquina con mier ', 'df', 'gam', NULL),
(9876, 'Exportadora de Mochilas Monterrey', 'Juan Carlos Lopez Jicaras', '722435678', 'jicarasj@hotmail.com', 'a', 'dlr', 16, 'apodaca 135 parque industrial huinala', 'df', 'gam', NULL),
(76548, 'distribuidara de alimentos', 'Felipe Flores', '232321', 'flores@hotmail.com', 'a', 'mxn', 16, 'av las animas sn', 'df', 'gam', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subclase`
--

CREATE TABLE `subclase` (
  `id_dept` int(4) NOT NULL,
  `id_clase` int(4) NOT NULL,
  `id_subclase` int(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subclase`
--

INSERT INTO `subclase` (`id_dept`, `id_clase`, `id_subclase`, `descripcion`) VALUES
(2, 1, 1, '1 metro '),
(2, 1, 2, '2 metros '),
(2, 1, 3, '3 metros '),
(2, 1, 4, '4 metros '),
(1, 1, 4, 'Blancos'),
(1, 1, 2, 'carro 20'),
(1, 1, 3, 'carro 30'),
(1, 1, 1, 'carros 10'),
(2, 2, 3, 'Fieltro'),
(2, 2, 2, 'Foami'),
(2, 2, 4, 'Madera'),
(2, 2, 1, 'Melamina'),
(1, 3, 1, 'opcion'),
(1, 3, 2, 'opcion 2'),
(3, 1, 1, 'opcion 3 1 1'),
(1, 3, 3, 'opcion1 3'),
(10, 1, 1, 'Para hogar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `tienda` int(4) NOT NULL COMMENT 'id_tienda\\nnombre \\ndireccion \\nresponsable\\nregion \\nid_ciudad\\nestado \\npais\\nfecha_apertura\\nfecha_cierre\\ncodigo_postal\\ntipo_tienda\\nimpuesto\\nid_cd\\nMoneda\\n',
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `region` int(4) DEFAULT NULL,
  `id_ciudad` varchar(6) NOT NULL,
  `id_estado` varchar(6) NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `tipo_tienda` varchar(10) DEFAULT NULL,
  `impuesto` int(4) DEFAULT NULL,
  `id_cd` int(4) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `tienda_cd` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`tienda`, `nombre`, `direccion`, `responsable`, `region`, `id_ciudad`, `id_estado`, `fecha_apertura`, `fecha_cierre`, `codigo_postal`, `tipo_tienda`, `impuesto`, `id_cd`, `moneda`, `tienda_cd`) VALUES
(1, 'tienda', 'asd', 'Responsable 1', 5, 'CCO', 'DF', '2017-03-02 00:00:00', '2017-03-02 00:00:00', '55700', 'asd', 100, 1, 'dolar', '2'),
(2, 'tienda 2', 'asd', 'Responsable 2', 5, 'CCO', 'DF', '2017-03-02 00:00:00', '2017-03-02 00:00:00', '55700', 'asd', 100, 1, 'dolar', '2'),
(50, 'Tienda 3', 'Coacalco de Berriozabal', 'Sanbdra Mercado', 10, 'ECT', 'DGO', '2017-03-02 00:00:00', '2017-03-02 00:00:00', '55700', 'Chica', 100, 1, 'dolar', '2'),
(50, 'Tienda 50', 'Coacalco', 'Juan Jose fuentes', 10, 'ECT', 'MX', '2017-03-16 00:00:00', '2017-03-26 00:00:00', '55700', 'GRANDE', 100, 10, 'dolar', 'TIENDA'),
(60, 'Tienda 50', 'Coacalco', 'Maria jose', 10, 'ECT', 'MX', '2017-03-16 00:00:00', '2017-03-26 00:00:00', '55700', 'GRANDE', 100, 10, 'dolar', 'TIENDA'),
(70, 'Tienda 50', 'Coacalco', 'Maria jose', 10, 'ECT', 'MX', '2017-03-16 00:00:00', '2017-03-26 00:00:00', '55700', 'GRANDE', 100, 10, 'dolar', 'CD'),
(70, 'Tienda 50', 'Coacalco', 'Maria jose', 10, 'ECT', 'MX', '2017-03-16 00:00:00', '2017-03-26 00:00:00', '55700', 'GRANDE', 100, 10, 'dolar', 'TIENDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccional`
--

CREATE TABLE `transaccional` (
  `sku` int(11) NOT NULL COMMENT 'transaccional\\nsku\\nid_dept\\nid_clase\\nid_sub\\ntienda\\ncd\\nfecha_tran\\ncodigo_tran\\npiezas\\ncosto_total\\nprecio_total\\nref_1\\nref_2\\nprograma\\nusuario_creo\\nfecha_carga\\n',
  `id_dept` int(4) NOT NULL,
  `id_clase` int(4) NOT NULL,
  `id_subclase` int(4) NOT NULL,
  `tienda` int(4) NOT NULL,
  `cd` int(4) NOT NULL,
  `fecha_tran` datetime NOT NULL,
  `codigo_tran` int(4) NOT NULL,
  `piezas` decimal(10,4) NOT NULL,
  `costo_total` decimal(10,4) NOT NULL,
  `precio_total` decimal(10,4) NOT NULL,
  `ref_1` varchar(20) DEFAULT NULL,
  `ref_2` varchar(20) DEFAULT NULL,
  `programa` varchar(50) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE `transferencia` (
  `id_transfer` int(11) NOT NULL COMMENT 'transferencia\\nid_transfer\\norig_tipo_destino\\norig_destino\\ndest_tipo_destino\\ndest_destino\\ntipo\\nestatus\\nfecha_creacion \\nusuario_creacion \\nfecha_aprobacion \\nusuario_aprobacion \\nFecha_cierre\\n',
  `orig_tda_cd` int(4) NOT NULL,
  `dest_tda_cd` int(4) NOT NULL,
  `tipo` varchar(3) DEFAULT NULL,
  `estatus` varchar(2) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL,
  `fecha_aprobacion` datetime DEFAULT NULL,
  `usuario_aprobacion` varchar(20) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `transferenciacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_detalle`
--

CREATE TABLE `transfer_detalle` (
  `id_transfer` int(11) NOT NULL COMMENT 'id_transfer\\nsku\\ncontenedor\\ncantidad_trans\\ncantidad_embarcada\\ncantidad_recibida\\ninner_pack\\n',
  `sku` int(11) NOT NULL,
  `contenedor` varchar(20) DEFAULT NULL,
  `cantidad_trans` decimal(20,0) DEFAULT NULL,
  `cantidad_embarcada` decimal(20,0) DEFAULT NULL,
  `cantidad_recibida` decimal(20,0) DEFAULT NULL,
  `inner_pack` int(4) DEFAULT NULL,
  `transfer_detallecol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_cd` int(4) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `multi_sku` int(11) NOT NULL,
  `estatus` varchar(6) NOT NULL,
  `conteo_ciclico` varchar(5) DEFAULT NULL,
  `fecha_conteo` datetime DEFAULT NULL,
  `usuario_conteo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_cd`, `ubicacion`, `tipo`, `fecha_creacion`, `usuario_creacion`, `multi_sku`, `estatus`, `conteo_ciclico`, `fecha_conteo`, `usuario_conteo`) VALUES
(1, '12345', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(1, 'derftg', 'a', '2017-02-10 00:00:00', 'comodin', 0, 'a', 'sder', '2017-02-10 00:00:00', 'comodin'),
(2, '12345', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '11', 'a', '2017-01-01 00:00:00', 'comodin', 0, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '12345', 'a', '2017-01-01 00:00:00', 'comodin', 0, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '15', 'a', '2017-01-01 00:00:00', 'comodin', 0, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '21', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '5', 'a', '2017-01-01 00:00:00', 'comodin', 0, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '7', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '8', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, '90', 'a', '2017-01-01 00:00:00', 'comodin', 1, 'a', '12345', '2017-01-01 00:00:00', 'comodin'),
(3, 'ubicacion', 'a', '2017-01-01 00:00:00', 'comodin', 0, 'a', '12345', '2017-01-01 00:00:00', 'comodin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upc`
--

CREATE TABLE `upc` (
  `sku` int(11) NOT NULL,
  `upc` varchar(15) NOT NULL COMMENT '\\nsku \\nupc \\nprimario \\ntipo_upc\\n',
  `primario` varchar(1) DEFAULT NULL,
  `tipo_upc` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `upc`
--

INSERT INTO `upc` (`sku`, `upc`, `primario`, `tipo_upc`) VALUES
(63, '10300', 'N', 'EAN13'),
(63, '10301', 'N', 'EAN13'),
(62, '11200', 'N', 'EAN13'),
(62, '11300', 'Y', 'EAN13'),
(62, '11400', 'N', 'EAN13'),
(62, '11500', 'N', 'EAN13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `tienda` int(11) NOT NULL,
  `ticket` varchar(40) NOT NULL,
  `sku` int(11) NOT NULL,
  `upc` varchar(20) NOT NULL,
  `fecha_venta` datetime NOT NULL,
  `cajero` varchar(20) NOT NULL,
  `terminal` varchar(30) NOT NULL,
  `piezas` decimal(10,4) NOT NULL,
  `precio` decimal(10,4) NOT NULL,
  `total` decimal(10,4) NOT NULL,
  `forma_pago` varchar(10) NOT NULL,
  `descuento` decimal(10,4) NOT NULL,
  `usuario_cierre` varchar(20) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `estatus` varchar(4) NOT NULL,
  `estatus_existe` varchar(4) DEFAULT NULL,
  `fecha_carga_inv` datetime DEFAULT NULL,
  `devolucion` varchar(4) DEFAULT NULL,
  `razon_devolucion` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_precio`
--

CREATE TABLE `zona_precio` (
  `id_zona` int(4) NOT NULL,
  `sku` int(11) NOT NULL,
  `precio` float(10,4) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `usuario_creacion` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zona_precio`
--

INSERT INTO `zona_precio` (`id_zona`, `sku`, `precio`, `fecha_creacion`, `usuario_creacion`) VALUES
(1, 50, 1000.0000, NULL, NULL),
(1, 57, 87.0000, NULL, NULL),
(1, 58, 8776.0000, NULL, 'jytfgh'),
(1, 60, 87.0000, NULL, 'userdeft'),
(1, 61, 12.5600, NULL, 'userdeft'),
(1, 62, 7000.0000, NULL, 'userdeft'),
(1, 63, 522.6300, NULL, 'userdeft');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona_precio_enc`
--

CREATE TABLE `zona_precio_enc` (
  `id_zona` varchar(10) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `zona_precio_enc`
--

INSERT INTO `zona_precio_enc` (`id_zona`, `descripcion`, `fecha_creacion`, `usuario_creacion`) VALUES
('1', 'Zona Centro', '2017-02-17 00:00:00', 'usuario'),
('2', 'Zona Sur', '2017-02-17 00:00:00', 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_sequence`
--

CREATE TABLE `_sequence` (
  `seq_name` varchar(50) NOT NULL,
  `seq_val` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `_sequence`
--

INSERT INTO `_sequence` (`seq_name`, `seq_val`) VALUES
('\0', 1),
('orden', 39),
('sku', 63);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`sku`,`desc_larga`),
  ADD UNIQUE KEY `sku_UNIQUE` (`sku`),
  ADD KEY `a_dept_fk1_idx` (`id_dept`),
  ADD KEY `a_clase_fk1_idx` (`id_dept`,`id_clase`),
  ADD KEY `a_sub_fk1_idx` (`id_dept`,`id_clase`,`id_subclase`);

--
-- Indices de la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD PRIMARY KEY (`id_proveedor`,`sku`,`pais_origen`),
  ADD KEY `ap_aprov_fk1_idx` (`sku`),
  ADD KEY `ap_aprov_fk2_idx` (`id_proveedor`);

--
-- Indices de la tabla `assignacion`
--
ALTER TABLE `assignacion`
  ADD PRIMARY KEY (`id_cd`,`id_asignacion`,`destino`,`id_distribucion`,`surtido_contenedor`,`sku`,`fecha_creacion`),
  ADD KEY `asig_dest_fk1_idx` (`destino`),
  ADD KEY `asig_distr_fk2_idx` (`id_cd`,`id_distribucion`),
  ADD KEY `asig_cont_fk3_idx` (`id_cd`,`surtido_contenedor`),
  ADD KEY `asig_ubic_fk4_idx` (`id_cd`,`ubicacion_ini`,`ubicacion_fin`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cd`,`id_cita`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_dept`,`id_clase`),
  ADD KEY `clase_dept_fk1_idx` (`id_dept`);

--
-- Indices de la tabla `codigo`
--
ALTER TABLE `codigo`
  ADD PRIMARY KEY (`id_codigo`);

--
-- Indices de la tabla `contenedor`
--
ALTER TABLE `contenedor`
  ADD PRIMARY KEY (`id_cd`,`id_contenedor`);

--
-- Indices de la tabla `contenedor_historia`
--
ALTER TABLE `contenedor_historia`
  ADD PRIMARY KEY (`accion`,`fecha_modificacion`,`usuario_modificacion`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_dept`);

--
-- Indices de la tabla `distribucion`
--
ALTER TABLE `distribucion`
  ADD PRIMARY KEY (`id_cd`,`id_distribucion`);

--
-- Indices de la tabla `distribucion_detalle`
--
ALTER TABLE `distribucion_detalle`
  ADD PRIMARY KEY (`id_cd`,`id_distribucion`,`sku`,`destino`),
  ADD KEY `dist_dist_fk1_idx` (`id_cd`,`id_distribucion`),
  ADD KEY `dist_sku_fk1_idx` (`sku`),
  ADD KEY `dist_dest_fk1_idx` (`destino`);

--
-- Indices de la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD PRIMARY KEY (`id_embarque`),
  ADD KEY `emb_orde_fk1_idx` (`id_orden`),
  ADD KEY `emb_trans_fk2_idx` (`id_transfer`),
  ADD KEY `emb_dest_fk3_idx` (`destino`);

--
-- Indices de la tabla `embarque_detalle`
--
ALTER TABLE `embarque_detalle`
  ADD PRIMARY KEY (`id_embarque`,`sku`,`contenedor`),
  ADD KEY `emd_embar_fk1_idx` (`id_embarque`),
  ADD KEY `emd_sku_fk1_idx` (`sku`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`id_envio`);

--
-- Indices de la tabla `envio_cd`
--
ALTER TABLE `envio_cd`
  ADD PRIMARY KEY (`id_cd`,`id_envio`,`destino`),
  ADD UNIQUE KEY `estatus_UNIQUE` (`estatus`),
  ADD UNIQUE KEY `fecha_envio_UNIQUE` (`fecha_envio`),
  ADD UNIQUE KEY `usuario_envio_UNIQUE` (`usuario_envio`);

--
-- Indices de la tabla `envio_detalle`
--
ALTER TABLE `envio_detalle`
  ADD PRIMARY KEY (`id_envio`,`sku`,`id_embarque`),
  ADD KEY `env_envio_fk1_idx` (`id_envio`),
  ADD KEY `env_sku_fk2_idx` (`sku`),
  ADD KEY `env_emba_fk3_idx` (`id_embarque`);

--
-- Indices de la tabla `error_log`
--
ALTER TABLE `error_log`
  ADD KEY `fecha` (`fecha`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`,`descripcion`);

--
-- Indices de la tabla `inv_cd`
--
ALTER TABLE `inv_cd`
  ADD PRIMARY KEY (`cd`,`sku`),
  ADD KEY `invcd_sku_fk1_idx` (`sku`),
  ADD KEY `invcd_cd_fk1_idx1` (`proveedor`),
  ADD KEY `invcd_prov_fk3_idx` (`cd`);

--
-- Indices de la tabla `inv_tienda`
--
ALTER TABLE `inv_tienda`
  ADD PRIMARY KEY (`tienda`,`sku`),
  ADD KEY `inv_tda_fk1_idx` (`tienda`),
  ADD KEY `inv_sku_fk1_idx` (`sku`),
  ADD KEY `inv_prov_fk1_idx` (`proveedor`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `ord_prov_fk1_idx` (`id_proveedor`);

--
-- Indices de la tabla `orden_cd`
--
ALTER TABLE `orden_cd`
  ADD PRIMARY KEY (`id_orden`,`id_cd`);

--
-- Indices de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD PRIMARY KEY (`id_orden`,`sku`),
  ADD KEY `ordet_artprov_fk1_idx` (`sku`,`id_proveedor`),
  ADD KEY `ordet_dest_fk1_idx` (`destino`),
  ADD KEY `ordet_ord_fk1_idx` (`id_orden`);

--
-- Indices de la tabla `orden_detalle_cd`
--
ALTER TABLE `orden_detalle_cd`
  ADD PRIMARY KEY (`id_orden`,`id_cd`,`sku`),
  ADD KEY `ocd_sku_fk_idx` (`sku`),
  ADD KEY `ocd_orden_fk_idx` (`id_orden`),
  ADD KEY `ocd_dest_fk_idx` (`destino`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `p_estado_fk_idx` (`id_estado`),
  ADD KEY `p_ciudad_fk1_idx` (`id_ciudad`);

--
-- Indices de la tabla `subclase`
--
ALTER TABLE `subclase`
  ADD PRIMARY KEY (`id_dept`,`id_clase`,`id_subclase`),
  ADD KEY `sub_dept_fk1_idx` (`id_dept`,`id_clase`),
  ADD KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`tienda`,`tienda_cd`),
  ADD KEY `t_estado_fk1_idx` (`id_ciudad`),
  ADD KEY `t_ciudad_fk2_idx` (`id_estado`);

--
-- Indices de la tabla `transaccional`
--
ALTER TABLE `transaccional`
  ADD UNIQUE KEY `sku_UNIQUE` (`sku`),
  ADD UNIQUE KEY `tienda_UNIQUE` (`tienda`),
  ADD UNIQUE KEY `cd_UNIQUE` (`cd`),
  ADD UNIQUE KEY `fecha_tran_UNIQUE` (`fecha_tran`),
  ADD UNIQUE KEY `codigo_tran_UNIQUE` (`codigo_tran`),
  ADD KEY `tran_sku_fk1_idx` (`sku`),
  ADD KEY `tran_subcla_fk2_idx` (`id_dept`,`id_clase`,`id_subclase`),
  ADD KEY `tran_trans_fk1_idx` (`codigo_tran`),
  ADD KEY `tran_tda_fk1_idx` (`tienda`),
  ADD KEY `tran_cd_fk5_idx` (`cd`);

--
-- Indices de la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `t_destino_fk1_idx` (`orig_tda_cd`),
  ADD KEY `t_origen_fk1_idx` (`dest_tda_cd`);

--
-- Indices de la tabla `transfer_detalle`
--
ALTER TABLE `transfer_detalle`
  ADD PRIMARY KEY (`id_transfer`,`sku`),
  ADD KEY `td_sku_fk1_idx` (`id_transfer`),
  ADD KEY `td_trans_fk2_idx` (`id_transfer`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_cd`,`ubicacion`);

--
-- Indices de la tabla `upc`
--
ALTER TABLE `upc`
  ADD PRIMARY KEY (`upc`,`sku`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`,`tienda`,`ticket`,`sku`,`upc`,`fecha_venta`,`cajero`,`terminal`);

--
-- Indices de la tabla `zona_precio`
--
ALTER TABLE `zona_precio`
  ADD PRIMARY KEY (`id_zona`,`sku`) COMMENT 'pk_1',
  ADD KEY `zonap_sku_fk1` (`sku`);

--
-- Indices de la tabla `zona_precio_enc`
--
ALTER TABLE `zona_precio_enc`
  ADD PRIMARY KEY (`id_zona`);

--
-- Indices de la tabla `_sequence`
--
ALTER TABLE `_sequence`
  ADD PRIMARY KEY (`seq_name`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `a_clase_fk1` FOREIGN KEY (`id_dept`,`id_clase`) REFERENCES `clase` (`id_dept`, `id_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `a_dept_fk1` FOREIGN KEY (`id_dept`) REFERENCES `departamento` (`id_dept`),
  ADD CONSTRAINT `a_sub_fk1` FOREIGN KEY (`id_dept`,`id_clase`,`id_subclase`) REFERENCES `subclase` (`id_dept`, `id_clase`, `id_subclase`);

--
-- Filtros para la tabla `articulo_proveedor`
--
ALTER TABLE `articulo_proveedor`
  ADD CONSTRAINT `ap_aprov_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ap_aprov_fk2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_dept_fk1` FOREIGN KEY (`id_dept`) REFERENCES `departamento` (`id_dept`);

--
-- Filtros para la tabla `distribucion_detalle`
--
ALTER TABLE `distribucion_detalle`
  ADD CONSTRAINT `dist_dest_fk3` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `dist_dist_fk1` FOREIGN KEY (`id_cd`,`id_distribucion`) REFERENCES `distribucion` (`id_cd`, `id_distribucion`),
  ADD CONSTRAINT `dist_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`);

--
-- Filtros para la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD CONSTRAINT `emb_dest_fk3` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `emb_orden_fk1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_proveedor`),
  ADD CONSTRAINT `emb_trans_fk2` FOREIGN KEY (`id_transfer`) REFERENCES `transferencia` (`id_transfer`);

--
-- Filtros para la tabla `embarque_detalle`
--
ALTER TABLE `embarque_detalle`
  ADD CONSTRAINT `emd_embar_fk1` FOREIGN KEY (`id_embarque`) REFERENCES `embarque` (`id_embarque`),
  ADD CONSTRAINT `emd_sku_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`);

--
-- Filtros para la tabla `envio_detalle`
--
ALTER TABLE `envio_detalle`
  ADD CONSTRAINT `env_emba_fk3` FOREIGN KEY (`id_embarque`) REFERENCES `embarque` (`id_embarque`),
  ADD CONSTRAINT `env_envio_fk1` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`),
  ADD CONSTRAINT `env_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`);

--
-- Filtros para la tabla `inv_cd`
--
ALTER TABLE `inv_cd`
  ADD CONSTRAINT `invcd_prov_fk3` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `invcd_prov_fk3a` FOREIGN KEY (`cd`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `invcd_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inv_tienda`
--
ALTER TABLE `inv_tienda`
  ADD CONSTRAINT `inv_prov_fk1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `inv_sku_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `inv_tda_fk1` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`tienda`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `ord_prov_fk1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD CONSTRAINT `ordet_artprov_fk1` FOREIGN KEY (`sku`,`id_proveedor`) REFERENCES `articulo_proveedor` (`sku`, `id_proveedor`),
  ADD CONSTRAINT `ordet_dest_fk1` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ordet_ord_fk1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_detalle_cd`
--
ALTER TABLE `orden_detalle_cd`
  ADD CONSTRAINT `ocd_dest_fk` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `ocd_orden_fk` FOREIGN KEY (`id_orden`) REFERENCES `orden_cd` (`id_orden`),
  ADD CONSTRAINT `ocd_sku_fk` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `p_ciudad_fk1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `p_estado_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `subclase`
--
ALTER TABLE `subclase`
  ADD CONSTRAINT `sub_dept_fk1` FOREIGN KEY (`id_dept`,`id_clase`) REFERENCES `clase` (`id_dept`, `id_clase`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `t_ciudad_fk2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `t_estado_fk1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `transaccional`
--
ALTER TABLE `transaccional`
  ADD CONSTRAINT `tran_cd_fk5` FOREIGN KEY (`cd`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `tran_sku_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `tran_subcla_fk2` FOREIGN KEY (`id_dept`,`id_clase`,`id_subclase`) REFERENCES `subclase` (`id_dept`, `id_clase`, `id_subclase`),
  ADD CONSTRAINT `tran_tda_fk4` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `tran_trans_fk3` FOREIGN KEY (`codigo_tran`) REFERENCES `codigo` (`id_codigo`);

--
-- Filtros para la tabla `transferencia`
--
ALTER TABLE `transferencia`
  ADD CONSTRAINT `t_destino_fk1` FOREIGN KEY (`orig_tda_cd`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `t_origen_fk1` FOREIGN KEY (`dest_tda_cd`) REFERENCES `tienda` (`tienda`);

--
-- Filtros para la tabla `transfer_detalle`
--
ALTER TABLE `transfer_detalle`
  ADD CONSTRAINT `td_sku_fk1` FOREIGN KEY (`id_transfer`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `td_trans_fk2` FOREIGN KEY (`id_transfer`) REFERENCES `transferencia` (`id_transfer`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
