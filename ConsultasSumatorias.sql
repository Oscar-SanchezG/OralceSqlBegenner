--Funciones por columna AVG, SUM, MAX, MIN
--Suma de los valores de columna:
-- EJEMPLO: Cual es la suma de todos los costos de laboratorios?

select SUM(McostoLab) FROM materia;

-- AVG(): Promedio de una columna de valores
-- EJemplo Cual es el valor promedio de todos los costos de laboratorio

SELECT AVG(McostoLab) FROM materia;

-- MAX() MIN(): Muestra el valor minimo de cada columna
-- Ejemplo: Cual es el valor minimo y maximo del costo laboratorio

SELECT MIN(McostoLab) FROM materia;

SELECT MAX(McostoLab) FROM materia;

-- COUNT()
-- Regresa el numero de filas seleccionadas
-- Ejemplo : Cuantas Materias de computacion existen?

SELECT * FROM materia WHERE MnoCarrera = 32;

SELECT COUNT(*) FROM materia WHERE MnoCarrera = 32;

-- Eliminacion de filas duplicadas (DISTINCT)
-- DISTINCT: Regresa el numero de filas seleccionadas
-- Ejemplo: Cuantas carreras diferentas hay en la tabla de materia

SELECT * FROM materia;

SELECT DISTINCT MnoCarrera FROM materia;

SELECT COUNT(DISTINCT MnoCarrera) FROM materia;

--Consultas Agrupadas, clausula GROUP BY
--GROUP BY
-- Ejemplo: Para cada una de las carreras, obtener el promedio del costo
--          de todos los laboratorios

SELECT MnoCarrera, AVG(McostoLab)
FROM Materia
GROUP BY MnoCarrera;

-- Ejemplo: Para cada materia determinar la suma de los costos de laboratorio
--          que tengan 8 creditos. Visualizar la salida en forma decendente 
--          por el numero de carrera

SELECT Mnocarrera, SUM(McostoLab)
FROM materia
WHERE Mcred = 8
GROUP BY MnoCarrera
ORDER BY MnoCarrera DESC;

-- Ejemplo: Listar el maximo costo de laboratorio, agrupado por el numero de
--          creditos y separando las diferente carreras.

SELECT Materia.Mcred, Materia.MnoCarrera, MAX(Materia.McostoLab)
FROM Materia
GROUP  BY Materia.Mcred, Materia.MnoCarrera;

-- Condiciones de busqueda de grupos clausulas HAVING
-- HAVING
-- Ejemplo : Obtener el numero de la carrera y el valor promedio del costo de
--           laboratorio, solo para las carreras en los que el costo promedio
--           Exceda $ 100.

SELECT MnoCarrera, AVG(McostoLab)
FROM materia
GROUP BY MnoCarrera
HAVING AVG(McostoLab) > 100;

-- EJEMPLO : Obternet el numero de la carrera y el valor promedio del costo de
--           laboratoriom para todas las carreras en los que el promerdio exceda
--           Selecciona solamente las filas donde el costo del laboratorio sea
--           mayor a $0

SELECT MnoCarrera, AVG(McostoLab)
FROM materia
WHERE McostoLab > 0   -- que no incluya el 0 en el promedio 
GROUP BY MnoCarrera
HAVING AVG(McostoLab) > 100;



