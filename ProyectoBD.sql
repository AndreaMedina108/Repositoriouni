-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS Normalizacion_Senadores;
USE Normalizacion_Senadores;

-- Tabla DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    CODIGO_DANE INT PRIMARY KEY,
    NOMBRE_DEPARTAMENTO VARCHAR(100) NOT NULL
);

-- Tabla CIUDAD
CREATE TABLE CIUDAD (
    ID_CIUDAD INT PRIMARY KEY,
    NOMBRE_CIUDAD VARCHAR(100) NOT NULL,
    CODIGO_DANE INT,
    FOREIGN KEY (CODIGO_DANE) REFERENCES DEPARTAMENTO(CODIGO_DANE)
);

-- Tabla SENADOR
CREATE TABLE SENADOR (
    ID_SENADOR INT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    GENERO VARCHAR(20) NOT NULL,
    ANO_NACIMIENTO VARCHAR(50),
    ID_CIUDAD INT,
    FOREIGN KEY (ID_CIUDAD) REFERENCES CIUDAD(ID_CIUDAD)
);

-- Tabla PARTIDO
CREATE TABLE PARTIDO (
    ID_PARTIDO INT PRIMARY KEY,
    NOMBRE_PARTIDO VARCHAR(100) NOT NULL
);

-- Tabla COMISION_LEGAL
CREATE TABLE COMISION_LEGAL (
    ID_COMISION_LEGAL INT PRIMARY KEY,
    NOMBRE_COMISION TEXT
);

-- Tabla CONTACTO
CREATE TABLE CONTACTO (
    ID_CONTACTO INT PRIMARY KEY,
    CORREO_ELECTRONICO VARCHAR(200),
    TWITTER VARCHAR(100),
    FACEBOOK VARCHAR(200),
    PAGINA_WEB VARCHAR(200),
    TELEFONO VARCHAR(50)
);

-- Tabla COMISION_CONSTITUCIONAL
CREATE TABLE COMISION_CONSTITUCIONAL (
    ID_COMISION_CONST INT PRIMARY KEY,
    NOMBRE_COMISION VARCHAR(50) NOT NULL
);

-- Tabla SENADOR_PERIODO
CREATE TABLE SENADOR_PERIODO (
    ID_SENADOR_PERIODO INT PRIMARY KEY,
    ID_SENADOR INT,
    ID_PARTIDO INT,
    NUMERO_VOTOS VARCHAR(50),
    ID_COMISION_CONST INT,
    ID_COMISION_LEGAL INT,
    ID_CONTACTO INT,
    FOREIGN KEY (ID_SENADOR) REFERENCES SENADOR(ID_SENADOR),
    FOREIGN KEY (ID_PARTIDO) REFERENCES PARTIDO(ID_PARTIDO),
    FOREIGN KEY (ID_COMISION_CONST) REFERENCES COMISION_CONSTITUCIONAL(ID_COMISION_CONST),
    FOREIGN KEY (ID_COMISION_LEGAL) REFERENCES COMISION_LEGAL(ID_COMISION_LEGAL),
    FOREIGN KEY (ID_CONTACTO) REFERENCES CONTACTO(ID_CONTACTO)
);

-- Insertar datos en DEPARTAMENTO
INSERT INTO DEPARTAMENTO (CODIGO_DANE, NOMBRE_DEPARTAMENTO) VALUES
(8, 'Atlantico'),
(73, 'Tolima'),
(5, 'Antioquia'),
(70, 'Sucre'),
(23, 'Cordoba'),
(41, 'Huila'),
(13, 'Bolivar'),
(76, 'Valle del Cauca'),
(15, 'Boyacá'),
(11, 'Distrito Capital'),
(25, 'Cundinamarca'),
(17, 'Caldas'),
(54, 'Norte de Santander'),
(47, 'Magdalena'),
(66, 'Risaralda'),
(68, 'Santander'),
(52, 'Nariño'),
(20, 'Cesar'),
(85, 'Casanare'),
(86, 'Putumayo'),
(63, 'Quindio'),
(50, 'Meta');

-- Insertar datos en CIUDAD
INSERT INTO CIUDAD (ID_CIUDAD, NOMBRE_CIUDAD, CODIGO_DANE) VALUES
(1, 'Barranquilla', 8),
(2, 'Ibague', 73),
(3, 'Medellin', 5),
(4, 'Tolu', 70),
(5, 'Lorica', 23),
(6, 'Neiva', 41),
(7, 'Cartagena', 13),
(8, 'Cali', 76),
(9, 'Sogamoso', 15),
(10, 'Cerete', 23),
(11, 'Bogotá', 11),
(12, 'Sutatenza', 15),
(13, 'Sahagun', 23),
(14, 'Girardot', 25),
(15, 'Sincelejo', 70),
(16, 'Pacora', 17),
(17, 'Convención', 54),
(18, 'Cienaga', 47),
(19, 'Belen de Umbria', 66),
(20, 'Cucuta', 54),
(21, 'Chinacosta', 54),
(22, 'San Gil', 68),
(23, 'Santa Marta', 47),
(24, 'Monteria', 23),
(25, 'La Cruz', 52),
(26, 'El Carmen', 13),
(27, 'La Ceja', 5),
(28, 'Valledupar', 20),
(29, 'Aguazul', 85),
(30, 'Puerto Leguizamo', 86),
(31, 'Guatape', 5),
(32, 'Yumbo', 76),
(33, 'Andes', 5),
(34, 'Calarca', 63),
(35, 'La Jagua de Ibirico', 20),
(36, 'La Paz', 68),
(37, 'Medelliín', 5),
(38, 'Palmira', 76),
(39, 'Garzón', 41),
(40, 'Villavicencio', 50),
(41, 'Pereira', 66),
(42, 'Manizales', 17);

-- Insertar datos en SENADOR
INSERT INTO SENADOR (ID_SENADOR, NOMBRE, GENERO, ANO_NACIMIENTO, ID_CIUDAD) VALUES
(1, 'Acuña Díaz Laureano Augusto', 'Masculino', '1971/03/25', 1),
(2, 'Agudelo García Ana Paola', 'Femenino', '1983/05/08', 2),
(3, 'Agudelo Zapata Iván Darío', 'Masculino', '1967/08/15', 3),
(4, 'Aguilar Villa Richard Alfonso', 'Masculino', '1981/09/26', 4),
(5, 'Amín Escaf Miguel', 'Masculino', '1948/09/05', 1),
(6, 'Amín Saleme Fabio Raúl', 'Masculino', '1976/10/15', 5),
(7, 'Andrade Serrano Esperanza', 'Femenino', '1957/03/14', 6),
(8, 'Araújo Rumié Fernando Nicolás', 'Masculino', '1983/05/16', 7),
(9, 'Arias Castillo Wilson Neber', 'Masculino', '1962/12/17', 8),
(10, 'Avella Esquivel Aída Yolanda', 'Femenino', '1949/01/23', 9),
(11, 'Barguil Assis David Alejandro', 'Masculino', '1981/06/23', 10),
(12, 'Barreras Montealegre Roy Leonardo', 'Masculino', '1963/11/27', 11),
(13, 'Barreto Castillo Miguel Ángel', 'Masculino', '1978/04/06', 12),
(14, 'Bedoya Pulgarín Julián', 'Masculino', '1980/10/07', 3),
(15, 'Benedetti Villaneda Armando Alberto', 'Masculino', '1967/08/29', 1),
(16, 'Besaile Fayad John Moisés', 'Masculino', '1969/08/22', 13),
(17, 'Blel Scaf Nadya Georgette', 'Femenino', '1981/08/11', 7),
(18, 'Bolívar Moreno Gustavo', 'Masculino', '1965/06/22', 14),
(19, 'Cabal Molina María Fernanda', 'Femenino', '1964/08/08', 8),
(20, 'Castañeda Gómez Ana María', 'Femenino', '1984/12/27', 15),
(21, 'Castaño Perez Mario Alberto', 'Masculino', '1971/12/08', 16),
(22, 'Castellanos Emma Claudia', 'Femenino', '1960/05/04', 11),
(23, 'Castilla Salazar Jesús Alberto', 'Masculino', '1968/03/18', 17),
(24, 'Castillo Suárez Fabián Gerardo', 'Masculino', '1968/11/04', 18),
(25, 'Castro Córdoba Juan Luis', 'Masculino', '1975/02/12', 3),
(26, 'Cepeda Castro Iván', 'Masculino', '1962/10/24', 11),
(27, 'Cepeda Sarabia Efraín José', 'Masculino', '1950/05/24', 1),
(28, 'Chagui Spath Ruby Helena', 'Femenino', '1981/05/25', 10),
(29, 'Char Chaljub Arturo', 'Masculino', '1967/11/05', 1),
(30, 'Corrales Escobar Alejandro', 'Masculino', '1976/03/18', 19),
(31, 'Cristo Bustos Andrés', 'Masculino', '1971/01/18', 20),
(32, 'Díaz Contreras Edgar Jesús', 'Masculino', '1961/02/15', 21),
(33, 'Díaz Granados Luis Eduardo', 'Masculino', '1970/07/15', 1),
(34, 'Durán Barrera Jaime Enrique', 'Masculino', '1970/08/03', 22),
(35, 'Fortich Sánchez Laura Ester', 'Femenino', '1983/02/26', 23),
(36, 'Gallo Cubillos Julián', 'masculino', '1961/03/24', 11),
(37, 'Galvis Méndez Daira de Jesus', 'Femenino', '1953/10/04', 7),
(38, 'García Burgos Nora María', 'Femenino', '1956/05/15', 24),
(39, 'García Gómez Juan Carlos', 'Masculino', '1979/01/01', 20),
(40, 'García Realpe Guillermo', 'Masculino', '1954/11/17', 25),
(41, 'García Turbay Lidio Arturo', 'Masculino', '1971/02/10', 26),
(42, 'García Zuccardi Andrés Felipe', 'Masculino', '1983/06/18', 7),
(43, 'Gaviria Vélez José Obdulio', 'Masculino', '1951/11/18', 27),
(44, 'Gnecco Zuleta José Alfredo', 'Masculino', '1976/04/17', 28),
(45, 'Gómez Amin Mauricio', 'Masculino', '1982/03/31', 1),
(46, 'Gómez Jiménez Juan Diego', 'Masculino', '1975/11/26', 3),
(47, 'Gonzalez Rodriguez Amanda Rocio', 'Femenino', '1978/02/12', 29),
(48, 'Guerra de la Espriella Maria del Rosario', 'Femenino', '1961/10/15', 15),
(49, 'Guevara Jorge Eliecer', 'Masculino', '1955/12/10', 30),
(50, 'Guevara Villabon Carlos Eduardo', 'Masculino', '1977/01/29', 11),
(51, 'Henríquez Pinedo Honorio Miguel', 'Masculino', '1971/07/27', 23),
(52, 'Holguín Moreno Paola Andrea', 'Femenino', '1973/11/12', 3),
(53, 'Hoyos Giraldo Germán Darío', 'Masculino', '1066/11/22', 31),
(54, 'Jiménez López Carlos Abraham', 'Masculino', '1982/04/28', 32),
(55, 'Lara Restrepo Rodrigo', 'Masculino', '1975/05/12', 6),
(56, 'Lemos Uribe Juan Felipe', 'Masculino', '1977/07/12', 33),
(57, 'Lizarazo Cubillos Aydee', 'Femenino', '1965/02/18', 34),
(58, 'Lobo Chinchilla Didier', 'Masculino', '1971/10/13', 35),
(59, 'Lobo Silva Sandra Ramirez', 'Femenino', '1963/05/15', 36),
(60, 'Londoño Ulloa Jorge Eduardo', 'Masculino', '1960/11/25', 37),
(61, 'López Maya Alexánder', 'Masculino', '1967/06/26', 8),
(62, 'López Peña José Ritter', 'Masculino', '1958/12/21', 38),
(63, 'Lozano Correa Angelica Listbeth', 'Femenino', '1976/05/07', 11),
(64, 'Macías Tovar Ernesto', 'Masculino', '1955/06/26', 39),
(65, 'Martínez Aristizábal Maritza', 'Femenino', '1968/07/13', 40),
(66, 'Marulanda Gómez Luis Iván', 'Masculino', '1946/06/04', 41),
(67, 'Meisel Vergara Carlos Manuel', 'Masculino', '1985/05/18', 1),
(68, 'Mejía Mejía Carlos Felipe', 'Masculino', '1969/10/29', 42),
(69, 'Merheg Marun Juan Samy', 'Masculino', '1967/04/04', 41),
(70, 'Motoa Solarte Carlos Fernando', 'Masculino', '1975/10/24', 38);

-- Insertar datos en PARTIDO
INSERT INTO PARTIDO (ID_PARTIDO, NOMBRE_PARTIDO) VALUES
(1, 'Conservador'),
(2, 'Partido Mira'),
(3, 'Liberal'),
(4, 'Cambio Radical'),
(5, 'Partido de la U'),
(6, 'Centro Democrático'),
(7, 'Polo Democrático Alternativo'),
(8, 'Coalición Lista de la Decencia'),
(9, 'Alianza Verde'),
(10, 'Comunes');

-- Insertar datos en COMISION_LEGAL
INSERT INTO COMISION_LEGAL (ID_COMISION_LEGAL, NOMBRE_COMISION) VALUES
(1, 'Comisión de Ética y Estatuto del Congresista'),
(2, 'Comisión Legal para la Equidad de la Mujer. Comisión Asesora de Relaciones Exteriores'),
(3, 'Comisión de Derechos Humanos'),
(4, 'ND'),
(5, 'Comisión Legal para la Equidad de la Mujer'),
(6, 'Comisión de Administración'),
(7, 'Comisión de Acreditación Documental'),
(8, 'Comisión de Ética y Estatuto del Congresista. Comisión Legal para la Equidad de la Mujer'),
(9, 'Comisión de Derechos Humanos. Comisión de Administración. Comisión Asesora de Relaciones Exteriores.'),
(10, 'Comisión Legal de Seguimiento a las Actividades de Inteligencia y Contrainteligencia'),
(11, 'Comisión Asesora de Relaciones Exteriores'),
(12, 'Comisión Legal de Crédito Público'),
(13, 'Comisión de Derechos Humanos. Comisión Legal de Seguimiento a las Actividades de Inteligencia y Contrainteligencia'),
(14, 'Comisión Legal de Seguimiento a las Actividades de Inteligencia y Contrainteligencia. Comisión Asesora de Relaciones Exteriores.'),
(15, 'Comisión de Acreditación Documental. Comisión Legal para la Equidad de la Mujer'),
(16, 'Comisión de Ëtica y Estatuto del Congresista');

-- Insertar datos en CONTACTO 
INSERT INTO CONTACTO (ID_CONTACTO, CORREO_ELECTRONICO, TWITTER, FACEBOOK, PAGINA_WEB, TELEFONO) VALUES
(1, 'laureano.acuna@senado.gov.co', '@LaureanoAcuDiaz', 'facebook.com/laureanoaugusto.acunadiaz', 'ND', '57(1) - 382300'),
(2, 'ana.agudelo@senado.gov.co', '@AnaPaolaAgudelo', 'facebook.com/AnaPaolaAgudelo/', 'https://anapaolaagudelo.com/', '57(1) - 382300'),
(3, 'Juntosconivan14@gmail.com', '@IvanAgudeloZ', 'facebook.com/ivan.d.zapata.9', 'ND', '57(1) - 382300'),
(4, 'richard.aguilar@senado.gov.co', '@RichardAguilarV', 'facebook.com/richardaguilar26', 'http://www.richardaguilar.com', '57(1) - 382300'),
(5, 'miguelaminescaf@yahoo.com', 'ND', 'facebook.com/Miguel-Amin-Oficial-732501546782767/', 'ND', '57(1) - 382300'),
(6, 'fabio.amin@senado.gov.co', '@FabioAminSaleme', 'facebook.com/FabioAminSaleme/', 'ND', '57(1) - 382300'),
(7, 'esperanza.andrade@senado.gov.co', 'ND', 'ND', 'ND', '57(1) - 382300'),
(8, 'nicolas.araujo@senado.gov.co', '@fnaraujor', 'facebook.com/SenadorFernandoNicolas', 'http://senadoraraujo.co/', '57(1) - 382300'),
(9, 'wilson.arias@senado.gov.co', '@wilsonariasc', 'facebook.com/WilsonAriasC/', 'https://comunwa.blogspot.com/', '57(1) - 382300'),
(10, 'aida.avella@senado.gov.co', '@AidaAvellaE', 'facebook.com/aidaavellae/', 'ND', '57(1) - 382300'),
(11, 'david.barguil@senado.gov.co', '@davidbarguil', 'facebook.com/davidbarguil', 'ND', '57(1) - 382300'),
(12, 'roybarreras@gmail.com', '@RoyBarreras', 'facebook.com/Roybarrerassenador', 'ND', '57(1) - 382300'),
(13, 'miguel.barreto@senado.gov.co', '@MIgueBarretoC', 'facebook.com/MiguelBarretoC', 'ND', '57(1) - 382300'),
(14, 'julian.bedoya@senado.gov.co', '@JulianBedoyaL17', 'facebook.com/JulianBedoyaP', 'ND', '57(1) - 382300'),
(15, 'armando.benedetti.villaneda@senado.gov.co', '@AABenedetti', 'facebook.com/aabenedetti', 'http://www.armandobenedetti.com/', ''),
(16, 'utljohnmoisesbesaile@gmail.com', '@Jhonybesailef', 'facebook.com/JhonyBesaile', 'ND', '57(1) - 382301'),
(17, 'nadia.blel@senado.gov.co', '@nadiablel', 'facebook.com/nadia.blel', 'ND', '57(1) - 382300'),
(18, 'senadorgustavobolivar@gmail.com', '@GustavoBolivar', 'facebook.com/gustavobolivarsincensura/', 'ND', '57(1) - 382300'),
(19, 'maria.cabal@senado.gov.co', '@MariaFdaCabal', 'facebook.com/MariaFdaCabal/', 'http://mariafernandacabal.com/', '57(1) - 382300'),
(20, 'ana.castaneda@senado.gov.co', '@AnyMarCas', 'facebook.com/AnyMarCas/', 'https://www.anamariasenadora.com/', '57(1) - 382300'),
(21, 'mario.castano@senado.gov.co', '@mariocaspe', 'facebook.com/senadormariocastano/', 'ND', '57(1) - 382300'),
(22, 'emma.castellanos@senado.gov.co', '@EmmaClaudiaC', 'facebook.com/emmaclaudiacastellanos', 'https://emmaclaudiacastellanos.com/', '57(1) - 382300'),
(23, 'utl.albertocastilla@gmail.com', '@Castillasenador', 'facebook.com/CastillaSenador', 'http://www.albertocastillasenador.com/', '57(1) - 382300'),
(24, 'fabian.castillo@senado.gov.co', '@fabiangcs', 'facebook.com/fabiangcastillos/', 'ND', '57(1) - 382300'),
(25, 'juan.castro@senado.gov.co', '@JuanLuisCasCo', 'facebook.com/JuanLuisCasCo', 'http://juanluiscastro.co/', '57(1) - 382300'),
(26, 'Ivancepedacongresista@gmail.com', '@IvanCepedaCast', 'facebook.com/IvanCepedaCastro/', 'http://www.ivancepedacastro.com/', '57(1) - 382300'),
(27, 'efrain.cepeda@senado.gov.co', 'ND', 'ND', 'http://efraincepeda.com/', '57(1) - 382300'),
(28, 'ruby.chagui@senado.gov.co', '@Rubychagui', 'facebook.com/RubyChaguiCD9/', 'https://www.rubychagui.co/', '57(1) - 382300'),
(29, 'arturo.char@senado.gov.co', '@arturocharc', 'facebook.com/arturo.char', 'ND', '57(1) - 382300'),
(30, 'alejandro.corrales@senado.gov.co', '@AlejoCorralesCD', 'facebook.com/SenadorAlejandro/', 'https://jcaro440.wixsite.com/centrodemocratico/corrales', '57(1) - 382300'),
(31, 'andres.cristo@senado.gov.co', '@andrescristob', 'facebook.com/andrescristob/', 'http://www.andrescristo.com', '57(1) - 382300'),
(32, 'edgarjesus.diaz@senado.gov.co', '@EdgarDiazPaLant', 'facebook.com/EdgarDiazPaLante/', 'ND', '57(1) - 382300'),
(33, 'luis.diaz@senado.gov.co', '@LuisDiazGranad', 'facebook.com/luis.e.granados.14', 'ND', '57(1) - 382300'),
(34, 'jaime.duran.barrera@senado.gov.co', '@jaimeduranbar', 'facebook.com/JaimeDuranLiberal/', 'http://www.jaimeduransenadoyedgargomezcamara.com/', '57(1) - 382300'),
(35, 'laura.fortich@senado.gov.co', '@LauraFortichsan', 'facebook.com/laurafortichs14/', '', '57(1) - 382300'),
(36, 'julian.gallo@senado.gov.co', '@Carlozada_FARC', 'facebook.com/Carlozada.Farc', 'http://www.partidofarc.com.co/', '57(1) - 382300'),
(37, 'daira.galvis.mendez@senado.gov.co', '@dairagalmen', 'facebook.com/DairaFirmeConlaGente', 'http://www.dairagalvis.com', '57(1) - 382300'),
(38, 'nora.garcia@senado.gov.co', '@noragarciab', 'facebook.com/noragarciab', 'ND', '57(1) - 382300'),
(39, 'juan.garcia@senado.gov.co', 'ND', 'ND', 'ND', '57(1) - 382300'),
(40, 'guillermo.garcia@senado.gov.co', '@GGarciaRealpe', 'facebook.com/GuillermoGarciaRealpe/', 'http://www.guillermogarciarealpe.com/', '57(1) - 382300'),
(41, 'lidio.garcia@senado.gov.co', '@Lidiosenado', 'facebook.com/lidio.turbay', 'ND', '57(1) - 382300'),
(42, 'info@andresgarciazuccardi.com', '@AGarciaZuccardi', 'facebook.com/AGarciaZuccardi', 'http://www.andresgarciazuccardi.com/', '57(1) - 382300'),
(43, 'joseobdulio.gaviria@senado.gov.co', '@JOSEOBDULIO', 'facebook.com/josiogaviria', 'http://www.joseobdulio.com/', '57(1) - 382300'),
(44, 'Juanfelie039@hotmail.com', '@JoseAlfreGnecco', 'facebook.com/josealfredo.gneccozuleta', 'http://www.cnecuentasclaras.com/ Información:', '57(1) - 382300'),
(45, 'mauricio.gomez@senado.gov.co', '@MauricioGomezco', 'facebook.com/mauriciogomezco', 'http://www.mauriciogomezconcejo.com/', '57(1) - 382300'),
(46, 'diego.gomez@senado.gov.co', '@juandiegogj', 'facebook.com/JuanDiegoGomezJimenez', 'http://www.cnecuentasclaras.com/', '57(1) - 382300'),
(47, 'utlsenamandagonzalez@gmail.com', '@amandarociogon1', 'facebook.com/amandarociosenadoracd', 'https://jcaro440.wixsite.com/centrodemocratico/amandarocio', '57(1) - 382300'),
(48, 'maria.guerra@senado.gov.co', '@charoguerra', 'facebook.com/MaRosarioGuerra/', 'http://mariadelrosarioguerra.co/', '57(1) - 382300'),
(49, 'jorge.guevara@senado.gov.co', '@SenadorJGuevara', 'facebook.com/jorge.e.guevara.5', 'http://www.jorgeguevarasenador.net', '57(1) - 382300'),
(50, 'carlos.guevara@senado.gov.co', '@carlos_guevara', 'facebook.com/carloseduardo.guevara', 'http://www.carloseduardoguevara.co', '57(1) - 382300'),
(51, 'honorio.henriquez@senado.gov.co', 'ND', 'ND', 'https://www.centrodemocratico.com/', '57(1) - 382300'),
(52, 'paola.holguin@senado.gov.co', '@PaolaHolguin', 'facebook.com/paolaholguinm/', 'http://paolaholguin.com/', '57(1) - 382300'),
(53, 'german.hoyos.giraldo@senado.gov.co', '@GermanHoyos', 'facebook.com/germanhoyosg5/', 'http://www.cnecuentasclaras.com/', '57(1) - 382300'),
(54, 'carlos.jimenez@senado.gov.co', 'ND', 'facebook.com/abrahamcongreso/', 'http://www.partidocambioradical.org/portfolios/rodrigo-lara-6-2-2/', '57(1) - 382300'),
(55, 'rodrigo.lara@senado.gov.co', 'ND', 'facebook.com/RodrigoLaraR/', 'http://www.rodrigolara.com.co/', '57(1) - 382300'),
(56, 'juan.lemos@senado.gov.co', 'ND', 'facebook.com/JFLemosU/', 'http://www.juanfelipelemosuribe.com/', '57(1) - 382300'),
(57, 'aydee.lizarazo@senado.gov.co', '@aydeelizarazoc', 'facebook.com/aydee.lizarazocubillos/', 'https://aydeelizarazo.com/', '57(1) - 382300'),
(58, 'didier.lobo@senado.gov.co', '@DidierLobo_Ch', 'facebook.com/didier.senador.1', 'http://www.didierlobosenador.com', '57(1) - 382300'),
(59, 'criselda.lobo@senado.gov.co', '@SandraFARC', 'facebook.com/SandraRamirezFARC/', 'http://www.partidofarc.com.co/', '57(1) - 382300'),
(60, 'jorge.londono@senado.gov.co', '@jorgelondonou', 'facebook.com/jorgeelondonou', 'ND', '57(1) - 382300'),
(61, 'alexander.lopez.maya@senado.gov.co', '@AlexLopezMaya', 'facebook.com/AlexLopezMaya', 'http://www.alexanderlopezmaya.com.co/', '57(1) - 382300'),
(62, 'ritterasistente@gmail.com', '@Ritterlopez', 'facebook.com/Ritterlopez', 'http://www.ritterlopez.com', '57(1) - 382300'),
(63, 'angelicalozano.publico@gmail.com', '@AngelicaLozanoC', 'facebook.com/angelicalozanocorrea', 'http://angelicalozano.co/', '57(1) - 382300'),
(64, 'ernesto.macias@senado.gov.co', '@ernestomaciast', 'facebook.com/ernestomaciast', 'ND', '57(1) - 382300'),
(65, 'maritza.martinez.aristizabal@senado.gov.co', '@Maritza_Senado', 'facebook.com/maritzasenadora.latribupza', 'http://www.maritzamartinezaristizabal.com/', '57(1) - 382300'),
(66, 'ivanmarulandasenador@gmail.com', '@ivanmarulanda', 'facebook.com/IvanMarulandaGomez', 'http://ivanmarulanda.com', '57(1) - 382300'),
(67, 'carlos.meisel@senado.gov.co', '@carlosmeiselv', 'facebook.com/carlosmeiselv/', 'https://jcaro440.wixsite.com/centrodemocratico/meisel', '57(1) - 382300'),
(68, 'carlos.mejia@senado.gov.co', '@CARLOSFMEJIA', 'facebook.com/senadorcarlosfelipemejia/', 'https://jcaro440.wixsite.com/centrodemocratico/carlosfelipemejia', '57(1) - 382300'),
(69, 'juan.merheg.marun@senado.gov.co', '@Samy_Merheg', 'facebook.com/SamyMerheg', 'http://www.cnecuentasclaras.com/', '57(1) - 382300'),
(70, 'cmotoa@hotmail.com', 'ND', 'ND', 'http://www.cnecuentasclaras.com/', '57(1) - 382300');

-- Insertar datos en COMISION_CONSTITUCIONAL
INSERT INTO COMISION_CONSTITUCIONAL (ID_COMISION_CONST, NOMBRE_COMISION) VALUES
(1, 'Cuarta'),
(2, 'Segunda'),
(3, 'Sexta'),
(4, 'Tercera'),
(5, 'Primera'),
(6, 'Séptima'),
(7, 'Quinta');

-- Insertar datos en SENADOR_PERIODO
INSERT INTO SENADOR_PERIODO (ID_SENADOR_PERIODO, ID_SENADOR, ID_PARTIDO, NUMERO_VOTOS, ID_COMISION_CONST, ID_COMISION_LEGAL, ID_CONTACTO) VALUES
(1, 1, 1, '82,854', 1, 1, 1),
(2, 2, 2, '71,231', 2, 2, 2),
(3, 3, 3, '67,457', 3, 3, 3),
(4, 4, 4, '76,942', 4, 4, 4),
(5, 5, 5, '69,295', 1, 4, 5),
(6, 6, 3, '83,725', 5, 4, 6),
(7, 7, 1, '69,056', 5, 5, 7),
(8, 8, 6, '27,866', 4, 4, 8),
(9, 9, 7, '15,279', 1, 1, 9),
(10, 10, 8, '57,175', 1, 5, 10),
(11, 11, 1, '139,147', 4, 4, 11),
(12, 12, 5, '110,358', 5, 4, 12),
(13, 13, 1, '79,980', 3, 4, 13),
(14, 14, 3, '74,585', 1, 4, 14),
(15, 15, 5, '72,576', 5, 4, 15),
(16, 16, 5, '77,448', 3, 4, 16),
(17, 17, 1, '69,840', 6, 6, 17),
(18, 18, 8, '116,505', 4, 7, 18),
(19, 19, 6, '37,905', 5, 4, 19),
(20, 20, 4, '53,947', 3, 8, 20),
(21, 21, 3, '73,079', 1, 6, 21),
(22, 22, 4, '66,601', 2, 9, 22),
(23, 23, 7, '27,744', 6, 4, 23),
(24, 24, 4, '78,845', 6, 4, 24),
(25, 25, 9, '22,117', 1, 1, 25),
(26, 26, 7, '77,842', 2, 4, 26),
(27, 27, 1, '117,059', 4, 4, 27),
(28, 28, 6, '31,589', 3, 5, 28),
(29, 29, 4, '126,628', 1, 4, 29),
(30, 30, 6, '30,830', 7, 4, 30),
(31, 31, 3, '67,449', 4, 1, 31),
(32, 32, 4, '81,082', 4, 4, 32),
(33, 33, 4, '112,591', 2, 4, 33),
(34, 34, 3, '69,487', 2, 10, 34),
(35, 35, 3, '62,878', 6, 5, 35),
(36, 36, 10, 'ND', 5, 4, 36),
(37, 37, 4, '73,687', 7, 3, 37),
(38, 38, 1, '96,926', 7, 5, 38),
(39, 39, 1, '70,347', 5, 4, 39),
(40, 40, 3, '64,951', 7, 7, 40),
(41, 41, 3, '117,975', 2, 11, 41),
(42, 42, 5, '72,638', 4, 4, 42),
(43, 43, 6, '25,762', 5, 4, 43),
(44, 44, 5, '76,161', 4, 12, 44),
(45, 45, 3, '103,301', 4, 4, 45),
(46, 46, 1, '74,243', 2, 13, 46),
(47, 47, 6, '45,505', 3, 5, 47),
(48, 48, 6, '28,739', 4, 4, 48),
(49, 49, 9, '20,769', 3, 4, 49),
(50, 50, 2, '66,458', 5, 4, 50),
(51, 51, 6, '33,432', 6, 6, 51),
(52, 52, 6, '58,005', 2, 14, 52),
(53, 53, 5, '72,289', 4, 4, 53),
(54, 54, 4, '79,306', 1, 1, 54),
(55, 55, 4, '90,413', 5, 4, 55),
(56, 56, 5, '82,094', 1, 4, 56),
(57, 57, 2, '57,428', 6, 3, 57),
(58, 58, 4, '86,744', 7, 4, 58),
(59, 59, 10, 'ND', 3, 3, 59),
(60, 60, 9, '64,216', 7, 4, 60),
(61, 61, 7, '84,229', 5, 3, 61),
(62, 62, 5, '87,394', 6, 4, 62),
(63, 63, 9, '105,700', 5, 6, 63),
(64, 64, 6, '39,669', 2, 4, 64),
(65, 65, 5, '64,934', 7, 15, 65),
(66, 66, 9, '26,169', 4, 4, 66),
(67, 67, 6, '27,284', 1, 4, 67),
(68, 68, 6, '28,985', 7, 16, 68),
(69, 69, 1, '81,078', 1, 7, 69),
(70, 70, 4, '78,864', 6, 4, 70);

-- Verificar que los datos se insertaron correctamente
SELECT 'DEPARTAMENTO' as Tabla, COUNT(*) as Registros FROM DEPARTAMENTO
UNION ALL
SELECT 'CIUDAD', COUNT(*) FROM CIUDAD
UNION ALL
SELECT 'SENADOR', COUNT(*) FROM SENADOR
UNION ALL
SELECT 'PARTIDO', COUNT(*) FROM PARTIDO
UNION ALL
SELECT 'COMISION_LEGAL', COUNT(*) FROM COMISION_LEGAL
UNION ALL
SELECT 'CONTACTO', COUNT(*) FROM CONTACTO
UNION ALL
SELECT 'COMISION_CONSTITUCIONAL', COUNT(*) FROM COMISION_CONSTITUCIONAL
UNION ALL
SELECT 'SENADOR_PERIODO', COUNT(*) FROM SENADOR_PERIODO;

#Consultas

-- Lista de senadores con su partido
SELECT s.NOMBRE, p.NOMBRE_PARTIDO 
FROM SENADOR s
JOIN SENADOR_PERIODO sp ON s.ID_SENADOR = sp.ID_SENADOR
JOIN PARTIDO p ON sp.ID_PARTIDO = p.ID_PARTIDO
ORDER BY p.NOMBRE_PARTIDO, s.NOMBRE;

-- Conteo de senadores por genero
SELECT 
    GENERO,
    COUNT(*) as Total_Senadores,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM SENADOR)), 2) as Porcentaje
FROM SENADOR
GROUP BY GENERO;

-- Senadores por departamento
SELECT 
    d.NOMBRE_DEPARTAMENTO,
    COUNT(s.ID_SENADOR) as Cantidad_Senadores
FROM DEPARTAMENTO d
JOIN CIUDAD c ON d.CODIGO_DANE = c.CODIGO_DANE
JOIN SENADOR s ON c.ID_CIUDAD = s.ID_CIUDAD
GROUP BY d.NOMBRE_DEPARTAMENTO
ORDER BY Cantidad_Senadores DESC;

-- Top 10 senadores con mas votos
SELECT 
    s.NOMBRE,
    p.NOMBRE_PARTIDO,
    sp.NUMERO_VOTOS
FROM SENADOR s
JOIN SENADOR_PERIODO sp ON s.ID_SENADOR = sp.ID_SENADOR
JOIN PARTIDO p ON sp.ID_PARTIDO = p.ID_PARTIDO
WHERE sp.NUMERO_VOTOS != 'ND'
ORDER BY CAST(REPLACE(sp.NUMERO_VOTOS, ',', '') AS UNSIGNED) DESC
LIMIT 10;

-- Distribucion de comisiones constitucionales
SELECT 
    cc.NOMBRE_COMISION,
    COUNT(sp.ID_SENADOR) as Senadores_Asignados,
    GROUP_CONCAT(s.NOMBRE SEPARATOR ', ') as Senadores
FROM COMISION_CONSTITUCIONAL cc
JOIN SENADOR_PERIODO sp ON cc.ID_COMISION_CONST = sp.ID_COMISION_CONST
JOIN SENADOR s ON sp.ID_SENADOR = s.ID_SENADOR
GROUP BY cc.NOMBRE_COMISION
ORDER BY Senadores_Asignados DESC;

-- Partidos con mayor representacion por region
SELECT 
    d.NOMBRE_DEPARTAMENTO as Region,
    p.NOMBRE_PARTIDO as Partido,
    COUNT(s.ID_SENADOR) as Senadores,
    ROUND(AVG(CAST(REPLACE(sp.NUMERO_VOTOS, ',', '') AS UNSIGNED)), 0) as Promedio_Votos
FROM DEPARTAMENTO d
JOIN CIUDAD c ON d.CODIGO_DANE = c.CODIGO_DANE
JOIN SENADOR s ON c.ID_CIUDAD = s.ID_CIUDAD
JOIN SENADOR_PERIODO sp ON s.ID_SENADOR = sp.ID_SENADOR
JOIN PARTIDO p ON sp.ID_PARTIDO = p.ID_PARTIDO
WHERE sp.NUMERO_VOTOS != 'ND'
GROUP BY d.NOMBRE_DEPARTAMENTO, p.NOMBRE_PARTIDO
HAVING COUNT(s.ID_SENADOR) > 0
ORDER BY d.NOMBRE_DEPARTAMENTO, Senadores DESC;

-- Senadores en multiples comisiones legales
SELECT 
    s.NOMBRE,
    p.NOMBRE_PARTIDO,
    cl.NOMBRE_COMISION as Comision_Legal,
    cc.NOMBRE_COMISION as Comision_Constitucional,
    c.CORREO_ELECTRONICO
FROM SENADOR s
JOIN SENADOR_PERIODO sp ON s.ID_SENADOR = sp.ID_SENADOR
JOIN PARTIDO p ON sp.ID_PARTIDO = p.ID_PARTIDO
JOIN COMISION_LEGAL cl ON sp.ID_COMISION_LEGAL = cl.ID_COMISION_LEGAL
JOIN COMISION_CONSTITUCIONAL cc ON sp.ID_COMISION_CONST = cc.ID_COMISION_CONST
JOIN CONTACTO c ON sp.ID_CONTACTO = c.ID_CONTACTO
WHERE cl.NOMBRE_COMISION LIKE '%.%'  -- Comisiones que tienen múltiples responsabilidades
   OR cl.NOMBRE_COMISION LIKE '%/%'
ORDER BY s.NOMBRE;