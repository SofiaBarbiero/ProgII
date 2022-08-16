CREATE DATABASE UNIVERSIDAD
GO

USE UNIVERSIDAD
GO

--Creaci�n de tablas
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
INSERT INTO Carreras (nombre, titulo) VALUES ('Tecnicatura Universitaria en Programaci�n', 'Programador');
INSERT INTO Carreras (nombre, titulo) VALUES ('Ingenier�a en Sistemas', 'Ingeniero');
INSERT INTO Carreras (nombre, titulo) VALUES ('Ingenier�a Civil', 'Ingeniero Civil');

--Insert materias
INSERT INTO Materias (nombre) VALUES ('Programaci�n I');
INSERT INTO Materias (nombre) VALUES ('Laboratorio en Computaci�n');
INSERT INTO Materias (nombre) VALUES ('Estad�stica');
INSERT INTO Materias (nombre) VALUES ('Matem�tica');
INSERT INTO Materias (nombre) VALUES ('Telecomunicaci�n');
INSERT INTO Materias (nombre) VALUES ('Sistemas de Informaci�n');
INSERT INTO Materias (nombre) VALUES ('Hidr�ulica');
INSERT INTO Materias (nombre) VALUES ('Topograf�a');
INSERT INTO Materias (nombre) VALUES ('Construcci�n');

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


--Creacion de SP (Materias que se dictaron en el x cuatrimestre del a�o x | x se ingresa por parametro)
CREATE PROCEDURE SP_Materias
@anio INT,
@cuatrimestre INT
AS
	SELECT C.nombre 'Carrera', YEAR(anioCursado) 'A�o de cursado', cuatrimestre 'N� Cuatrimestre', M.nombre 'Materia'  
	FROM Carreras C JOIN DetalleCarreras D ON C.idCarrera=D.idCarrera
		 JOIN Materias M ON D.idMateria=M.idMateria
	WHERE YEAR(anioCursado)=@anio AND cuatrimestre=@cuatrimestre
	ORDER BY M.nombre




