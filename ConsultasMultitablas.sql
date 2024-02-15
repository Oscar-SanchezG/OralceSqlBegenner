-- Consultas Padre / hijo

SELECT * FROM materia;

SELECT Mnombre, MnoMateria, MnoCarrera, Cnombre
FROM materia, carrera
WHERE CnoCarrera = MnoCarrera;
--Uso del operador JOIN

SELECT Mnombre, MnoMateria, MnoCarrera, Cnombre
FROM materia INNER JOIN carrera
ON CnoCarrera = MnoCarrera;

SELECT * FROM grupo;

SELECT GnoMateria, GnoMaestro, Anombre
FROM academic INNER JOIN grupo
ON AnoEmplead = GnoMaestro;

-- Uso de Outer Joins
-- Generar un reporte de todas las materias con un grupo o clase asignada
-- e inclir las materias que no tienen grupo asignado
-- Ya sabemos como mostrar la informacion que coincide en ambas:

SELECT GnoGrupo, Mnombre, Mcred
FROM materia m INNER JOIN grupo g
ON m.Mnomateria = g.Gnomateria;

-- Ahora mostremos todas las filas de tabla materias que esta situada a la
-- izquierda del operador aunque no tengan grupo asignado

SELECT GnoGrupo, Mnombre, Mcred
FROM materia m  LEFT OUTER JOIN grupo g 
ON m.MnoMateria = g.Gnomateria;

SELECT GnoGrupo, Mnombre, Mcred
FROM grupo g  RIGHT OUTER JOIN materia m 
ON m.MnoMateria = g.Gnomateria;
-- Join Criterio de seleccion de fila

SELECT GnoGrupo, Mnombre, Mcred, MnoCarrera
FROM grupo g  RIGHT OUTER JOIN materia m 
ON m.MnoMateria = g.Gnomateria
WHERE MnoCarrera = 32;

SELECT GnoGrupo, Mnombre, Mcred, MnoCarrera, Cnombre
FROM grupo g  RIGHT OUTER JOIN materia m 
INNER JOIN carrera on MnoCarrera = Cnocarrera
ON m.MnoMateria = g.Gnomateria
WHERE MnoCarrera = 32;

-- Combinacion de resultados de consulta (union)
-- Seleccionar todos los numeros de empleado y nombres de maestro

SELECT Anoemplead, Anombre, 'A'
FROM academic;

--Seleccionar todos los numeros de cuenta y nombres de los estudiantes
SELECT EnoCuenta, Enombre, 'E'
FROM estudian;

-- Unir ambas
SELECT Anoemplead numero, Anombre nombre, 'A' tipo
FROM academic
UNION
SELECT EnoCuenta, Enombre, 'E'
FROM estudian
ORDER BY nombre;


