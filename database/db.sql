DROP DATABASE equipos_uniamazonia;
CREATE DATABASE equipos_uniamazonia;
use equipos_uniamazonia;

CREATE TABLE director(
     id INT(11) NOT NULL,
     nombres VARCHAR(100) NOT NULL,
     apellidos VARCHAR(100) NOT NULL,
     fecha_nacimiento DATE NOT NULL
);

CREATE TABLE equipo(
     id INT(11) NOT NULL,
     nombre VARCHAR(100) NOT NULL,
     estado VARCHAR(10) NOT NULL,
     cupos INT(11) NOT NULL,
     id_director INT(11) NOT NULL
);

CREATE TABLE lugar(
   id INT(11) NOT NULL,
   nombre VARCHAR(100) NOT NULL,
   estado VARCHAR(10) NOT NULL
);

CREATE TABLE horario(
     id INT(11) NOT NULL,
     dia VARCHAR(50) NOT NULL,
     horas VARCHAR(100) NOT NULL,
     id_lugar INT(11) NOT NULL,
     id_equipo INT(11) NOT NULL
);
 

CREATE TABLE matricula(
     id_estudiante INT(11) NOT NULL,
     id_equipo INT(11) NOT NULL,
     codigo INT(11) NOT NULL,
     estado VARCHAR(11) NOT NULL
);
 
ALTER TABLE director ADD PRIMARY KEY(id);


ALTER TABLE equipo ADD PRIMARY KEY(id);
ALTER TABLE equipo MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;
ALTER TABLE equipo ADD CONSTRAINT FOREIGN KEY (id_director) REFERENCES director(id);

ALTER TABLE lugar ADD PRIMARY KEY(id);
ALTER TABLE lugar MODIFY id INT(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE horario ADD PRIMARY KEY(id);
ALTER TABLE horario MODIFY id INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE horario ADD CONSTRAINT FOREIGN KEY (id_lugar) REFERENCES lugar(id);
ALTER TABLE horario ADD CONSTRAINT FOREIGN KEY (id_equipo) REFERENCES equipo(id);

ALTER TABLE matricula ADD PRIMARY KEY(codigo);
ALTER TABLE matricula MODIFY codigo INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE matricula ADD CONSTRAINT FOREIGN KEY (id_equipo) REFERENCES equipo(id);


INSERT INTO director(id, nombres, apellidos, fecha_nacimiento)
values (123, 'Roberto','Gonzales Villanueva', '1998-02-03' );

INSERT INTO equipo(id, nombre, estado, cupos, id_director)
values (3, 'Equipo de baloncesto Femenino', 'A',15, 123);


INSERT INTO equipo(id, nombre, estado, cupos, id_director)
values (4, 'Equipo de baloncesto Masculino', 'A',25, 123);


INSERT INTO equipo(id, nombre, estado, cupos, id_director)
values (5, 'Equipo de Ultimate Femenino', 'A',30, 123);

INSERT INTO lugar(id, nombre, estado) values (1,'Concha Acustica','Activo');

INSERT INTO horario (dia,horas, id_lugar, id_equipo) 
values('Jueves y Viernes', '8:00 AM A 10:00 PM',1,1);


INSERT INTO horario (dia,horas, id_lugar, id_equipo) 
values('Miercoles y Jueves', '8:00 AM A 10:00 PM',1,3);


INSERT INTO horario (dia,horas, id_lugar, id_equipo) 
values('Lunes y Jueves', '6:00 AM A 8:00 AM',1,5);