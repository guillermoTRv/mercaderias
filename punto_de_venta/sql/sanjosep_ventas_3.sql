-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-02-2017 a las 17:14:03
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sanjosep_ventas`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `secuencia` (`sSeqName` VARCHAR(50) CHARSET ascii) RETURNS INT(10) UNSIGNED READS SQL DATA
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
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `id_devolucion` int(20) NOT NULL,
  `id_ticket` int(20) NOT NULL,
  `upc` varchar(20) DEFAULT NULL,
  `sku` int(10) NOT NULL,
  `piezas` float(10,4) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL,
  `usuario_autoriza` varchar(20) DEFAULT NULL,
  `fecha_autoriza` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_salidas`
--

CREATE TABLE `entradas_salidas` (
  `id_entrada` int(20) NOT NULL,
  `total` float(10,4) NOT NULL,
  `razon` varchar(200) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `Usuario_creacion` varchar(20) NOT NULL,
  `id_inicio_user` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo`
--

CREATE TABLE `fondo` (
  `id_inicio_user` int(20) NOT NULL,
  `denominacion` int(4) NOT NULL,
  `total` int(4) NOT NULL,
  `monto_total` float(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fondo`
--

INSERT INTO `fondo` (`id_inicio_user`, `denominacion`, `total`, `monto_total`) VALUES
(1, 500, 2, 1000.0000),
(1, 200, 1, 200.0000),
(1, 100, 2, 200.0000),
(1, 50, 3, 150.0000),
(1, 20, 1, 20.0000),
(1, 10, 2, 20.0000),
(1, 5, 3, 15.0000),
(1, 2, 2, 4.0000),
(1, 1, 1, 1.0000),
(1, 1, 2, 1.0000),
(2, 500, 2, 1000.0000),
(2, 200, 1, 200.0000),
(2, 100, 2, 200.0000),
(2, 50, 3, 150.0000),
(2, 20, 1, 20.0000),
(2, 10, 2, 20.0000),
(2, 5, 1, 5.0000),
(2, 2, 23, 46.0000),
(2, 1, 1, 1.0000),
(2, 1, 0, 0.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio_sesion`
--

CREATE TABLE `inicio_sesion` (
  `id_inicio_user` int(20) NOT NULL,
  `usuario_inicio` varchar(20) NOT NULL,
  `estatus` varchar(4) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_cierre` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inicio_sesion`
--

INSERT INTO `inicio_sesion` (`id_inicio_user`, `usuario_inicio`, `estatus`, `fecha_inicio`, `fecha_cierre`) VALUES
(1, '1', 'qe', '2017-02-27 15:27:13', NULL),
(2, '1', 'A', '2017-02-27 15:27:46', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_preceio_detalle`
--

CREATE TABLE `lista_preceio_detalle` (
  `id_lista` int(20) NOT NULL,
  `sku` varchar(15) NOT NULL,
  `precio` float(10,4) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_precio`
--

CREATE TABLE `lista_precio` (
  `id_lista` int(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `fecha_creacion` varchar(45) DEFAULT NULL,
  `Usuario_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `tipo_pago` int(4) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(20) NOT NULL,
  `desccripcion` varchar(50) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL,
  `estatus` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion_detalle`
--

CREATE TABLE `promocion_detalle` (
  `id_promocion` int(20) NOT NULL,
  `sku` varchar(10) DEFAULT NULL,
  `precio` float(10,4) DEFAULT NULL,
  `minimo` float(10,4) DEFAULT NULL,
  `maximo` float(10,4) DEFAULT NULL,
  `tipo_prom` varchar(10) DEFAULT NULL,
  `porcentaje` float(10,4) DEFAULT NULL,
  `monto` float(10,4) DEFAULT NULL,
  `paquete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago_trans`
--

CREATE TABLE `tipo_pago_trans` (
  `no_ticket` int(20) NOT NULL,
  `tipo_pago` int(4) NOT NULL,
  `total_pago` float(10,4) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_venta`
--

CREATE TABLE `transaccion_venta` (
  `no_ticket` int(20) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `total` float(10,4) NOT NULL,
  `estatus` varchar(4) NOT NULL,
  `usuario_modifica` varchar(20) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `tienda` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_venta_det`
--

CREATE TABLE `transaccion_venta_det` (
  `no_ticket` int(20) NOT NULL,
  `upc` varchar(15) DEFAULT NULL,
  `sku` varchar(10) NOT NULL,
  `piezas` float(10,4) NOT NULL,
  `precio` float(10,4) NOT NULL,
  `fecha_creacio` date DEFAULT NULL,
  `Usuario_cracion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `apellido_paterno` varchar(40) NOT NULL,
  `apellido_materno` varchar(40) NOT NULL,
  `puesto` int(10) NOT NULL,
  `permiso` int(10) NOT NULL,
  `tienda_cd` int(4) DEFAULT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `Nombre`, `apellido_paterno`, `apellido_materno`, `puesto`, `permiso`, `tienda_cd`, `password`) VALUES
(1, 'Jose', 'Cesco', 'Gonzales', 1, 2, 1, '123qwe');

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
('id_inicio_user', 2);

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
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`id_devolucion`,`sku`),
  ADD KEY `fk_devolucion_transaccion_venta1_idx` (`id_ticket`);

--
-- Indices de la tabla `entradas_salidas`
--
ALTER TABLE `entradas_salidas`
  ADD PRIMARY KEY (`id_entrada`,`id_inicio_user`),
  ADD KEY `fk_entradas_salidas_inicio_sesion1_idx` (`id_inicio_user`);

--
-- Indices de la tabla `fondo`
--
ALTER TABLE `fondo`
  ADD KEY `fk_fondo_inicio_sesion1` (`id_inicio_user`);

--
-- Indices de la tabla `inicio_sesion`
--
ALTER TABLE `inicio_sesion`
  ADD PRIMARY KEY (`id_inicio_user`);

--
-- Indices de la tabla `lista_preceio_detalle`
--
ALTER TABLE `lista_preceio_detalle`
  ADD PRIMARY KEY (`id_lista`,`sku`);

--
-- Indices de la tabla `lista_precio`
--
ALTER TABLE `lista_precio`
  ADD PRIMARY KEY (`id_lista`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`tipo_pago`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`);

--
-- Indices de la tabla `promocion_detalle`
--
ALTER TABLE `promocion_detalle`
  ADD PRIMARY KEY (`id_promocion`);

--
-- Indices de la tabla `tipo_pago_trans`
--
ALTER TABLE `tipo_pago_trans`
  ADD PRIMARY KEY (`no_ticket`),
  ADD KEY `fk_tipo_pago_tipo_pago1_idx` (`tipo_pago`);

--
-- Indices de la tabla `transaccion_venta`
--
ALTER TABLE `transaccion_venta`
  ADD PRIMARY KEY (`no_ticket`);

--
-- Indices de la tabla `transaccion_venta_det`
--
ALTER TABLE `transaccion_venta_det`
  ADD PRIMARY KEY (`no_ticket`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `_sequence`
--
ALTER TABLE `_sequence`
  ADD PRIMARY KEY (`seq_name`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `fk_devolucion_transaccion_venta1` FOREIGN KEY (`id_ticket`) REFERENCES `transaccion_venta` (`no_ticket`);

--
-- Filtros para la tabla `entradas_salidas`
--
ALTER TABLE `entradas_salidas`
  ADD CONSTRAINT `fk_entradas_salidas_inicio_sesion1` FOREIGN KEY (`id_inicio_user`) REFERENCES `inicio_sesion` (`id_inicio_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fondo`
--
ALTER TABLE `fondo`
  ADD CONSTRAINT `fk_fondo_inicio_sesion1` FOREIGN KEY (`id_inicio_user`) REFERENCES `inicio_sesion` (`id_inicio_user`);

--
-- Filtros para la tabla `tipo_pago_trans`
--
ALTER TABLE `tipo_pago_trans`
  ADD CONSTRAINT `fk_tipo_pago_tipo_pago1` FOREIGN KEY (`tipo_pago`) REFERENCES `pagos` (`tipo_pago`),
  ADD CONSTRAINT `fk_tipo_pago_transaccion_venta1` FOREIGN KEY (`no_ticket`) REFERENCES `transaccion_venta` (`no_ticket`);

--
-- Filtros para la tabla `transaccion_venta_det`
--
ALTER TABLE `transaccion_venta_det`
  ADD CONSTRAINT `fk_transaccion_venta_det_transaccion_venta` FOREIGN KEY (`no_ticket`) REFERENCES `transaccion_venta` (`no_ticket`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
