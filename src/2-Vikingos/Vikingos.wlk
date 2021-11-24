class Vikingo {

	const casta
	var trabajos
	var expedicion
	var armas = []
	var hijos = []

	method esProductivo() {
		return self.esProductivoSegunTrabajo()
	}

	method esProductivoSegunTrabajo() {
		return trabajos.all{ unTrabajo => unTrabajo.esProductivo(self) }
	}

	method estaPermitidoSuIngresoAExpedicion() {
		return self.esProductivo() && self.estaPermitidoSuIngresoPorCasta()
	}

	method estaPermitidoSuIngresoPorCasta() {
		return casta.estaPermitidoParaExpedicion()
	}

	method tieneArmas() {
		return not armas.isEmpty()
	}

	method cantidadDeHijos() {
		return hijos.size()
	}

}

class Expedicion {

	var vikingos = #{}
	var lugaresAAsaltar = []

	method cantidadVikingos() = vikingos.size()

	method saquear(lugar) {
	}

}

class Casta {

	method estaPermitidoParaExpedicion(vikingo) {
		return true
	}

}

class Jarl inherits Casta {

	override method estaPermitidoParaExpedicion(vikingo) {
		return not vikingo.tieneArmas()
	}

}

class Karl inherits Casta {

}

class Thrall inherits Casta {

}

class Trabajo {

}

class Soldado {

	var property vidasCobradas

	method esProductivo(soldado) {
		return soldado.tieneArmas() && vidasCobradas > 20
	}

	method asesinar() {
		vidasCobradas += 1
	}

}

class Granjero {

	var hectareasDesignadas

	method esProductivo(granjero) {
		return granjero.cantidadDeHijos() * 2 / hectareasDesignadas <= 1
	}

}

class Aldea {

	method valeLaPena() {
	}

}

class Capital {

	var monedasDeOro = 0
	var potenciadorRiqueza
	var defensores

	method valeLaPena(expedicion) {
		return expedicion.cantidadVikingos() * 3 / monedasDeOro >= 1
	}

	method botin(expedicion) {
	}

}

