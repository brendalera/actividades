
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

////////////EJercicio de kinesiologia //////////////////
object centro {

	const pacientes = []
	const aparatos = []

	method coloresSinRepeticion() = aparatos.map{ap=>ap.color()}.asSet()
	method pacientesMenores() = pacientes.filter{pa=>pa.edad() < 8 }
	method cantidadPacientesSinSesion() = 
		pacientes.count{pa=>!pa.puedeHacerRutina()}


	method enOptimasCondiciones() = aparatos.all{ap=> !ap.necesitaMantenimiento()}
	//Saber si está en óptimas condiciones, o sea, si ninguno de sus aparatos necesita mantenimiento.

	method visitaTecnico() {
		aparatos.filter{ap=>ap.necesitaMantenimiento()}.
			forEach{ap=>ap.realizarMantenimiento()}
	}

	method estaComplicado() =
	   self.cantidadAparatosMantenimiento() >= self.cantidadAparatos() / 2

	method cantidadAparatosMantenimiento() = aparatos.count{ap=> ap.necesitaMantenimiento()}
	// Registrar una visita de técnico, que tiene el efecto de hacerle mantenimiento a todos los aparatos que lo necesiten.

	method cantidadAparatos() = aparatos.size()
}


class Paciente {

	var property dolor
	var property edad
	var property fortaleza

	const rutina = []

	method puedeHacerRutina() = rutina.all({ap=> ap.puedeSerUsadoPor(self)})

	method realizarSesion() {
		rutina.forEach{ap=> ap.usar(self) }
		self.otraConsecuencia()
	}
	method otraConsecuencia() {

	}

	method disminuirDolor(valor){
		dolor -= valor
	}
	method aumentarFortaleza(valor){
		fortaleza += valor
	}
	method disminuirDolorPorcentual(porcentaje){
		dolor -= dolor*porcentaje/100
	}
	method aumentarFortalezaPorcentual(porcentaje){
		fortaleza += fortaleza*porcentaje/100
	}
}

class PacienteResistente inherits Paciente{

	override method otraConsecuencia(){
		self.aumentarFortaleza(rutina.size())
	}
}

class PacienteCaprichoso inherits Paciente{

	override method otraConsecuencia(){
		self.realizarSesion()
	}

	override method puedeHacerRutina() = super() && self.algunAparatoRojo()
	method algunAparatoRojo() = 
	   rutina.any{ap=>ap.color() == "rojo"}
}


class PacienteRecuperacion inherits Paciente{
	override method otraConsecuencia(){
		self.disminuirDolor(recuperacion.dolor())
	}

}

object recuperacion{
	var property dolor = 3
}


class Aparato {
	var property color = "blanco"
//	method realizarMantenimiento()
//	method necesitaMantenimiento() 
//	method puedeSerUsadoPor(persona) 
//	method usar(persona)
}

class Bicicleta inherits Aparato{
	var tornillos = 0
	var aceite = 0
	method puedeSerUsadoPor(persona) = persona.edad() > 8

	method usar(persona){

		if(persona.dolor() > 30) 
			tornillos += 1
		if(persona.edad().between(30,50))
		    aceite +=1
		persona.disminuirDolor(4)
		persona.aumentarFortaleza(3)
	}

	method realizarMantenimiento(){
		aceite = 0
		tornillos = 0
	}

	method necesitaMantenimiento() = aceite >= 5 or tornillos >= 10

}


class Minitrap inherits Aparato{
	method puedeSerUsadoPor(persona) = persona.dolor() <= 20
	method usar(persona) {
		persona.aumentarFortalezaPorcentual(10)
	} 

	method realizarMantenimiento(){
	}

	method necesitaMantenimiento() = false 

}




class Magneto inherits Aparato{
	var imantacion = 800

	method puedeSerUsadoPor(persona) = true

	method usar(persona) {
		persona.disminuirDolorPorcentual(10)
		imantacion -= 1
	} 

	method realizarMantenimiento(){
		imantacion += 500
//		color = "verde"
	}

	method necesitaMantenimiento() = imantacion < 100
}
