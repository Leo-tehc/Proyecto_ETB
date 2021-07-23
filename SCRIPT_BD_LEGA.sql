create database BDLega;
use BDLega;

create table Cliente(
cedulaCliente int primary key,
nombreCliente varchar(25) not null,
celular varchar(15) not null,
telefonofijo varchar (15) null,
correoelectronico varchar (50) not null
);

create table Incidencia(
idIncicidencia int primary key auto_increment,
rol varchar (12) not null,
dispositivo varchar(30) not null,
fallaoincidencia varchar(500) not null,
areadetrabajo varchar (100) not null,
fechadeincidencia date not null,
idEquipoFK int
);


create table Usuario(
idUsuario int primary key auto_increment,
tipoUsuario varchar (15) not null,
nombreUsuario varchar (30) not null,
nickName varchar (30) not null,
contraseña varchar (50) not null,
idEquipoFK int
);


create table Conectividad(
idTC int primary key auto_increment,
tipoConexion varchar (15) not null,
adaptador varchar (40) not null,
protocolo varchar (20) not null,
direccion_IPv4 varchar (20) not null,
mascaraRed varchar (20) not null,
direccion_IPv6 varchar (20) not null,
nombreRed varchar (30) not null,
tipoSeguridad varchar (20) not null,
idEquipoFK int
);


create table Software(
idSoftware int primary key auto_increment,
tipoSoftware varchar (20) not null,
nombreSoftware varchar (100) not null,
version varchar (30) not null,
estado varchar (10) not null,
caracteristicas varchar (100) not null,
licenciado varchar (2) not null,
fechaLicencia date not null,
caducidad date not null,
observacion varchar (100) not null,
idEquipoFK int
);


create table Equipo(
idEquipo int primary key auto_increment,
marca varchar (30) not null,
modelo varchar (30) not null,
tipo varchar (30) not null,
estadoFisico varchar (30) not null,
cedulaClienteFK int,
idHardwareFK int
);


create table Diag_test_en_sal(
idES int primary key auto_increment,
fechaEntrada date not null,
observacionE varchar (100) not null,
fechaSalida date not null,
observacionS varchar (10) not null,
idEquipoFK int
);


create table Memoria_Ram(
idMemoriaram int primary key auto_increment,
cantidad varchar (2) not null,
capacidad varchar (10) not null,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);


create table Disco_Duro(
idDiscoduro int primary key auto_increment,
cantidad varchar (2) not null,
marca varchar (15) not null,
referencia varchar (20) not null,
capacidad varchar (10) not null,
estado varchar (10) not null
);


create table Procesador(
idProcesador int primary key auto_increment,
marca varchar (15) not null,
nomenclatura varchar (20) not null,
estado varchar (10) not null
);


create table Mouse(
idMouse int primary key auto_increment,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);


create table Pantalla(
idPantalla int primary key auto_increment,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);


create table Unidad_CD_DVD(
idUnidad int primary key auto_increment,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);


create table Tarjeta_Madre(
idTM int primary key auto_increment,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);


create table Teclado(
idTeclado int primary key auto_increment,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);

create table Otro(
idO int primary key auto_increment,
nombre varchar (20) not null,
marca varchar (15) not null,
referencia varchar (20) not null,
estado varchar (10) not null
);

create table Hoja_de_vida(
idHJ int primary key auto_increment,
cedulaClienteFK int,
idHardwareFK int,
idSoftwareFK int
);

create table Hardware(
idHardware int primary key auto_increment,
idMemoriaramFK int,
idDiscoduroFk int,
idProcesadorFK int,
idMouseFK int,
idPantallaFK int,
idUnidadFK int,
idTMFK int,
idTecladoFK int,
idOFK int
);


alter table Incidencia
add constraint FKRI_Eq
foreign key (idEquipoFK)
references Equipo (idEquipo);

alter table Usuario
add constraint FKAU_Eq
foreign key (idEquipoFK)
references Equipo (idEquipo);

alter table Diag_test_en_sal
add constraint FKES_Eq
foreign key (idEquipoFK)
references Equipo (idEquipo);

alter table Conectividad
add constraint FKIn_Eq
foreign key (idEquipoFK)
references Equipo (idEquipo);

alter table Equipo
add constraint FKEq_Cl
foreign key (cedulaClienteFk)
references Cliente (cedulaCliente);

alter table Equipo
add constraint FKEq_HD
foreign key (idHardwareFK)
references Hardware (idHardware);

alter table Hoja_de_vida
add constraint FKHJ_Cl
foreign key (cedulaClienteFK)
references Cliente (cedulaCliente);

alter table Hoja_de_vida
add constraint FKHJ_HD
foreign key (idHardwareFK)
references Hardware (idHardware);

alter table Hoja_de_vida
add constraint FKHJ_SW
foreign key (idSoftwareFK)
references Software (idSoftware);

alter table Software
add constraint FKSW_EQ
foreign key (idEquipoFK)
references Equipo (idEquipo);


alter table Hardware
add constraint FKHD_MR
foreign key (idMemoriaramFK)
references Memoria_Ram (idMemoriaram);

alter table Hardware
add constraint FKHD
foreign key (idDiscoduroFk)
references Disco_Duro (idDiscoduro);

alter table Hardware
add constraint FKHD_PRO
foreign key (idProcesadorFK)
references Procesador (idProcesador);

alter table Hardware
add constraint FKHD_MO
foreign key (idMouseFK)
references Mouse (idMouse);

alter table Hardware
add constraint FKHD_PA
foreign key (idPantallaFK)
references Pantalla (idPantalla);

alter table Hardware
add constraint FKHD_TE
foreign key (idUnidadFK)
references Unidad_CD_DVD (idUnidad);

alter table Hardware
add constraint FKHD_TM
foreign key (idTMFK)
references Tarjeta_Madre (idTM);

alter table Hardware
add constraint FKHD_TEC
foreign key (idTecladoFK)
references Teclado (idTeclado);

alter table Hardware
add constraint FKHD_O
foreign key (idOFK)
references Otro (idO);