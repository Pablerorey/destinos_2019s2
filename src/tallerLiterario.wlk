class TallerLiterario {
	const property libros = #{}
	const property sirveParaBronceado = false
	
	method agregarLibros(libross){
		libros.addAll(libross)
	}
	
	method idiomasUsados(){
		return libros.map({l=>l.idioma()})
	}
	
	method diasDeActividad(){
		return libros.size() + 1
	}
	
	method implicaEsfuerzo(){
		return libros.any({l=>l.paginas() > 500})
		or libros.all({l=>l.autor() == l.autor()})
		and libros.size() > 1
	}
	
	method autores(){
		return libros.map({l=>l.autor()})
	}
	
	method recomendadaPara(socio){
		return socio.idiomasQueHabla().size() > 1
	}
}

class Libro{
	const property idioma = []
	const property autor = []
	var property paginas = 0
	
	method agregarIdioma(idiomas){
		idioma.add(idiomas)
	}
	
	method agregarAutor(autores){
		autor.add(autores)
	}
}
