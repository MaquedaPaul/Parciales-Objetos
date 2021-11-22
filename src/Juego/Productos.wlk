class Producto {

	var property peso
	var property precio
	var property cantidad

}

class Leche inherits Producto {

}

class Carne inherits Producto {

}

class Fruta inherits Producto {

}

class Verdura inherits Producto {

}

class Galletitas inherits Producto {

	method image() = "galletita.png"

}

class YerbaMate inherits Producto {

}

class Yogurt inherits Producto {

}

object galletita inherits Galletitas(peso = 2, precio = 2, cantidad = 1) {

}

