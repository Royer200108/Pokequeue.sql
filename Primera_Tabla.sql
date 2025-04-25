CREATE SCHEMA Pokequeue;

DROP TABLE Pokequeue.Messages;

CREATE TABLE Pokequeue.Messages(
    id INT IDENTITY(1,1) PRIMARY KEY,
    [message] VARCHAR(255) NOT NULL
)

INSERT INTO Pokequeue.Messages ([message]) VALUES ('Message');
INSERT INTO Pokequeue.Messages ([message]) VALUES ('Prueba');
INSERT INTO Pokequeue.Messages ([message]) VALUES ('Otro');

SELECT DB_NAME() AS "Base de Datos";

USE mypokequeuedb;