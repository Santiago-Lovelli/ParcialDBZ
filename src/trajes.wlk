import guerreros.*
import piezasDeTraje.*

class Traje {

	var porcentajeDefencivo
	var porcentajeDeExperiencia
	var desgaste = 0
	var piezas = #{}

	method piezas() {
		return piezas
	}

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

	constructor(_porcentajeDefencivo, _porcentajeDeExperiencia) {
		porcentajeDefencivo = _porcentajeDefencivo
		porcentajeDeExperiencia = _porcentajeDeExperiencia
		piezas.add(0)
	}

	override method danioReducido(danio) {
		if (self.gastado()) {
			return 0
		} else {
			return danio - porcentajeDefencivo * danio
		}
	}

}

class DeEntrenamiento inherits Traje {

	constructor(_porcentajeDefencivo, _porcentajeDeExperiencia) {
		porcentajeDefencivo = _porcentajeDefencivo
		porcentajeDeExperiencia = _porcentajeDeExperiencia
		piezas.add(0)
	}

	override method experienciaAumentada(experiencia) {
		if (self.gastado()) {
			return 0
		} else {
			return experiencia + porcentajeDefencivo * experiencia
		}
	}

}

class Modularizados inherits Traje {

	constructor(_porcentajeDefencivo, _porcentajeDeExperiencia, _piezas) {
		porcentajeDefencivo = _porcentajeDefencivo
		porcentajeDeExperiencia = _porcentajeDeExperiencia
		piezas.addAll(_piezas)
	}

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
		return (piezas.size() - self.piezasGastadas().size()) / piezas.size()
	}

	override method experienciaAumentada(experiencia) {
		if (self.gastado()) {
			return 0
		} else {
			return experiencia + self.porcentajeEsperiencia() * experiencia
		}
	}

}

