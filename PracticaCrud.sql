create database PracticaCrud;

use practicacrud

create table Login
(
LoginId int identity (1,1) primary key,
Usuario nvarchar(100),
Contraseña nvarchar(100)
);

create table Usuario
(
UserId int identity (1,1) primary key,
Usuario nvarchar(100),
Nombre nvarchar(100),
Clave nvarchar(100),
Rango nvarchar(100),
LoginId int,
CONSTRAINT FK_Usuario FOREIGN KEY (LoginId) REFERENCES Login(LoginId)
);


create table Pelicula
(
PeliculaId int identity (1,1) primary key,
Titulo nvarchar(100),
Descripcion nvarchar(max),
Clasificacion nvarchar(100),
Genero nvarchar(100),
FechaEstreno date,
Duracion int,
Imagen varbinary(MAX),
UserId int,
CONSTRAINT FK_Comprador FOREIGN KEY (UserId) REFERENCES Usuario(UserId)
);

create table Comida
(
ComidaId int identity (1,1) primary key,
NombreProducto nvarchar(100),
Descripcion nvarchar(100),
Precio decimal (10,2)
);

create table Asiento
(
AsientoId int identity (1,1) primary key,
TipoAsiento nvarchar(100)
);


create table Salas
(
SalaId int identity (1,1) primary key,
Capacidad int,
AsientoId int,
CONSTRAINT FK_Asiento FOREIGN KEY (AsientoId) REFERENCES Asiento(AsientoId)
);

create table Tickets
(
Ticketid int identity (1,1) primary key,
NombrePelicula nvarchar(100),
Horario time,
Fecha date,
SalaId int,
PeliculaId int,

CONSTRAINT FK_Pelicula FOREIGN KEY (PeliculaId) REFERENCES Pelicula(PeliculaId),

CONSTRAINT FK_Cuarto FOREIGN KEY (SalaId) REFERENCES Salas(SalaId),

);

create table Ventas
(
VentaId int identity (1,1) primary key,
Precio decimal (10,2),
Fecha date,
ComidaId int,
TicketId int,

CONSTRAINT FK_Comida FOREIGN KEY (ComidaId) REFERENCES Comida(ComidaId),

CONSTRAINT FK_Ticket FOREIGN KEY (TicketId) REFERENCES Tickets(TicketId)
);

create table MetodoPago
(
MetodoPagoId int identity (1,1) primary key,
TipoPago nvarchar (100),
VentaId int
);

create table Factura
(
FacturaId int identity (1,1) primary key,
Fecha datetime,
Cliente nvarchar (100),
MontoTotal decimal (10,2),

MetodoPagoId int,
VentaId int,

CONSTRAINT FK_MetodoPago FOREIGN KEY (MetodoPagoId) REFERENCES MetodoPago(MetodoPagoId),

CONSTRAINT FK_Ventas FOREIGN KEY (VentaId) REFERENCES Ventas(VentaId),
);

--DATOS DEL LOGIN Y LOS USUARIOS---------------------------------

insert into Login (Usuario,Contraseña)

--SE DEBEN CREAR UNO POR UNO--

values ('Yenifer','2580');
values ('admin','1234');
values ('Amil','2580');
values ('Martin','2580');
values ('Julian','2580');

insert into Usuario(Usuario,Nombre,Clave,Rango,LoginId)

--SE DEBEN CREAR UNO POR UNO--

values ('Yenifer','Yenifer Colon Peña','2580','Jefa','1');
values ('admin','Administrador','1234','Programador','2');
values ('Amil','Luis Amil Mejia','2580','Jefe 2','3');
values ('Martin','Luis Martin Peña Mejia','2580','Jefe 3','4');
values ('Julian','Julian David Vazquez','2580','Jefe 4','5');

------------------------------------------------------------------

--CREACION DE DATOS DE PELICULA------------------------------------------------------------------------------

insert into Pelicula(Titulo,Descripcion,Clasificacion,Genero,FechaEstreno,Duracion,Imagen,UserId)

values ('Sonic','Un zorro azul veloz','PE-10','Infantil',CONVERT(date, '2025-12-20', 23),180,NULL,1);

-------------------------------------------------------------------------------------------------------------

SELECT * FROM Pelicula








------
--Editable

--create proc MostrarDatos
--as
--select * from Datos
--go


--create proc InsertarDatos
--@nombre nvarchar(100),
--@email nvarchar(100),
--@telefono nvarchar(100),
--@metodopago nvarchar(100),
--@cedula nvarchar (100)
--as
--insert into Datos values (@nombre, @email, @telefono, @metodopago, @cedula)
--go

--create proc EditarDatos
--@nombre nvarchar(100),
--@email nvarchar(100),
--@telefono nvarchar(100),
--@metodopago nvarchar(100),
--@cedula nvarchar (100),
--@id int
--as
--update Datos set Nombre=@nombre,Email=@email,Telefono=@telefono,MetodoPago=@metodopago,Cedula=@cedula
--where id=@id
--go

--create proc EliminarDatos
--@idpro int
--as
--delete from Datos where id=@idpro
--go