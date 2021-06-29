import habitantes.*

class Planeta {
	const property habitantes = #{}
	var property cantidadDeMuseos
	
	method delegacionDiplomatica() = self.habitantes().filter{ habitante => habitante.esDestacada() }
	method valorInicialDeDefensa() = self.habitantes().count{ habitante => habitante.potencia() >= 30 }
	method esCulto() = self.cantidadDeMuseos() >=2 and self.habitantes().all{ habitante => habitante.inteligencia() >= 10 }
	method potenciaReal() = self.habitantes().sum{ habitante => habitante.potencia()}
}