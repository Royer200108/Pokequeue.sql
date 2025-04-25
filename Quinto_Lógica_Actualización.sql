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

SELECT * FROM Pokequeue.[requests];
DELETE FROM Pokequeue.[requests] WHERE id < 24;

SELECT * FROM Pokequeue.[statuses] WHERE description = 'inprogress'

select 
            r.id as ReportId,
            s.description as Status,
            r.type as PokemonType,
            r.url,
            r.created,
            r.updated
        from pokequeue.requests r
        inner join pokequeue.statuses s on r.id_status = s.id

UPDATE Pokequeue.[requests] SET url = 'https://samypokequeuedev.blob.core.windows.net/reports/poke_report_25.csv' where id = 25