--CREATE PROCEDURE Pokequeue.create_pokerequest(
ALTER PROCEDURE Pokequeue.create_pokerequest(
    @type NVARCHAR(255),
    @sample_size INT
)
AS

SET NOCOUNT ON; --Para que no nos envie el resultado de ninguna operacion insert, update o delete como parte del resultado (solo interesa el resultado del select)

INSERT INTO Pokequeue.[requests](
    [type],
    [url],
    [id_status],
    [sample_size]
) VALUES (
    @type, 
    '', 
    (SELECT id FROM Pokequeue.[statuses] WHERE description = 'sent'),
    @sample_size
)

SELECT MAX(id) AS id_request, @sample_size AS sample_size FROM Pokequeue.[requests];

--Siendo el resultado de este procedimiento lo que se almacenara en la cola
EXEC Pokequeue.create_pokerequest 'fire', 0;

SELECT * FROM Pokequeue.[requests];