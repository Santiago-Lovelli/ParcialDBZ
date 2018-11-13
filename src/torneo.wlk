import guerreros.*

object juego {

	var personajes = []
	var guerrerosParticipantes
	var modalidad

	method seleccionarGuerreros() {
		guerrerosParticipantes.addAll(modalidad.seleccion(personajes))
	}

}

object powerlsBest {

	method ordenarPorAtaque(personajes) {
		return personajes.sortBy({ personaje => personaje.ataque() })
	}

	method seleccion(personajes) {
		return self.ordenarPorAtaque(personajes).take(16)
	}

}

object funny {

	method ordenarPorCantidadDePiezas(personajes) {
		return personajes.sortBy({ personaje => personaje.piezas().size() })
	}

	method seleccion(personajes) {
		return self.ordenarPorCantidadDePiezas(personajes).take(16)
	}

}

object surprise {
	var lista = []

	method seleccion(personajes) {
		16.times({ x => self.aleatorio(personajes)})
		return lista
	}

	method aleatorio(personajes) {
		return lista.add(personajes.anyOne())
	}

}

