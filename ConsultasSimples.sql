-- Select
SELECT cnocarrera, cnombre FROM carrera;

-- Columnas calculada
SELECT mnombre, mcostolab,mcostolab *10 as ayuda from materia;

-- Select Columnas constantes
SELECT 'La materia',Mnombre, 'Tiene', Mcred, 'creditos' from materia;

-- Select Distinct eliminacion de filas duplicadas
SELECT MnoCarrera  FROM materia;
SELECT DISTINCT MnoCarrera  FROM materia;

-- Clausula Where
-- (X = Y), (X <> ), (X != Y), (X < y), (X > Y), (X >= Y), (X <= Y)

select MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab 
from materia 
where Mcostolab < 100;

-- Predicado de rango Between

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera, Mcostolab
FROM materia 
WHERE McostoLab BETWEEN 100 AND 200;

SELECT MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab
FROM materia
WHERE McostoLab >= 100 AND McostoLab <= 200;

SELECT MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab
from materia
WHERE MCostoLab NOT BETWEEN 100 AND 200;

SELECT MnoMateria, Mnombre, Mcred, MnoCarrera, Mcostolab
FROM materia
WHERE Mnombre BETWEEN 'B' AND 'D';

-- Predicado de pertenencia  a un conjunto (IN)

SELECT MnoMateria, Mnombre, Mcred, Mnocarrera, McostoLab
FROM materia
WHERE Mcred in (10, 8, 7);

SELECT MnoMateria, Mnombre, Mcred, Mnocarrera, McostoLab
FROM materia
WHERE Mcred not in (10, 8, 7);

SELECT MnoMateria, Mnombre, Mcred, Mnocarrera, McostoLab
FROM materia
WHERE Mcred <> 10 and Mcred <> 8 and Mcred <> 7;

-- Predicado de pertenencia de patron (LIKE)

SELECT Mnombre, Mnombre, Mcred, Mnocarrera, Mcostolab
FROM materia
WHERE Mnombre LIKE '%Maquina%';

SELECT Mnombre, Mnombre, Mcred, Mnocarrera, Mcostolab
FROM materia
WHERE Mnombre NOT LIKE '%Maquina%';

SELECT Mnombre, Mnombre, Mcred, Mnocarrera, Mcostolab
FROM materia
WHERE Mnombre LIKE '%M_quina%';

SELECT Mnombre, Mnombre, Mcred, Mnocarrera, Mcostolab
FROM materia
WHERE Mnombre NOT LIKE '_i%';

-- Predicado de valor nulo(IS NULL)
-- Ejemplo encontrar los grupos que no tienen un maestro asignado

SELECT * from grupo;

SELECT GnoGrupo, GnoMateria, GnoMaestro, Gdias, Gsalon
FROM Grupo
WHERE GnoMaestro is Null; 

SELECT GnoGrupo, GnoMateria, GnoMaestro, Gdias, Gsalon
FROM Grupo
WHERE GnoMaestro is Not Null; 

-- Predicados compuestos. Operadores AND OR y NOT
-- Si la clausula WHERE no tiene nungun parentesis, el sistema sigue 
-- la siguiente secuencia NOT AND OR

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera 
FROM Materia
WHERE MnoCarrera = 32 or MnoCarrera = 38;

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab 
FROM Materia
WHERE MnoCarrera = 32 and McostoLab > 100;

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera 
FROM Materia
WHERE not MnoCarrera = 32;

--Ordenacion de los resultados de una consulta (Clausula ORDER BY)

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab 
FROM Materia
ORDER BY McostoLab DESC, Mnombre DESC;

SELECT  MnoMateria, Mnombre, Mcred, MnoCarrera, McostoLab 
FROM Materia
ORDER BY McostoLab ASC;


SELECT MnoMateria, Mnombre, McostoLab *1.10
FROM materia
ORDER BY 3 asc;
-- Alias de tablas

SELECT  carrera.CnoCarrera, carrera.Cnombre
FROM carrera;

SELECT m.MnoMateria, m.Mnombre
FROM materia m
WHERE m.MnoMateria = '0076';