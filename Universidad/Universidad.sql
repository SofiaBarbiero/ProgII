CREATE DATABASE UNIVERSIDAD
GO

USE UNIVERSIDAD
GO

--Creación de tablas
CREATE TABLE Carreras
(idCarrera INT IDENTITY(1,1),
 nombre VARCHAR(200) NOT NULL,
 titulo VARCHAR(200),
 CONSTRAINT pk_carrera PRIMARY KEY(idCarrera))

CREATE TABLE Materias
(idMateria INT IDENTITY(1,1),
 nombre VARCHAR(100),
 CONSTRAINT pk_materia PRIMARY KEY(idMateria))

CREATE TABLE DetalleCarreras
(idDetalleCarrera INT IDENTITY(1,1),
 idCarrera INT NOT NULL,
 anioCursado DATETIME,
 cuatrimestre INT,
 idMateria INT,
 CONSTRAINT pk_detalle PRIMARY KEY(idDetalleCarrera),
 CONSTRAINT fk_detalle_carreras FOREIGN KEY(idCarrera)
	REFERENCES Carreras(idCarrera),
 CONSTRAINT fk_detalle_materias FOREIGN KEY(idMateria)
	REFERENCES Materias(idMateria))

--Insert carreras
INSERT INTO Carreras (nombre, titulo) VALUES ('Tecnicatura Universitaria en Programación', 'Programador');
INSERT INTO Carreras (nombre, titulo) VALUES ('Ingeniería en Sistemas', 'Ingeniero');
INSERT INTO Carreras (nombre, titulo) VALUES ('Ingeniería Civil', 'Ingeniero Civil');

--Insert materias
INSERT INTO Materias (nombre) VALUES ('Programación I');
INSERT INTO Materias (nombre) VALUES ('Laboratorio en Computación');
INSERT INTO Materias (nombre) VALUES ('Estadística');
INSERT INTO Materias (nombre) VALUES ('Matemática');
INSERT INTO Materias (nombre) VALUES ('Telecomunicación');
INSERT INTO Materias (nombre) VALUES ('Sistemas de Información');
INSERT INTO Materias (nombre) VALUES ('Hidráulica');
INSERT INTO Materias (nombre) VALUES ('Topografía');
INSERT INTO Materias (nombre) VALUES ('Construcción');

SELECT * FROM Carreras;
SELECT * FROM Materias;

--Insert detalles
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (1, '2022', 1, 1);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (1, '2022', 1, 2);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (1, '2022', 2, 3);

INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (2, '2021', 1, 4);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (2, '2021', 2, 5);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (2, '2022', 3, 6);

INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (3, '2020', 1, 7);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (3, '2020', 2, 8);
INSERT INTO DetalleCarreras (idCarrera, anioCursado, cuatrimestre, idMateria) VALUES (3, '2021', 2, 9);

SELECT * FROM DetalleCarreras


--Creacion de SP (Materias que se dictaron en el x cuatrimestre del año x | x se ingresa por parametro)
CREATE PROCEDURE SP_Materias
@anio INT,
@cuatrimestre INT
AS
	SELECT C.nombre 'Carrera', YEAR(anioCursado) 'Año de cursado', cuatrimestre 'N° Cuatrimestre', M.nombre 'Materia'  
	FROM Carreras C JOIN DetalleCarreras D ON C.idCarrera=D.idCarrera
		 JOIN Materias M ON D.idMateria=M.idMateria
	WHERE YEAR(anioCursado)=@anio AND cuatrimestre=@cuatrimestre
	ORDER BY M.nombre




