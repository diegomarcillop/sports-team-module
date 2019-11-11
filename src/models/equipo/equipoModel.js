const db = require('../../database')

exports.consultarEquipos = async () => {
     //Pendiente
    const equipo =  await db.query('  SELECT  equipo.id, equipo.nombre, equipo.estado, equipo.cupos, director.nombres, director.apellidos, horario.dia, horario.horas, lugar.nombre  AS lugarNombre  FROM equipo INNER JOIN director ON equipo.id_director = director.id   INNER JOIN  horario ON horario.id_equipo = equipo.id INNER JOIN lugar ON horario.id_lugar = lugar.id; ');
    //console.log(equipo);
    return equipo;
}

