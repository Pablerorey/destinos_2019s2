class UserException inherits Exception {}

class Socios {
	const property actividades = #{}
	const property idiomasQueHabla = #{}
	var property maximoDeActividades = 0 
	var property edad = 0
	
	method adoradorDelSol(){
		return actividades.all({a=>a.sirveParaBronceado()})
	}
	
	method actividadesEsforzadas(){
		return actividades.map({a=>a.implicaEsfuerzo()})
	}
	
	method agregarActividad(actividad){
		if(actividades.size() > maximoDeActividades){
			throw new UserException(message = "Ud. a superado el maximo de actividades")
		}
		actividades.add(actividad)
	}
	
	method agregarIdiomas(idiomas){
		idiomasQueHabla.addAll(idiomas) 
	}
}

class SocioTranquilo inherits Socios{
	
	method leAtraeActividad(actividad){
		return actividad.diasDeActividad() >= 4
	}
}

class SocioCoherente inherits Socios{
	
	method leAtraeActividad(actividad){
		if(self.adoradorDelSol()){
			return actividad.sirveParaBronceado()
		}
		else {return actividad.implicaEsfuerzo()}
	}
}

class SocioRelajado inherits Socios{
	
	method leAtraeActividad(actividad){
		return self.idiomasQueHabla().intersection(actividad.idiomas()).size() >= 1
	}
}
