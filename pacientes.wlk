import aparatos.*
import centroKinesiologia.*

class Paciente {

    const property edad 
    const property rutina = []
    var  property fortalezaMuscular 
    var  property nivelDeDolor

    method puedeUsar(aparato) = aparato.puedeSerUsadoPor(self)

    method usarAparato(aparato) {

    if (self.puedeUsar(aparato)) {
         aparato.usarAparato(self)
        }
    }
    
    method puedeHacerRutina() = rutina.all({c =>c.puedeSerUsadoPor(self)}) 
    method hacerRutina() {
      if (not self.puedeHacerRutina()){
        self.error("El paciente no puede realizar la rutina")
      }
      rutina.forEach({c => c.usarAparato(self)})
    }

}
/*El centro observa que algunes de sus pacientes tienen comportamientos particulares. Quedan definidos estos tres tipos de paciente.

Resistente:
Cuando realiza una sesión, luego de usar los aparatos, el nivel de fortalecimiento se incrementa en un punto adicional por cada aparato usado.
Si usa dos veces el mismo aparato se cuenta dos veces, por ejemplo en la rutina: "bicicleta, minitramp, bicicleta de nuevo, magneto" sumaría 4 puntos.

Caprichoso:
Tiene una condición adicional para saber si puede realizar una rutina o no: al menos uno de los aparatos deben ser de color rojo.
Se debe agregar a la información que maneja el programa, el color de cada aparato. Un buen valor inicial para el color de un aparato es el blanco.
Un cliente caprichoso, además, en cada sesión realiza siempre dos veces toda la rutina que tiene asignada.

Rápida Recuperación:
Luego de aplicar su rutina, el nivel de dolor se decrementa en una cantidad configurable, que es la misma para todos los pacientes de rápida recuperación. Un buen valor inicial es 3.

Requerimientos:

agregar estos tipos de pacientes
modificar el valor de puntos de dolor que se decrementa para todos los pacientes de Rápida Recuperación.*/

class PacienteResistente inherits Paciente{
    override method hacerRutina() {
      if (not self.puedeHacerRutina()){
        self.error("El paciente no puede realizar la rutina")
      }
      rutina.forEach({c => c.usarAparato(self)})
      self.fortalezaMuscular(self.fortalezaMuscular() + rutina.size())
    }
}
class PacienteCaprichoso inherits Paciente{
    override method hacerRutina() {
      if (not self.puedeHacerRutina()){
        self.error("El paciente no puede realizar la rutina")
      }
      rutina.forEach({c => c.usarAparato(self)})
      rutina.forEach({c => c.usarAparato(self)})
    }
    override method puedeHacerRutina() = super() and rutina.any({c =>c.color() == "rojo"})

}
class PacienteRapidaRecuperacion inherits Paciente{
    override method hacerRutina() {
      if (not self.puedeHacerRutina()){
        self.error("El paciente no puede realizar la rutina")
      }
      rutina.forEach({c => c.usarAparato(self)})
      self.nivelDeDolor(self.nivelDeDolor() - cantConfigurable.valor())
      
    }
    override method puedeUsar(aparato) = rutina.any({c =>c.color() == "rojo"})

}
object cantConfigurable {
    var property valor = 3 
}



