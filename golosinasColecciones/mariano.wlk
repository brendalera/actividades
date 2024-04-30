import golosinas.*

object mariano{
	var bolsa
	method comprar(golosina){
		bolsa = []
		bolsa.add(golosina)
	}
	method desechar(golosina){
		bolsa.remove(golosina)
	}
	method cantidadDeGolosinas() {
		return bolsa.size()
	}
	method tieneLaGolosina(golosina){
		return bolsa.contains(golosina)
	}
	method probarGolosinas(){
		bolsa.forEach({golosina => golosina.recibeMordisco()})
	}
	method hayGolosinaSinTACC(){
		return bolsa.any({golosina => not golosina.contieneGluten()})
	}
	method preciosCuidados(){
		return bolsa.all({golosina => golosina.precio() <= 10})
	}
	method golosinaDeSabor(sabor){
		return bolsa.find({golosina => golosina.sabor() == sabor})
	}
	method golosinasDeSabor(sabor){
		return bolsa.filter({golosina => golosina.sabor() == sabor})
	}
	method sabores(){
		const sabores = #{}
		bolsa.forEach{golosina => sabores.addAll(golosina.sabores())}
		return sabores
	}
	method golosinaMasCara(){
		return bolsa.max({golosina => golosina.precio()})
	}
	method pesoGolosinas(){
		return bolsa.sum({golosina => golosina.peso()})
	}
	method golosinasFaltantes(golosinasDeseadas){
		return golosinasDeseadas.asSet().difference(bolsa.asSet())
	}
	method gustosFaltantes(gustosDeseados){
		return gustosDeseados.asSet().difference(self.sabores())
	}
}
