import cosas.*
import almacen.*
import rutas.*



object camion {
	const property cosas = #{}
	var property ruta = ruta9 
		
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

//PREGUNTA: Yo en esta comparación lo que quiero es preguntar 
//con un OR, no con un and. Pero cuando uso OR se me rompe y me dice undefined.
	method validarRuta(_ruta) {
	  if (self.puedeCircularEnRuta(_ruta.nivelPeligrosidad()) 
	  and self.pesoTotal() < _ruta.pesoSoportado()){
		ruta = _ruta  //xq haces esto??
	  }else{
		self.error("Este camion no puede circular por este camino!")
	  }

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

	method transportar(destino, camino) {
	  self.validarRuta(camino)
	  self.ruta(camino)
	  self.descargarCargaCompleta(destino)
	}

	/*
	COMO LO HICE YO: No tengo una variable ruta, xq no me interesa guardarme esa informacion. Es momentanea para llevar al almacen las cosas

	method transportar(destino, camino){
		self.validarTransportar(destino, camino)
		self.llegadaADestino(destino)
	}
	
	method validarTransportar(destino, camino){
		self.verificaPeso()
		self.verificaHayEspacioEnAlmacen(destino)
		self.verificarCamino(camino)
	}
	method verificaPeso(){
		if(self.excedidoDePeso()){
			self.error("No puede transportar a destino porque está excedido de peso")
		}
	}
	method verificaHayEspacioEnAlmacen(destino){
		if(destino.espacioDisponibleBultos() < self.totalBultos()){
			self.error("No puede transportar a destino porque no hay espacio en " + destino)
		}
	}
	method verificarCamino(camino){
		if(camino.puedeCircular(self)){
			self.error("El camino no es apto para el transporte")
		}
	}
	*/

}

