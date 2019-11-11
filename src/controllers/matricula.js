const router = require('express').Router();
const { estudiantes } = require('../models/estudiante/estudianteRegistro'); // JSON CHAIRA
const estudianteModel = require('../models/estudiante/estudianteModel');
const equipoModel = require('../models/equipo/equipoModel')

//GET 
router.get('/matricula/:id/:estado?', async (req, res) => {
     const idEstudiante = req.params.id;
      const equipos = await equipoModel.consultarEquipos();
     const { estudiante, valido } = estudianteModel.consultar(idEstudiante);
     res.render('matricula/matricula', { estudiante, valido, equipos, idEstudiante });
});


router.get('/matricular/:id/:idCurso', (req, res) => {
     console.log('ESTA AQUI')
})

 
module.exports = router;