class Barco {

	var property tripulantes = []
	var property mision

	method tripulacionPasadaDeGrog() {
		self.tripulantes().all({ tripulante => tripulante.estarPasadoDeGrog()})
	}

}

class Pirata {

	var property items = []
	var property monedas
	var property nivelEbriedad = 0

	method tieneItem(unItem) {
		self.items().contains(unItem)
	}

	method estarPasadoDeGrog() {
		return self.nivelEbriedad() >= 90
	}

}

class Item {

}

//Misiones
class Mision {

}

object barbaNegra inherits Pirata(items = [ "traje" ], monedas = 5) {

}

class BusquedaDelTesoro {

	method esUtil(unPirata) {
		return self.tieneAlgunItemUtil(unPirata) && unPirata.monedas() <= 5
	}

	method tieneAlgunItemUtil(unPirata) = #{ "brujula", "botellaGrog", "cuchillo", "mapa" }.any({ item => unPirata.tieneItem(item) })

	method puedeSerRealizadoPor(unBarco) = unBarco.tripulantes().any{ (unTripulante => unTripulante.tieneItem("Llave de cofre")) }

}

class ConvertirseEnLeyenda {

	var property itemObligatorio

	method esUtil(unPirata) {
		return self.tieneItemsCantidadNecesaria(unPirata) && unPirata.tieneItem(itemObligatorio)
	}

	method tieneItemsCantidadNecesaria(unPirata) {
		return unPirata.items().size() >= 10
	}

	method puedeSerRealizadoPor(unBarco) {
	}

}

class Saqueo {

	var property victima
	var property cantidadMinimaMonedasParaMision = 5

	method esUtil(unPirata) {
		return unPirata.monedas() < cantidadMinimaMonedasParaMision && self.seAnimaASaquear(unPirata)
	}

	method seAnimaASaquear(unPirata) {
		return 0
	}

	method puedeSerRealizadoPor(unBarco) {
		return victima.esVulnerableA(unBarco)
	}

}

class CiudadCostera {

	var property habitantes

	method puedeSerSaqueado(unPirata) = unPirata.nivelEbriedad() > 50

	method esVulnerableA(unBarco) {
		const cuarentaPorCientoDeHabitantes = self.habitantes() * 0.4
		return unBarco.tripulantes() >= cuarentaPorCientoDeHabitantes || unBarco.tripulacionPasadaDeGrog()
	}

}

class BarcoPirata inherits Barco {

	method puedeSerSaqueado(unPirata) = unPirata.estarPasadoDeGrog() && unPirata.tieneItem("botellaGrog")

	method esVulnerableA(unBarco) {
		const tripulantesDelAtacante = unBarco.tripulantes()
		const tripulantesDelBarcoPirata = self.tripulantes()
		return (tripulantesDelAtacante / 2) >= tripulantesDelBarcoPirata
	}

}

