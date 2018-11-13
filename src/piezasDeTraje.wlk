class Pieza{
	var porcentajeDeResistencia
	var valorDedesgaste
	var desgaste=0
	
	method aumentarDesgaste(){
		desgaste = 20.min(desgaste + 5)
	}
	method gastada(){
		return desgaste>=20
	}
	method porcentajeDeResistencia(){
		return porcentajeDeResistencia
	}
}