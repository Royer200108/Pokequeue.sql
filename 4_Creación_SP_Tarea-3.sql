--Creando el procedimiento almacenado para la Tarea-3
-- Este procedimiento almacenado se encargara de crear una nueva peticion en la tabla requests que contendrá una x cantidad de pokemons

-- INICIO DEL PROCEDIMIENTO
CREATE PROCEDURE Pokequeue.create_pokerequest(
    @type NVARCHAR(255),
    @sample_size INT
)
AS

SET NOCOUNT ON; --Para que no nos envie el resultado de ninguna operacion insert, update o delete como parte del resultado (solo interesa el resultado del select)

INSERT INTO Pokequeue.[requests](
    [type],
    [url],
    [id_status],
    [sample_size]   -- Se agrega el valor de sample_size a la insercion
) VALUES (
    @type, 
    '', 
    (SELECT id FROM Pokequeue.[statuses] WHERE description = 'sent'),
    @sample_size
)

SELECT MAX(id) AS id_request, @sample_size AS sample_size FROM Pokequeue.[requests];
-- FIN DEL PROCEDIMIENTO

--Probando el procedimiento almacenado
-- Se crea una nueva petición de tipo 'fire' con un tamaño de muestra de 0 (En realidad el backend creara el csv con todos los pokemons de ese tipo)
EXEC Pokequeue.create_pokerequest 'fire', 0;
