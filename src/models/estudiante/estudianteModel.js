const { estudiantes } = require('./estudianteRegistro'); // JSON CHAIRA

exports.consultar = (id) =>{
    let estudiante = {};
    let valido = false;
    let x;
    for (x in estudiantes) {
          if (id === estudiantes[x].id) {
              estudiante = estudiantes[x];
              valido = true;
              break;
         }
    }
    return {
         estudiante, 
         valido
     }
}
 
