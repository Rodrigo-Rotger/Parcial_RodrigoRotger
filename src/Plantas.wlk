import Parcelas.*

class Planta {
	
	const anioSemilla
	
	const property altura
	
	
	method horasSolTolera()
	
	method esFuerte() = self.horasSolTolera() > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacioPlantada()
	
}


class Menta inherits Planta {
	
	override method horasSolTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacioPlantada() = altura * 3
	
	method esIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method horasSolTolera() { 
		var horas = 0
		
		if (altura < 0.5 )
			horas = 6
		else if (altura.between(0.5, 1)) 
			horas = 7 
		else
			horas = 9
			
		return horas
	}
	
	override method daNuevasSemillas() = super() or (anioSemilla > 2007 and altura > 1)
	
	override method espacioPlantada() = altura / 2
	
	method esIdeal(parcela) = parcela.horasSolPorDia() == self.horasSolTolera()
}

class Quinoa inherits Planta {
	
	const horasSolTolera
	
	override method horasSolTolera() = horasSolTolera
	
	override method daNuevasSemillas() = super() or anioSemilla < 2005
	
	override method espacioPlantada() = 0.5
	
	method esIdeal(parcela) = not parcela.plantasDentro().any{ p => p.altura() > 1.5}
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() = false
	
	override method esIdeal(parcela) = parcela.cantMaxPlantas() == 1 
	
}

class HierbaBuena inherits Menta {
	
	override method espacioPlantada() = super() * 2
	
}


