///INCOMPLETO//// REVISAR SOLUCIÓN DEBAJO
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
		self.supervivientes().forEach{ superviviente => superviviente.registrar(unaMision)}
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
		unEmpleado.registrar(self)
	}

	method aprenderHabilidades(unEmpleado) {
		habilidadesRequeridas.forEach{ habilidad => unEmpleado.aprenderHabilidad(habilidad)}
	}

}

/*Agregado relevante, que sino termina siendo duplicado para los Jefes
 * // const empleado = new Empleado(
 * // 		puesto = new Oficinista(cantEstrellas = 1))
 * // empleado.puesto(espia)
 * // empleado.estaIncapacitado()

 * // empleado.puedeUsar(habilidad)

 * // mision.serCumplidaPor(empleado)
 * // mision.serCumplidaPor(equipo)

 * class Equipo {
 * 	const empleados = []
 * 	
 * 	method puedeUsar(habilidad) = 
 * 		empleados.any({empleado => empleado.puedeUsar(habilidad)})
 * 		
 * 	method recibirDanio(cantidad) {
 * 		empleados.forEach({empleado => empleado.recibirDanio(cantidad / 3)})
 * 	}
 * 	
 * 	method finalizarMision(mision) {
 * 		empleados.forEach({empleado => empleado.finalizarMision(mision)})
 * 	}
 * }

 * class Mision {
 * 	const habilidadesRequeridas = []
 * 	const peligrosidad
 * 	
 * 	method serCumplidaPor(asignado) {
 * 		self.validarHabilidades(asignado)
 * 		asignado.recibirDanio(peligrosidad)		
 * 		asignado.finalizarMision(self)
 * 	}
 * 	
 * 	method validarHabilidades(asignado) {
 * 		if (not self.reuneHabilidadesRequeridas(asignado)) {
 * 			self.error("La misión no se puede cumplir")
 * 		}
 * 	}
 * 	
 * 	method enseniarHabilidades(empleado) {
 * 		self.habilidadesQueNoPosee(empleado)
 * 			.forEach({hab => empleado.aprenderHabilidad(hab)})
 * 	}
 * 	
 * 	method reuneHabilidadesRequeridas(asignado) =
 * 		habilidadesRequeridas.all({hab => asignado.puedeUsar(hab)})
 * 		
 * 	method habilidadesQueNoPosee(empleado) =
 * 		habilidadesRequeridas.filter({hab => not empleado.poseeHabilidad(hab)})
 * }

 * class Empleado {
 * 	var property puesto
 * 	var salud = 100
 * 	const habilidades = #{}
 * 	
 * 	method estaIncapacitado() = salud < puesto.saludCritica()
 * 	method puedeUsar(habilidad) 
 * 		= not self.estaIncapacitado() && self.poseeHabilidad(habilidad)
 * 		
 * 	method poseeHabilidad(habilidad) = habilidades.contains(habilidad)
 * 	
 * 	method recibirDanio(cantidad) { salud = salud - cantidad }
 * 	
 * 	method estaVivo() = salud > 0
 * 	
 * 	method finalizarMision(mision) {
 * 		if (self.estaVivo()) {
 * 			self.completarMision(mision)
 * 		}
 * 	}
 * 	
 * 	method completarMision(mision) {
 * 		puesto.completarMision(mision, self) 
 * 	}
 * 	
 * 	method aprenderHabilidad(habilidad) {
 * 		habilidades.add(habilidad)
 * 	}
 * }

 * class Jefe inherits Empleado {
 * 	var subordinados
 * 	override method poseeHabilidad(habilidad) 
 * 		= super(habilidad) || self.algunoDeSusSubordinadosLaPuedeUsar(habilidad)
 * 		
 * 	method algunoDeSusSubordinadosLaPuedeUsar(habilidad)
 * 		= subordinados.any {subordinado => subordinado.puedeUsar(habilidad)	}
 * 	
 * }

 * object espia {
 * 	method saludCritica() = 15
 * 	
 * 	method completarMision(mision, empleado) {
 * 		mision.enseniarHabilidades(empleado)
 * 	}
 * }

 * class Oficinista {
 * 	var cantEstrellas = 0
 * 	method saludCritica() = 40 - 5 * cantEstrellas
 * 	
 * 	method completarMision(mision, empleado) {
 * 		cantEstrellas += 1
 * 		if (cantEstrellas == 3) {
 * 			empleado.puesto(espia)
 * 		}
 * 	}
 * }
 */
