import habitantes.*
class Planeta {
	/*Modelo básico de personas y planetas */
	const property habitantes = #{}
	var property cantidadDeMuseos=0
	var property longitudDeMurallas=0
	
	method delegacionDiplomatica() = self.habitantes().filter{ habitante => habitante.esDestacada() }
	method valorInicialDeDefensa() = self.habitantes().count{ habitante => habitante.potencia() >= 30 }
	method esCulto() = self.cantidadDeMuseos() >=2 and self.habitantes().all{ habitante => habitante.inteligencia() >= 10 }
	method potenciaReal() = self.habitantes().sum{ habitante => habitante.potencia()}
	
	/*Más sobre el planeta */
	method construirMurallas(kms){self.longitudDeMurallas(self.longitudDeMurallas()+kms)}
	method fundarUnMuseo(){self.cantidadDeMuseos(self.cantidadDeMuseos()+1)}
	method potenciaAparente() = self.habitantes().max{ habitante => habitante.potencia()} * self.habitantes().size()
	method necesitaReforzarse() = self.potenciaAparente()/2 >= self.potenciaReal()
	method recibirTributos() { self.habitantes().forEach{ habitante => habitante.ofrecerTributo(self) } }
	
	/*Valor de cada persona */
	method habitantesValiosos() = self.habitantes().filter{ habitante => habitante.valor() >= 40 }

	/*Apaciguar a otro planeta */
	method apaciguar(otroPlaneta) { self.habitantesValiosos().forEach{ habitante => habitante.ofrecerTributo() } }
}