use mypokequeuedb;

--Creando tabla de Statuses
DROP TABLE IF EXISTS Pokequeue.[statuses];

CREATE TABLE Pokequeue.[statuses](
    id INT IDENTITY(1,1) PRIMARY KEY,
    [description] VARCHAR(255) NOT NULL
)

INSERT INTO Pokequeue.[statuses] ([description]) VALUES ('sent'), ('inprogress'), ('completed'), ('failed');

SELECT * FROM Pokequeue.[statuses];

--Creando tabla de Requests
DROP TABLE IF EXISTS Pokequeue.[requests];

CREATE TABLE Pokequeue.[requests](
    id INT IDENTITY(1,1) PRIMARY KEY,
    [type] NVARCHAR(255) NOT NULL,
    id_status INT NOT NULL,
    [url] NVARCHAR(1000), --Direccion de donde esta almacenado el reporte
    created DATETIME DEFAULT GETDATE(),
    updated DATETIME DEFAULT GETDATE(), 
    FOREIGN KEY (id_status) REFERENCES Pokequeue.[statuses](id)
)

--Alterando la tabla para hacer la Tarea-3
    -- Se agrega la columna sample_size a la tabla requests
ALTER TABLE Pokequeue.[requests] ADD sample_size INT null;


--Ver todas las tablas creadas
select * from sys.tables;