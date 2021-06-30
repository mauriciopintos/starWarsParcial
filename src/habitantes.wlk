import planeta.*

class Persona {
	/*Modelo básico de personas y planetas */
	var property edad
	var property potencia = 20
	
	method inteligencia() = if(self.edad().between(20,40)) 12 else 8
	method esDestacada() = self.edad() == 25 or self.edad() == 35

	/*Más sobre el planeta */
	method ofrecerTributo(unPlaneta){}
	
	/*Valor de cada persona */
	method valor() = self.potencia() + self.inteligencia()
}

class Atleta inherits Persona {
	/*Modelo básico de personas y planetas */
	var property masaMuscular = 4
	var property tecnicasConocidas = 2
	
	override method potencia() = super() + (self.masaMuscular() * self.tecnicasConocidas())
	override method esDestacada() = super() or self.tecnicasConocidas() > 5
	method entrenar(dias) { self.masaMuscular(self.masaMuscular()+dias/5) } // Para que no sume decimales (dias/5).truncate(0)
	method aprenderUnaTecnica() { self.tecnicasConocidas(self.tecnicasConocidas()+1)}

	/*Más sobre el planeta */
	override method ofrecerTributo(unPlaneta){ unPlaneta.construirMurallas(2) }
	
	/*Valor de cada persona */		
}

class Docente inherits Persona {
	/*Modelo básico de personas y planetas */
	var property cursosDados = 0
	override method inteligencia() = super() + self.cursosDados()*2
	override method esDestacada() = self.cursosDados() > 3
	
	/*Más sobre el planeta */
	override method ofrecerTributo(unPlaneta){ unPlaneta.fundarUnMuseo() }
		
	/*Valor de cada persona */
	override method valor() = super() + 5
}

/*Soldados */
class Soldado inherits Persona {
	const property armas = []
	
	override method potencia() = super() + self.potenciaDeArmas()
	method potenciaDeArmas() = self.armas().sum{ arma => arma.potenciaQueOtorgaA(self) }
}

/* Armas */
class Armas {
	method potenciaQueOtorgaA(unSoldado)
}
class Pistolete inherits Armas {
	var property largo
	override method potenciaQueOtorgaA(unSoldado) = if (unSoldado.edad() > 30) self.largo() * 3 else self.largo() * 2
}

class Espadon inherits Armas {
	var property peso
	override method potenciaQueOtorgaA(unSoldado) = if (unSoldado.edad() < 40) self.peso() / 2 else 6
}