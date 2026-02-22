-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2024 a las 07:23:46
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdcarritocompras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompra` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) NOT NULL,
  `FechaCompra` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Monto` double NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Email` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompra`, `idCliente`, `FechaCompra`, `Monto`, `Nombres`, `Email`) VALUES
(1, 2, '2024-07-24 23:21:08', 469, 'Sara', 'sara@gmail.com'),
(3, 2, '2024-07-24 23:28:04', 100, 'Sara', 'sara@gmail.com'),
(6, 2, '2024-07-24 23:47:01', 470, 'Sara', 'sara@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallejuego`
--

CREATE TABLE `detallejuego` (
  `detalleJuegoId` int(11) NOT NULL,
  `idJuego` int(10) UNSIGNED NOT NULL,
  `descripcionJuego` mediumtext NOT NULL,
  `fechaEstreno` date NOT NULL,
  `plataforma` varchar(30) NOT NULL,
  `idiomaTexto` varchar(50) NOT NULL,
  `idiomaAudio` varchar(50) NOT NULL,
  `urlVideo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallejuego`
--

INSERT INTO `detallejuego` (`detalleJuegoId`, `idJuego`, `descripcionJuego`, `fechaEstreno`, `plataforma`, `idiomaTexto`, `idiomaAudio`, `urlVideo`) VALUES
(1, 1, 'Los creadores de la aclamada saga de Left 4 Dead presentan Back 4 Blood, un emocionante juego de disparos en primera persona cooperativo. Te encuentras en medio de una guerra contra los Infectados. Estos humanos, huéspedes de un parásito letal, se han convertido en terroríficas criaturas dispuestas a devorar lo que queda de civilización. Con la humanidad a punto de extinguirse, tus amigos y tú deberéis enfrentaros al enemigo, exterminar a los Infectados y recuperar el control del mundo.', '2021-10-12', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/tKlFJbyUsoo?si=6qA-FlbM6n_h_09C    '),
(2, 2, 'Explora tierras remotas, enfréntate a máquinas más grandes e imponentes y conoce a increíbles tribus en tu regreso a un futuro lejano en el mundo postapocalíptico de Horizon. La tierra se muere. Tormentas violentas y una plaga imparable asolan los restos dispersos de la humanidad mientras nuevas y temibles máquinas merodean sus fronteras. La vida en la Tierra se precipita hacia otra extinción.', '2024-03-21', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/SEVdWRmLn54?si=QjiCzyoeXOMJXHJZ'),
(3, 3, 'Alone in the Dark teje un tapiz de terror psicológico y encanto gótico, reinventando el icónico juego que marcó el género. Te invitamos a un viaje hacia la locura, donde cada encuentro podría ser el último. A cada paso que das para desentrañar el misterio de Derceto, los ojos que observan desde la oscuridad se vuelven más hambrientos. Cada bala es la diferencia entre la supervivencia y un final impensable. La siguiente puerta que abras podrá conducirte a un reino de pesadilla con garras, tentáculos y locura. Viaja a la Luisiana de entreguerras, donde se esconde una historia sombría: el escape de traumas pasados y una sociedad intolerante, hacia la espera de algo más oscuro, algo que ha acechado pacientemente durante eras imposibles. Esto es Alone in the Dark como nunca lo has visto: una narrativa de elegancia gótica y locura sobrenatural que rinde homenaje a sus orígenes legendarios mientras avanza el terror de supervivencia.', '2024-03-20', 'PC', 'Español', 'Ingles', 'https://www.youtube.com/embed/ddsa1IB9MH4?si=I4jP7vUXbxaPDzrs'),
(4, 4, 'Tras derrotar a su padre, Heihachi Mishima, Kazuya continúa su conquista por la dominación global, utilizando las fuerzas de la Corporación G para detonar la guerra en el mundo. Jin se ve obligado a enfrentarse a su destino cuando se reencuentra con su desaparecida madre e intenta detener el reino de terror de su padre Kazuya.', '2024-01-25', 'PC', 'Español', 'Ingles', 'https://www.youtube.com/embed/_MM4clV2qjE?si=Za7HPQQCfoC12feg'),
(5, 5, 'Black Ops Cold War, la secuela directa de Call of Duty®: Black Ops, transportará a los jugadores al centro de la volátil batalla geopolítica de la Guerra Fría, a principios de los 80. Nada es lo que parece en la fascinante Campaña para un jugador, donde los jugadores se enfrentarán cara a cara a figuras históricas y verdades incómodas mientras luchan por todo el mundo en escenarios icónicos de la Guerra Fría como Berlín Oriental, Vietnam, la sede de la KGB y más.', '2023-03-08', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/aTS9n_m7TW0?si=SpdxcqsWXC2JNKkV'),
(6, 6, 'Stray es un juego de aventura felina en tercera persona ambientada en los callejones iluminados con luces de neón de una ciberciudad en plena decadencia y el ambiente turbio de sus bajos fondos. Deambula por cada rincón de los alrededores, defiéndete de amenazas imprevistas y resuelve los misterios de este lugar inhóspito en el cual moran robots apáticos y criaturas peligrosas.', '2022-07-19', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/vBDQEkfAcnc?si=8Ppbj6DvCCgdUB3A'),
(7, 7, 'EA SPORTS FIFA 23 da vida al juego del mundo con la tecnología HyperMotion2 y su experiencia de juego aún más realista, incluye tanto la FIFA World Cup™ masculina como la femenina como actualizaciones posteriores tras el lanzamiento, incorpora equipos femeninos y funciones Cross-Play**, ¡y mucho más! Disfruta de una autenticidad única con más de 19 000 jugadores, 700 equipos, 100 estadios y más de 30 ligas en FIFA 23.', '2022-09-30', 'PC', 'Español', 'Español', 'https://www.youtube.com/embed/zMyeAFzCTM0?si=e40VoOTdjbQX-OQe'),
(14, 19, 'Elden Ring es el nuevo videojuego de rol, aventura y acción de FromSoftware y Bandai Namco. Ideado por Hidetaka Miyazaki y George R.R. Martin, el escritor de Canción de hielo y fuego, nos llevará a un mundo convulso, complejo y sangriento. En esta ocasión, el equipo de Dark Souls ha aumentado la escala del título, trasladando y depurando su conocida jugabilidad a una nueva dimensión. Personalización, armas, armaduras y objetos mágicos se darán la mano con una desafiante dificultad, jefes finales y criaturas horripilantes', '2022-02-24', 'Pc', 'Español', 'Ingles', 'NULL'),
(15, 20, 'Link que ha perdido la memoria, y que despierta en un misterioso santuario, sin saber cómo ni por qué ha acabado ahí. La única pista sobre su pasado se la dará una voz que le encomienda la misión de acabar con el malvado Ganon el Cataclismo, un ser maligno que aparece desde tiempos inmemoriales, y responsable de la destrucción que asoló el reino de hace mucho tiempo. En su aventura, Link recuperará sus memorias perdidas, e irá descubriendo qué fue lo que realmente ocurrió hace 100 años', '2017-03-03', 'Nintendo Switch', 'Español', 'Español', 'NULL'),
(16, 21, 'Grand Theft Auto V para PC ofrece a los jugadores la opción de explorar el galardonado mundo de Los Santos y el condado de Blaine con una resolución de 4K y disfrutar del juego a 60 fotogramas por segundo.', '2015-04-14', 'Pc', 'Español', 'Ingles', 'NULL'),
(17, 22, 'Las nuevas variantes de los personajes te ofrecen un control de tus kombatientes sin precedentes, ya que podrás personalizarlos como tú quieras. El motor gráfico, además de mostrar con gran detalle cada destrucción craneal y ocular, te acercará tanto al kombate que casi podrás sentirlo. Y eso no es todo: las cinemáticas del modo Historia te traen a los kombatientes klásicos y a nuevos personajes, que continuarán esta épica saga creada hace 25 años.', '2019-04-23', 'Pc', 'Español', 'Ingles', 'NULL'),
(18, 23, 'Descubre un nuevo universo de Mortal Kombatcreado por Liu Kang, Dios del Fuego. ¡Mortal Kombat 1 abre paso a una nueva era de esta icónica saga con un nuevo sistema de kombate, modos de juego y fatalities!', '2023-09-19', 'PlayStation', 'Ingles', 'Ingles', 'NULL'),
(20, 25, 'Con más de 175 premios al Juego del año y más de 250 valoraciones perfectas, Red Dead Redemption 2 es la épica historia de Arthur Morgan y la banda de Van der Linde, que huyen por toda América en el albor de una nueva era. También incluye acceso al mundo multijugador compartido de Red Dead Online.', '2019-12-05', 'Pc', 'Español', 'Ingles', 'NULL'),
(21, 26, 'Reúne a tu grupo y vuelve a los Reinos Olvidados en un relato de compañerismo y traición, sacrificio y supervivencia, además de la atracción de un poder absoluto.', '2023-08-03', 'Pc', 'Español', 'Ingles', 'NULL'),
(22, 27, 'Disfruta de la emotiva historia y los inolvidables personajes de The Last of Us, ganador de más de 200 premios de Juego del Año.', '2023-03-28', 'Pc', 'Español', 'Ingles', 'NULL'),
(23, 28, 'Cinco años después de su peligroso viaje a través de unos Estados Unidos pospandemia, Ellie y Joel logran establecerse en Jackson, Wyoming. Vivir entre una próspera comunidad de sobrevivientes les ha concedido paz y estabilidad, a pesar de la amenaza constante de los infectados y de otros sobrevivientes más desesperados.  Cuando un evento violento interrumpe esa paz, Ellie se embarca en un viaje incesante para obtener justicia y llegar a un cierre. A medida que caza a los responsables uno por uno, deberá enfrentarse a las devastadoras repercusiones físicas y emocionales de sus acciones.', '2025-03-25', 'PlayStation 5', 'Español', 'Ingles', 'NULL'),
(24, 29, '¡La «Iniciativa de Prueba Perpetua» se ha ampliado, permitiéndote ahora diseñar puzles cooperativos para ti y tus amigos!', '2021-04-18', 'Pc', 'Español', 'Español', 'NULL'),
(25, 30, 'El jugador vuelve a tomar la palanca del científico Gordon Freeman, quien se encuentra en una Tierra infestada por alienígenas, desposeída de todos sus recursos y en la que cada vez queda menos población. Freeman se ve envuelto en el papel nada envidiable de rescatar el mundo del mal que desencadenó en Black Mesa. Y mucha gente a la que aprecia cuenta con él.', '2004-11-16', 'Pc', 'Español', 'Español', 'NULL'),
(26, 31, 'En Sekiro: Shadows Die Twice encarnas al \'lobo manco\', un guerrero desfigurado y caído en desgracia que ha sido rescatado al borde de la muerte. Tras jurar proteger a un joven señor descendiente de un antiguo linaje, te conviertes en el objetivo de despiadados enemigos, entre ellos el peligroso clan Ashina. Cuando el joven señor sea capturado, nada te detendrá en tu peligrosa aventura por restituir tu honor, ni siquiera la muerte.', '2019-03-21', 'PlayStation', 'Español', 'Español', 'NULL'),
(27, 32, 'Kratos ha dejado atrás su venganza contra los dioses del Olimpo y vive ahora como un hombre en los dominios de los dioses y monstruos nórdicos. En este mundo cruel e implacable debe luchar para sobrevivir y enseñar a su hijo a hacerlo también.', '2022-01-14', 'Pc', 'Español', 'Español', 'NULL'),
(28, 33, 'Kratos y Atreus se embarcan en una mítica aventura en busca de respuestas y aliados antes de la llegada del Ragnarök. Ahora también en PC.', '2024-09-19', 'Pc', 'Español', 'Ingles', 'NULL'),
(29, 34, 'Juegas como Aiden Pearce, un brillante hacker y antiguo matón, cuyo pasado delictivo le ha conducido a una terrible tragedia familiar. Ahora, persiguiendo a los que hirieron a tu familia, podrás hackear todo lo que te rodea, manipulando la red de conexiones de la ciudad. Accede a las cámaras de seguridad que hay por todas partes, descarga información personal que te lleve a tu objetivo, controla los semáforos y el transporte público para detener al enemigo y mucho más.', '2014-05-26', 'PlayStation', 'Español', 'Ingles', 'NULL'),
(30, 35, 'Juega como Marcus Holloway, un joven y brillante hacker que vive en la cuna de la revolución tecnológica, la zona de la bahía de San Francisco. Colabora con DedSec, un conocido grupo de hackers, para ejecutar el mayor pirateo de la historia; acaba con ctOS 2.0, un sistema operativo utilizado por un grupo de genios criminales para vigilar y manipular a los ciudadanos a gran escala.', '2016-11-28', 'PlayStation', 'Español', 'Ingles', 'NULL'),
(31, 36, 'Tres años después de los eventos de  UNCHARTED 3: Drakes Deception, se supone que Nathan Drake se retiró del mundo de los cazafortunas. Sin embargo, el destino no tarda en golpear su puerta cuando su hermano Sam reaparece en busca de ayuda para salvar su propia vida, una aventura demasiado tentadora e irresistible para Drake.', '2016-05-10', 'PlayStation', 'Español', 'Ingles', 'NULL'),
(32, 37, 'Seis años después de la catástrofe biológica en Raccoon City, el agente Leon S. Kennedy, uno de los supervivientes del desastre, ha sido enviado a rescatar a la hija del presidente, a quien han secuestrado. Siguiendo su rastro, llega a una apartada población europea, donde sus habitantes sufren un mal terrible. Así comienza esta historia de un arriesgado rescate y terror escalofriante donde se cruzan la vida y la muerte, y el miedo y la catarsis.', '2023-03-23', 'Pc', 'Español', 'Ingles', 'NULL'),
(33, 39, 'Juego de habilidad manual, reflejos y no apto para cardiacos', '2012-03-12', 'PC', 'Español', 'Español', 'NULL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(10) UNSIGNED NOT NULL,
  `nombreJuego` varchar(60) NOT NULL,
  `imagenJuego` varchar(150) NOT NULL,
  `pesoJuego` varchar(10) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `nombreJuego`, `imagenJuego`, `pesoJuego`, `precio`, `categoria`) VALUES
(1, 'Back 4 Blood Ultimate Edition', 'games/Back_4_Blood_Ultimate_Edition.jpg', '47,8 GB', 75, 'Accion'),
(2, 'Horizon Forbidden West Complete Edition', 'games/Horizon-Forbidden-West-Complete-Edition.jpg', '98,9 GB', 125, 'Aventura'),
(3, 'Alone in the Dark Deluxe Edition', 'games/Alone-in-the-Dark-Deluxe-Edition.jpg', '26,9 GB', 100, 'Accion'),
(4, 'TEKKEN 8 Ultimate Edition', 'games/TEKKEN-8-Ultimate-Edition.jpg', '78,6 GB', 150, 'Lucha'),
(5, 'Call of Duty Black Ops Cold War', 'games/Call-of-Duty-Black-Ops-Cold-War.jpg', '122 GB', 200, 'Accion'),
(6, 'Stray', 'games/Stray.jpg', '6,5 GB', 180, 'Aventura'),
(7, 'FIFA 23', 'games/FIFA23.jpg', '46,5 GB', 220, 'Deporte'),
(19, 'Elden Ring', 'games/elden_ring.jpg', '60Gb', 173, 'Mundo Abierto'),
(20, 'The Legend of Zelda Breath of the Wild', 'games/The_Legend_of_Zelda_Breath_of_the_Wild.jpg', '10Gb', 79, 'accion'),
(21, 'Grand Theft Auto V', 'games/Grand_Theft_Auto_V.png', '120Gb', 100, 'Mundo Abierto'),
(22, 'Mortal Kombat 11', 'games/Mortal-Kombat-11-Ultimate-Edition.jpg', '120Gb', 150, 'Lucha'),
(23, 'Mortal Kombat 1', 'games/MortalKombat1PremiumEdition.jpg', '140Gb', 210, 'Lucha'),
(25, 'Red Dead Redemption 2', 'games/red_dead_3__nombre_temporal_-4030936.jpg', '150Gb', 200, 'Mundo Abierto'),
(26, 'Baldur\'s Gate 3', 'games/baldur__039_s_gate_3-5271587.jpg', '150Gb', 200, 'accion'),
(27, 'The Last Of Us Remake', 'games/The_Last_Of_Us_Remake.jpg', '170Gb', 180, 'accion'),
(28, 'The Last Of Us Part 2 Remake', 'games/AUAHUKD55FFFFECWDG2AFYCBMQ.jpg', '150Gb', 200, 'accion'),
(29, 'Portal 2', 'games/Portal2.jpg', '8Gb', 23, 'Puzles'),
(30, 'Half Life 2', 'games/Half_life_2.jpg', '7Gb', 23, 'accion'),
(31, 'Sekiro: Shadows Die Twice', 'games/co2a23.jpg', '25Gb', 220, 'accion'),
(32, 'God Of War', 'games/peque_godofwar.jpg', '70Gb', 160, 'Mundo Abierto'),
(33, 'God of War Ragnarok', 'games/God of War Ragnarok.jpg', '30Gb', 300, 'Mundo Abierto'),
(34, 'Watch_Dogs', 'games/Watch Dogs.jpg', '25Gb', 80, 'Mundo Abierto'),
(35, 'Watch_Dogs 2', 'games/Watch Dogs 2.jpg', '27Gb', 150, 'Mundo Abierto'),
(36, 'Uncharted 4', 'games/Uncharted_4_portada.jpg', '50Gb', 140, 'aventura'),
(37, 'Resident Evil 4 Remake', 'games/resident_evil_4_remake-5789986.jpg', '50Gb', 220, 'Terror'),
(39, 'Geometry Dash', 'games/geometry.png', '150gb', 10, 'Puzles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reclamaciones`
--

CREATE TABLE `reclamaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `monto_reclamado` decimal(10,2) NOT NULL,
  `descripcion_problema` text NOT NULL,
  `evidencia` varchar(255) DEFAULT NULL,
  `estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reclamaciones`
--

INSERT INTO `reclamaciones` (`id`, `nombre`, `apellidos`, `correo`, `telefono`, `producto`, `monto_reclamado`, `descripcion_problema`, `evidencia`, `estado`) VALUES
(1, 'sfsfa', 'asffsgds', 'asasd@gmail.com', '46456456', 'afsafsafsegrg', 152.00, 'jtfyf', '', ''),
(2, 'sfsfafghf', 'asffsgdsfgjfgj', 'asasd@gmail.com', '4645645645', 'afsafsafsegrg', 152.00, 'buuÃ±', 'Captura de pantalla 2024-05-25 160148.png', ''),
(3, 'sfsfafghf', 'asffsgdsfgjfgj', 'asasd@gmail.com', '4645645645', 'afsafsafsegrg', 152.00, 'tjrhtherhrhe', 'PERFIL.png', ''),
(4, 'Sara', 'gallegos', 'sara@gmail.com', '9382323221', 'left', 150.00, 'pipipipi', 'evidencias/a46efd6651e00b47106de378a467f320.jpg', 'P');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `categoria` enum('usabilidad','catalogo','precios','soporte','metodos_pago','otros') NOT NULL,
  `asunto` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idCliente` int(10) NOT NULL,
  `Dni` varchar(9) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Rol` enum('cliente','administrador') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idCliente`, `Dni`, `Nombres`, `Direccion`, `Email`, `Contraseña`, `Rol`) VALUES
(1, '12345678A', 'Juan Pérez', 'Calle Principal 123', 'juan@example.com', 'contraseña123', 'cliente'),
(2, '12345679A', 'Sara', 'Calle Principal 123', 'sara@gmail.com', '12', 'cliente'),
(3, '98765432B', 'Jheremy Alois', 'dubai', 'saremi@game.com', '123', 'administrador'),
(4, '15231', 'manu', 'avenida  los incas', 'dvega1402@icloud.com', '12345', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `fk_idCliente` (`idCliente`);

--
-- Indices de la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  ADD PRIMARY KEY (`detalleJuegoId`),
  ADD KEY `idJuego` (`idJuego`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`);

--
-- Indices de la tabla `reclamaciones`
--
ALTER TABLE `reclamaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `Dni` (`Dni`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  MODIFY `detalleJuegoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `juego`
--
ALTER TABLE `juego`
  MODIFY `idJuego` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `reclamaciones`
--
ALTER TABLE `reclamaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idCliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`idCliente`);

--
-- Filtros para la tabla `detallejuego`
--
ALTER TABLE `detallejuego`
  ADD CONSTRAINT `detallejuego_ibfk_1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
