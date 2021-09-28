class Empleado {

	var property habilidades = #{}
	var property salud
	var property puesto

	method quedaIncapacitado() {
		return salud < puesto.saludCritica()
	}

	method puedeUsar(unaHabilidad) {
		return (not self.quedaIncapacitado() && self.poseeHabilidad(unaHabilidad))
	}

	method poseeHabilidad(unaHabilidad) {
		return habilidades.contains(unaHabilidad)
	}

	method cumplirMision(unaMision) {
		unaMision.serCumplidaPor(self)
		if (self.estaVivo()) {
			self.registrar(unaMision)
		}
	}

	method recibirDanio(danioRecibido) {
		salud -= danioRecibido
	}

	method estaVivo() {
		return salud > 0
	}

	method registrar(unaMision) {
		puesto.registrar(unaMision, self)
	}

	method aprenderHabilidad(unaHabilidad) {
		habilidades.add(unaHabilidad)
	}

}

object puestoEspia {

	const saludCritica = 15

	method saludCritica() {
		return saludCritica
	}

	method registrar(unaMision, empleado) {
		unaMision.aprenderHabilidades(empleado)
	}

}

class PuestoOficinista {

	var property estrellas

	method saludCritica() {
		return 40 - 5 * estrellas
	}

	method registrar(unaMision, empleado) {
		estrellas += 1
		if (self.puedeTrabajarComoEspia()) {
			empleado.puesto(puestoEspia)
		}
	}

	method puedeTrabajarComoEspia() {
		return estrellas >= 3
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

class Equipo {

	const integrantes = #{}

	method cumplirMision(unaMision) {
		if (not self.validarCumplimiento(unaMision)) {
			self.error("No se pudo cumplir la mision")
		}
		const peligrosidadRepartida = unaMision.peligrosidad() / 3
		self.recibirDanio(peligrosidadRepartida)
	}

	method validarCumplimiento(unaMision) {
		return integrantes.any{ integrante => integrante.cumplirMision(unaMision) }
	}

	method recibirDanio(peligrosidad) {
		integrantes.forEach{ integrante => integrante.recibirDanio(peligrosidad)}
	}

	method supervivientes() {
		return integrantes.filter{ integrante => integrante.estaVivo() }
	}

}

class Mision {

	const peligrosidad = 10
	const habilidadesRequeridas = #{}

	method cumpleRequerimientos(unEmpleado) {
		const habilidadesDeUnEmpleado = unEmpleado.habilidades()
		return habilidadesDeUnEmpleado.all{ habilidad => habilidadesRequeridas.contains(habilidad) }
	}

	method serCumplidaPor(unEmpleado) {
		if (not self.cumpleRequerimientos(unEmpleado)) {
			self.error("La mision no puede ser cumplida")
		}
		unEmpleado.recibirDanio(peligrosidad)
	}

	method aprenderHabilidades(unEmpleado) {
		habilidadesRequeridas.forEach{ habilidad => unEmpleado.aprenderHabilidad(habilidad)}
	}

}

/*Agregado relevante, que sino termina siendo duplicado para los Jefes
 * 
 * 
 * 
 */
