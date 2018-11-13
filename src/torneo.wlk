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

	method seleccion(personajes) {
		return ordenador.ordenarPor(personajes,porAtaque).take(16)
	}

}

object funny {

	method seleccion(personajes) {
		return ordenador.ordenarPor(personajes,porCantidadDePiezas).take(16)
	}

}

object porCantidadDePiezas{
	method condicion(persona)
	{
		return persona.piezas().size()
	}
}

object porAtaque{
	method condicion(persona)
	{
		return persona.ataque()
	}
}

object ordenador {
	method ordenarPor(lista,criterio){
		return lista.sortBy({elemento => criterio.condicion(elemento)})
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

