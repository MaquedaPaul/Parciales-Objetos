//Misiones
class Mision {

	var property itemNecesario

	method puedeSerRealizadoPor(unBarco)

	method esUtil(unPirata)

}

class BusquedaDelTesoro inherits Mision(itemNecesario = "Llave de cofre") {

	override method esUtil(unPirata) {
		return self.tieneAlgunItemUtil(unPirata) && unPirata.monedas() <= 5
	}

	method tieneAlgunItemUtil(unPirata) = #{ "brujula", "botellaGrog", "cuchillo", "mapa" }.any({ item => unPirata.tieneItem(item) })

	override method puedeSerRealizadoPor(unBarco) {
		return unBarco.tieneItem(itemNecesario)
	}

}

class ConvertirseEnLeyenda inherits Mision {

	override method esUtil(unPirata) {
		return self.tieneItemsCantidadNecesaria(unPirata) && unPirata.tieneItem(itemNecesario)
	}

	method tieneItemsCantidadNecesaria(unPirata) {
		return unPirata.cantidadItems() >= 10
	}

}

class Saqueo inherits Mision {

	var property victima
	const cantidadMinimaMonedasParaMision = configuracionSaqueos.maximoMonedas()

	override method esUtil(unPirata) {
		return unPirata.monedas() < cantidadMinimaMonedasParaMision && unPirata.seAnimaASaquear(victima)
	}

	override method puedeSerRealizadoPor(unBarco) {
		return victima.esVulnerableA(unBarco)
	}

}

class CiudadCostera {

	var property precioDeEstadia
	var property habitantes

	method puedeSerSaqueadoPor(unPirata) = unPirata.nivelEbriedad() > 50

	method esVulnerableA(unBarco) {
		const cuarentaPorCientoDeHabitantes = self.habitantes() * 0.4
		return unBarco.tripulantes() >= cuarentaPorCientoDeHabitantes || unBarco.tripulacionPasadaDeGrog()
	}

}

/*
 * class BarcoPirata inherits Barco {

 * 	method puedeSerSaqueadoPor(unPirata) = unPirata.estarPasadoDeGrog() && unPirata.tieneItem("botellaGrog")

 * 	method esVulnerableA(unBarco) {
 * 		const tripulantesDelAtacante = unBarco.tripulantes()
 * 		const tripulantesDelBarcoPirata = self.tripulantes()
 * 		return (tripulantesDelAtacante / 2) >= tripulantesDelBarcoPirata
 * 	}

 * }
 */
object configuracionSaqueos {

	var property maximoMonedas = 0

}

