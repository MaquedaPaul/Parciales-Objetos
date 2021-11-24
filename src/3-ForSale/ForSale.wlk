object inmobiliaria {

	var operaciones
	var empleados = #{}
	var inmuebles = []

	method registrarOperacion(empleado, operacion) {
		empleado.cobrarComision(operacion.comisionAgente())
		self.addOperacion(operacion, empleado)
	}

	method addOperacion(operacion, empleado) {
		operaciones.add(operacion)
		empleado.operacionCerrada(operacion)
		operacion.estaOcupado(true)
	}

	method empleadoMVPSegun(criterio) {
		return empleados.max{ unEmpleado => criterio.criterioAplicado(unEmpleado) }
	}

}

object segunComision {

	method criterioAplicado(unEmpleado) {
		return unEmpleado.dinero()
	}

}

object segunCantidadOperacionesConcretadas {

	method criterioAplicado(unEmpleado) {
		return unEmpleado.operacionesCerradas().size()
	}

}

object segunCantidadOperacionesReservadas {

	method criterioAplicado(unEmpleado) {
		return unEmpleado.operacionesReservadas().size()
	}

}

class Agente {

	var dinero
	var property operacionesReservadas = []
	var property operacionesCerradas = []

	method dinero() = dinero

	method cobrarComision(comisionACobrar) {
		dinero += comisionACobrar
	}

	method operacionCerrada(operacion) {
		operacionesCerradas.add(operacion)
	}

	method operacionReservada(operacion) {
		operacionesReservadas.add(operacion)
	}

	method zonasEnLasQueCerroOperaciones() {
		return operacionesCerradas.map{ operacion => operacion.ubicacion() }
	}

	method operoEnZona(zona) {
		self.zonasEnLasQueCerroOperaciones().contains(zona)
	}

	method reservoOperacion(operacion) {
		operacionesReservadas.contains(operacion)
	}

	method concretoOperacion(operacion) {
		operacionesCerradas.contains(operacion)
	}

	method cerroOperacionesEnLaMismaZona(otroEmpleado) {
		const zonasOtroEmpleado = otroEmpleado.zonasEnLasQueCerroOperaciones()
		return zonasOtroEmpleado.any{ unaZona => self.operoEnZona(unaZona) }
	}

	method concretoUnaReservaDe(otroEmpleado) {
		const reservasOtroEmpleado = otroEmpleado.operacionesReservadas()
		return reservasOtroEmpleado.any{ reserva => self.concretoOperacion(reserva) }
	}

}

class Inmueble {

	var property valorInmueble
	var property estaReservado = false
	var tipoInmueble
	var tamanio
	var cantidadAmbientes
	var operacion
	var ubicacion

}

class Operacion { // cliente tiene acceso a operacion

	var inmueble
	var estaOcupado

	method solicitarReserva(empleado) {
		empleado.operacionReservada(self)
		inmueble.estaReservado(true)
	}

	method concretarOperacion(empleado) {
		inmobiliaria.registrarOperacion(empleado, self)
	}

}

class Alquiler inherits Operacion {

	var cantidadMeses
	const constanteNumerica = 50000

	method comisionAgente() {
		return cantidadMeses * inmueble.valorInmueble() / constanteNumerica
	}

}

class Venta inherits Operacion {

	const porcentajeNumerico = configuracionPorcentaje.porcentaje()

	method comisionAgente() {
		return inmueble.valorInmueble() * porcentajeNumerico
	}

}

class Casa {

	var valorInmueble

	method valorInmueble(inmueble) = valorInmueble + inmueble.ubicacion().plus()

}

object pH {

	const constanteNumericaPH = 14000

	method valorInmueble(inmueble) {
		return constanteNumericaPH * inmueble.tamanio() + inmueble.ubicacion().plus()
	}

}

object departamento {

	const constanteNumericaDepartamento = 350000

	method valorInmueble(inmueble) {
		return constanteNumericaDepartamento * inmueble.cantidadAmbientes() + inmueble.ubicacion().plus()
	}

}

class Ubicacion {

	const lugar
	var property plus

}

object configuracionPorcentaje {

	var property porcentaje = 1.5

}

