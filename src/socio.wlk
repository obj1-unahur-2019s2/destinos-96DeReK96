import viajes.*
class Socio {
	var actividades = []
	var idiomasQueHabla = #{}
	var property actMax
	var property edad
	method agregarIdiomaQueHabla(idioma) {
		idiomasQueHabla.add(idioma)
	}
	method quitarIdioma(idioma) {
		idiomasQueHabla.remove(idioma)
	}
	method esAdoradorAlSol() {
		return actividades.all({act => act.sirveBroncearse()})		
	}
	method actividadesEsforzadas() {
		return actividades.filter({act => act.implicaEsfuerzo() })
	}
	method registrarActividad(act) {
		if (actividades.size() < actMax) {
			actividades.add(act)
		} else {
			self.error("error, se llego al maximo de actividades")
		}
	}
	method realizoActividad(act) {
		return actividades.contains(act)
	} 
}
class SocioTranquilo inherits Socio {
	method leAtraeAlSocio(act) {
		return act.diasDeActividad() >= 4		
	}
}
class SocioCoherente inherits Socio {
	
	method leAtraeAlSocio(act) {
		return if (self.esAdoradorAlSol()) {
			act.sirveBroncearse()
		} else {
			act.implicaEsfuerzo()
		}
	}
}

class SocioRelajado inherits Socio {

	method leAtraeAlSocio(act) {
        return idiomasQueHabla.any({lenguaje => act.contengoEsteIdioma(lenguaje)})
    }
}





