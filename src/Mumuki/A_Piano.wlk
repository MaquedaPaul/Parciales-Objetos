object jazmin {

	var property piano = pianoFamiliar

	method piano(unPiano) {
		piano = unPiano
	}

	method tocar() {
		const nivelActual = piano.nivelDeAfinacion()
		const despuesDeTocar = nivelActual - nivelActual * 0.01
		piano.nivelDeAfinacion(despuesDeTocar)
	}

}

object lucio {

	method afinar(unPiano, tiempo) {
		const nivelInicial = unPiano.nivelDeAfinacionInicial()
		const despuesDeAfinar = ((tiempo * 5) / 100) * nivelInicial
		unPiano.nivelDeAfinacion(100.min(despuesDeAfinar))
	}

}

object pianoFamiliar {

	var property nivelDeAfinacion = 100

	method nivelDeAfinacionInicial() {
		return 100
	}

	method estaAfinado() = self.porEncimaDelOchentaPorciento()

	method porEncimaDelOchentaPorciento() = (self.nivelDeAfinacionInicial() * 0.80) < self.nivelDeAfinacion()

}

