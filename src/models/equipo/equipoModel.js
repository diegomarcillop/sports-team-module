const db = require('../../database')

exports.consultarEquipos = async (idEstudiante) => {
    //Pendiente
    const equipos = await db.query(`SELECT * FROM equipo WHERE equipo.id NOT IN (SELECT matricula.id_equipo FROM matricula WHERE matricula.id_estudiante = ${idEstudiante});`);
    //console.log(equipo);
    return equipos;
}

exports.consultarEquipo = async (idEquipo) => {
    const equipo = await db.query('SELECT  equipo.id, equipo.estado, equipo.cupos, director.nombres, director.apellidos, horario.dia, horario.horas, lugar.nombre  AS lugarNombre  FROM equipo INNER JOIN director ON equipo.id_director = director.id   INNER JOIN  horario ON horario.id_equipo = equipo.id INNER JOIN lugar ON horario.id_lugar = lugar.id WHERE equipo.id =' + idEquipo + " ;");
    return equipo;
};


exports.registrar = async (idEstudiante, idEquipo) => {
    const equipo = await db.query(`INSERT INTO matricula ( id_estudiante, id_equipo, estado) VALUES (${idEstudiante}, ${idEquipo}, "Activa");`);
    return equipo;
};

exports.generarHorario = async (idEstudiante) => {
    const horario = await db.query(`SELECT  matricula.id_equipo, matricula.id_estudiante ,matricula.codigo, equipo.nombre AS equipoNombre, director.nombres AS directorNombres, director.apellidos AS directorApellidos, horario.dia, horario.horas, lugar.nombre AS lugarNombre FROM matricula INNER JOIN equipo ON matricula.id_equipo = equipo.id INNER JOIN director ON director.id = equipo.id_director INNER JOIN horario ON horario.id_equipo = equipo.id INNER JOIN lugar ON lugar.id = horario.id_lugar WHERE matricula.id_estudiante = ${idEstudiante} GROUP BY matricula.id_equipo; `)
    return horario;
};

exports.eliminar = async (idEstudiante, idMatricula) => {
    console.log(`DELETE FROM matricula WHERE matricula.id_estudiante = ${idEstudiante} AND matricula.codigo = ${idMatricula};`);
    const eliminado = await db.query(`DELETE FROM matricula WHERE matricula.id_estudiante = ${idEstudiante} AND matricula.codigo = ${idMatricula};`);
    console.log(eliminado);
    
}