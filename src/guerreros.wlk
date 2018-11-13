import trajes.*

class Guerrero {

	var ataque
	var ataqueOriginal
	var experiencia
	var energia
	var energiaOriginal
	var traje

	constructor(_ataque, _experiencia, _energia, _traje) {
		ataque = _ataque
		ataqueOriginal = _ataque
		experiencia = _experiencia
		energia = _energia
		energiaOriginal = _energia
		traje = _traje
	}

	method energia() {
		return energia
	}

	method ataque() {
		return ataque
	}

	method atacarA(oponente) {
		if (oponente.energia() > 0) {
			oponente.reducirEnergia(0.1 * ataque)
			oponente.aumentarExperiencia(1)
			traje.aumentarDesgaste()
		}
	}

	method reducirEnergia(cantidad) {
		energia = 0.max(traje.danioReducido(cantidad))
	}

	method aumentarExperiencia(experienciaGanada) {
		experiencia = traje.experienciaAumentada(experienciaGanada)
	}

	method comerSemillaDelHermitanio() {
		energia = energiaOriginal
	}

}

class Saiyan inherits Guerrero {

	var nivel = 0
	var resistencia = [ 0.05, 0.07, 0.15 ]

	method tranformarse() {
		nivel = (3).min(nivel + 1)
		if (nivel < 3) {
			ataque = ataque * 0.5
		}
	}

	override method reducirEnergia(cantidad) {
		if (nivel > 0) {
			energia = cantidad * resistencia.get(nivel - 1)
			if (energia < energiaOriginal * 0.01) {
				self.volverAEstadoNormal()
			}
		} else {
			super(cantidad)
		}
	}

	method volverAEstadoNormal() {
		nivel = 0
	}

	override method comerSemillaDelHermitanio() {
		super()
		ataque = ataqueOriginal * 0.05
	}

}

