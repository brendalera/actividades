import wollok.game.*

object auto {
	// definimos los atributos para imagen y posición de nuestro elemento
	var image = "autitoRojo.png"
	var property position = game.origin() //para el movimiento en el tablero.

	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method posicion(nuevaPosicion) { position = nuevaPosicion }
	method accidente() = "Eh chocado :( "
}

object coche {
	var image = "autitoAzul.png"
	var property position = game.center()
	  
	method position() = position
	method image() = image
	method image(nuevaImagen) { image = nuevaImagen }
}


object carro{
	var image = "autitoVerde.png"
	var property position = game.at(5,3)
	  
	method position() = position
	method image() = image
	method image(nuevaImagen) { image = nuevaImagen }
	method transitar(){
		const x = 0.randomUpTo(game.width()).truncate(0)
        const y = 0.randomUpTo(game.height()).truncate(0)
    // otra opcion:
    // const x = (0.. game.width() - 1).anyOne() 
    // const y = (0.. game.height() - 1).anyOne() 
        position = game.at(x,y) 
	}
}