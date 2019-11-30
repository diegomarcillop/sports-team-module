const router = require('express').Router();
const { estudiantes } = require('../models/estudiante/estudianteRegistro'); // JSON CHAIRA
const estudianteModel = require('../models/estudiante/estudianteModel');
const equipoModel = require('../models/equipo/equipoModel')

//global variables
let bandera = false;
let idEstudiante;
/// ROUTER
//GET
router.get('/matricula/:id?/:idEquipo?/:estado?', async (req, res) => {
    idEstudiante = req.params.id;
    const { estudiante, valido, genero } = estudianteModel.consultar(idEstudiante);
    const horario = await equipoModel.generarHorario(idEstudiante);
    const equipos = await equipoModel.consultarEquipos(idEstudiante, genero);
    let equipo = {};
    bandera = req.params.estado;
    
    if (req.params.estado) {
        equipo = await equipoModel.consultarEquipo(req.params.idEquipo);
    }

    res.render('matricula/matricula', { estudiante, valido, equipos, idEstudiante, bandera, equipo, horario });
});


router.get('/matricularEquipo/:idEstudiante/:idEquipo', async (req, res) => {
    // variables
    idEstudiante = req.params.idEstudiante;
    const idEquipo = req.params.idEquipo;
    await equipoModel.registrar(idEstudiante, idEquipo);
    res.redirect(`/matricula/${idEstudiante}`);

})

router.get('/cancelarMatricula/:idEstudiante/:idMatricula/:idEquipo', async (req, res) => {
    idEstudiante = req.params.idEstudiante;
    const idMatricula = req.params.idMatricula;
    const idEquipo = req.params.idEquipo;
    await equipoModel.eliminar(idEstudiante, idMatricula, idEquipo);

    res.redirect(`/matricula/${idEstudiante}`);
});
/*
    lo del horario, que puede estar en muchos equipos
    Lo del filtro de genero [femenino, masculino, mixto]
    Filtro en el caso de matricular una materia que este en el mismo horario 
    Inyección de dependencias.
*/
module.exports = router;