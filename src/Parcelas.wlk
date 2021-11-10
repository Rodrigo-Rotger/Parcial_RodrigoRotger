import Plantas.*

class Parcela {
	
	const ancho
	const largo
	const property horasSolPorDia
	const property plantasDentro = []
	
	method superficie() = ancho * largo
	
	method cantidadPlantas() = plantasDentro.size()
	
	method cantMaxPlantas() {
		
		if (ancho > largo)
			return self.superficie() /5
		else
			return self.superficie() / 3 + largo
	} 
	
	method tieneComplicaciones() = plantasDentro.any{ p => p.horasSolTolera() < self.horasSolPorDia()}
	
	method plantar(planta) {
		
		if (self.cantMaxPlantas() > self.cantidadPlantas() + 1 and horasSolPorDia > planta.horasSolTolera() + 2)
			plantasDentro.add(planta)
		else
			throw new Exception(message = "No se puede plantar")
	}
	
}

class Ecologica inherits Parcela {
	
	method seAsociaBien(planta ) = not self.tieneComplicaciones() and planta.esIdeal(self)
	
}

class Industriales inherits Parcela {
	
	method seAsociaBien(planta) = self.plantasDentro().size() < 3  and planta.esFuerte()
}


object inta {
	
	const parcelas = []
	
	method promedioPlantas() = parcelas.sum { p => p.plantasDentro().cantidadPlantas()} / parcelas.size()
	
	method parcelaMasSustentable() =
	
}
