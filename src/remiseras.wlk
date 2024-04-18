
object ludmila {
	const kilometroValor = 18
	var valorKilometro =  kilometroValor
	var pactoConMelina = false
	method pacto(){
		pactoConMelina = true
		valorKilometro -= 3
	}
	method valorKilometro(){  
	    return valorKilometro
	}
}

object anaMaria{
	var kilometroValor = 30
	var economiaEstable = true
	var pactoConMelina = false
	method pacto(){
		pactoConMelina = true
	}
	method economiaNoEstable(){
		economiaEstable = false
	} 
	method estaEstable() = economiaEstable
	method valorKilometro(){
		if (self.estaEstable()) kilometroValor = 30 else kilometroValor = 25
		if (pactoConMelina)kilometroValor -= 3
		return kilometroValor
	}
}

object teresa{
	const valorFijo = 22
	var kilometroValor  = valorFijo
	var pactoConMelina = false
	method pacto(){
		pactoConMelina = true
		kilometroValor -= 3
	}
	method valorKilometro(){
		return kilometroValor
	}
}

object roxana{
	var precio = 0
	method precioViaje(persona, kilometros){
		precio = persona.valorKilometro() * kilometros
		return precio
	}
}

object gabriela{
	var precio = 0
	method precioViaje(persona, kilometros){
		precio = persona.valorKilometro() * kilometros 
		precio *= 1.2
		return precio
	}
}

object mariela{
	const valorViaje = 50
	var precio = valorViaje
	method precio(persona, kilometros){
		precio = persona.valorKilometro() * kilometros
		return precio
	}
	method precioViaje(persona, kilometros){
		return if (self.precio(persona, kilometros) >= valorViaje) precio  else valorViaje
	}
}

object juana{
	var precio = 0
	method precioViaje(persona, kilometros){
		if (kilometros.between(0,8)) precio = 100 else precio = 200
		return precio
	}
}

object lucia{
	var precio = 0 
	method reemplazarRemisera(remisera, clienta, kilometrosAViajar){
		precio = remisera.precioViaje(clienta, kilometrosAViajar)
		return precio 
	}
}

object melina{
	method trabajarPara(clienta){
		clienta.pacto()
	}	
}

object oficina{
	var priOpcion = roxana
	var segOpcion = juana
	var remiseraRecordar= gabriela
	method asignarRemiseras(remisera1, remisera2){
		priOpcion = remisera1
	    segOpcion = remisera2
	}
	method cambiarPrimerRemiseraPor(remisera){
		priOpcion = remisera
	}
	method cambiarSegundoRemiseraPor(remisera){
		segOpcion = remisera
	}
	method intercambiarRemiseras(){
		remiseraRecordar = priOpcion 
		priOpcion = segOpcion
		segOpcion = remiseraRecordar
	}
	method remiseraElegidaParaViaje(cliente, kms){
		return if (segOpcion.precioViaje(cliente , kms) + 30 <= priOpcion.precioViaje(cliente, kms))
		segOpcion else priOpcion
	}
}
