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


object barbaNegra inherits Pirata(items = [ "traje" ], monedas = 5) {}