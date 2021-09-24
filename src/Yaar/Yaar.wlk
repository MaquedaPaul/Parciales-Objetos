//Punto 2b
//var pirataIncorporado = new Pirata(monedas = 10, items = ["cuchillo"] )
//var  mision = new BusquedaDelTesoro()
//var barcoPrueba = new Barco(mision =)
//barcoPrueba.incorporar(pirataIncorporado)
class Barco {

	var property hayLugar = true
	var property tripulantes = #{}
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

	method mision(nuevaMision) {
		mision = nuevaMision
		const tripulantesInutiles = tripulantes.filter{ tripulante => not nuevaMision.esUtil(tripulante) }
		tripulantesInutiles.forEach{ tripulante => self.expulsar(tripulante)}
	// tripulantes.removeAll(piratasQueNoSirven) Alternativa
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
		return self.itemsDelBarco().min{ item => self.tripulantesQueTienen(item) }
	}

	method anclar(unaCiudadCostera) {
		self.pagarGrogXD()
		if (not self.todosPuedenPagar(unaCiudadCostera.precioDeEstadia())) {
			self.error("No alcanza la guita")
		}
		const quedaPerdido = self.tripulanteMasEbrio()
		tripulantes.remove(quedaPerdido)
		unaCiudadCostera.add(quedaPerdido)
	}

	method todosPuedenPagar(unDinero) {
		return tripulantes.all{ tripulante => tripulante.puedePagarMonedas(unDinero) }
	}

	method pagarGrogXD() {
		const puedenPagar = tripulantes.filter{ tripulante => tripulante.puedePagar("botellaGrog") }
		puedenPagar.forEach{ tripulante => tripulante.pagar("botellaGrog")}
		puedenPagar.forEach{ tripulante => tripulante.nivelEbriedad(tripulante.nivelEbriedad() + 5)} // Consecuencia de pagar Grog
	}

	method tripulanteMasEbrio() {
		return tripulantes.min{ tripulante => tripulante.nivelEbriedad() }
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

	method pagar(unItem) {
		if (not self.puedePagar(unItem)) {
			self.error("No puede pagarlo")
		}
		monedas -= unItem.precio()
		items.add(unItem)
	}

	method puedePagar(unItem) {
		return monedas >= unItem.precio()
	}

	method puedePagarMonedas(unDinero) {
		return monedas >= unDinero
	}

	method seAnimaASaquear(victima) {
		victima.puedeSerSaqueadoPor(self)
	}

}

class Espia inherits Pirata {

}

class Item {

	var property precio

}

//Misiones
class Mision {

	var property itemNecesario

	method puedeSerRealizadoPor(unBarco)

	method esUtil(unPirata)

}

object barbaNegra inherits Pirata(items = [ "traje" ], monedas = 5) {

}

class BusquedaDelTesoro inherits Mision(itemNecesario = "Llave de cofre") {

	override method esUtil(unPirata) {
		return self.tieneAlgunItemUtil(unPirata) && unPirata.monedas() <= 5
	}

	method tieneAlgunItemUtil(unPirata) = #{ "brujula", "botellaGrog", "cuchillo", "mapa" }.any({ item => unPirata.tieneItem(item) })

	override method puedeSerRealizadoPor(unBarco) {
		return unBarco.tieneItem(itemNecesario)
	}

}

class ConvertirseEnLeyenda inherits Mision {

	override method esUtil(unPirata) {
		return self.tieneItemsCantidadNecesaria(unPirata) && unPirata.tieneItem(itemNecesario)
	}

	method tieneItemsCantidadNecesaria(unPirata) {
		return unPirata.cantidadItems() >= 10
	}

}

class Saqueo inherits Mision {

	var property victima
	const cantidadMinimaMonedasParaMision = configuracionSaqueos.maximoMonedas()

	override method esUtil(unPirata) {
		return unPirata.monedas() < cantidadMinimaMonedasParaMision && unPirata.seAnimaASaquear(victima)
	}

	override method puedeSerRealizadoPor(unBarco) {
		return victima.esVulnerableA(unBarco)
	}

}

class CiudadCostera {

	var property precioDeEstadia
	var property habitantes

	method puedeSerSaqueadoPor(unPirata) = unPirata.nivelEbriedad() > 50

	method esVulnerableA(unBarco) {
		const cuarentaPorCientoDeHabitantes = self.habitantes() * 0.4
		return unBarco.tripulantes() >= cuarentaPorCientoDeHabitantes || unBarco.tripulacionPasadaDeGrog()
	}

}

class BarcoPirata inherits Barco {

	method puedeSerSaqueadoPor(unPirata) = unPirata.estarPasadoDeGrog() && unPirata.tieneItem("botellaGrog")

	method esVulnerableA(unBarco) {
		const tripulantesDelAtacante = unBarco.tripulantes()
		const tripulantesDelBarcoPirata = self.tripulantes()
		return (tripulantesDelAtacante / 2) >= tripulantesDelBarcoPirata
	}

}

object configuracionSaqueos {

	var property maximoMonedas = 0

}

