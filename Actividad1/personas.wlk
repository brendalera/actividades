import objetos.*

object rosa{
	method leGusta(cosa) = cosa.peso() <= 2000
}

object estefania{
	method leGusta(cosa){
	    return cosa.colorFuerte()
	}  
}
object luisa{
	method leGusta(cosa){
		return cosa.material().brilla()
	}
}

object juan{
	method leGusta(cosa){
		return not cosa.color().colorFuerte() or cosa.peso().between(1200,1800)
	}
}



}
