object bombon{
	var peso = 15
	method precio() = 5
	method sabor() = "frutilla"
	method peso() = peso 
	method recibeMordisco(){
		peso = peso - (peso * 0.8) - 1
	}
	method contieneGluten() = true
	method sabores() = [self.sabor()]
}

object alfajor{
	var peso = 300
	method precio() = 12
	method sabor() = "chocolate"
	method peso() = peso 
	method recibeMordisco(){
		peso = peso - peso * 0.8
	}
	method contieneGluten() = false 
	method sabores() = [self.sabor()]
}

object caramelo{
	var peso = 5
	method precio() = 1
	method sabor() = "frutilla"
	method peso() = peso 
	method recibeMordisco(){
		peso = peso - 1
	}
	method contieneGluten() = true
	method sabores() = [self.sabor()]
}

object chupetin{
	var peso = 7
	method precio() = 2
	method sabor() = "naranja"
	method peso() = peso 
	method recibeMordisco(){
		if (peso > 2) peso = peso - peso * 0.4 else peso
	}
	method contieneGluten() = true
	method sabores() = [self.sabor()]
}

object oblea{
	var peso = 250
	method precio() = 5
	method sabor() = "vainilla"
	method peso() = peso 
	method recibeMordisco(){
		peso = peso - peso * if (peso > 70) 0.5 else 0.75
	}
	method contieneGluten() = false
	method sabores() = [self.sabor()]
}

object chocolatin{
	var peso 
	const pesaje = peso
	method pesoEs(pesa){
		peso = pesa
		return peso
	}
	method precio(pesa) = pesaje * 0.5
	method sabor() = "chocolate"
	method peso() = peso 
	method recibeMordisco(){
		peso = peso - 2
	}
	method contieneGluten() = true
	method sabores() = [self.sabor()]
}

object golosinaBanada{
	var peso
	var banado = 4
	method peso(golosina){
		peso = golosina.peso() + banado
	}
	method precio(golosina) = golosina.precio() + 2
	method sabor(golosina) = golosina.sabor()
	method contieneGluten(golosina) = golosina.contieneGluten()
	method recibeMordisco(golosina){
		golosina.recibeMordisco()
		banado -= 2
	}
	method sabores(golosina) = [self.sabor(golosina)]
}

object pastilla{
	var peso = 5
	var gluten
	var sabor = "frutilla"
	method pesoEs(pesa){
		peso = pesa
		return peso
	}
	method precio() = if (self.contieneGluten()) 7 else 10
	method sabor() = sabor
	method peso() = peso 
	method recibeMordisco(){
		if (sabor == "frutilla") sabor = "chocolate" 
		if(sabor == "chocolate") sabor = "naranja"
		else sabor ="frutilla"
	} 
	method esLibreDeGluten(bool){
		gluten = bool
	}
	method contieneGluten() = gluten
	method sabores() = [self.sabor()]
}

