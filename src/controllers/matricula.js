const router = require('express').Router();
const { estudiantes } = require('../models/estudiante/estudianteRegistro'); // JSON CHAIRA
const estudianteModel = require('../models/estudiante/estudianteModel');
const equipoModel = require('../models/equipo/equipoModel')

//global variables
let bandera = false;
let idEstudiante;
/// ROUTER
//GET
router.get('/matricula/:id/:idEquipo?/:estado?', async (req, res) => {
     idEstudiante = req.params.id;
     const equipos = await equipoModel.consultarEquipos(idEstudiante);
    
     const { estudiante, valido } = estudianteModel.consultar(idEstudiante);
     bandera = req.params.estado;
     let  equipo = {};
     if(req.params.estado){
           equipo = await equipoModel.consultarEquipo(req.params.idEquipo);
     }

     const horario = await equipoModel.generarHorario(idEstudiante);
    
    res.render('matricula/matricula', { estudiante, valido, equipos, idEstudiante, bandera, equipo, horario });
});


router.get('/matricularEquipo/:idEstudiante/:idEquipo', async (req, res) => {
    // variables
     idEstudiante = req.params.idEstudiante;
     const idEquipo = req.params.idEquipo;
     const result = await equipoModel.registrar(idEstudiante, idEquipo);
     
     res.redirect(`/matricula/${idEstudiante}`);

})

router.get('/cancelarMatricula/:idEstudiante/:idMatricula', async (req, res) => {
     idEstudiante = req.params.idEstudiante;
     const  idMatricula = req.params.idMatricula;

     console.log('id matricula ->' + idMatricula)
     const result = await equipoModel.eliminar(idEstudiante, idMatricula);

     res.redirect(`/matricula/${idEstudiante}`);
});
 
module.exports = router;