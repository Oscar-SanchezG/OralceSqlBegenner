/*
La sentencia Insert se usa para agregar filas en una tabla, la tabla puede 
estar vacia o contener informacion

La sentencia UPDATE es Utilizada para modificar los dtos existentes en las
tablas.

La sentencia DELETE elimina una o mas filas de una tabla 
*/

-- Adiccion de datos INSERT
-- Ejemplo: Supongamos que la carrera de computacion ofrece una nueva materia
--          con el nombre de "Programacion con SQL" y con la clave 0177


INSERT INTO materia
VALUES ('0177', 'Programacion con SQL', 6, 100.00, 32);
/*
INSERT INTO materia (MnoMateria, Mnombre, Mcred, McostoLab, MnoCarrera)
VALUES ('0177', 'Programacion con SQL', 6, 100.00, 32);
*/

SELECT * FROM materia WHERE MnoMateria = '0177';

-- Insercion de valores NULL
/*
Ejemplo: Insertar una fila en la tabla materia, la nueva materia es 
         "SQL dinamico" la clave es 0178 y es de la carrera de computacion. Los 
         creditos y el costo de laboratorio son desconocidos
*/

INSERT INTO materia
VALUES ('0178', 'SQL Dinamico', null, null, 32);

INSERT INTO materia (MnoMateria, Mnombre, MnoCarrera)
VALUES ('0178', 'SQL Dinamico', 32);

SELECT * FROM materia WHERE MnoMateria = '0178';

-- La sentencia Inset miltifila
/*
INSERT INTO nombre de la tabla [( Nombre de las columnas)]
Consulta

Ejemplo: Copiar los cursos de computacion de la tabla materias en la tabla
cmatria
*/

INSERT INTO cmateria
SELECT *
FROM materia 
WHERE MnoCarrera = 32; 

SELECT * FROM cmateria;
SELECT * FROM materia;


-- Suprecion de datos DELETE
/*
Cuando se la de baja un maestro, cuando un alumno se da de baja en la U, cuando
se actuliza el plan de estudios y se dan de baja algunas materias.

Sintaxis
DELETE FROM Nombre de la tabla
WHERE condicion de busqueda

Ejemplo: Borrar todos los registro de la tabla materia que su numero de curso 
comience con '00'
*/
SELECT * FROM materia
where MnoMateria LIKE '00%';

DELETE FROM materia
WHERE MnoMateria Like '00%';

SELECT * FROM cmateria;

DELETE FROM cmateria;
-- Modificacion de datos UPDATE
/*
Cuando un maestro cambia de domicilio o es ascendido, cuando un alumno cambia
de carrera o materias que desea cursar

Con DELETE borramos filas completas

Pero al actulizar, modificamos solo columnas

Ejemplo Cambiar la tarifa de laboratorio en la materia 0177 a $150
*/

SELECT * FROM materia
WHERE MnoMateria = '0177';

UPDATE materia
SET McostoLab = 160.00
WHERE MnoMateria = '0177';

SELECT * FROM materia
WHERE MnoMateria = '0177';

UPDATE materia
SET Mcred = Mcred - 1;

SELECT * FROM materia ;