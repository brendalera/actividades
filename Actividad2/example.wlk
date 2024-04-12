object olivia{
	const concentracion = 6
	var concentracionActual = concentracion
	
	method recibeMasajes(){
		concentracionActual += 3
	} 
	method discute(){
		concentracionActual -= 1
	}
	method gradoDeConcentracion() = concentracionActual
}

object bruno{
	var esFeliz = true
	var tieneSed = false
	var peso = 55000
	
	method recibeMasajes(){
		esFeliz = true	
	} 
	method seDaBanoVapor(){
		tieneSed = true
		peso -= 500
	}	
	method tomaAgua(){
		tieneSed = false
	}
	method come(comida){ 
		peso += comida.peso()
		tieneSed = true
	}
	method corre(){
		peso -= 300
	}
	method veElNoticiero(){
		esFeliz = false
	}
	method estaPerfecto(){
		return esFeliz and not tieneSed and peso.between(50000,70000)
	}
	method medioDiaEnCasa(comida){
		self.come(comida)
		self.tomaAgua()
		self.veElNoticiero()
	}
}

object ramiro{
	var nivelDeContractura = 0
	var pielGrasosa = false
	
	method recibeMasajes(){
		return if(nivelDeContractura.between(0,1)) nivelDeContractura else
		nivelDeContractura -= 2
	}
	method seDaBanoDeVapor(){
		pielGrasosa = false
	}
	method come(comida){
		return if(comida.esComidaGrasosa()) pielGrasosa = true else pielGrasosa = false
	}
	method bajarALaFosa(){
		pielGrasosa = true
		nivelDeContractura += 1
	}
	method jugarAlPaddel(){
		nivelDeContractura += 3
	}
	method nivelDeContractura()= nivelDeContractura
	method pielGrasosa()= pielGrasosa
	method diaDeTrabajo(comida){
		self.bajarALaFosa()
		self.come(comida)
		self.bajarALaFosa()
	}
}

object fideos{
	const peso = 250
	method peso()= peso
}

object bigMac{
	const peso = 300
	method peso()= peso
	method esComidaGrasosa()= true
}