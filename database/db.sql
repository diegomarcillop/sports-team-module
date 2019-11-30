DROP DATABASE equipos_uniamazonia;
CREATE DATABASE equipos_uniamazonia;
use equipos_uniamazonia;

CREATE TABLE director(
     id INT(11) NOT NULL,
     nombres VARCHAR(100) NOT NULL,
     apellidos VARCHAR(100) NOT NULL,
     fecha_nacimiento DATE NOT NULL
);

CREATE TABLE lugar(
   id INT(11) NOT NULL,
   nombre VARCHAR(100) NOT NULL,
   estado VARCHAR(10) NOT NULL
);

CREATE TABLE horas(
     id INT(11) NOT NULL,
     nombre VARCHAR(100) NOT NULL
);

CREATE TABLE dias(
     id INT(11) NOT NULL,
     nombre VARCHAR(100) NOT NULL
);

CREATE TABLE genero(
     id INT(11) NOT NULL,
     nombre VARCHAR(100) NOT NULL
);

CREATE TABLE horario(
     id INT(11) NOT NULL,
     id_dias INT (11) NOT NULL,
     id_horas INT(11) NOT NULL,
     id_lugar INT(11) NOT NULL,
     estado VARCHAR(10) NOT NULL
 );
 
CREATE TABLE equipo(
     id INT(11) NOT NULL,
     nombre VARCHAR(100) NOT NULL,
     estado VARCHAR(10) NOT NULL,
     cupos INT(11) NOT NULL,
     id_director INT(11) NOT NULL,
     id_genero INT(11) NOT NULL,
     id_horario INT(11) NOT NULL
);
 

CREATE TABLE matricula(
     id_estudiante INT(11) NOT NULL,
     id_equipo INT(11) NOT NULL,
     codigo INT(11) NOT NULL,
     estado VARCHAR(11) NOT NULL
 );
 
ALTER TABLE director ADD PRIMARY KEY(id);

ALTER TABLE lugar ADD PRIMARY KEY(id); 
ALTER TABLE horas ADD PRIMARY KEY(id);
ALTER TABLE dias ADD PRIMARY KEY(id);
ALTER TABLE genero ADD PRIMARY KEY(id);


ALTER TABLE horario ADD PRIMARY KEY(id);
ALTER TABLE horario ADD CONSTRAINT FOREIGN KEY (id_lugar) REFERENCES lugar(id);
ALTER TABLE horario ADD CONSTRAINT FOREIGN KEY (id_dias) REFERENCES dias(id);
ALTER TABLE horario ADD CONSTRAINT FOREIGN KEY (id_horas) REFERENCES horas(id);
 

ALTER TABLE equipo ADD PRIMARY KEY(id);
ALTER TABLE equipo ADD CONSTRAINT FOREIGN KEY (id_director) REFERENCES director(id);
ALTER TABLE equipo ADD CONSTRAINT FOREIGN KEY (id_genero) REFERENCES genero(id);
ALTER TABLE equipo ADD CONSTRAINT FOREIGN KEY (id_horario) REFERENCES horario(id);


ALTER TABLE matricula ADD PRIMARY KEY(codigo);
ALTER TABLE matricula ADD CONSTRAINT FOREIGN KEY (id_equipo) REFERENCES equipo(id); 
ALTER TABLE matricula MODIFY codigo INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;


INSERT INTO lugar(id, nombre, estado) values (1,'Concha Acustica','Activo');
INSERT INTO lugar(id, nombre, estado) values (2,'Canchas sinteticas','Activo');


INSERT INTO dias(id,nombre) values (1,'Lunes');
INSERT INTO dias(id,nombre) values (2,'Martes');
INSERT INTO dias(id,nombre) values (3,'Miercoles');
INSERT INTO dias(id,nombre) values (4,'Jueves');
INSERT INTO dias(id,nombre) values (5,'Viernes');
INSERT INTO dias(idnombre) values (6,'Sabado');

INSERT INTO horas(id,nombre) values(1,'6AM-8AM');
INSERT INTO horas(id,nombre) values(2,'8AM-10AM');
INSERT INTO horas(id,nombre) values(3,'11AM-12AM');
INSERT INTO horas(id,nombre) values(4,'1PM-2PM');
INSERT INTO horas(id,nombre) values(5,'2PM-4PM');
INSERT INTO horas(id,nombre) values(6,'6PM-8PM');
INSERT INTO horas(id,nombre) values(7,'8PM-10PM');
INSERT INTO horas(id,nombre) values(8,'10AM-12AM');

INSERT INTO director(id, nombres, apellidos, fecha_nacimiento) values (1, 'Roberto','Gonzales Villanueva', '1998-02-03' );
INSERT INTO director(id, nombres, apellidos, fecha_nacimiento) values (2, 'Marcos','Vidal Garzon', '1998-02-04' );

INSERT INTO genero(id,nombre) values(1, 'Masculino');
INSERT INTO genero(id,nombre) values(2, 'Femenino');
INSERT INTO genero(id,nombre) values(3, 'Mixto');


INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(1, 1,1,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(2, 2,2,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(3, 3,3,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(4, 4,4,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(5, 5,5,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(6, 6,6,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(7, 1,1,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(8, 2,2,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(9, 3,3,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(10, 4,4,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(11, 5,5,1,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(12, 1,1,2,'Activo'); 
INSERT INTO horario (id,id_dias, id_horas, id_lugar, estado)  values(13, 2,2,1,'Activo'); 



INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (1, 'Equipo de Baloncesto', 'Activo',20,1, 1,1);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (2, 'Equipo de MicroFutbol', 'Activo',20,2, 1,2);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (3, 'Equipo de Bolley', 'Activo',20,1, 1,3);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (4, 'Equipo de Balonmano', 'Activo',20,2, 1,4);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (5, 'Equipo de Futbol Americano', 'Activo',20,1, 1,5);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (6, 'Equipo de Ruby', 'Activo',20,2, 1,6);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (7, 'Equipo de Ultimate', 'Activo',20,1, 1,7);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (8, 'Equipo de Tenis', 'Activo',20,2, 1,8);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (9, 'Equipo de Atletismo', 'Activo',20,1, 1,9);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (10, 'Equipo de Baloncesto', 'Activo',20,2, 2,10);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (11, 'Equipo de MicroFutbol', 'Activo',20,1, 2,11);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (12, 'Equipo de Bolley', 'Activo',20,2, 2,12);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (13, 'Equipo de Ruby', 'Activo',20,1,2,13);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (14, 'Equipo de Ultimate', 'Activo',20,2, 2,1);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (15, 'Equipo de Tenis', 'Activo',20,1, 2,2);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (16, 'Equipo de Atletismo', 'Activo',20,2, 2,3);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (17, 'Equipo de MicroFutbol', 'Activo',20,1, 3,4);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (18, 'Equipo de Ruby', 'Activo',20,2, 3,5);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (19, 'Equipo de Ultimate', 'Activo',20,1, 3,6);
INSERT INTO equipo(id, nombre, estado, cupos, id_director, id_genero, id_horario) values (20, 'Equipo de Balonmano', 'Activo',20,2, 3,7);

DELIMITER $$
CREATE PROCEDURE operar_cupos (IN id_equipo INT, IN bandera INT)
BEGIN
IF(bandera = 0) THEN
     UPDATE equipo SET cupos = cupos-1 WHERE equipo.id = id_equipo;
ELSEIF (bandera =1) THEN
	UPDATE equipo SET cupos = cupos+1 WHERE equipo.id = id_equipo;
END IF;

END$$ 