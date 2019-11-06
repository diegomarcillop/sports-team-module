const router = require('express').Router();
const { estudiantes } = require('../models/estudiante/estudiante'); // JSON CHAIRA


//GET 
router.get('/matricula/:id', (req, res) => {
     let estudiante = {};
     let valido = false;
     let id = req.params.id;
     let x;
     console.log('AQUI');
     for (x in estudiantes) {
          if (id === estudiantes[x].id) {
               estudiante = estudiantes[x];
               valido = true;
               break;
          }
     }
     res.render('matricula/matricula',{estudiante, valido}); 
});

module.exports = router;