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

	method decrementarVida(cantidad) {
		vida = 0.max(vida - cantidad)
	}

	method cambiarCondicion(otraCondicion) {
		condicion = otraCondicion
	}

	method permiteMovimiento() {
		return condicion.permiteMovimiento()
	}

	method puedeLuchar() {
		return self.estaVivo()
	}

	method estaVivo() {
		return vida > 0
	}

	method tieneMovimiento(movimiento) {
		return movimientos.contains(movimiento)
	}

	method usarMovimiento(movimiento, adversario) {
		movimientos.find(movimiento)
		movimiento.realizar(self, adversario)
	}

	method luchar(otroPokemon, movimiento) {
		if (self.puedeLuchar() && self.tieneMovimiento(movimiento)) {
			if (self.permiteMovimiento()) {
				condicion.siguienteCondicion()
				self.usarMovimiento(movimiento, otroPokemon)
			} else {
				condicion.debuff(self)
			}
		} else self.error("El pokemon no pudo luchar")
	}

}

class Movimiento {

	var usos

	method realizar(pokemon, adversario) {
		if (self.puedeRealizar()) {
			self.decrementarUsos()
		} else {
			self.error("Es incapaz de realizar el movimiento")
		}
	}

	method puedeRealizar() {
		return usos > 0
	}

	method decrementarUsos() {
		usos = -1
	}

}

class Curativo inherits Movimiento {

	const cantidadCurativa

	method poder() {
		return cantidadCurativa
	}

	override method realizar(pokemon, adversario) {
		super(pokemon, adversario)
		pokemon.curarse(cantidadCurativa)
	}

}

class Danino inherits Movimiento {

	const danio

	method poder() {
		return danio * 2
	}

	override method realizar(pokemon, adversario) {
		super(pokemon, adversario)
		adversario.decrementarVida(danio)
	}

}

class Especial inherits Movimiento {

	const condicionQueGenera

	method poder() {
		return condicionQueGenera.poder()
	}

	override method realizar(pokemon, adversario) {
		super(pokemon, adversario)
		adversario.condicion(condicionQueGenera)
	}

}

class Condicion {

	method permiteMovimiento() {
		return 0.randomUpTo(2).roundUp().even()
	}

	method debuff(pokemon) {
	}

}

class Suenio inherits Condicion {

	method poder() = 50

	method siguienteCondicion() {
		return new Normal()
	}

}

class Paralisis inherits Condicion {

	method poder() = 30

	method siguienteCondicion() {
		return self
	}

}

class Normal inherits Condicion {

	override method permiteMovimiento() = true

}

class Confusion inherits Condicion {

	var cantidadTurnos

	method poder() = 40 * cantidadTurnos

	override method debuff(pokemon) {
		const puntosADecrementar = 20
		pokemon.decrementarVida(puntosADecrementar)
	}

	method siguienteCondicion() {
		if (cantidadTurnos == 0) {
			return new Normal()
		} else {
			return self
		}
	}

}

