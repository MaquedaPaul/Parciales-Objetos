//Punto 2b
//var pirataIncorporado = new Pirata(monedas = 10, items = ["cuchillo"] )
//var  mision = new BusquedaDelTesoro()
//var barcoPrueba = new Barco(mision =)
//barcoPrueba.incorporar(pirataIncorporado)
class Barco {

	var property hayLugar = true
	var property tripulantes = []
	var property mision

	method tieneItem(item) = tripulantes.any{ tripulante => tripulante.tieneItem(item) }

	method tripulacionPasadaDeGrog() {
		self.tripulantes().all({ tripulante => tripulante.estarPasadoDeGrog()})
	}

	method incorpar(unTripulante) {
		if (not self.puedeFormarParteDeUnaTripulacion(unTripulante)) self.error("No se puede subir al barco")
		tripulantes.add(unTripulante)
	}

	method puedeFormarParteDeUnaTripulacion(unTripulante) {
		return self.hayLugar() && mision.esUtil(unTripulante)
	}

	method cambiarDeMision() {
		const tripulantesInutiles = tripulantes.filter{ tripulante => not mision.esUtil(tripulante) }
		tripulantesInutiles.forEach{ tripulante => self.expulsar(tripulante)}
	}

	method expulsar(unTripulante) {
		tripulantes.remove(unTripulante)
	}

	method tripulantesUtiles() = tripulantes.filter{ tripulante => mision.esUtil(tripulante) }

	method puedeRealizarSuMision() = mision.puedeSerRealizadoPor(self)

	method esTembible() = self.tripulantesUtiles().size() >= 5 && self.puedeRealizarSuMision()

	method itemsDelBarco() {
		const itemsTotales = []
		tripulantes.forEach{ tripulante => tripulante.items().addAll(itemsTotales)}
		return itemsTotales
	}

	method tripulantesQueTienen(unItem) {
		const tripulantesQueLoTienen = tripulantes.filter{ tripulante => tripulante.tieneItem(unItem) }
		return tripulantesQueLoTienen.size()
	}

	method itemMasRaro() {
		tripulantes.forEach{ tripulante , otroTripulante => tripulante.cantidadItems() < otroTripulante.cantidadItems()}
	}

}

class Pirata {

	var property items = []
	var property monedas = 0
	var property nivelEbriedad = 0

	method cantidadItems() {
		return items.size()
	}

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

	var property itemNecesario = "Llave de cofre"

	method esUtil(unPirata) {
		return self.tieneAlgunItemUtil(unPirata) && unPirata.monedas() <= 5
	}

	method tieneAlgunItemUtil(unPirata) = #{ "brujula", "botellaGrog", "cuchillo", "mapa" }.any({ item => unPirata.tieneItem(item) })

	method puedeSerRealizadoPor(unBarco) {
		return unBarco.tieneItem(itemNecesario)
	}

}

class ConvertirseEnLeyenda {

	var property itemObligatorio

	method esUtil(unPirata) {
		return self.tieneItemsCantidadNecesaria(unPirata) && unPirata.tieneItem(itemObligatorio)
	}

	method tieneItemsCantidadNecesaria(unPirata) {
		return unPirata.cantidadItems() >= 10
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

	method esTembible() {
	}

}

