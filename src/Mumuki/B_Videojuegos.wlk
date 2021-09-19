object delfina {

	var property diversion = 0
	var property agarrar = play

	method jugar(unVideojuego) {
		diversion += unVideojuego.diversionQueOtorga(self.agarrar())
		agarrar.usar()
	}

}

object arkanoid {

	method diversionQueOtorga(consola) {
		return 50
	}

}

object mario {

	method diversionQueOtorga(consola) {
		if (consola.jugabilidad() > 5) {
			return 100
		} else return 15
	}

}

object pokemon {

	method diversionQueOtorga(consola) {
		return 10 * consola.jugabilidad()
	}

}

object play {

	var property usos = 0

	method jugabilidad() {
		return 10
	}

	method usar() {
		usos++
	}

}

object portatil {

	var property usos = 0
	var property bateriaBaja = false

	method jugabilidad() {
		if (not self.bateriaBaja()) return 8 else return 1
	}

	method usar() {
		bateriaBaja = true
		usos++
	}

}

