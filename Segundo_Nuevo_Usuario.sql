--Creamos un nuevo login para la app (Esto se ejecuta sobre master)
create login PokeQueueApp with PASSWORD = 'Hol@Mundo2025!';

--EL resto de instrucciones se ejecuta sobre la BD mypokequeuedb
--Creando un nuevo usuario
CREATE user PokeQueueAppUser for login PokeQueueApp;

--Otrorgando permisos al nuevo usuario (restringiendo acceso a lo demas)
GRANT SELECT ON SCHEMA :: Pokequeue TO PokeQueueAppUser;
GRANT INSERT ON SCHEMA :: Pokequeue TO PokeQueueAppUser;
GRANT UPDATE ON SCHEMA :: Pokequeue TO PokeQueueAppUser;
GRANT DELETE ON SCHEMA :: Pokequeue TO PokeQueueAppUser;
GRANT EXECUTE ON SCHEMA :: Pokequeue TO PokeQueueAppUser;