const { estudiantes } = require('./estudianteRegistro'); // JSON CHAIRA

exports.consultar = (id) =>{
    let estudiante = {};
    let valido = false;
    let genero  = "";
    let x;
    for (x in estudiantes) {
          if (id === estudiantes[x].id) {
              estudiante = estudiantes[x];
              valido = true;
              genero = estudiante.genero;
              break;
         }
    }
    return {
         estudiante, 
         valido,
         genero
     }
}
 
