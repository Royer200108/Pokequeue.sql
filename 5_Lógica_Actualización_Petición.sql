-- Procedimiento para actualizar el estado de una solicitud de Pokémon
-- INICIO DEL PROCEDIMIENTO
CREATE PROCEDURE Pokequeue.update_pokerequest(
    @id INT,
    @status NVARCHAR(255),
    @url NVARCHAR(1000)
)
AS 
SET NOCOUNT ON;

UPDATE Pokequeue.[requests]
SET 
    id_status = (SELECT id FROM Pokequeue.[statuses] WHERE description = @status),
    url = @url,
    updated = GETDATE()
WHERE id = @id

SELECT 1 AS COMPLETED;
-- FIN DEL PROCEDIMIENTO


-- Consulta utilizada para extraer las solicitudes de Pokemon que se han realizado
select 
            r.id as ReportId,
            s.description as Status,
            r.type as PokemonType,
            r.url,
            r.created,
            r.updated
        from pokequeue.requests r
        inner join pokequeue.statuses s on r.id_status = s.id
