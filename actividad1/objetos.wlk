
object lino{
	method brilla()= false
}
object cuero{
	method brilla()= false
}
object madera{
	method brilla()= false
}
object vidrio{
	method brilla()= true
}
object cobre{
	method brilla()= true
}
object rojo{
	method colorFuerte()= true 
}
object verde{
	method colorFuerte()= true 
}
object celeste{
	method colorFuerte()= false
}
object pardo{
	method colorFuerte()= false
}
object lampara{
	method brilla()= true
}


object remera{
	method color()= rojo
	method material()= lino
	method peso()= 800
}

object pelota{
	method color()= pardo
	method material()= cuero
	method peso()= 1300
}

object biblioteca{
	method color()= verde
	method material()= madera
	method peso()= 8000
}

object muneco{
	var pesaje = 0
	method color()= celeste
	method material()= vidrio
	method peso(nuevoPeso){
		pesaje = nuevoPeso
	}  
}

object placa{
	var tono = verde
	var pesaje = 0
	method color(colorNuevo){
		tono = colorNuevo
	} 
	method material()= cobre
	method peso(nuevoPeso){
		pesaje= nuevoPeso
	}
}
	