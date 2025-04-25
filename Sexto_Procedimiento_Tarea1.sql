CREATE OR ALTER PROCEDURE Pokequeue.delete_pokerequest
    @id INT
AS 
SET NOCOUNT ON;

-- Elimina y captura la URL en una sola operación
DELETE FROM Pokequeue.[requests] 
OUTPUT DELETED.url AS deleted_url
WHERE id = @id;

EXEC Pokequeue.delete_pokerequest 45;