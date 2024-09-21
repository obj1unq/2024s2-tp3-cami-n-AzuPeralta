import cosas.*
import almacen.*
import rutas.*



object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cambiar()
	}

	method descargar(unaCosa) {
	  cosas.remove(unaCosa)
	}

	method descargarCargaCompleta(destino) {
	  destino.bajarCarga(cosas)
	  cosas.clear()
	  //o seria mejor cosas.map({cosa => self.descargar(cosa)}) ?
	}

	method todoPesoPar() {
	  return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method tara() {
	  return 1000
	}

	method pesoMaximo() {
	  return 2500
	}
	method pesoTotal() {
	  return self.tara() + cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso(){
		return self.pesoTotal() > self.pesoMaximo()
	} 

	method objetosQueSuperanPeligrosidad(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
	  return cosas.filter({cosaDelSet => cosaDelSet.nivelPeligrosidad() > cosa.nivelPeligrosidad() })
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
	  return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).count(0)
	}

	method tieneAlgoQuePesaEntre(min, max) {
	  return cosas.any({cosa => (cosa.peso() > min) and (cosa.peso() < max)})
	}

	method cosaMasPesada() {
	  return cosas.maxIfEmpty({ cosa => cosa.peso() }, { "El camion esta vacio" })
	}
	
	method pesos() {
	  return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
	  return cosas.map({cosa => cosa.bulto()}).sum()
	}

	method validarViaje(destino, camino) {
	  self.validarPeso()
	  self.validarCamino(camino)
	  self.validarDestino(destino)

	}

	method validarDestino(destino) {
	  return destino.haySuficienteCapacidad(cosas)
	}

	method validarCamino(camino) {
	  if(not self.puedeCircularPor(camino)) self.error("El camion no puede circular por " + camino + " ya que no cumple las condiciones.")
	}

	method puedeCircularPor(camino) {
	  return 
	  self.objetosQueSuperanPeligrosidad(camino.nivelPeligrosidad()) and 
	  self.pesoTotal() < camino.pesoSoportado()

	}

	method validarPeso() {
	  if (self.excedidoDePeso()) self.error("Excede el peso permitido! No puede circular.")

	}
	method transportar(destino, camino) {
	  self.validarViaje(destino, camino)
	  self.descargarCargaCompleta(destino)
	}
}

