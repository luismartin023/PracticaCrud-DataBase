create database PracticaCrud;

use practicacrud

create table Login
(
LoginId int identity (1,1) primary key,
Usuario nvarchar(100),
Contraseña nvarchar(100)
)

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


hyghyg







'Editable

create proc MostrarDatos
as
select * from Datos
go


create proc InsertarDatos
@nombre nvarchar(100),
@email nvarchar(100),
@telefono nvarchar(100),
@metodopago nvarchar(100),
@cedula nvarchar (100)
as
insert into Datos values (@nombre, @email, @telefono, @metodopago, @cedula)
go

create proc EditarDatos
@nombre nvarchar(100),
@email nvarchar(100),
@telefono nvarchar(100),
@metodopago nvarchar(100),
@cedula nvarchar (100),
@id int
as
update Datos set Nombre=@nombre,Email=@email,Telefono=@telefono,MetodoPago=@metodopago,Cedula=@cedula
where id=@id
go

create proc EliminarDatos
@idpro int
as
delete from Datos where id=@idpro
go'