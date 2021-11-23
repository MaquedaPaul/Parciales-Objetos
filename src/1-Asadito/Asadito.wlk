class Persona {

	var property elementosCercanos = []
	var property posicion
	var condicion
	var property tipoDeDietas = []
	var bandejasComidas = []

	method pedirElementoA(persona, elemento) {
		if (!persona.comprobarPertenencia(elemento)) {
			self.error("La persona no tiene ese elemento")
		}
		persona.condicion().pasarElemento(elemento, persona, self)
	}

	method agregarElemento(elemento) {
		elementosCercanos.add(elemento)
	}

	method quitarElemento(elemento) {
		elementosCercanos.remove(elemento)
	}

	method comprobarPertenencia(elemento) {
		return elementosCercanos.contains(elemento)
	}

	method quitarTodosLosElementos() {
		elementosCercanos.clear()
	}

	method pasarTodosLosElementosA(persona) {
		persona.elementosCercanos(elementosCercanos + persona.elementosCercanos())
		self.quitarTodosLosElementos()
	}

	method pasarPrimerElementoA(persona) {
		const primerElemento = elementosCercanos.first()
		self.pasarElementoA(persona, primerElemento)
	}

	method pasarElementoA(persona, elemento) {
		persona.agregarElemento(elemento)
		self.quitarElemento(elemento)
	}

	method intercambiarElementosCon(persona) {
		const misElementos = elementosCercanos
		const susElementos = persona.elementosCercanos()
		elementosCercanos = susElementos
		persona.elementosCercanos(misElementos)
	}

	method intercambiarPosicionesCon(persona) {
		const miPosicion = posicion
		const suPosicion = persona.posicion()
		posicion = suPosicion
		persona.posicion(miPosicion)
	}

	method quiereComer(bandeja) {
		return tipoDeDietas.all{ unaDieta => unaDieta.quiereComer(bandeja) }
	}

	method comer(bandeja) {
		if (!self.quiereComer(bandeja)) {
			self.error("La persona no quiere comer esa bandeja")
		}
		self.agregarBandejaComida(bandeja)
	}

	method agregarBandejaComida(bandeja) {
		bandejasComidas.add(bandeja)
	}

	method estaPipon() {
		return bandejasComidas.any{ unaBandeja => unaBandeja.superaLas500Calorias() }
	}

	method laEstaPasandoBien()

	method comioCarne() {
		return bandejasComidas.any{ unaBandeja => unaBandeja.esCarne() }
	}

}

class Condicion {

}

class Cascarabias inherits Condicion {

	method pasarElemento(elemento, cascarabias, persona) {
		cascarabias.pasarTodosLosElementosA(persona)
	}

}

class Sordo inherits Condicion {

	method pasarElemento(elemento, sordo, persona) {
		sordo.pasarPrimerElementoA(persona)
	}

}

class Vueltero inherits Condicion {

	method pasarElemento(elemento, vueltero, persona) {
		vueltero.intercambiarPosicionesCon(persona)
		vueltero.intercambiarElementosCon(persona)
	}

}

class Normal inherits Condicion {

	method pasarElemento(elemento, normal, persona) {
		normal.pasarElementoA(persona, elemento)
	}

}

class Bandeja {

	var property esCarne
	var property calorias

	method superaLas500Calorias() {
		return calorias > 500
	}

}

class Dieta {

}

class Vegetariano {

	method quiereComer(bandeja) {
		return not bandeja.esCarne()
	}

}

class Dietetico {

	const recomendacionOMS = oms

	method quiereComer(bandeja) {
		return bandeja.superaLas500Calorias() && oms.validarPlatillo(bandeja)
	}

}

class Alternado {

	var yaAcepto = false

	method quiereComer(bandeja) {
		if (yaAcepto) {
			yaAcepto = false
			return false
		} else {
			yaAcepto = true
			return true
		}
	}

}

object oms {

	method validarPlatillo(bandeja) {
		return true
	}

}

object osky inherits Persona(condicion = new Alternado(), posicion = "1@2") {

	override method laEstaPasandoBien() = true

}

object moni inherits Persona(condicion = new Alternado(), posicion = "1@3") {

	override method laEstaPasandoBien() {
		return posicion == "1@1"
	}

}

object vero inherits Persona(condicion = new Alternado(), posicion = "1@4") {

	override method laEstaPasandoBien() {
		return elementosCercanos.size() < 3
	}

}

object facu inherits Persona(condicion = new Alternado(), posicion = "1@5") {

	override method laEstaPasandoBien() {
		return self.comioCarne()
	}

}

