-- SubConsultas
SELECT MnoMateria, Mnombre, McostoLab, MnoCarrera
FROM materia
WHERE Mcostolab = 
(SELECT MIN(McostoLAB)
FROM materia
WHERE MnoCarrera = '32' and not McostoLab = 0);

--Ejemplo: Traer el nombre de la carrera con el maximo costo de laboratorio
SELECT MAX(McostoLAB)
FROM materia;

-- El sistema regresa valor a 500 lo que podria escribir

SELECT MnoCarrera, Mnombre
FROM materia
WHERE McostoLab = 500;

-- Sustituyendo el 500 por la primera consulta queda

SELECT MnoCarrera, Mnombre
FROM materia
WHERE McostoLab = (SELECT MAX(McostoLAB)
FROM materia);
/*
Diferencias entre una subconsulta y una sentencia SELECT:
1.- Una subconsulta solo debe producir una columna de datos como resultado, es
    decir que una subconsulta solo tiene un elemento en la clausula SELECT
2.- La clausula ORDER BY no puede ser especificada en una subconsulta
3.- Los resultados de una subconsulta no son visibles, esta es la razon por la
    que la clausula ORDER BY no tiene sentido en la subconsulta
4.- Una Subconsulta no puede ser la union de varias sentencias diferentes, solo
    se permite una sentencia SELECT
*/
-- Ejemplo: Seleccionar el numero , nombre y tarifa de laboratorio de cualquier
--          curso que tenga una tarifa mayor o igual al 5% del sueldo de 
--          cualquier maestro

SELECT MnoMateria, Mnombre, McostoLab
FROM materia
WHERE McostoLab >
(
SELECT MIN(academic.Asueldo * 0.05)
FROM academic
);


-- Test de pertenencia a  un conjunto (IN)
-- IN 
-- EJEMPLO : Reportar el nombre y el sueldo de cada maestro que trabajan  en la
--           carrera que su cordinacion esta en el edificio A501

SELECT Anombre, Asueldo
FROM academic
WHERE AnoCarrera IN (
SELECT CnoCarrera
FROM carrera
WHERE Cedificio = 'A501'
);

-- Test de existencia (EXIST)
-- EXISTS : Este test comprueba si una subconsulta produce alguna fila de resul
-- Ejemplo: Lista los grupos que tengan profesor dado de alta en la tabla
--          academic

SELECT Gnogrupo, GnoMaestro
FROM grupo
WHERE exists (
SELECT * 
FROM academic
WHERE AnoEmplead = GnoMaestro
);


--SubConsulta anidada
-- Ejemplo: Visualisar el numero y nombre de academico que sea coordinador de
--          la carrera que tenga materias con 8 creditos

SELECT AnoEmplead, Anombre
FROM academic
WHERE AnoEmplead In (
    SELECT Ccoord
    FROM carrera
    WHERE CnoCarrera in (
        SELECT MnoCarrera 
        FROM materia
        WHERE Mcred = 8
    )
);

-- SunConsulta en la clausula HAVING
/*
Aunque la mayoria de las subconsultas se encuentran en la clausula WHERE,
tambien pueden utilizarse en la clausula HAVING, funcionando como parte de la
seleccion de grupos. la sistaxis de la subconsulta es la misma en ambos casos.
*/
-- Ejemplo : Reportar el numero de carrera y el costo promedio de laboratorios
--           de la carrera, para las carreras con un promedio del costo de
--           laboratorio por abajo del promedio de todos los laboratorios.

SELECT MnoCarrera, AVG(McostoLab)
FROM materia
GROUP BY MnoCarrera
HAVING AVG (McostoLab) < 
(
    SELECT AVG(McostoLab)
    FROM materia
);
