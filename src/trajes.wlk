import guerreros.*
import piezasDeTraje.*

class Traje {

	var porcentajeDefencivo
	var porcentajeDeExperiencia
	var desgaste = 0

	method danioReducido(danio) {
		return 0
	}

	method experienciaAumentada(experiencia) {
		return 0
	}

	method aumentarDesgaste() {
		desgaste = 100.min(desgaste + 5)
	}

	method gastado() {
		return desgaste == 100
	}

}

class Comun inherits Traje {

	override method danioReducido(danio) {
		if (self.gastado()) {
			return 0
		} else {
			return danio - porcentajeDefencivo * danio
		}
	}

}

class DeEntrenamiento inherits Traje {

	override method experienciaAumentada(experiencia) {
		if (self.gastado()) {
			return 0
		} else {
			return experiencia + porcentajeDefencivo * experiencia
		}
	}

}

class Modularizados inherits Traje {

	var piezas = #{}

	override method gastado() {
		return piezas.all({ pieza => pieza.gastada() })
	}

	method reduce() {
		return piezas.sum({ pieza => pieza.porcentajeDeResistencia() })
	}

	override method danioReducido(danio) {
		if (self.gastado()) {
			return 0
		} else {
			return danio - self.reduce() * danio
		}
	}

	method piezasGastadas() {
		return piezas.filter({ pieza => pieza.gastada() })
	}

	method porcentajeEsperiencia() {
		return (piezas.size() - self.piezasGastadas()) / piezas.size()
	}

	override method experienciaAumentada(experiencia) {
		if (self.gastado()) {
			return 0
		} else {
			return experiencia + self.porcentajeEsperiencia() * experiencia
		}
	}
	

}