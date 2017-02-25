-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-02-2017 a las 19:30:13
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
CREATE DEFINER=`root`@`localhost` FUNCTION `secuencia` (`sSeqName` VARCHAR(50)) RETURNS INT(10) UNSIGNED NO SQL
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
  `fecha_autoriza` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_salidas`
--

CREATE TABLE `entradas_salidas` (
  `id_entrada` int(20) NOT NULL,
  `total` float(10,4) NOT NULL,
  `razon` varchar(200) NOT NULL,
  `fecha_creacion` date NOT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inicio_sesion`
--

CREATE TABLE `inicio_sesion` (
  `id_inicio_user` int(20) NOT NULL,
  `usuario_inicio` varchar(20) NOT NULL,
  `estatus` varchar(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_cierre` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inicio_sesion`
--

INSERT INTO `inicio_sesion` (`id_inicio_user`, `usuario_inicio`, `estatus`, `fecha_inicio`, `fecha_cierre`) VALUES
(1, '1', 'I', '2017-02-25', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_preceio_detalle`
--

CREATE TABLE `lista_preceio_detalle` (
  `id_lista` int(20) NOT NULL,
  `sku` varchar(15) NOT NULL,
  `precio` float(10,4) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
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
  `Usuario_creacion` date DEFAULT NULL
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
  `fecha_creacion` date DEFAULT NULL,
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
  `fecha_creacion` date DEFAULT NULL,
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
  `fecha_modificacion` date DEFAULT NULL,
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
(1, 'Jose', 'Perez', 'Perez', 1, 1, 1, '123qwe');

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
('SESION', 1);

--
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`id_inicio_user`);

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
