import Misiones.*
import Piratas.*

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




class Item {

	var property precio

}






