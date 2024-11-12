import centroKinesiologia.*
import pacientes.*
class Aparato {
    const color 

    method color() = color 

    method puedeSerUsadoPor(unPaciente) = true


    method usarAparato(unPaciente)

}

class Magneto inherits Aparato {

    override method usarAparato(unPaciente) {
        unPaciente.nivelDeDolor(unPaciente.nivelDeDolor() * 0.9) 
    }

}

class Bicicleta inherits Aparato {

    override method puedeSerUsadoPor(unPaciente) {
        return unPaciente.edad() > 8
    }

    override method usarAparato(unPaciente) {
        if(self.puedeSerUsadoPor(unPaciente)){
            unPaciente.nivelDeDolor(unPaciente.nivelDeDolor()- 4)
            unPaciente.fortalezaMuscular(unPaciente.fortalezaMuscular()+ 3) 
        }
    }

 }


class Minitramp inherits Aparato {

    override method puedeSerUsadoPor(unPaciente) {
        return unPaciente.nivelDeDolor() < 20
    }

       override method usarAparato(unPaciente) {
        if(self.puedeSerUsadoPor(unPaciente)){
            unPaciente.fortalezaMuscular(unPaciente.fortalezaMuscular() + unPaciente.edad() * 0.1)
        }

    }
}