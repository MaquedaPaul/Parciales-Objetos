object abc {

}

class Pokemon {

	const vidaMax
	var vida
	var property movimientos = []
	var condicion = new Normal()

	method curarse(cantidad) {
		vida = vidaMax.min(cantidad)
	}

	method grositud() {
		return vidaMax * self.poderTotalMovimientos()
	}

	method poderTotalMovimientos() {
		return movimientos.sum{ unMovimiento => unMovimiento.poder() }
	}

}

class Movimiento {

	method realizar(pokemon) {
	}

}

class Curativo inherits Movimiento {

	const cantidadCurativa

	method poder() {
		return cantidadCurativa
	}

	override method realizar(pokemon) {
		pokemon.curarse(cantidadCurativa)
	}

}

class Danino inherits Movimiento {

	const danio

	method poder() {
		return danio * 2
	}

	method realizar(pokemon, adversario) {
		adversario.recibirDanio(danio)
	}

}

class Especial inherits Movimiento {

	const condicionQueGegenera

	method poder() {
		return condicionQueGegenera.poder()
	}

	method realizar(pokemon, adversario) {
	}

}

class Condicion {

}

class Suenio inherits Condicion {

	method poder() = 50

}

class Paralisis inherits Condicion {

	method poder() = 30

}

class Normal inherits Condicion {

}

