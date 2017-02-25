-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-01-2017 a las 12:49:54
-- Versión del servidor: 5.5.52-cll-lve
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sanjosep_mercaderias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE IF NOT EXISTS `articulo` (
  `sku` int(11) NOT NULL,
  `desc_larga` varchar(100) NOT NULL COMMENT 'sku\\nDesc_larga\\nDesc_corta\\nid_dept\\nid_clase\\nid_subclase\\nzona_precio\\nUnidad_medida\\nvendible\\nPrimer_recibo \\nultimo_recibo \\n',
  `desc_corta` varchar(50) DEFAULT NULL,
  `id_dept` int(11) DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL,
  `id_subclase` int(11) DEFAULT NULL,
  `zona_precio` int(11) DEFAULT NULL,
  `unidad_medida` int(11) DEFAULT NULL,
  `vendible` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sku`,`desc_larga`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `a_dept_fk1_idx` (`id_dept`),
  KEY `a_clase_fk1_idx` (`id_dept`,`id_clase`),
  KEY `a_sub_fk1_idx` (`id_dept`,`id_clase`,`id_subclase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo_proveedor`
--

CREATE TABLE IF NOT EXISTS `articulo_proveedor` (
  `id_proveedor` int(11) NOT NULL COMMENT 'sku\\nid_proveedor\\ncosto\\nprimario\\npais_origen\\ntiempo_llegada\\ninner_pack\\ncase_pack\\npallet_size\\nLargo_caja\\nancho_caja\\nprofundo_caja\\npeso_caja\\n',
  `sku` int(11) NOT NULL,
  `costo` decimal(10,4) NOT NULL,
  `primario` varchar(1) NOT NULL,
  `pais_origen` varchar(6) NOT NULL,
  `tiempo_llegada` int(11) DEFAULT NULL,
  `inner_pack` int(11) NOT NULL,
  `case_pack` int(11) NOT NULL,
  `pallet_size` int(11) DEFAULT NULL,
  `Largo_caja` decimal(10,4) DEFAULT NULL,
  `ancho_caja` decimal(10,4) DEFAULT NULL,
  `profundo_caja` decimal(10,4) DEFAULT NULL,
  `peso_caja` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`,`sku`,`pais_origen`),
  KEY `ap_aprov_fk1_idx` (`sku`),
  KEY `ap_aprov_fk2_idx` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `assignacion`
--

CREATE TABLE IF NOT EXISTS `assignacion` (
  `id_cd` int(11) NOT NULL COMMENT 'asignacion \\nid_cd\\nid_asignacion \\ndestino\\nid_distribucion\\nsurtido_contenedor\\nasignado_contenedor\\nsku\\npiezas\\ntipo\\nfecha_creacion\\norden_surtido\\nubicación \\n',
  `id_asignacion` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `id_distribucion` int(11) NOT NULL,
  `surtido_contenedor` varchar(20) NOT NULL,
  `asignacion_contenedor` varchar(20) NOT NULL,
  `sku` int(11) NOT NULL,
  `piezas` decimal(10,4) DEFAULT NULL,
  `tipo` varchar(4) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `orden_surtido` int(11) NOT NULL,
  `ubicacion_ini` varchar(20) DEFAULT NULL,
  `ubicacion_fin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`id_asignacion`,`destino`,`id_distribucion`,`surtido_contenedor`,`sku`,`fecha_creacion`),
  KEY `asig_dest_fk1_idx` (`destino`),
  KEY `asig_distr_fk2_idx` (`id_cd`,`id_distribucion`),
  KEY `asig_cont_fk3_idx` (`id_cd`,`surtido_contenedor`),
  KEY `asig_ubic_fk4_idx` (`id_cd`,`ubicacion_ini`,`ubicacion_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE IF NOT EXISTS `cita` (
  `id_cd` int(11) NOT NULL COMMENT 'cita\\nid_cd\\nid_cita\\nfecha_creacion\\nusuario_creacion \\npuerta\\nestatus\\ninicio_cita\\nfin_cita\\ntrailer\\nchofer\\nimprimir_etiqueta\\n',
  `id_cita` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `puerta` varchar(10) DEFAULT NULL,
  `estatus` varchar(6) NOT NULL,
  `inicio_cita` datetime DEFAULT NULL,
  `fin_cita` datetime DEFAULT NULL,
  `trailer` varchar(20) DEFAULT NULL,
  `chofer` varchar(50) DEFAULT NULL,
  `imprimir_etiqueta` varchar(3) NOT NULL,
  PRIMARY KEY (`id_cd`,`id_cita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_detalle`
--

CREATE TABLE IF NOT EXISTS `cita_detalle` (
  `id_cd` int(11) NOT NULL COMMENT 'cita_detalle\\nid_cd\\nid_cita\\nid_orden\\nsku\\ninner_pack\\ncantidad_pedida\\ncantidad_recibida \\ncajas_pedidas\\ncajas_recibidas \\n',
  `id_cita` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `inner_pack` int(11) NOT NULL,
  `cantidad_pedida` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) DEFAULT NULL,
  `cajas_pedidas` decimal(10,4) NOT NULL,
  `cajas_recibidas` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id_ciudad` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE IF NOT EXISTS `clase` (
  `id_dept` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dept`,`id_clase`),
  KEY `clase_dept_fk1_idx` (`id_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo`
--

CREATE TABLE IF NOT EXISTS `codigo` (
  `id_codigo` int(11) NOT NULL COMMENT 'id_codigo\\ndescripcion \\nactivo \\n',
  `descricpion` varchar(50) NOT NULL,
  `activo` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor`
--

CREATE TABLE IF NOT EXISTS `contenedor` (
  `id_cd` int(11) NOT NULL COMMENT 'contenedor\\nid_cd\\nid_contenedor\\nubicación \\nagrupado_contenedor\\nid_cita\\nid_orden\\nalto\\nancho\\nprofundo\\nusuario_recibo\\nfecha_recibo\\nestatus\\ndestino\\nenvio\\nsurtir_contenedor\\nid_asignacion\\nfecha_envio\\nsiguiente_ubicacion\\nfinal_ubicacion\\n',
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
  `destino` int(11) NOT NULL,
  `id_envio` int(11) DEFAULT NULL,
  `surtir_contenedor` varchar(20) DEFAULT NULL,
  `id_asignacion` int(11) DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `siguiente_ubicacion` varchar(20) DEFAULT NULL,
  `final_ubicacion` varchar(20) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `usuario_mofificacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`id_contenedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenedor_historia`
--

CREATE TABLE IF NOT EXISTS `contenedor_historia` (
  `id_cd` int(11) NOT NULL COMMENT 'id_cd\\nid_contenedor\\nsku\\nid_distribucion\\ncajas\\npiezas\\ndistribuido\\nconteo_pzas\\nusuario_conteo\\nfecha_conteo\\naccion\\nfecha_modificacion\\nusuario_modificacion\\nubicación_inicial\\nubicacio_final\\n',
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
  `ubicacion_final` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`accion`,`fecha_modificacion`,`usuario_modificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id_dept` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion`
--

CREATE TABLE IF NOT EXISTS `distribucion` (
  `id_cd` int(11) NOT NULL COMMENT 'id_cd\\nid_distribucion\\nfecha_inicio\\nfecha_fin\\ntipo_distribucion\\nid_orden\\ndescripcion\\nvalor_1\\nvalor_2\\nvalor_3\\nfecha_creacion\\nusuario_creacion\\n',
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
  `usuario_creacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`id_distribucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribucion_detalle`
--

CREATE TABLE IF NOT EXISTS `distribucion_detalle` (
  `id_cd` int(11) NOT NULL COMMENT 'id_cd\\nid_distribucion \\nsku\\ndestino\\nid_orden\\ndistribuido\\nid_asignacion\\nusuario_asignacio\\nfecha_asignacion\\ntipo_asignacion\\n',
  `id_distribucion` int(11) NOT NULL,
  `sku` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `pedido` decimal(10,4) NOT NULL,
  `distribuido` decimal(10,4) NOT NULL,
  `id_asignacion` int(11) DEFAULT NULL,
  `usuario_asignacion` varchar(20) DEFAULT NULL,
  `fecha_asignacion` datetime DEFAULT NULL,
  `tipo_asignacion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`id_distribucion`,`sku`,`destino`),
  KEY `dist_dist_fk1_idx` (`id_cd`,`id_distribucion`),
  KEY `dist_sku_fk1_idx` (`sku`),
  KEY `dist_dest_fk1_idx` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque`
--

CREATE TABLE IF NOT EXISTS `embarque` (
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
  `embarquecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_embarque`),
  KEY `emb_orde_fk1_idx` (`id_orden`),
  KEY `emb_trans_fk2_idx` (`id_transfer`),
  KEY `emb_dest_fk3_idx` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarque_detalle`
--

CREATE TABLE IF NOT EXISTS `embarque_detalle` (
  `id_embarque` int(11) NOT NULL COMMENT 'id_embarque\\nsku\\nupc\\ncontenedor\\ncantidad_esperada\\ncantidad_recibida\\ncosto_unitario\\nprecio\\n',
  `sku` int(11) NOT NULL,
  `upc` varchar(20) DEFAULT NULL,
  `contenedor` varchar(20) NOT NULL,
  `cantidad_esperada` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) NOT NULL,
  `costo_unitario` decimal(10,4) DEFAULT NULL,
  `precio` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id_embarque`,`sku`,`contenedor`),
  KEY `emd_embar_fk1_idx` (`id_embarque`),
  KEY `emd_sku_fk1_idx` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE IF NOT EXISTS `envio` (
  `id_envio` int(11) NOT NULL COMMENT 'envio\\nid_envio\\ntipo_origen\\norigen \\ntipo_destino\\ndestino \\nfecha_creacion \\nusuario\\n',
  `origen` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_envio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_cd`
--

CREATE TABLE IF NOT EXISTS `envio_cd` (
  `id_cd` int(11) NOT NULL COMMENT 'id_cd\\nid_envio \\ndestino\\npuerta\\nusuario_envio\\nfecha_envio \\nfecha_carga\\nestatus\\nusuario_recibe\\ntransporte\\n',
  `id_envio` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `puerta` varchar(20) DEFAULT NULL,
  `usuario_envio` varchar(20) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `estatus` varchar(2) DEFAULT NULL,
  `usuario_recibe` varchar(20) DEFAULT NULL,
  `fecha_recibe` datetime DEFAULT NULL,
  `transporte` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`id_envio`,`destino`),
  UNIQUE KEY `estatus_UNIQUE` (`estatus`),
  UNIQUE KEY `fecha_envio_UNIQUE` (`fecha_envio`),
  UNIQUE KEY `usuario_envio_UNIQUE` (`usuario_envio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio_detalle`
--

CREATE TABLE IF NOT EXISTS `envio_detalle` (
  `id_envio` int(11) NOT NULL COMMENT 'envio_detalle\\nid_envio\\nsku \\nid_transfer\\npiezas_emb\\n',
  `sku` int(11) NOT NULL,
  `id_embarque` int(11) NOT NULL,
  `piezas_emb` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_envio`,`sku`,`id_embarque`),
  KEY `env_envio_fk1_idx` (`id_envio`),
  KEY `env_sku_fk2_idx` (`sku`),
  KEY `env_emba_fk3_idx` (`id_embarque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `id_estado` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`,`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_cd`
--

CREATE TABLE IF NOT EXISTS `inv_cd` (
  `cd` int(11) NOT NULL COMMENT 'id_tienda \\nsku\\nproveedor\\ncosto_unitario\\ncosto_promedio\\nprecio_venta\\ninventario \\ntransito\\nreservado\\nesperado\\nvendible\\nestatus\\nfecha_creacion\\n',
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
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`cd`,`sku`),
  KEY `invcd_sku_fk1_idx` (`sku`),
  KEY `invcd_cd_fk1_idx1` (`proveedor`),
  KEY `invcd_prov_fk3_idx` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inv_tienda`
--

CREATE TABLE IF NOT EXISTS `inv_tienda` (
  `tienda` int(11) NOT NULL COMMENT 'id_tienda \\nsku\\nproveedor\\ncosto_unitario\\ncosto_promedio\\nprecio_venta\\ninventario \\ntransito\\nreservado\\nesperado\\nvendible\\nestatus\\nfecha_creacion\\n',
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
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`tienda`,`sku`),
  KEY `inv_tda_fk1_idx` (`tienda`),
  KEY `inv_sku_fk1_idx` (`sku`),
  KEY `inv_prov_fk1_idx` (`proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE IF NOT EXISTS `orden` (
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nid_dept\\nid_proveedor\\nfecha_creacion \\nusuario_creacion \\nfecha_inicial_entrega\\nfecha_final_entrega\\nfecha_cierre\\ntermino_pago\\nestatus\\nfecha_aprobacion \\nusuario_aprobacion \\nMoneda\\ntipo_orden \\n',
  `id_dept` int(11) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
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
  `tipo_orden` varchar(10) DEFAULT NULL,
  `ordencol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_orden`),
  KEY `ord_prov_fk1_idx` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_cd`
--

CREATE TABLE IF NOT EXISTS `orden_cd` (
  `id_cd` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nid_dept\\nid_proveedor\\nfecha_creacion \\nusuario_creacion \\nfecha_inicial_entrega\\nfecha_final_entrega\\nfecha_cierre\\ntermino_pago\\nestatus\\nfecha_aprobacion \\nusuario_aprobacion \\nMoneda\\ntipo_orden \\n',
  `id_dept` int(11) DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `fecha_ini_entrega` datetime DEFAULT NULL,
  `fecha_fin_entrega` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` int(11) DEFAULT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `estatus` varchar(6) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE IF NOT EXISTS `orden_detalle` (
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nsku \\ndestino\\nprecio\\ncantidad_ordenada\\ncantidad_original\\ncantidad_recibida \\ncantidad_cancelada\\ncodigo_cancelacion\\nfecha_cancelacion\\nusuario_cancelacion\\n',
  `sku` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `costo` decimal(10,4) NOT NULL,
  `cantidad_recibida` decimal(10,4) DEFAULT NULL,
  `cantidad_ordenada` decimal(10,4) NOT NULL,
  `cantidad_original` decimal(10,4) DEFAULT NULL,
  `cantidad_cancelada` decimal(10,4) DEFAULT NULL,
  `fecha_cancelacion` decimal(10,4) DEFAULT NULL,
  `codigo_cancelacion` decimal(10,4) DEFAULT NULL,
  `usuario_cancelacion` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_orden`,`sku`),
  KEY `ordet_artprov_fk1_idx` (`sku`,`id_proveedor`),
  KEY `ordet_dest_fk1_idx` (`destino`),
  KEY `ordet_ord_fk1_idx` (`id_orden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle_cd`
--

CREATE TABLE IF NOT EXISTS `orden_detalle_cd` (
  `id_cd` int(11) NOT NULL,
  `id_orden` int(11) NOT NULL COMMENT 'id_orden\\nsku \\ndestino\\nprecio\\ncantidad_ordenada\\ncantidad_original\\ncantidad_recibida \\ncantidad_cancelada\\ncodigo_cancelacion\\nfecha_cancelacion\\nusuario_cancelacion\\n',
  `sku` int(11) NOT NULL,
  `destino` int(11) NOT NULL,
  `cantidad_ordenada` decimal(10,4) NOT NULL,
  `fecha_carga` datetime DEFAULT NULL,
  `usuario_carga` varchar(20) DEFAULT NULL,
  `inner_pack` int(11) NOT NULL,
  PRIMARY KEY (`id_orden`,`id_cd`,`sku`),
  KEY `ocd_sku_fk_idx` (`sku`),
  KEY `ocd_orden_fk_idx` (`id_orden`),
  KEY `ocd_dest_fk_idx` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL COMMENT 'id_proveedor\\nnombre\\ncontacto\\ntelefono\\nemail\\nestatus\\nmoneda\\nimpuesto\\nDireccion\\nEstado\\nMunicipio\\n',
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estatus` varchar(1) DEFAULT NULL,
  `moneda` varchar(4) DEFAULT NULL,
  `impuesto` int(11) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_estado` varchar(6) DEFAULT NULL,
  `id_ciudad` varchar(6) DEFAULT NULL,
  `proveedorcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `id_proveedor_UNIQUE` (`id_proveedor`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `p_estado_fk_idx` (`id_estado`),
  KEY `p_ciudad_fk1_idx` (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subclase`
--

CREATE TABLE IF NOT EXISTS `subclase` (
  `id_dept` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_subclase` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dept`,`id_clase`,`id_subclase`),
  UNIQUE KEY `id_dept_UNIQUE` (`id_dept`),
  UNIQUE KEY `id_clase_UNIQUE` (`id_clase`),
  UNIQUE KEY `id_subclase_UNIQUE` (`id_subclase`),
  KEY `sub_dept_fk1_idx` (`id_dept`,`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE IF NOT EXISTS `tienda` (
  `tienda` int(11) NOT NULL COMMENT 'id_tienda\\nnombre \\ndireccion \\nresponsable\\nregion \\nid_ciudad\\nestado \\npais\\nfecha_apertura\\nfecha_cierre\\ncodigo_postal\\ntipo_tienda\\nimpuesto\\nid_cd\\nMoneda\\n',
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `responsable` varchar(50) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `id_ciudad` varchar(6) NOT NULL,
  `id_estado` varchar(6) NOT NULL,
  `fecha_apertura` datetime DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL,
  `tipo_tienda` varchar(10) DEFAULT NULL,
  `impuesto` int(11) DEFAULT NULL,
  `id_cd` int(11) DEFAULT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `tienda_cd` varchar(10) NOT NULL,
  PRIMARY KEY (`tienda`,`tienda_cd`),
  KEY `t_estado_fk1_idx` (`id_ciudad`),
  KEY `t_ciudad_fk2_idx` (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccional`
--

CREATE TABLE IF NOT EXISTS `transaccional` (
  `sku` int(11) NOT NULL COMMENT 'transaccional\\nsku\\nid_dept\\nid_clase\\nid_sub\\ntienda\\ncd\\nfecha_tran\\ncodigo_tran\\npiezas\\ncosto_total\\nprecio_total\\nref_1\\nref_2\\nprograma\\nusuario_creo\\nfecha_carga\\n',
  `id_dept` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_subclase` int(11) NOT NULL,
  `tienda` int(11) NOT NULL,
  `cd` int(11) NOT NULL,
  `fecha_tran` datetime NOT NULL,
  `codigo_tran` int(11) NOT NULL,
  `piezas` decimal(10,4) NOT NULL,
  `costo_total` decimal(10,4) NOT NULL,
  `precio_total` decimal(10,4) NOT NULL,
  `ref_1` varchar(20) DEFAULT NULL,
  `ref_2` varchar(20) DEFAULT NULL,
  `programa` varchar(50) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `fecha_carga` datetime NOT NULL,
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  UNIQUE KEY `tienda_UNIQUE` (`tienda`),
  UNIQUE KEY `cd_UNIQUE` (`cd`),
  UNIQUE KEY `fecha_tran_UNIQUE` (`fecha_tran`),
  UNIQUE KEY `codigo_tran_UNIQUE` (`codigo_tran`),
  KEY `tran_sku_fk1_idx` (`sku`),
  KEY `tran_subcla_fk2_idx` (`id_dept`,`id_clase`,`id_subclase`),
  KEY `tran_trans_fk1_idx` (`codigo_tran`),
  KEY `tran_tda_fk1_idx` (`tienda`),
  KEY `tran_cd_fk5_idx` (`cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencia`
--

CREATE TABLE IF NOT EXISTS `transferencia` (
  `id_transfer` int(11) NOT NULL COMMENT 'transferencia\\nid_transfer\\norig_tipo_destino\\norig_destino\\ndest_tipo_destino\\ndest_destino\\ntipo\\nestatus\\nfecha_creacion \\nusuario_creacion \\nfecha_aprobacion \\nusuario_aprobacion \\nFecha_cierre\\n',
  `orig_tda_cd` int(11) NOT NULL,
  `dest_tda_cd` int(11) NOT NULL,
  `tipo` varchar(3) DEFAULT NULL,
  `estatus` varchar(2) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL,
  `fecha_aprobacion` datetime DEFAULT NULL,
  `usuario_aprobacion` varchar(20) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `transferenciacol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_transfer`),
  KEY `t_destino_fk1_idx` (`orig_tda_cd`),
  KEY `t_origen_fk1_idx` (`dest_tda_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transfer_detalle`
--

CREATE TABLE IF NOT EXISTS `transfer_detalle` (
  `id_transfer` int(11) NOT NULL COMMENT 'id_transfer\\nsku\\ncontenedor\\ncantidad_trans\\ncantidad_embarcada\\ncantidad_recibida\\ninner_pack\\n',
  `sku` int(11) NOT NULL,
  `contenedor` varchar(20) DEFAULT NULL,
  `cantidad_trans` decimal(20,0) DEFAULT NULL,
  `cantidad_embarcada` decimal(20,0) DEFAULT NULL,
  `cantidad_recibida` decimal(20,0) DEFAULT NULL,
  `inner_pack` int(11) DEFAULT NULL,
  `transfer_detallecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_transfer`,`sku`),
  KEY `td_sku_fk1_idx` (`id_transfer`),
  KEY `td_trans_fk2_idx` (`id_transfer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_cd` int(11) NOT NULL,
  `ubicacion` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `usuario_creacion` varchar(20) NOT NULL,
  `multi_sku` int(11) NOT NULL,
  `estatus` varchar(6) NOT NULL,
  `conteo_ciclico` varchar(5) DEFAULT NULL,
  `fecha_conteo` datetime DEFAULT NULL,
  `usuario_conteo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cd`,`ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `upc`
--

CREATE TABLE IF NOT EXISTS `upc` (
  `sku` int(11) NOT NULL,
  `upc` varchar(15) NOT NULL COMMENT '\\nsku \\nupc \\nprimario \\ntipo_upc\\n',
  `primario` varchar(1) DEFAULT NULL,
  `tipo_upc` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`upc`,`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
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
  `razon_devolucion` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id_venta`,`tienda`,`ticket`,`sku`,`upc`,`fecha_venta`,`cajero`,`terminal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `_sequence`
--

CREATE TABLE IF NOT EXISTS `_sequence` (
  `seq_name` varchar(50) NOT NULL,
  `seq_val` int(10) unsigned NOT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `a_dept_fk1` FOREIGN KEY (`id_dept`) REFERENCES `departamento` (`id_dept`),
  ADD CONSTRAINT `a_clase_fk1` FOREIGN KEY (`id_dept`, `id_clase`) REFERENCES `clase` (`id_dept`, `id_clase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `a_sub_fk1` FOREIGN KEY (`id_dept`, `id_clase`, `id_subclase`) REFERENCES `subclase` (`id_dept`, `id_clase`, `id_subclase`);

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
  ADD CONSTRAINT `dist_dist_fk1` FOREIGN KEY (`id_cd`, `id_distribucion`) REFERENCES `distribucion` (`id_cd`, `id_distribucion`),
  ADD CONSTRAINT `dist_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `dist_dest_fk3` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`);

--
-- Filtros para la tabla `embarque`
--
ALTER TABLE `embarque`
  ADD CONSTRAINT `emb_orden_fk1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`),
  ADD CONSTRAINT `emb_trans_fk2` FOREIGN KEY (`id_transfer`) REFERENCES `transferencia` (`id_transfer`),
  ADD CONSTRAINT `emb_dest_fk3` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`);

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
  ADD CONSTRAINT `env_envio_fk1` FOREIGN KEY (`id_envio`) REFERENCES `envio` (`id_envio`),
  ADD CONSTRAINT `env_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `env_emba_fk3` FOREIGN KEY (`id_embarque`) REFERENCES `embarque` (`id_embarque`);

--
-- Filtros para la tabla `inv_cd`
--
ALTER TABLE `inv_cd`
  ADD CONSTRAINT `invcd_sku_fk2` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `invcd_prov_fk3` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `invcd_prov_fk3a` FOREIGN KEY (`cd`) REFERENCES `tienda` (`tienda`);

--
-- Filtros para la tabla `inv_tienda`
--
ALTER TABLE `inv_tienda`
  ADD CONSTRAINT `inv_tda_fk1` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `inv_sku_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `inv_prov_fk1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `ord_prov_fk1` FOREIGN KEY (`id_orden`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD CONSTRAINT `ordet_artprov_fk1` FOREIGN KEY (`sku`, `id_proveedor`) REFERENCES `articulo_proveedor` (`sku`, `id_proveedor`),
  ADD CONSTRAINT `ordet_dest_fk1` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ordet_ord_fk1` FOREIGN KEY (`id_orden`) REFERENCES `orden` (`id_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `orden_detalle_cd`
--
ALTER TABLE `orden_detalle_cd`
  ADD CONSTRAINT `ocd_sku_fk` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `ocd_orden_fk` FOREIGN KEY (`id_orden`) REFERENCES `orden_cd` (`id_orden`),
  ADD CONSTRAINT `ocd_dest_fk` FOREIGN KEY (`destino`) REFERENCES `tienda` (`tienda`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `p_estado_fk` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `p_ciudad_fk1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `subclase`
--
ALTER TABLE `subclase`
  ADD CONSTRAINT `sub_dept_fk1` FOREIGN KEY (`id_dept`, `id_clase`) REFERENCES `clase` (`id_dept`, `id_clase`);

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `t_estado_fk1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  ADD CONSTRAINT `t_ciudad_fk2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `transaccional`
--
ALTER TABLE `transaccional`
  ADD CONSTRAINT `tran_sku_fk1` FOREIGN KEY (`sku`) REFERENCES `articulo` (`sku`),
  ADD CONSTRAINT `tran_subcla_fk2` FOREIGN KEY (`id_dept`, `id_clase`, `id_subclase`) REFERENCES `subclase` (`id_dept`, `id_clase`, `id_subclase`),
  ADD CONSTRAINT `tran_trans_fk3` FOREIGN KEY (`codigo_tran`) REFERENCES `codigo` (`id_codigo`),
  ADD CONSTRAINT `tran_tda_fk4` FOREIGN KEY (`tienda`) REFERENCES `tienda` (`tienda`),
  ADD CONSTRAINT `tran_cd_fk5` FOREIGN KEY (`cd`) REFERENCES `tienda` (`tienda`);

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
