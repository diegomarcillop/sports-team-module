const db = require('../../database')

exports.consultarEquipos = async (idEstudiante, genero) => {
    //Pendiente
    const equipos = await db.query(` SELECT equipo.id, equipo.nombre, equipo.cupos, genero.nombre AS genero FROM equipo INNER JOIN genero ON genero.id = equipo.id_genero WHERE equipo.id NOT IN (SELECT matricula.id_equipo FROM matricula    WHERE matricula.id_estudiante =  ${idEstudiante}) AND  genero.nombre = '${genero}'  OR genero.nombre = 'Mixto';`);
    //console.log(equipo);
    return equipos;
}

exports.consultarEquipo = async (idEquipo) => {
    const equipo = await db.query(' SELECT  equipo.id, equipo.estado, equipo.cupos, director.nombres, director.apellidos, dias.nombre AS dias, horas.nombre AS horas, lugar.nombre  AS lugarNombre, genero.nombre AS genero  FROM equipo INNER JOIN director ON equipo.id_director = director.id   INNER JOIN  horario ON horario.id = equipo.id_horario INNER JOIN lugar ON horario.id_lugar = lugar.id INNER JOIN horas ON horas.id = horario.id_horas INNER JOIN dias ON dias.id= horario.id_dias INNER JOIN genero ON genero.id=equipo.id_genero WHERE equipo.id=' + idEquipo + " ;");
    return equipo;
};


exports.registrar = async (idEstudiante, idEquipo) => {
    const equipo = await db.query(`INSERT INTO matricula ( id_estudiante, id_equipo, estado) VALUES (${idEstudiante}, ${idEquipo}, "Activa");`);
    await db.query(`CALL operar_cupos(${idEquipo},0)`); 
    return equipo;
};

exports.generarHorario = async (idEstudiante) => {
    const horario = await db.query(`SELECT  matricula.id_equipo, matricula.id_estudiante ,matricula.codigo, equipo.id AS idEquipo, equipo.nombre AS equipoNombre, director.nombres AS directorNombres, director.apellidos AS directorApellidos, dias.nombre AS dias, horas.nombre AS horas , lugar.nombre AS lugarNombre FROM matricula INNER JOIN equipo ON matricula.id_equipo = equipo.id INNER JOIN director ON director.id = equipo.id_director INNER JOIN horario ON horario.id = equipo.id_horario INNER JOIN lugar ON lugar.id = horario.id_lugar INNER JOIN horas ON  horas.id = horario.id_horas INNER JOIN dias ON dias.id = horario.id_dias WHERE matricula.id_estudiante =${idEstudiante} GROUP BY matricula.id_equipo;`)
     return horario;
};

exports.eliminar = async (idEstudiante, idMatricula, idEquipo) => {
    console.log(`DELETE FROM matricula WHERE matricula.id_estudiante = ${idEstudiante} AND matricula.codigo = ${idMatricula};`);
    const eliminado = await db.query(`DELETE FROM matricula WHERE matricula.id_estudiante = ${idEstudiante} AND matricula.codigo = ${idMatricula};`);
    await db.query(`CALL operar_cupos(${idEquipo},1)`); 

    console.log(eliminado);
    
}