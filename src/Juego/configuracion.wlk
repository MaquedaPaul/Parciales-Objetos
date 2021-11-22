import wollok.game.*
import Jugadores.*
import Productos.*

object juegoTP1 {

	method jugar() {
		self.configurarVentana()
		self.agregarObjetos()
		self.configurarTeclas()
		self.configurarColisiones()
			// self.configurarEventosAutomaticos()
		game.start()
	}



	method configurarVentana() {
		game.width(30)
		game.height(30)
		game.title("Supermercadito")
	}

	method agregarObjetos() {
		game.addVisualCharacter(personajeControlado)
			// game.addVisualCharacter(carritoUno)
		game.addVisualIn(galletita, game.at(1, 1))
	// game.addVisualIn(jardin, game.at(6, 6))
	// Al pasar con el mouse sobre el jardín muestra
	// la cantidad actual de malezas
	// game.showAttributes(jardin)
	}

	method configurarTeclas() {
	// keyboard.space().onPressDo({ personajeControlado.cambiar()})
	}

	// Configura qué hacer cuando se pasa por el spa o el jardín
	method configurarColisiones() {
	// game.onCollideDo(spa, { _ => spa.atender(personajeControlado.personajeActual())})
	// game.onCollideDo(jardin, { _ => personajeControlado.personajeActual().trabajarEnJardin(jardin)})
	}

}

// Objeto que controla si se está manejando a adriano o a olivia
object personajeControlado {

	var property position = game.center()
	const personajeActual = carritoUno

	method image() = self.personajeActual().image()

	method personajeActual() = personajeActual

}

