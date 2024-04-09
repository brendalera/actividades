object feroz{
	var peso = 10
	method esSaludable(){
		return peso.between(20,150)
	}
	method aumentarPeso(pesaje){
		peso = peso + pesaje
	}
	method disminuirPeso(pesaje){
		peso = peso - pesaje
	}
	method sufrirCrisis(){
		peso = 10
	}
	method ingiereAlimento(pesaje){
		peso = peso + pesaje / 10
	}
	method correr(){
		peso = peso - 1
	}
	method encuentroCaperucitaYFeroz(){
		return "charlan"
	}
	method comerAbuelita(){
		self.ingiereAlimento(abuela.pesaje())
		return "disfrazarse de abuelita"
	}
	method huir(){
		self.correr()
	}
}

object caperucita{
	var peso = 60
	method encuentroCaperucitaYFeroz(){
		return "charlan"
	}
	method cruzarBosque(){
		self.caeUnaManzanaDeLaCanasta()
	}
	method caeUnaManzanaDeLaCanasta(){
		peso = peso - 0.2
	}
}

object abuela{
	const peso = 50
	method pesaje()= peso
}

object cazador{
	method llegaALaCasa(){
		feroz.disminuirPeso(6)
	}
	method atacaAFeroz(){
		feroz.disminuirPeso(10)
	}
}

