import socio.*
class Viaje {
	var property idiomas = #{}
	method diasDeActividad()
	method implicaEsfuerzo()
	method sirveBroncearse()
	method agregarIdioma(idioma) {
		idiomas.add(idioma)
	}
	method sacarIdioma(idioma) {
		idiomas.remove(idioma)
	}
	method esInteresante() {
		return idiomas.size() > 1
	}

	method contengoEsteIdioma(lenguaje){
        return idiomas.any({ idioma => idioma == lenguaje})
    }
    method esRecomendadaParaSocio(socio) {
    	return self.esInteresante() and socio.leAtraeAlSocio(self) and not socio.realizoActividad(self)
    }
}

class ViajeDePlaya inherits Viaje {
	var property largoDePlaya
	override method diasDeActividad() {
		return largoDePlaya / 500
	}
	override method implicaEsfuerzo() {
		return largoDePlaya > 1200
	}
	override method sirveBroncearse() {
		return true
	}
}

class ExcursionACiudad inherits Viaje {
	var property cantidadDeAtraccionesQueSeVisita
	override method diasDeActividad() {
		return cantidadDeAtraccionesQueSeVisita / 2
	}
	override method implicaEsfuerzo() {
		return (cantidadDeAtraccionesQueSeVisita.between(5,8))
	}
	override method sirveBroncearse() {
		return false
	}
	override method esInteresante() {
		var recorre5Atracciones = self.cantidadDeAtraccionesQueSeVisita() == 5 
		return super() or recorre5Atracciones
	}
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method diasDeActividad() {
		return ((super()) + 1)
	}
	override method sirveBroncearse() {
		return (not super())
	}
}

class SalidaDeTrekking inherits Viaje {
	var property kmDeSenderos
	var property diasDeSolPorAnio
	override method diasDeActividad() {
		return kmDeSenderos / 50
	}
	override method implicaEsfuerzo() {
		return kmDeSenderos > 80
	}
	override method sirveBroncearse() {
		var hayMasDe200 = diasDeSolPorAnio > 200
		var hayEntre100y200 = diasDeSolPorAnio.between(100,200)
		var limiteDeKm = kmDeSenderos > 120
		return hayMasDe200 or hayEntre100y200 and limiteDeKm
	}
	override method esInteresante() {
		var ademas = diasDeSolPorAnio > 140
		return super() and ademas
	}
}

class ClaseDeGimnasia {
	const property idiomas = #{"espaniol"}
	const property diasDeActividad = 1
	const property implicaEsfuerzo = true
	const property sirveBroncearse = false
	
	method contengoEsteIdioma(lenguaje){
        return idiomas.any({ idioma => idioma == lenguaje})
    }
    method esRecomendadaParaSocio(socio) {
    	return socio.edad().between(20, 30)
    }
}