import planeta.*
class Persona {
	var property edad
	var property potencia = 20

	method inteligencia() = if(self.edad().between(20,40)) 12 else 8
	method esDestacada() = self.edad() == 25 or self.edad() == 35
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property tecnicasConocidas = 2
	
	override method potencia() = super() + (self.masaMuscular() * self.tecnicasConocidas())
	override method esDestacada() = super() or self.tecnicasConocidas() > 5
	method entrenar(dias) { self.masaMuscular(self.masaMuscular()+dias/5) } // Para que no sume decimales (dias/5).truncate(0)
	method aprenderUnaTecnica() { self.tecnicasConocidas(self.tecnicasConocidas()+1)}
}

class Docente inherits Persona {
	var property cursosDados = 0
	override method inteligencia() = super() + self.cursosDados()*2
	override method esDestacada() = self.cursosDados() > 3
}

class Soldado inherits Persona {
	
}