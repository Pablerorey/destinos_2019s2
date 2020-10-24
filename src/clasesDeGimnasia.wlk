class ClasesDeGimnasia {
	const property idiomas = #{}
	const property diasDeActividad = 1
	const property implicaEsfuerzo = true
	const property sirveParaBronceado = false
	
	method agregarIdioma(idioma){
		idiomas.add(idioma)
	}
	
	method quitarIdioma(idioma){
		idiomas.remove(idioma)
	}
	
	method recomendadaPara(socio){
		return socio.edad().between(20,30)
	}
}
