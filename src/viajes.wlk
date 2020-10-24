class Viaje {
	const property idiomas = #{}
	var property implicaEsfuerzo = false
	var property sirveParaBronceado = false
	var property diasDeActividad = 0
	
	method agregarIdioma(idioma){
		idiomas.add(idioma)
	}
	
	method agregarIdiomas(idiomass){
		idiomas.addAll(idiomass)
	}
	
	method quitarIdioma(idioma){
		idiomas.remove(idioma)
	}
	
	method quitarIdiomas(idiomass){
		idiomas.removeAll(idiomass)
	}
	
	method viajeInteresante(){
		return idiomas.size() > 1
	}
	
	method recomendadaPara(socio){
		return self.viajeInteresante() and 
		socio.leAtraeActividad(self)
		and not socio.actividades().contains(self)
	}
}

class ViajesDePlaya inherits Viaje{
	var property largo = 0
	
	override method diasDeActividad(){
		return largo / 500
	}
	
	override method implicaEsfuerzo(){
		return largo > 1200
	}
}

class ExcursionACiudad inherits Viaje{
	var property atracciones = 0
	
	override method diasDeActividad(){
		return atracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return atracciones.between(5,8)
	}
	
	override method viajeInteresante(){
		return super() or atracciones == 5
	}
}

class ExcursionesACiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad(){
		return super() + 1
	}
}

class SalidaDeTrekking inherits Viaje{
	var property kmtsDeSendero = 0
	var property diasDeSol = 0
	
	override method diasDeActividad(){
		return kmtsDeSendero / 50
	}
	
	override method implicaEsfuerzo(){
		return kmtsDeSendero > 80 
	}
	
	override method sirveParaBronceado(){
		return diasDeSol > 200 or diasDeSol.between(100,200) and kmtsDeSendero > 120
	}
	
	override method viajeInteresante(){
		return super() and diasDeSol > 140
	}
}
