object georginho {

	var property peso = 70
	const inerciaBase = 490
// var property sustancia
	var property rendimiento

	method consumir(cantidad, unaSustancia) {
		rendimiento = unaSustancia.consumirse(cantidad)
	}

	method velocidad() {
		return (rendimiento * inerciaBase) / peso
	}

}

object whisky {

	method consumirse(cantidad) {
		return 0.9 ** cantidad
	}

}

object terere {

	method consumirse(cantidad) {
		return 1.max(cantidad * 0.1)
	}

}

object cianuro {

	method consumirse(cantidad) {
		return 0
	}

}

