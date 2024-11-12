import pacientes.*
import aparatos.*
class Centro{
    var pacientes = []
    var aparatos = []

    method coloresAparatos() = aparatos.map({c=>c.color()}).asSet().asList()

    method pacientesMenores() = pacientes.filter({c=>c.edad()<8})  
    
    method pacientesQueNoPuedenHacerRutina() = pacientes.filter({c => not c.puedeHacerRutina()})
}