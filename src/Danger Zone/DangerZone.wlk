class Empleado {

	var property habilidades
	var property salud

	method quedaIncapacitado() {
		return salud < self.saludCritica()
	}

	method saludCritica()

	method puedeUsar(unaHabilidad) {
		return (not self.quedaIncapacitado() && ...)
	}

	method poseeHabilidad(unaHabilidad) {
	}

}

class Espia inherits Empleado {

	const saludCritica = 15

	override method saludCritica() {
		return saludCritica
	}

}

class Oficinista inherits Empleado {

	var property estrellas

	override method saludCritica() {
		return 40 - 5 * estrellas
	}

}

