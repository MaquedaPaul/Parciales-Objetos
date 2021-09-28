class Empleado {

	var property habilidades = #{}
	var property salud
	var puesto

	method quedaIncapacitado() {
		return salud < puesto.saludCritica()
	}

	method puedeUsar(unaHabilidad) {
		return (not self.quedaIncapacitado() && self.poseeHabilidad(unaHabilidad))
	}

	method poseeHabilidad(unaHabilidad) {
		return habilidades.contains(unaHabilidad)
	}

}

object puestoEspia {

	const saludCritica = 15

	method saludCritica() {
		return saludCritica
	}

}

class PuestoOficinista {

	var property estrellas

	method saludCritica() {
		return 40 - 5 * estrellas
	}

}

class Jefe inherits Empleado {

	const empleados = #{}

	override method poseeHabilidad(unaHabilidad) {
		return super(unaHabilidad) or self.algunEmpleadoPuedeUsar(unaHabilidad)
	}

	method algunEmpleadoPuedeUsar(unaHabilidad) {
		return empleados.any{ empleado => empleado.puedeUsar(unaHabilidad) }
	}

}

